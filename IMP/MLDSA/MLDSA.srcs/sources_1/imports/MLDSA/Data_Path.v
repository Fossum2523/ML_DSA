module Data_Path
#(  parameter DLEN = 23, A_HLEN = 12, T_HLEN = 10, Y_HLEN = 10, HLEN = 8, BIT_LEN = 23)
    (   
    input           clk,
    input           reset,

    input  [8:0]    ctrl_sign,
    /*---Keack---*/
    input           sha_en,
    input  [3:0]    sha_type,
    output          sha_out_ready,

    /*---Data_Mem---*/
    input           mem_sel,
    input           A_mem_sel,
    input           t_mem_sel,
    input           Rho_en,
    input           Rho_prime_en,
    input           Kata_en,
    input           Rho_mode,
    input           Rho_prime_mode,
    input           Kata_mode,

    /*---Sampler---*/
    input   [1:0]   sampler_mode,
    input   [3:0]   s1_index,
    input   [3:0]   s2_index,
    input   [3:0]   A_index,
    input   [3:0]   y_index,
    input           sampler_in_ready,
    output          next_element,

    /*---NTT---*/
    input           NTT_mode,
	input           NTT_in_ready,
    input [1:0]     NTT_index,
    output          NTT_done,

    /*---PWM---*/
    input [1:0]     PWM_index,

    /*---AG---*/
    input [3:0]    main_mem_sel,

    input           AG_1_triger,
    input           AG_1_clean,
    output          AG_1_addr_en, //spercial add to send p at SginGen stage 4_1
    output          AG_1_done,

    input           AG_2_triger,
    input           AG_2_clean,
    output          AG_2_done,
    
    input           AG_3_triger,
    input           AG_3_clean,
    output          AG_3_done,

    input           AG_4_triger,
    input           AG_4_clean,
    output          AG_4_done,

    //Deoceder
    output          DEC_ready_i,
    //AXI Stream input protocol A
    input   [63:0]      MLDSA_data_in_A,
    input               MLDSA_i_valid_A,
    input               MLDSA_i_last_A,
    // output              MLDSA_i_ready_A,

    //AXI Stream input protocol B
    input   [63:0]      MLDSA_data_in_B,
    input               MLDSA_i_valid_B,
    input               MLDSA_i_last_B,
    input               MLDSA_i_ready_B,

    //AXI Stream output protocol
    input               MLDSA_o_ready,
    output reg [63:0]   MLDSA_data_out,
    output reg          MLDSA_o_valid,
    output reg          MLDSA_o_last,
    
    /*---test (Need to chAG_1e to wire)---*/
    output  [1343:0]    padder_out,
    output              padder_out_ready,
    output  [1599:0]    f_out,
    output              f_out_ready,
    output  [1343:0]    sha_out
    );  



    /*---parameter---*/
    //vaiable
    parameter Beta   = 78;
    parameter GAMMA1 = 131072;
    parameter GAMMA2 = 95232;
    parameter ALPHA = 2 * GAMMA2;


    //sha type
    parameter   Gen_Seed    = 4'd0,
                Gen_A       = 4'd1,
                Gen_s1      = 4'd2,
                Gen_s2      = 4'd3,
                Gen_y       = 4'd4,
                H_u_w1      = 4'd5,
                H_pk_1      = 4'd6,
                H_pk_2      = 4'd7,
                Gen_c_1     = 4'd8,
                Gen_c_2     = 4'd9,
                H_K_rnd_u   = 4'd10,
                H_tr_M_1    = 4'd11,
                H_tr_M_2    = 4'd12;

    //main mode
    localparam  [1:0]   KeyGen  = 2'd0,
                        SignGen = 2'd1,
                        SignVer = 2'd2;


    //Keack mode
    localparam          G           = 1'b0,
                        H           = 1'b1;

    //Sampler mode
    localparam [1:0]    S_mode      = 2'd0,
                        A_mode      = 2'd1,
                        MASK_mode   = 2'd2,
                        SIB_mode    = 2'd3;

    //seed_in_sel
    localparam  [1:0]   RHO         = 2'b00,
                        RHO_PRIME   = 2'b01,
                        KATA        = 2'B10;

    //sha_in_sel
    localparam  [1:0]   OUSIDE      = 2'b00,
                        SAMPLE      = 2'b01;

    //Mem_Data Control
    localparam          SAMPLER_ADDR = 1'b0,
                        PWM_ADDR     = 1'b1;

    //PWM mode
    localparam [1:0]    MATRIX_VECTOR = 2'd0, /*path 1(in_a0, in_a1, in_a2)*/ /*path 2(in_b0, in_b1, in_b2)*/
                        SCALAR_VECTOR = 2'd1, /*path 1(in_a0, in_a1)*/        /*path 2(in_b0, in_b1)*/     
                        ADD_VECTOR    = 2'd2; /*path 1(in_a1, in_a2)*/        /*path 2(in_b1, in_b2)*/

    reg [15:0]       kappa;

    reg             z_fail;
    reg             r0_fail;

    /*---Keack signals---*/
    wire            sha_in_ready;
    wire            sha_is_last;
    wire            sha_squeeze;
    wire            sha_mode;
    wire            sha_hold;
    wire            sha_buffer_full;
    wire [2:0]      sha_byte_num;
    wire            sha_clean;
    wire [1:0]      keccak_in_sel;
    wire [1:0]      kk_sub_sel_1;
    wire [1:0]      kk_sub_sel_2;
    wire [1:0]      kk_sub_sel_3;

    reg  [63:0]     sha_in;
    reg  [63:0]     kk_sub_1_in;
    reg  [63:0]     kk_sub_2_in;
    reg  [63:0]     kk_sub_3_in;
    reg  [63:0]     in_seed_in;
    wire            sha_AG_1_gen;
    
    
    /*---Data_Mem signals---*/

    //---seed
    reg [63:0]      seed_data_a;
    reg [63:0]      seed_data_b;
    reg [4 - 1:0]   seed_addr_a;
    reg [4 - 1:0]   seed_addr_b;
    reg             seed_en_a;
    reg             seed_en_b;
    reg             seed_we_a;
    reg             seed_we_b;
    wire [63:0]     seed_q_a;
    wire [63:0]     seed_q_b;

    //---s1
    reg  [3 - 1:0]  s1_data_a;
    reg  [3 - 1:0]  s1_data_b;
    reg  [10 - 1:0] s1_addr_a;
    reg  [10 - 1:0] s1_addr_b;
    reg             s1_en_a;
    reg             s1_en_b;
    reg             s1_we_a;
    reg             s1_we_b;
    wire [3-1:0]    s1_q_a;
    wire [3-1:0]    s1_q_b;

    //---s2
    reg [3 - 1:0]  s2_data_a;
    reg [3 - 1:0]  s2_data_b;
    reg [10 - 1:0] s2_addr_a;
    reg [10 - 1:0] s2_addr_b;
    reg            s2_en_a;
    reg            s2_en_b;
    reg            s2_we_a;
    reg            s2_we_b;
    wire [3-1:0]   s2_q_a;
    wire [3-1:0]   s2_q_b;
    
    //---c
    reg [23 - 1:0]  c_data_a;
    reg [23 - 1:0]  c_data_b;
    reg [8 - 1:0] c_addr_a;
    reg [8 - 1:0] c_addr_b;
    reg            c_en_a;
    reg            c_en_b;
    reg            c_we_a;
    reg            c_we_b;
    wire [23-1:0]   c_q_a;
    wire [23-1:0]   c_q_b;

    //---A
    reg [DLEN-1:0]   A_data_a;
    reg [DLEN-1:0]   A_data_b;
    reg [A_HLEN-1:0] A_addr_a;
    reg [A_HLEN-1:0] A_addr_b;
    reg              A_en_a;
    reg              A_en_b;
    reg              A_we_a;
    reg              A_we_b;
    wire [DLEN-1:0]   A_q_a;
    wire [DLEN-1:0]   A_q_b;

    //---y
    reg [DLEN-1:0]      y_data_a;
    reg [DLEN-1:0]      y_data_b;
    reg [Y_HLEN - 1:0]  y_addr_a;
    reg [Y_HLEN - 1:0]  y_addr_b;
    reg                 y_en_a;
    reg                 y_en_b;
    reg                 y_we_a;
    reg                 y_we_b;
    wire [DLEN-1:0]      y_q_a;
    wire [DLEN-1:0]      y_q_b;

    //---t
    reg [DLEN-1:0]      t_data_a;
    reg [DLEN-1:0]      t_data_b;
    reg [T_HLEN - 1:0]  t_addr_a;
    reg [T_HLEN - 1:0]  t_addr_b;
    reg                 t_en_a;
    reg                 t_en_b;
    reg                 t_we_a;
    reg                 t_we_b;
    wire [DLEN-1:0]     t_q_a;
    wire [DLEN-1:0]     t_q_b;

    //---t0
    reg [DLEN-1:0]      t0_data_a;
    reg [DLEN-1:0]      t0_data_b;
    reg [T_HLEN - 1:0]  t0_addr_a;
    reg [T_HLEN - 1:0]  t0_addr_b;
    reg                 t0_en_a;
    reg                 t0_en_b;
    reg                 t0_we_a;
    reg                 t0_we_b;
    wire [DLEN-1:0]     t0_q_a;
    wire [DLEN-1:0]     t0_q_b;


    //---tr
    reg [63:0]       tr_data_a;
    reg [63:0]       tr_data_b;
    reg [2:0]        tr_addr_a;
    reg [2:0]        tr_addr_b;
    reg              tr_en_a;
    reg              tr_en_b;
    reg              tr_we_a;
    reg              tr_we_b;
    wire [63:0]      tr_q_a;
    wire [63:0]      tr_q_b;

    //---u
    reg [63:0]       u_data_a;
    reg [63:0]       u_data_b;
    reg [2:0]        u_addr_a;
    reg [2:0]        u_addr_b;
    reg              u_en_a;
    reg              u_en_b;
    reg              u_we_a;
    reg              u_we_b;
    wire [63:0]      u_q_a;
    wire [63:0]      u_q_b;

    //---p_prime_prime
    reg [63:0]       p_prime_prime_data_a;
    reg [63:0]       p_prime_prime_data_b;
    reg [2:0]        p_prime_prime_addr_a;
    reg [2:0]        p_prime_prime_addr_b;
    reg              p_prime_prime_en_a;
    reg              p_prime_prime_en_b;
    reg              p_prime_prime_we_a;
    reg              p_prime_prime_we_b;
    wire [63:0]      p_prime_prime_q_a;
    wire [63:0]      p_prime_prime_q_b;

    //---s1_pack
    reg [63:0]       s1_pack_data_a;
    reg [63:0]       s1_pack_data_b;
    reg [5:0]        s1_pack_addr_a;
    reg [5:0]        s1_pack_addr_b;
    reg              s1_pack_en_a;
    reg              s1_pack_en_b;
    reg              s1_pack_we_a;
    reg              s1_pack_we_b;
    wire [63:0]      s1_pack_q_a;
    wire [63:0]      s1_pack_q_b;

    //---s2_pack
    reg [63:0]       s2_pack_data_a;
    reg [63:0]       s2_pack_data_b;
    reg [5:0]        s2_pack_addr_a;
    reg [5:0]        s2_pack_addr_b;
    reg              s2_pack_en_a;
    reg              s2_pack_en_b;
    reg              s2_pack_we_a;
    reg              s2_pack_we_b;
    wire [63:0]      s2_pack_q_a;
    wire [63:0]      s2_pack_q_b;

    //---t1_pack
    reg [63:0]       t1_pack_data_a;
    reg [63:0]       t1_pack_data_b;
    reg [7:0]        t1_pack_addr_a;
    reg [7:0]        t1_pack_addr_b;
    reg              t1_pack_en_a;
    reg              t1_pack_en_b;
    reg              t1_pack_we_a;
    reg              t1_pack_we_b;
    wire [63:0]      t1_pack_q_a;
    wire [63:0]      t1_pack_q_b;

    //---t0_pack
    reg [63:0]       t0_pack_data_a;
    reg [63:0]       t0_pack_data_b;
    reg [7:0]        t0_pack_addr_a;
    reg [7:0]        t0_pack_addr_b;
    reg              t0_pack_en_a;
    reg              t0_pack_en_b;
    reg              t0_pack_we_a;
    reg              t0_pack_we_b;
    wire [63:0]      t0_pack_q_a;
    wire [63:0]      t0_pack_q_b;

    //---w1_pack
    reg [63:0]       w1_pack_data_a;
    reg [63:0]       w1_pack_data_b;
    reg [6:0]        w1_pack_addr_a;
    reg [6:0]        w1_pack_addr_b;
    reg              w1_pack_en_a;
    reg              w1_pack_en_b;
    reg              w1_pack_we_a;
    reg              w1_pack_we_b;
    wire [63:0]      w1_pack_q_a;
    wire [63:0]      w1_pack_q_b;

    //---w
    wire [DLEN-1:0] w_q_a;
    wire [DLEN-1:0] w_q_b;

    //---c
    wire [DLEN-1:0] c_q_a;
    wire [DLEN-1:0] c_q_b;

    //---c_tlide
    reg [64-1:0]      c_tlide_data_a;
    reg [64-1:0]      c_tlide_data_b;
    reg [T_HLEN - 1:0]  c_tlide_addr_a;
    reg [T_HLEN - 1:0]  c_tlide_addr_b;
    reg                 c_tlide_en_a;
    reg                 c_tlide_en_b;
    reg                 c_tlide_we_a;
    reg                 c_tlide_we_b;
    wire [64-1:0]     c_tlide_q_a;
    wire [64-1:0]     c_tlide_q_b;

    //---c_hat
    reg [23-1:0]      c_hat_data_a;
    reg [23-1:0]      c_hat_data_b;
    reg [T_HLEN - 1:0]  c_hat_addr_a;
    reg [T_HLEN - 1:0]  c_hat_addr_b;
    reg                 c_hat_en_a;
    reg                 c_hat_en_b;
    reg                 c_hat_we_a;
    reg                 c_hat_we_b;
    wire [23-1:0]     c_hat_q_a;
    wire [23-1:0]     c_hat_q_b;

    //---temp_0
    reg [DLEN-1:0]      temp_0_data_a;
    reg [DLEN-1:0]      temp_0_data_b;
    reg [T_HLEN - 1:0]  temp_0_addr_a;
    reg [T_HLEN - 1:0]  temp_0_addr_b;
    reg                 temp_0_en_a;
    reg                 temp_0_en_b;
    reg                 temp_0_we_a;
    reg                 temp_0_we_b;
    wire [DLEN-1:0]     temp_0_q_a;
    wire [DLEN-1:0]     temp_0_q_b;

    //---temp_1
    reg [DLEN-1:0]      temp_1_data_a;
    reg [DLEN-1:0]      temp_1_data_b;
    reg [T_HLEN - 1:0]  temp_1_addr_a;
    reg [T_HLEN - 1:0]  temp_1_addr_b;
    reg                 temp_1_en_a;
    reg                 temp_1_en_b;
    reg                 temp_1_we_a;
    reg                 temp_1_we_b;
    wire [DLEN-1:0]     temp_1_q_a;
    wire [DLEN-1:0]     temp_1_q_b;

    //---temp_2
    reg [DLEN-1:0]      temp_2_data_a;
    reg [DLEN-1:0]      temp_2_data_b;
    reg [T_HLEN - 1:0]  temp_2_addr_a;
    reg [T_HLEN - 1:0]  temp_2_addr_b;
    reg                 temp_2_en_a;
    reg                 temp_2_en_b;
    reg                 temp_2_we_a;
    reg                 temp_2_we_b;
    wire [DLEN-1:0]     temp_2_q_a;
    wire [DLEN-1:0]     temp_2_q_b;

    //---temp_3
    reg [DLEN-1:0]      temp_3_data_a;
    reg [DLEN-1:0]      temp_3_data_b;
    reg [T_HLEN - 1:0]  temp_3_addr_a;
    reg [T_HLEN - 1:0]  temp_3_addr_b;
    reg                 temp_3_en_a;
    reg                 temp_3_en_b;
    reg                 temp_3_we_a;
    reg                 temp_3_we_b;
    wire [DLEN-1:0]     temp_3_q_a;
    wire [DLEN-1:0]     temp_3_q_b;

    //---temp_4
    reg [DLEN-1:0]      temp_4_data_a;
    reg [DLEN-1:0]      temp_4_data_b;
    reg [T_HLEN - 1:0]  temp_4_addr_a;
    reg [T_HLEN - 1:0]  temp_4_addr_b;
    reg                 temp_4_en_a;
    reg                 temp_4_en_b;
    reg                 temp_4_we_a;
    reg                 temp_4_we_b;
    wire [DLEN-1:0]     temp_4_q_a;
    wire [DLEN-1:0]     temp_4_q_b;

    //---PWM_temp
    reg [DLEN-1:0]      PWM_temp_data_a;
    reg [DLEN-1:0]      PWM_temp_data_b;
    reg [T_HLEN - 1:0]  PWM_temp_addr_a;
    reg [T_HLEN - 1:0]  PWM_temp_addr_b;
    reg                 PWM_temp_en_a;
    reg                 PWM_temp_en_b;
    reg                 PWM_temp_we_a;
    reg                 PWM_temp_we_b;
    wire [DLEN-1:0]     PWM_temp_q_a;
    wire [DLEN-1:0]     PWM_temp_q_b;



    /*---Sampler signals---*/
    //---Control
    wire            sampler_squeeze;
    //---ExpandS
    wire [2:0]      z0;
    wire [2:0]      z1;
    wire [7:0]      addr_z0;
    wire [7:0]      addr_z1;
    wire            en_z0;
    wire            we_z0;
    wire            en_z1;
    wire            we_z1;
    wire            s1_en_z;
    wire            s1_we_z;
    wire            s2_en_z;
    wire            s2_we_z;
    //---ExpandA
    wire [22:0]     A0;
    wire [22:0]     A1;
    wire [7:0]      addr_A0;
    wire [7:0]      addr_A1;
    wire            en_A0;
    wire            we_A0;
    wire            en_A1;
    wire            we_A1;
    //---ExpandMask
    wire [22:0]     y0;
    wire [22:0]     y1;
    wire [7:0]      addr_y0;
    wire [7:0]      addr_y1;
    wire            en_y;
    wire            we_y;
    //---SampleInBall
    wire [22:0]     ci;
    wire [7:0]      addr_ci;
    wire [7:0]      addr_cj;
    wire            en_ci;
    wire            en_cj;
    wire            we_ci;
    wire            we_cj;

    /*---NTT signals---*/
    //---Control
    wire                NTT_reset;
    wire                NTT_out_ready;
    //---Data
    wire                NTT_data_en;
    reg  [BIT_LEN-1:0]  NTT_in_u;
    reg  [BIT_LEN-1:0]  NTT_in_d;
    wire [7:0]          NTT_in_addr_u;
    wire [7:0]          NTT_in_addr_d;
    wire [BIT_LEN-1:0]  NTT_out_u;
    wire [BIT_LEN-1:0]  NTT_out_d;
    wire [7:0]          NTT_addr_u;
    wire [7:0]          NTT_addr_d;

    /*---PWM Signal---*/
    reg  [1:0]           PWM_mode;
    reg  [BIT_LEN - 1:0] PWM_in_a0;
    reg  [BIT_LEN - 1:0] PWM_in_a1;
    reg  [BIT_LEN - 1:0] PWM_in_a2;
    wire [BIT_LEN - 1:0] PWM_out_a;
    reg  [BIT_LEN - 1:0] PWM_in_b0;
    reg  [BIT_LEN - 1:0] PWM_in_b1;
    reg  [BIT_LEN - 1:0] PWM_in_b2;
    wire [BIT_LEN - 1:0] PWM_out_b;

    //Adress Generate
    reg  [1:0]   AG_1_addr_adder;
    reg  [11:0]  AG_1_last_addr;
    reg  [11:0]  AG_1_star_addr;
    reg          AG_1_pasue;
    // wire         AG_1_addr_en;
    wire [11:0]  AG_1_addr_a;
    wire [11:0]  AG_1_addr_b;
    wire         AG_1_data_valid;

    reg  [1:0]   AG_2_addr_adder;
    reg  [11:0]  AG_2_last_addr;
    reg  [11:0]  AG_2_star_addr;
    reg          AG_2_pasue;
    wire         AG_2_addr_en;
    wire [11:0]  AG_2_addr_a;
    wire [11:0]  AG_2_addr_b;
    wire         AG_2_data_valid;

    reg  [1:0]   AG_3_addr_adder;
    reg  [11:0]  AG_3_last_addr;
    reg  [11:0]  AG_3_star_addr;
    reg          AG_3_pasue;
    wire         AG_3_addr_en;
    wire [11:0]  AG_3_addr_a;
    wire [11:0]  AG_3_addr_b;
    wire         AG_3_data_valid;

    reg  [1:0]   AG_4_addr_adder;
    reg  [11:0]  AG_4_last_addr;
    reg  [11:0]  AG_4_star_addr;
    reg          AG_4_pasue;
    wire         AG_4_addr_en;
    wire [11:0]  AG_4_addr_a;
    wire [11:0]  AG_4_addr_b;
    wire         AG_4_data_valid;

    //Encoder
    reg [2:0] ENC_sec_lvl;
    reg [2:0] ENC_encode_mode;
    reg ENC_valid_i;
    reg ENC_ready_o;
    reg [45:0]ENC_di;
    wire ENC_ready_i;
    wire ENC_valid_o;
    wire [63:0]ENC_dout;

    //Decoder
    reg [2:0]   DEC_sec_lvl;
    reg [2:0]   DEC_mode;
    reg         DEC_valid_i;
    reg         DEC_ready_o;
    reg [63:0]  DEC_di;
    // wire        DEC_ready_i;
    wire        DEC_valid_o;
    wire [45:0] DEC_dout;

    /*---Keccak---*/ //------------------------------------------str
    reg sha_data_valid;

    always @(posedge clk) begin
        if(reset)
            kappa <= 16'd0;
        else if(y_index == 3 && next_element)
            kappa <= kappa + 16'd4;
    end
    always @(*) begin
        sha_data_valid = 1'b0;
        case (ctrl_sign)
            {KeyGen,6'd1}:begin
                sha_data_valid = MLDSA_i_valid_A;
            end
            {KeyGen,6'd2},
            {KeyGen,6'd3}:begin
                sha_data_valid = AG_1_data_valid;
            end
            {KeyGen,6'd4}:begin
                sha_data_valid = AG_1_data_valid;
            end
            {KeyGen,6'd8}:begin
                sha_data_valid = AG_1_data_valid;
            end
            {SignGen,6'd1}:begin
                sha_data_valid = MLDSA_i_valid_A;
            end
            {SignGen,6'd2}:begin
                sha_data_valid = MLDSA_i_valid_A | AG_1_data_valid; ////
            end
            {SignGen,6'd3}:begin
                sha_data_valid = AG_1_data_valid;
            end
            {SignGen,6'd4},
            {SignGen,6'd5}:begin
                sha_data_valid = AG_1_data_valid;
            end
            {SignGen,6'd9}:begin
                sha_data_valid = AG_1_data_valid;
            end
            {SignGen,6'd10}:begin
                sha_data_valid = AG_1_data_valid;
            end
            {SignGen,6'd15}:begin
                sha_data_valid = AG_1_data_valid;
            end
        endcase
    end
    Keccak_Ctrl KKC(   
        .clk(clk),
        .reset(reset),
        .sha_in(sha_in),
        .sha_data_valid(sha_data_valid),
        .sha_en(sha_en),
        .sha_type(sha_type),
        .next_element(next_element),
        .MLDSA_i_last(MLDSA_i_last_A),
        .sha_in_ready(sha_in_ready), 
        .sha_is_last(sha_is_last),
        .sha_squeeze(sha_squeeze), // when squeeze = 0, output once; otherwise, keep squeezing
        .sha_mode(sha_mode),
        .sha_hold(sha_hold),
        .sha_byte_num(sha_byte_num),
        .sha_out_ready(sha_out_ready),
        .sha_clean(sha_clean),
        .keccak_in_sel(keccak_in_sel),
        .kk_sub_sel_1(kk_sub_sel_1),
        .kk_sub_sel_2(kk_sub_sel_2),
        .kk_sub_sel_3(kk_sub_sel_3),

        // .sha_AG_gen(sha_AG_1_gen),
        .AG_done(AG_4_done)
    );  

    Keccak KK(
        .clk(clk),
        .reset(sha_reset),
        .in(sha_in),
        .in_ready(sha_in_ready),
        .is_last(sha_is_last),
        .squeeze(sha_squeeze | sampler_squeeze),
        .mode(sha_mode),
        .sha_hold(sha_hold),
        .byte_num(sha_byte_num),
        .buffer_full(sha_buffer_full),
        // .buffer_last(buffer_last),
        .out(sha_out),
        .out_ready(sha_out_ready),
        .padder_out(padder_out),
        .padder_out_ready(padder_out_ready),
        .f_out(f_out),                                  
        .f_out_ready(f_out_ready)
    );

    assign sha_reset = reset | sha_clean;

    always @(*) begin
        kk_sub_1_in = 64'd0;
        case (kk_sub_sel_1)
            2'd0: kk_sub_1_in = seed_q_a;      //seed mem
            2'd1: kk_sub_1_in = u_q_a;         //u mem
            2'd2: kk_sub_1_in = w1_pack_q_a;         //w1 mem
            2'd3: kk_sub_1_in = t1_pack_q_a;   //t1_pack mem
        endcase
    end

    always @(*) begin
        kk_sub_2_in = 64'd0;
        case (kk_sub_sel_2)
            2'd0: kk_sub_2_in = c_tlide_q_a;      //c1_tilde mem
            2'd1: kk_sub_2_in = 64'd0;      //tr mem
            2'd2: kk_sub_2_in = 64'd0;      //zero_index
            2'd3: kk_sub_2_in = 64'h0000_0000_0000_0404; //seed_gen_index
        endcase
    end

    always @(*) begin
        case (kk_sub_sel_3)
            2'd0: kk_sub_3_in = {48'd0,{6'd0,A_index[3:2]},{6'd0,A_index[1:0]}}; //A_gen_index
            2'd1: kk_sub_3_in = {60'd0,s1_index};   //s1_gen_index
            2'd2: kk_sub_3_in = {60'd0,s2_index};   //s2_gen_index
            2'd3: kk_sub_3_in = 64'd0 | (y_index + kappa);   //y_gen_index
            default: kk_sub_3_in = 64'd0;
        endcase
    end
    
    always @(*) begin
        sha_in = 64'd0;
        case (keccak_in_sel)
            2'd0: sha_in = kk_sub_1_in;
            2'd1: sha_in = kk_sub_2_in;
            2'd2: sha_in = kk_sub_3_in;
            2'd3: sha_in = MLDSA_data_in_A;
        endcase
    end

    
    /*---Keccak---*/ //------------------------------------------end

    /*---Data_Mem---*/ //------------------------------------------str
    wire [127:0] seed_out;
    
    Data_Mem DM(
        .clk(clk),
        .reset(reset),
        
        /*---Seed---*/
        .seed_data_a(seed_data_a),
        .seed_data_b(seed_data_b),
        .seed_addr_a(seed_addr_a),
        .seed_addr_b(seed_addr_b),
        .seed_en_a(seed_en_a),
        .seed_en_b(seed_en_b),
        .seed_we_a(seed_we_a),
        .seed_we_b(seed_we_b),
        .seed_q_a(seed_q_a),
        .seed_q_b(seed_q_b),

        /*---s1---*/
        .s1_data_a(s1_data_a),
        .s1_data_b(s1_data_b),
        .s1_addr_a(s1_addr_a),
        .s1_addr_b(s1_addr_b),
        .s1_en_a(s1_en_a),
        .s1_en_b(s1_en_b),
        .s1_we_a(s1_we_a),
        .s1_we_b(s1_we_b),
        .s1_q_a(s1_q_a),
        .s1_q_b(s1_q_b),

        /*---s2---*/
        .s2_data_a(s2_data_a),
        .s2_data_b(s2_data_b),
        .s2_addr_a(s2_addr_a),
        .s2_addr_b(s2_addr_b),
        .s2_en_a(s2_en_a),
        .s2_en_b(s2_en_b),
        .s2_we_a(s2_we_a),
        .s2_we_b(s2_we_b),
        .s2_q_a(s2_q_a),
        .s2_q_b(s2_q_b),

        /*---c---*/
        .c_data_a(c_data_a),
        .c_data_b(c_data_b),
        .c_addr_a(c_addr_a),
        .c_addr_b(c_addr_b),
        .c_en_a(c_en_a),
        .c_en_b(c_en_b),
        .c_we_a(c_we_a),
        .c_we_b(c_we_b),
        .c_q_a(c_q_a),
        .c_q_b(c_q_b),

        /*---A---*/
        .A_data_a(A_data_a),
        .A_data_b(A_data_b),//
        .A_addr_a(A_addr_a),
        .A_addr_b(A_addr_b),
        .A_en_a(A_en_a),
        .A_en_b(A_en_b),
        .A_we_a(A_we_a),
        .A_we_b(A_we_b),
        .A_q_a(A_q_a),
        .A_q_b(A_q_b),

        /*---y---*/
        .y_data_a(y_data_a),
        .y_data_b(y_data_b),
        .y_addr_a(y_addr_a),
        .y_addr_b(y_addr_b),
        .y_en_a(y_en_a),
        .y_en_b(y_en_b),
        .y_we_a(y_we_a),
        .y_we_b(y_we_b),
        .y_q_a(y_q_a),
        .y_q_b(y_q_b),

        /*---c_tlide---*/
        .c_tlide_data_a(c_tlide_data_a),
        .c_tlide_data_b(c_tlide_data_b),
        .c_tlide_addr_a(c_tlide_addr_a),
        .c_tlide_addr_b(c_tlide_addr_b),
        .c_tlide_en_a(c_tlide_en_a),
        .c_tlide_en_b(c_tlide_en_b),
        .c_tlide_we_a(c_tlide_we_a),
        .c_tlide_we_b(c_tlide_we_b),
        .c_tlide_q_a(c_tlide_q_a),
        .c_tlide_q_b(c_tlide_q_b),

        /*---c_hat---*/
        .c_hat_data_a(c_hat_data_a),
        .c_hat_data_b(c_hat_data_b),
        .c_hat_addr_a(c_hat_addr_a),
        .c_hat_addr_b(c_hat_addr_b),
        .c_hat_en_a(c_hat_en_a),
        .c_hat_en_b(c_hat_en_b),
        .c_hat_we_a(c_hat_we_a),
        .c_hat_we_b(c_hat_we_b),
        .c_hat_q_a(c_hat_q_a),
        .c_hat_q_b(c_hat_q_b),

        /*---temp_0---*/
        .temp_0_data_a(temp_0_data_a),
        .temp_0_data_b(temp_0_data_b),
        .temp_0_addr_a(temp_0_addr_a),
        .temp_0_addr_b(temp_0_addr_b),
        .temp_0_en_a(temp_0_en_a),
        .temp_0_en_b(temp_0_en_b),
        .temp_0_we_a(temp_0_we_a),
        .temp_0_we_b(temp_0_we_b),
        .temp_0_q_a(temp_0_q_a),
        .temp_0_q_b(temp_0_q_b),

        /*---temp_1---*/
        .temp_1_data_a(temp_1_data_a),
        .temp_1_data_b(temp_1_data_b),
        .temp_1_addr_a(temp_1_addr_a),
        .temp_1_addr_b(temp_1_addr_b),
        .temp_1_en_a(temp_1_en_a),
        .temp_1_en_b(temp_1_en_b),
        .temp_1_we_a(temp_1_we_a),
        .temp_1_we_b(temp_1_we_b),
        .temp_1_q_a(temp_1_q_a),
        .temp_1_q_b(temp_1_q_b),

        /*---temp_2---*/
        .temp_2_data_a(temp_2_data_a),
        .temp_2_data_b(temp_2_data_b),
        .temp_2_addr_a(temp_2_addr_a),
        .temp_2_addr_b(temp_2_addr_b),
        .temp_2_en_a(temp_2_en_a),
        .temp_2_en_b(temp_2_en_b),
        .temp_2_we_a(temp_2_we_a),
        .temp_2_we_b(temp_2_we_b),
        .temp_2_q_a(temp_2_q_a),
        .temp_2_q_b(temp_2_q_b),

        /*---temp_3---*/
        .temp_3_data_a(temp_3_data_a),
        .temp_3_data_b(temp_3_data_b),
        .temp_3_addr_a(temp_3_addr_a),
        .temp_3_addr_b(temp_3_addr_b),
        .temp_3_en_a(temp_3_en_a),
        .temp_3_en_b(temp_3_en_b),
        .temp_3_we_a(temp_3_we_a),
        .temp_3_we_b(temp_3_we_b),
        .temp_3_q_a(temp_3_q_a),
        .temp_3_q_b(temp_3_q_b),

        /*---temp_4---*/
        .temp_4_data_a(temp_4_data_a),
        .temp_4_data_b(temp_4_data_b),
        .temp_4_addr_a(temp_4_addr_a),
        .temp_4_addr_b(temp_4_addr_b),
        .temp_4_en_a(temp_4_en_a),
        .temp_4_en_b(temp_4_en_b),
        .temp_4_we_a(temp_4_we_a),
        .temp_4_we_b(temp_4_we_b),
        .temp_4_q_a(temp_4_q_a),
        .temp_4_q_b(temp_4_q_b),

        /*---t---*/
        .t_data_a(t_data_a),
        .t_data_b(t_data_b),
        .t_addr_a(t_addr_a),
        .t_addr_b(t_addr_b),
        .t_en_a(t_en_a),
        .t_en_b(t_en_b),
        .t_we_a(t_we_a),
        .t_we_b(t_we_b),
        .t_q_a(t_q_a),
        .t_q_b(t_q_b),

        /*---t0---*/
        .t0_data_a(t0_data_a),
        .t0_data_b(t0_data_b),
        .t0_addr_a(t0_addr_a),
        .t0_addr_b(t0_addr_b),
        .t0_en_a(t0_en_a),
        .t0_en_b(t0_en_b),
        .t0_we_a(t0_we_a),
        .t0_we_b(t0_we_b),
        .t0_q_a(t0_q_a),
        .t0_q_b(t0_q_b),

        /*---tr---*/
        .tr_data_a(tr_data_a),
        .tr_data_b(tr_data_b),
        .tr_addr_a(tr_addr_a),
        .tr_addr_b(tr_addr_b),
        .tr_en_a(tr_en_a),
        .tr_en_b(tr_en_b),
        .tr_we_a(tr_we_a),
        .tr_we_b(tr_we_b),
        .tr_q_a(tr_q_a),
        .tr_q_b(tr_q_b),

        /*---u---*/
        .u_data_a(u_data_a),
        .u_data_b(u_data_b),
        .u_addr_a(u_addr_a),
        .u_addr_b(u_addr_b),
        .u_en_a(u_en_a),
        .u_en_b(u_en_b),
        .u_we_a(u_we_a),
        .u_we_b(u_we_b),
        .u_q_a(u_q_a),
        .u_q_b(u_q_b),

        /*---p_prime_prime---*/
        .p_prime_prime_data_a(p_prime_prime_data_a),
        .p_prime_prime_data_b(p_prime_prime_data_b),
        .p_prime_prime_addr_a(p_prime_prime_addr_a),
        .p_prime_prime_addr_b(p_prime_prime_addr_b),
        .p_prime_prime_en_a(p_prime_prime_en_a),
        .p_prime_prime_en_b(p_prime_prime_en_b),
        .p_prime_prime_we_a(p_prime_prime_we_a),
        .p_prime_prime_we_b(p_prime_prime_we_b),
        .p_prime_prime_q_a(p_prime_prime_q_a),
        .p_prime_prime_q_b(p_prime_prime_q_b),

        /*---s1_pack---*/
        .s1_pack_data_a(s1_pack_data_a),
        .s1_pack_data_b(s1_pack_data_b),
        .s1_pack_addr_a(s1_pack_addr_a),
        .s1_pack_addr_b(s1_pack_addr_b),
        .s1_pack_en_a(s1_pack_en_a),
        .s1_pack_en_b(s1_pack_en_b),
        .s1_pack_we_a(s1_pack_we_a),
        .s1_pack_we_b(s1_pack_we_b),
        .s1_pack_q_a(s1_pack_q_a),
        .s1_pack_q_b(s1_pack_q_b),

        /*---s2_pack---*/
        .s2_pack_data_a(s2_pack_data_a),
        .s2_pack_data_b(s2_pack_data_b),
        .s2_pack_addr_a(s2_pack_addr_a),
        .s2_pack_addr_b(s2_pack_addr_b),
        .s2_pack_en_a(s2_pack_en_a),
        .s2_pack_en_b(s2_pack_en_b),
        .s2_pack_we_a(s2_pack_we_a),
        .s2_pack_we_b(s2_pack_we_b),
        .s2_pack_q_a(s2_pack_q_a),
        .s2_pack_q_b(s2_pack_q_b),

        /*---t1_pack---*/
        .t1_pack_data_a(t1_pack_data_a),
        .t1_pack_data_b(t1_pack_data_b),
        .t1_pack_addr_a(t1_pack_addr_a),
        .t1_pack_addr_b(t1_pack_addr_b),
        .t1_pack_en_a(t1_pack_en_a),
        .t1_pack_en_b(t1_pack_en_b),
        .t1_pack_we_a(t1_pack_we_a),
        .t1_pack_we_b(t1_pack_we_b),
        .t1_pack_q_a(t1_pack_q_a),
        .t1_pack_q_b(t1_pack_q_b),

        /*---t0_pack---*/
        .t0_pack_data_a(t0_pack_data_a),
        .t0_pack_data_b(t0_pack_data_b),
        .t0_pack_addr_a(t0_pack_addr_a),
        .t0_pack_addr_b(t0_pack_addr_b),
        .t0_pack_en_a(t0_pack_en_a),
        .t0_pack_en_b(t0_pack_en_b),
        .t0_pack_we_a(t0_pack_we_a),
        .t0_pack_we_b(t0_pack_we_b),
        .t0_pack_q_a(t0_pack_q_a),
        .t0_pack_q_b(t0_pack_q_b),

        /*---w1_pack---*/
        .w1_pack_data_a(w1_pack_data_a),
        .w1_pack_data_b(w1_pack_data_b),
        .w1_pack_addr_a(w1_pack_addr_a),
        .w1_pack_addr_b(w1_pack_addr_b),
        .w1_pack_en_a(w1_pack_en_a),
        .w1_pack_en_b(w1_pack_en_b),
        .w1_pack_we_a(w1_pack_we_a),
        .w1_pack_we_b(w1_pack_we_b),
        .w1_pack_q_a(w1_pack_q_a),
        .w1_pack_q_b(w1_pack_q_b),

        /*---PWM_temp---*/
        .PWM_temp_data_a(PWM_temp_data_a),
        .PWM_temp_data_b(PWM_temp_data_b),
        .PWM_temp_addr_a(PWM_temp_addr_a),
        .PWM_temp_addr_b(PWM_temp_addr_b),
        .PWM_temp_en_a(PWM_temp_en_a),
        .PWM_temp_en_b(PWM_temp_en_b),
        .PWM_temp_we_a(PWM_temp_we_a),
        .PWM_temp_we_b(PWM_temp_we_b),
        .PWM_temp_q_a(PWM_temp_q_a),
        .PWM_temp_q_b(PWM_temp_q_b)
    );
    
    mux_gen #(
        .param_in(1024),
        .param_m(128)
    ) mux_(
        .in(sha_out[1023:0]),
        .sel(AG_4_addr_a >> 1),
        .out(seed_out)
    );

    always @(*) begin
        seed_data_a = 64'd0;
        seed_data_b = 64'd0;
        seed_addr_a = 8'd0;
        seed_addr_b = 8'd0;
        seed_en_a   = 1'd0; 
        seed_en_b   = 1'd0; 
        seed_we_a   = 1'd0; 
        seed_we_b   = 1'd0; 
        case (ctrl_sign)
            {KeyGen,6'd1}:begin
                seed_data_a = seed_out[63:0];
                seed_data_b = seed_out[127:64];
                seed_addr_a = AG_4_addr_a[3:0];
                seed_addr_b = AG_4_addr_b[3:0];
                seed_en_a  =  AG_4_addr_en;
                seed_en_b  =  AG_4_addr_en;
                seed_we_a  =  AG_4_addr_en;
                seed_we_b  =  AG_4_addr_en;
            end
            {KeyGen,6'd2},
            {KeyGen,6'd3},
            {KeyGen,6'd4}:begin
                seed_addr_a = AG_1_addr_a[3:0];
                seed_en_a  =  AG_1_addr_en;
            end
            {KeyGen,6'd8}:begin
                seed_addr_a = AG_1_addr_a[3:0];
                seed_en_a  =  (~main_mem_sel[0]) & AG_1_addr_en;
            end
            {KeyGen,6'd9}:begin
                seed_addr_a = AG_1_addr_a[3:0];
                seed_en_a  =  (~main_mem_sel[0]) & AG_1_addr_en;
            end
            {KeyGen,6'd10}:begin
                if(main_mem_sel == 4'd0)begin
                    seed_addr_a = AG_1_addr_a[3:0];
                    seed_en_a  =  AG_1_addr_en;
                end
                else if(main_mem_sel == 4'd1)begin
                    seed_addr_a = AG_1_addr_a[3:0];
                    seed_en_a  =  AG_1_addr_en;
                end   
            end
            {SignGen,6'd2}:begin
                seed_data_a = seed_out[63:0];
                seed_data_b = seed_out[127:64];
                seed_addr_a = AG_4_addr_a[2:0];
                seed_addr_b = AG_4_addr_b[2:0];
                seed_en_a  =  AG_4_addr_en;
                seed_en_b  =  AG_4_addr_en;
                seed_we_a  =  AG_4_addr_en;
                seed_we_b  =  AG_4_addr_en;
            end
            {SignGen,6'd3}:begin
                seed_addr_a = AG_1_addr_a[3:0];
                seed_en_a  =  AG_1_addr_en;
            end
            {SignGen,6'd20}:begin //store p from MLDSA_in_B (stage_4-1)
                seed_data_a = MLDSA_data_in_B;
                seed_addr_a = AG_1_addr_a[3:0];
                seed_en_a  =  AG_1_addr_en;
                seed_we_a  =  AG_1_addr_en;
            end
            {SignGen,6'd4},
            {SignGen,6'd5}:begin
                seed_addr_a = AG_1_addr_a[3:0];
                seed_en_a  =  AG_1_addr_en;
            end
            {SignGen,6'd15}:begin
                seed_addr_a = AG_1_addr_a[3:0];
                seed_en_a  =  AG_1_addr_en;
            end
        endcase
    end

    //---s1 mem
    always @(*) begin
        s1_data_a = 3'd0;
        s1_data_b = 3'd0;
        s1_addr_a = 10'd0;
        s1_addr_b = 10'd0;
        s1_en_a   = 1'd0;
        s1_en_b   = 1'd0;
        s1_we_a   = 1'd0;
        s1_we_b   = 1'd0;
        case (ctrl_sign)
            {KeyGen,6'd2}:begin //Gen_s1
                s1_data_a = z0;
                s1_data_b = z1;
                s1_addr_a = {s1_index[1:0],addr_z0};
                s1_addr_b = {s1_index[1:0],addr_z1};
                s1_en_a   = en_z0;
                s1_en_b   = en_z1;
                s1_we_a   = we_z0;
                s1_we_b   = we_z1;
            end
            {KeyGen,6'd3}:begin
                s1_addr_a = {NTT_index,AG_2_addr_a[7:0]};
                s1_addr_b = {NTT_index,(AG_2_addr_a[7:0] + 8'd128)};
                s1_en_a   = AG_2_addr_en;
                s1_en_b   = AG_2_addr_en;
            end
            {KeyGen,6'd4}:begin // Enocder s1
                s1_addr_a = AG_2_addr_a[9:0];
                s1_addr_b = AG_2_addr_b[9:0];
                s1_en_a   = AG_2_addr_en;
                s1_en_b   = AG_2_addr_en;
            end
            {SignGen,6'd1}:begin // Decocder s1_pack to s1
                s1_data_a = DEC_dout[2:0];
                s1_data_b = DEC_dout[25:23];
                s1_addr_a = AG_3_addr_a;
                s1_addr_b = AG_3_addr_b;
                s1_en_a   = DEC_valid_o;
                s1_en_b   = DEC_valid_o;
                s1_we_a   = DEC_valid_o;
                s1_we_b   = DEC_valid_o;
            end
            {SignGen,6'd2}:begin
                s1_addr_a = {NTT_index,AG_2_addr_a[7:0]};
                s1_addr_b = {NTT_index,(AG_2_addr_a[7:0] + 8'd128)};
                s1_en_a   = AG_2_addr_en;
                s1_en_b   = AG_2_addr_en;
            end
        endcase
    end

    //---s2 mem
    always @(*) begin
        s2_data_a = 3'd0;
        s2_data_b = 3'd0;
        s2_addr_a = 10'd0;
        s2_addr_b = 10'd0;
        s2_en_a   = 1'd0;
        s2_en_b   = 1'd0;
        s2_we_a   = 1'd0;
        s2_we_b   = 1'd0;
        case (ctrl_sign)
            {KeyGen,6'd3}:begin //Gen_s2
                s2_data_a = z0;
                s2_data_b = z1;
                s2_addr_a = {s2_index[1:0],addr_z0};
                s2_addr_b = {s2_index[1:0],addr_z1};
                s2_en_a   = en_z0;
                s2_en_b   = en_z1;
                s2_we_a   = we_z0;
                s2_we_b   = we_z1;
            end
            {KeyGen,6'd5}:begin //Gen_s2
                s2_addr_a = AG_2_addr_a[9:0];
                s2_addr_b = AG_2_addr_b[9:0];
                s2_en_a   = AG_2_addr_en;
                s2_en_b   = AG_2_addr_en;
            end
            {KeyGen,6'd7}:begin // Enocder s2
                s2_addr_a = AG_4_addr_a[9:0];
                s2_addr_b = AG_4_addr_b[9:0];
                s2_en_a   = AG_4_addr_en;
                s2_en_b   = AG_4_addr_en;
            end
            {SignGen,6'd2}:begin // Decocder s2_pack to s2
                s2_data_a = DEC_dout[2:0];
                s2_data_b = DEC_dout[25:23];
                s2_addr_a = AG_3_addr_a;
                s2_addr_b = AG_3_addr_b;
                s2_en_a   = DEC_valid_o;
                s2_en_b   = DEC_valid_o;
                s2_we_a   = DEC_valid_o;
                s2_we_b   = DEC_valid_o;
            end
            {SignGen,6'd3}:begin
                s2_addr_a = {NTT_index,AG_2_addr_a[7:0]};
                s2_addr_b = {NTT_index,(AG_2_addr_a[7:0] + 8'd128)};
                s2_en_a   = AG_2_addr_en;
                s2_en_b   = AG_2_addr_en;
            end
        endcase
    end

    //---A mem
    always @(*) begin
        A_data_a = 23'd0;
        A_data_b = 23'd0;
        A_addr_a = 10'd0;
        A_addr_b = 10'd0;
        A_en_a   = 1'd0;
        A_en_b   = 1'd0;
        A_we_a   = 1'd0;
        A_we_b   = 1'd0;
        case (ctrl_sign)
            {KeyGen,6'd4}:begin //Gen_A
                A_data_a = A0;
                A_data_b = A1;
                A_addr_a = {A_index,addr_A0};
                A_addr_b = {A_index,addr_A1};
                A_en_a   = en_A0;
                A_en_b   = en_A1;
                A_we_a   = we_A0;
                A_we_b   = we_A1;
            end
            {KeyGen,6'd5}:begin //PWM t^ = A^ * s1^
                A_addr_a = {AG_4_addr_a[9:8], PWM_index,AG_4_addr_a[7:0]};
                A_addr_b = {AG_4_addr_a[9:8], PWM_index,AG_4_addr_a[7:0]} + 1'b1;
                A_en_a   = AG_4_addr_en;
                A_en_b   = AG_4_addr_en;
            end
            {SignGen,6'd4},      //Gen_A
            {SignGen,6'd5}:begin //Gen_A
                A_data_a = A0;
                A_data_b = A1;
                A_addr_a = {A_index,addr_A0};
                A_addr_b = {A_index,addr_A1};
                A_en_a   = en_A0;
                A_en_b   = en_A1;
                A_we_a   = we_A0;
                A_we_b   = we_A1;
            end
            {SignGen,6'd6}:begin //PWM W^ = A^ * y^
                A_addr_a = {AG_4_addr_a[9:8], PWM_index,AG_4_addr_a[7:0]};
                A_addr_b = {AG_4_addr_a[9:8], PWM_index,AG_4_addr_a[7:0]} + 1'b1;
                A_en_a   = AG_4_addr_en;
                A_en_b   = AG_4_addr_en;
            end
        endcase
    end

    //---y mem
    always @(*) begin
        y_data_a = 23'd0;
        y_data_b = 23'd0;
        y_addr_a = 10'd0;
        y_addr_b = 10'd0;
        y_en_a   = 1'd0;
        y_en_b   = 1'd0;
        y_we_a   = 1'd0;
        y_we_b   = 1'd0;
        case (ctrl_sign)
            {SignGen,6'd3}:begin //Gen y
                y_data_a = y0;
                y_data_b = y1;
                y_addr_a = {y_index,addr_y0};
                y_addr_b = {y_index,addr_y1};
                y_en_a   = en_y;
                y_en_b   = en_y;
                y_we_a   = we_y;
                y_we_b   = we_y;
            end
            {SignGen,6'd5}:begin //NTT y
                y_addr_a = {NTT_index,AG_2_addr_a[7:0]};
                y_addr_b = {NTT_index,(AG_2_addr_a[7:0] + 8'd128)};
                y_en_a   = AG_2_addr_en;
                y_en_b   = AG_2_addr_en;
            end
            {SignGen,6'd14}:begin
                y_addr_a = AG_4_addr_a;
                y_addr_b = AG_4_addr_b;
                y_en_a   = AG_4_addr_en;
                y_en_b   = AG_4_addr_en;
            end
            {SignGen,6'd15}:begin //Gen y
                y_data_a = y0;
                y_data_b = y1;
                y_addr_a = {y_index,addr_y0};
                y_addr_b = {y_index,addr_y1};
                y_en_a   = en_y;
                y_en_b   = en_y;
                y_we_a   = we_y;
                y_we_b   = we_y;
            end
            {SignGen,6'd16}:begin //NTT y
                y_addr_a = {NTT_index,AG_2_addr_a[7:0]};
                y_addr_b = {NTT_index,(AG_2_addr_a[7:0] + 8'd128)};
                y_en_a   = AG_2_addr_en;
                y_en_b   = AG_2_addr_en;
            end
        endcase
    end

    //---c mem
    always @(*) begin
        c_data_a = 23'd0;
        c_data_b = 23'd0;
        c_addr_a = 8'd0;
        c_addr_b = 8'd0;
        c_en_a   = 1'd0;
        c_en_b   = 1'd0;
        c_we_a   = 1'd0;
        c_we_b   = 1'd0;
        case (ctrl_sign)
            {SignGen,6'd10}:begin //Gen_s1
                c_data_a = ci;
                c_data_b = c_q_a;
                c_addr_a = addr_ci;
                c_addr_b = addr_cj;
                c_en_a   = en_ci;
                c_en_b   = en_cj;
                c_we_a   = we_ci;
                c_we_b   = we_cj;
            end
            {SignGen,6'd11}:begin //NTT c -> c_hat
                c_addr_a = {NTT_index,AG_2_addr_a[7:0]};
                c_addr_b = {NTT_index,(AG_2_addr_a[7:0] + 8'd128)};
                c_en_a   = AG_2_addr_en;
                c_en_b   = AG_2_addr_en;
            end    
        endcase
    end


    //---t mem
    always @(*) begin
        t_data_a = 23'd0;
        t_data_b = 23'd0;
        t_addr_a = 10'd0;
        t_addr_b = 10'd0;
        t_en_a   = 1'd0;
        t_en_b   = 1'd0;
        t_we_a   = 1'd0;
        t_we_b   = 1'd0;
        case (ctrl_sign)
            {KeyGen,6'd5}:begin //PWM t^ = A^ * s1^
                if(~PWM_index[0])begin
                    t_addr_a = AG_4_addr_a;
                    t_addr_b = AG_4_addr_a + 1'b1;
                    t_en_a   = AG_4_addr_en;
                    t_en_b   = AG_4_addr_en;
                end
                else begin
                    t_data_a = PWM_out_a;
                    t_data_b = PWM_out_b;
                    t_addr_a = AG_4_addr_a - 2'd2;
                    t_addr_b = AG_4_addr_a - 2'd1;
                    t_en_a   = AG_4_data_valid;
                    t_en_b   = AG_4_data_valid;
                    t_we_a   = AG_4_data_valid;
                    t_we_b   = AG_4_data_valid;
                end
            end
            {KeyGen,6'd6}:begin
                t_addr_a = {NTT_index, AG_2_addr_a[7:0]};
                t_addr_b = {NTT_index, AG_2_addr_a[7:0]} + 1'b1;
                t_en_a   = AG_2_addr_en;
                t_en_b   = AG_2_addr_en;
            end
            {KeyGen,6'd7}:begin
                t_data_a = PWM_out_a;
                t_data_b = PWM_out_b;
                t_addr_a = AG_4_addr_a - 2'd2;
                t_addr_b = AG_4_addr_b - 2'd2;
                t_en_a   = AG_4_data_valid;
                t_en_b   = AG_4_data_valid;
                t_we_a   = AG_4_data_valid;
                t_we_b   = AG_4_data_valid;
            end
            {KeyGen,6'd8}:begin
                t_addr_a = AG_2_addr_a;
                t_addr_b = AG_2_addr_b;
                t_en_a   = AG_2_addr_en;
                t_en_b   = AG_2_addr_en;
            end
            {SignGen,6'd6}:begin //PWM W^ = A^ * y^ store w^ in t MEM
                if(~PWM_index[0])begin
                    t_addr_a = AG_4_addr_a;
                    t_addr_b = AG_4_addr_a + 1'b1;
                    t_en_a   = AG_4_addr_en;
                    t_en_b   = AG_4_addr_en;
                end
                else begin
                    t_data_a = PWM_out_a;
                    t_data_b = PWM_out_b;
                    t_addr_a = AG_4_addr_a - 2'd2;
                    t_addr_b = AG_4_addr_a - 2'd1;
                    t_en_a   = AG_4_data_valid;
                    t_en_b   = AG_4_data_valid;
                    t_we_a   = AG_4_data_valid;
                    t_we_b   = AG_4_data_valid;
                end
            end
            {SignGen,6'd7}:begin // INTT W^, take the w^ data from t MEM
                t_addr_a = {NTT_index, AG_2_addr_a[7:0]};
                t_addr_b = {NTT_index, AG_2_addr_a[7:0]} + 1'b1;
                t_en_a   = AG_2_addr_en;
                t_en_b   = AG_2_addr_en;
            end
            {SignGen,6'd12}:begin // PWM <<cs1>>^ = c^ * s1^ and store <<cs1>>^ here
                t_data_a = PWM_out_a;
                t_data_b = PWM_out_b;
                t_addr_a = AG_4_addr_a - 2'd2;
                t_addr_b = AG_4_addr_a - 2'd1;
                t_en_a   = AG_4_data_valid;
                t_en_b   = AG_4_data_valid;
                t_we_a   = AG_4_data_valid;
                t_we_b   = AG_4_data_valid;
            end
            {SignGen,6'd13}:begin // INTT <<cs1>>^, send out <<cs1>>^ data
                t_addr_a = {NTT_index, AG_2_addr_a[7:0]};
                t_addr_b = {NTT_index, AG_2_addr_a[7:0]} + 1'b1;
                t_en_a   = AG_2_addr_en;
                t_en_b   = AG_2_addr_en;
            end
        endcase
    end

    //---t0 mem
    always @(*) begin
        t0_data_a = 23'd0;
        t0_data_b = 23'd0;
        t0_addr_a = 10'd0;
        t0_addr_b = 10'd0;
        t0_en_a   = 1'd0;
        t0_en_b   = 1'd0;
        t0_we_a   = 1'd0;
        t0_we_b   = 1'd0;
        case (ctrl_sign)
            {SignGen,6'd3}:begin // Decocder t0_pack to t0
                t0_data_a = DEC_dout[22:0];
                t0_data_b = DEC_dout[45:23];
                t0_addr_a = AG_3_addr_a;
                t0_addr_b = AG_3_addr_b;
                t0_en_a   = DEC_valid_o;
                t0_en_b   = DEC_valid_o;
                t0_we_a   = DEC_valid_o;
                t0_we_b   = DEC_valid_o;
            end
            {SignGen,6'd4}:begin //NTT t0
                t0_addr_a = {NTT_index,AG_2_addr_a[7:0]};
                t0_addr_b = {NTT_index,(AG_2_addr_a[7:0] + 8'd128)};
                t0_en_a   = AG_2_addr_en;
                t0_en_b   = AG_2_addr_en;
            end
            {SignGen,6'd15}:begin //PWM w_cs2 = 𝐰 − ⟨⟨𝑐𝐬2⟩⟩ and LowBits(w_cs2)
                t0_data_a = DEC_dout[22:0];
                t0_data_b = DEC_dout[45:23];
                t0_addr_a = AG_4_addr_a;
                t0_addr_b = AG_4_addr_b;
                t0_en_a   = AG_4_data_valid;
                t0_en_b   = AG_4_data_valid;
                t0_we_a   = AG_4_data_valid;
                t0_we_b   = AG_4_data_valid;
            end
        endcase
    end
    
    //---tr mem
    always @(*) begin
        tr_data_a = 3'd0;
        tr_data_b = 3'd0;
        tr_addr_a = 10'd0;
        tr_addr_b = 10'd0;
        tr_en_a   = 1'd0;
        tr_en_b   = 1'd0;
        tr_we_a   = 1'd0;
        tr_we_b   = 1'd0;
        case (ctrl_sign)
            {KeyGen,6'd8}:begin
                tr_data_a = seed_out[63:0];
                tr_data_b = seed_out[127:64];
                tr_addr_a = AG_4_addr_a[2:0];
                tr_addr_b = AG_4_addr_b[2:0];
                tr_en_a  =  AG_4_addr_en;
                tr_en_b  =  AG_4_addr_en;
                tr_we_a  =  AG_4_addr_en;
                tr_we_b  =  AG_4_addr_en;
            end
            {KeyGen,6'd10}:begin
                if(main_mem_sel == 4'd2)begin
                   tr_addr_a = AG_1_addr_a[2:0]; 
                   tr_en_a  =  AG_1_addr_en;
                end
            end
        endcase
    end

    //---u mem
    always @(*) begin
        u_data_a = 3'd0;
        u_data_b = 3'd0;
        u_addr_a = 10'd0;
        u_addr_b = 10'd0;
        u_en_a   = 1'd0;
        u_en_b   = 1'd0;
        u_we_a   = 1'd0;
        u_we_b   = 1'd0;
        case (ctrl_sign)
            {SignGen,6'd1}:begin
                u_data_a = seed_out[63:0];
                u_data_b = seed_out[127:64];
                u_addr_a = AG_4_addr_a[2:0];
                u_addr_b = AG_4_addr_b[2:0];
                u_en_a  =  AG_4_addr_en;
                u_en_b  =  AG_4_addr_en;
                u_we_a  =  AG_4_addr_en;
                u_we_b  =  AG_4_addr_en;
            end
            {SignGen,6'd2}:begin
                u_addr_a = AG_1_addr_a[2:0];
                u_en_a  =  AG_1_addr_en;
            end
            {SignGen,6'd9}:begin
                if(~main_mem_sel[0])begin
                    u_addr_a = AG_1_addr_a[2:0];
                    u_en_a  =  AG_1_addr_en;
                end
            end
        endcase
    end

    //---p_prime_prime mem
    // always @(*) begin
    //     p_prime_prime_data_a = 3'd0;
    //     p_prime_prime_data_b = 3'd0;
    //     p_prime_prime_addr_a = 10'd0;
    //     p_prime_prime_addr_b = 10'd0;
    //     p_prime_prime_en_a   = 1'd0;
    //     p_prime_prime_en_b   = 1'd0;
    //     p_prime_prime_we_a   = 1'd0;
    //     p_prime_prime_we_b   = 1'd0;
    //     case (ctrl_sign)
    //         {SignGen,6'd2}:begin
    //             p_prime_prime_data_a = seed_out[63:0];
    //             p_prime_prime_data_b = seed_out[127:64];
    //             p_prime_prime_addr_a = AG_4_addr_a[2:0];
    //             p_prime_prime_addr_b = AG_4_addr_b[2:0];
    //             p_prime_prime_en_a  =  AG_4_addr_en;
    //             p_prime_prime_en_b  =  AG_4_addr_en;
    //             p_prime_prime_we_a  =  AG_4_addr_en;
    //             p_prime_prime_we_b  =  AG_4_addr_en;
    //         end
    //     endcase
    // end

    //---s1_pack mem
    always @(*) begin
        s1_pack_data_a = 3'd0;
        s1_pack_data_b = 3'd0;
        s1_pack_addr_a = 10'd0;
        s1_pack_addr_b = 10'd0;
        s1_pack_en_a   = 1'd0;
        s1_pack_en_b   = 1'd0;
        s1_pack_we_a   = 1'd0;
        s1_pack_we_b   = 1'd0;
        case (ctrl_sign)
            {KeyGen,6'd4}:begin // Enocder s1
                s1_pack_data_a = ENC_dout;
                s1_pack_addr_a = AG_3_addr_a;
                s1_pack_en_a   = ENC_valid_o;
                s1_pack_we_a   = ENC_valid_o;
            end
            {KeyGen,6'd10}:begin
                if(main_mem_sel == 4'd3)begin
                   s1_pack_addr_a = AG_1_addr_a; 
                   s1_pack_en_a  =  AG_1_addr_en;
                end
            end
        endcase
    end


    //---s2_pack mem
    always @(*) begin
        s2_pack_data_a = 3'd0;
        s2_pack_data_b = 3'd0;
        s2_pack_addr_a = 10'd0;
        s2_pack_addr_b = 10'd0;
        s2_pack_en_a   = 1'd0;
        s2_pack_en_b   = 1'd0;
        s2_pack_we_a   = 1'd0;
        s2_pack_we_b   = 1'd0;
        case (ctrl_sign)
            {KeyGen,6'd5}:begin // Enocder s2
                s2_pack_data_a = ENC_dout;
                s2_pack_addr_a = AG_3_addr_a;
                s2_pack_en_a   = ENC_valid_o;
                s2_pack_we_a   = ENC_valid_o;
            end
            {KeyGen,6'd10}:begin
                if(main_mem_sel == 4'd4)begin
                   s2_pack_addr_a = AG_1_addr_a; 
                   s2_pack_en_a  =  AG_1_addr_en;
                end
            end
        endcase
    end

    //---t1_pack mem
    always @(*) begin
        t1_pack_data_b = 23'd0;
        t1_pack_data_a = 23'd0;
        t1_pack_addr_a = 8'd0;
        t1_pack_addr_b = 8'd0;
        t1_pack_en_a   = 1'd0;
        t1_pack_en_b   = 1'd0;
        t1_pack_we_a   = 1'd0;
        t1_pack_we_b   = 1'd0;
        case (ctrl_sign)
            {KeyGen,6'd7}:begin // Enocder t
                t1_pack_data_a = ENC_dout;
                t1_pack_addr_a = AG_3_addr_a;
                t1_pack_en_a   = ENC_valid_o;
                t1_pack_we_a   = ENC_valid_o;
            end
            {KeyGen,6'd8}:begin
                t1_pack_addr_a = AG_1_addr_a[7:0];
                t1_pack_en_a  =  (main_mem_sel[0]) & AG_1_addr_en;
            end
            {KeyGen,6'd9}:begin
                t1_pack_addr_a = AG_1_addr_a[7:0];
                t1_pack_en_a  =  (main_mem_sel[0]) & AG_1_addr_en;
            end
        endcase
    end

    //---t0_pack mem
    always @(*) begin
        t0_pack_data_b = 23'd0;
        t0_pack_data_a = 23'd0;
        t0_pack_addr_a = 8'd0;
        t0_pack_addr_b = 8'd0;
        t0_pack_en_a   = 1'd0;
        t0_pack_en_b   = 1'd0;
        t0_pack_we_a   = 1'd0;
        t0_pack_we_b   = 1'd0;
        case (ctrl_sign)
            {KeyGen,6'd8}:begin // Enocder t
                t0_pack_data_a = ENC_dout;
                t0_pack_addr_a = AG_3_addr_a;
                t0_pack_en_a   = ENC_valid_o;
                t0_pack_we_a   = ENC_valid_o;
            end
            {KeyGen,6'd10}:begin
                if(main_mem_sel == 4'd5)begin
                   t0_pack_addr_a = AG_1_addr_a; 
                   t0_pack_en_a  =  AG_1_addr_en;
                end
            end
        endcase
    end

    //---w1_pack mem
    always @(*) begin
        w1_pack_data_b = 23'd0;
        w1_pack_data_a = 23'd0;
        w1_pack_addr_a = 7'd0;
        w1_pack_addr_b = 7'd0;
        w1_pack_en_a   = 1'd0;
        w1_pack_en_b   = 1'd0;
        w1_pack_we_a   = 1'd0;
        w1_pack_we_b   = 1'd0;
        case (ctrl_sign)
            {SignGen,6'd8}:begin // Enocder t
                w1_pack_data_a = ENC_dout;
                w1_pack_addr_a = AG_3_addr_a;
                w1_pack_en_a   = ENC_valid_o;
                w1_pack_we_a   = ENC_valid_o;
            end
            {SignGen,6'd9}:begin
                if(main_mem_sel[0])begin
                   w1_pack_addr_a = AG_1_addr_a; 
                   w1_pack_en_a  =  AG_1_addr_en;
                end
            end
        endcase
    end
    
    //---c_hat mem
    always @(*) begin
        c_hat_data_a = 23'd0;
        c_hat_data_b = 23'd0;
        c_hat_addr_a = 8'd0;
        c_hat_addr_b = 8'd0;
        c_hat_en_a   = 1'd0;
        c_hat_en_b   = 1'd0;
        c_hat_we_a   = 1'd0;
        c_hat_we_b   = 1'd0;
        case (ctrl_sign)
            {SignGen,6'd11}:begin
                c_hat_data_a = NTT_out_u;
                c_hat_data_b = NTT_out_d;
                c_hat_addr_a = NTT_addr_u;
                c_hat_addr_b = NTT_addr_d;
                c_hat_en_a   = NTT_out_ready;
                c_hat_en_b   = NTT_out_ready;
                c_hat_we_a   = NTT_out_ready;
                c_hat_we_b   = NTT_out_ready;
            end
            {SignGen,6'd12}:begin //PWM <<cs1>> = c^ * s1^ and send c_hat data to PWM
                c_hat_addr_a = AG_4_addr_a[7:0];
                c_hat_addr_b = AG_4_addr_b[7:0];
                c_hat_en_a   = AG_4_addr_en;
                c_hat_en_b   = AG_4_addr_en;
            end
            {SignGen,6'd13}:begin //PWM <<cs2>> = c^ * s2^ and send c_hat data to PWM
                c_hat_addr_a = AG_4_addr_a[7:0];
                c_hat_addr_b = AG_4_addr_b[7:0];
                c_hat_en_a   = AG_4_addr_en;
                c_hat_en_b   = AG_4_addr_en;
            end
            {SignGen,6'd16}:begin //PWM <<ct0>>^ = c^ * t0^
                c_hat_addr_a = AG_4_addr_a[7:0];
                c_hat_addr_b = AG_4_addr_b[7:0];
                c_hat_en_a   = AG_4_addr_en;
                c_hat_en_b   = AG_4_addr_en;
            end
        endcase
    end

    //---c_tlide mem
    always @(*) begin
        c_tlide_data_a = 64'd0;
        c_tlide_data_b = 64'd0;
        c_tlide_addr_a = 2'd0;
        c_tlide_addr_b = 2'd0;
        c_tlide_en_a   = 1'd0;
        c_tlide_en_b   = 1'd0;
        c_tlide_we_a   = 1'd0;
        c_tlide_we_b   = 1'd0;
        case (ctrl_sign)
            {SignGen,6'd9}:begin
                c_tlide_data_a = seed_out[63:0];
                c_tlide_data_b = seed_out[127:64];
                c_tlide_addr_a = AG_4_addr_a[1:0];
                c_tlide_addr_b = AG_4_addr_b[1:0];
                c_tlide_en_a  =  AG_4_addr_en;
                c_tlide_en_b  =  AG_4_addr_en;
                c_tlide_we_a  =  AG_4_addr_en;
                c_tlide_we_b  =  AG_4_addr_en;
            end
            {SignGen,6'd10}:begin
                c_tlide_addr_a = AG_1_addr_a[1:0];
                c_tlide_en_a  =  AG_1_addr_en;
            end
        endcase
    end
    
    //---temp_0 mem
    always @(*) begin
        temp_0_data_a = 23'd0;
        temp_0_data_b = 23'd0;
        temp_0_addr_a = 10'd0;
        temp_0_addr_b = 10'd0;
        temp_0_en_a   = 1'd0;
        temp_0_en_b   = 1'd0;
        temp_0_we_a   = 1'd0;
        temp_0_we_b   = 1'd0;
        case (ctrl_sign)
            {KeyGen,6'd3}:begin
                temp_0_data_a = NTT_out_u;
                temp_0_data_b = NTT_out_d;
                temp_0_addr_a = {NTT_index,NTT_addr_u};
                temp_0_addr_b = {NTT_index,NTT_addr_d};
                temp_0_en_a   = NTT_out_ready;
                temp_0_en_b   = NTT_out_ready;
                temp_0_we_a   = NTT_out_ready;
                temp_0_we_b   = NTT_out_ready;
            end
            {KeyGen,6'd5}:begin //PWM t^ = A^ * s1^
                temp_0_addr_a = {PWM_index, AG_4_addr_a[7:0]};
                temp_0_addr_b = {PWM_index, AG_4_addr_a[7:0]} + 1'b1;
                temp_0_en_a   = AG_4_addr_en;
                temp_0_en_b   = AG_4_addr_en;
            end
            {KeyGen,6'd6}:begin //INTT t^
                temp_0_data_a = NTT_out_u;
                temp_0_data_b = NTT_out_d;
                temp_0_addr_a = {NTT_index,NTT_addr_u};
                temp_0_addr_b = {NTT_index,NTT_addr_d};
                temp_0_en_a   = NTT_out_ready;
                temp_0_en_b   = NTT_out_ready;
                temp_0_we_a   = NTT_out_ready;
                temp_0_we_b   = NTT_out_ready;
            end
            {KeyGen,6'd7}:begin
                temp_0_addr_a = AG_4_addr_a;
                temp_0_addr_b = AG_4_addr_b;
                temp_0_en_a   = AG_4_addr_en;
                temp_0_en_b   = AG_4_addr_en;
            end
            {SignGen,6'd2}:begin // NTT s1 and store s1^
                temp_0_data_a = NTT_out_u;
                temp_0_data_b = NTT_out_d;
                temp_0_addr_a = {NTT_index,NTT_addr_u};
                temp_0_addr_b = {NTT_index,NTT_addr_d};
                temp_0_en_a   = NTT_out_ready;
                temp_0_en_b   = NTT_out_ready;
                temp_0_we_a   = NTT_out_ready;
                temp_0_we_b   = NTT_out_ready;
            end
            {SignGen,6'd12}:begin //PWM <<cs1>> = c^ * s1^ and send s1^ data to PWM
                temp_0_addr_a = AG_4_addr_a;
                temp_0_addr_b = AG_4_addr_b;
                temp_0_en_a   = AG_4_addr_en;
                temp_0_en_b   = AG_4_addr_en;
            end
            {SignGen,6'd13}:begin // INTT <<cs1>> and store <<cs1>>
                temp_0_data_a = NTT_out_u;
                temp_0_data_b = NTT_out_d;
                temp_0_addr_a = {NTT_index,NTT_addr_u};
                temp_0_addr_b = {NTT_index,NTT_addr_d};
                temp_0_en_a   = NTT_out_ready;
                temp_0_en_b   = NTT_out_ready;
                temp_0_we_a   = NTT_out_ready;
                temp_0_we_b   = NTT_out_ready;
            end
            {SignGen,6'd14}:begin
                temp_0_addr_a = AG_4_addr_a;
                temp_0_addr_b = AG_4_addr_b;
                temp_0_en_a   = AG_4_addr_en;
                temp_0_en_b   = AG_4_addr_en;
            end
            {SignGen,6'd18}:begin //PWM (𝐰 − ⟨⟨𝑐𝐬2⟩⟩) + <<ct0>> store data here
                temp_0_data_a = PWM_out_a;
                temp_0_data_b = PWM_out_b;
                temp_0_addr_a = AG_4_addr_a - 2'd2;
                temp_0_addr_b = AG_4_addr_a - 2'd1;
                temp_0_en_a   = AG_4_data_valid;
                temp_0_en_b   = AG_4_data_valid;
                temp_0_we_a   = AG_4_data_valid;
                temp_0_we_b   = AG_4_data_valid;
            end
        endcase
    end

    //---temp_1 mem
    always @(*) begin
        temp_1_data_a = 23'd0;
        temp_1_data_b = 23'd0;
        temp_1_addr_a = 10'd0;
        temp_1_addr_b = 10'd0;
        temp_1_en_a   = 1'd0;
        temp_1_en_b   = 1'd0;
        temp_1_we_a   = 1'd0;
        temp_1_we_b   = 1'd0;
        case (ctrl_sign)
            {SignGen,6'd3}:begin // NTT s2
                temp_1_data_a = NTT_out_u;
                temp_1_data_b = NTT_out_d;
                temp_1_addr_a = {NTT_index,NTT_addr_u};
                temp_1_addr_b = {NTT_index,NTT_addr_d};
                temp_1_en_a   = NTT_out_ready;
                temp_1_en_b   = NTT_out_ready;
                temp_1_we_a   = NTT_out_ready;
                temp_1_we_b   = NTT_out_ready;
            end
            {SignGen,6'd13}:begin //PWM <<cs2>> = c^ * s2^ and send s2^ data to PWM
                temp_1_addr_a = AG_4_addr_a;
                temp_1_addr_b = AG_4_addr_b;
                temp_1_en_a   = AG_4_addr_en;
                temp_1_en_b   = AG_4_addr_en;
            end
            {SignGen,6'd14}:begin // INTT <<cs2>>^ and store <<cs2>>
                temp_1_data_a = NTT_out_u;
                temp_1_data_b = NTT_out_d;
                temp_1_addr_a = {NTT_index,NTT_addr_u};
                temp_1_addr_b = {NTT_index,NTT_addr_d};
                temp_1_en_a   = NTT_out_ready;
                temp_1_en_b   = NTT_out_ready;
                temp_1_we_a   = NTT_out_ready;
                temp_1_we_b   = NTT_out_ready;
            end
            {SignGen,6'd15}:begin //PWM w_cs2 = 𝐰 − ⟨⟨𝑐𝐬2⟩⟩ and LowBits(w_cs2)
                temp_1_addr_a = AG_4_addr_a;
                temp_1_addr_b = AG_4_addr_b;
                temp_1_en_a   = AG_4_addr_en;
                temp_1_en_b   = AG_4_addr_en;
            end
            {SignGen,6'd16}:begin //PWM <<ct0>>^ = c^ * t0^ and store <<ct0>>^
                temp_1_data_a = PWM_out_a;
                temp_1_data_b = PWM_out_b;
                temp_1_addr_a = AG_4_addr_a - 2'd2;
                temp_1_addr_b = AG_4_addr_a - 2'd1;
                temp_1_en_a   = AG_4_data_valid;
                temp_1_en_b   = AG_4_data_valid;
                temp_1_we_a   = AG_4_data_valid;
                temp_1_we_b   = AG_4_data_valid;
            end
            {SignGen,6'd17}:begin // INTT(<<ct0>>^ ), send out <<ct0>>^ data
                temp_1_addr_a = {NTT_index, AG_2_addr_a[7:0]};
                temp_1_addr_b = {NTT_index, AG_2_addr_a[7:0]} + 1'b1;
                temp_1_en_a   = AG_2_addr_en;
                temp_1_en_b   = AG_2_addr_en;
            end
        endcase
    end

    //---temp_2 mem
    always @(*) begin
        temp_2_data_a = 23'd0;
        temp_2_data_b = 23'd0;
        temp_2_addr_a = 10'd0;
        temp_2_addr_b = 10'd0;
        temp_2_en_a   = 1'd0;
        temp_2_en_b   = 1'd0;
        temp_2_we_a   = 1'd0;
        temp_2_we_b   = 1'd0;
        case (ctrl_sign)
            {SignGen,6'd4}:begin //NTT t0 and temp here
                temp_2_data_a = NTT_out_u;
                temp_2_data_b = NTT_out_d;
                temp_2_addr_a = {NTT_index,NTT_addr_u};
                temp_2_addr_b = {NTT_index,NTT_addr_d};
                temp_2_en_a   = NTT_out_ready;
                temp_2_en_b   = NTT_out_ready;
                temp_2_we_a   = NTT_out_ready;
                temp_2_we_b   = NTT_out_ready;
            end
            {SignGen,6'd16}:begin //PWM <<ct0>>^ = c^ * t0^
                temp_2_addr_a = AG_4_addr_a;
                temp_2_addr_b = AG_4_addr_b;
                temp_2_en_a   = AG_4_addr_en;
                temp_2_en_b   = AG_4_addr_en;
            end
            {SignGen,6'd17}:begin //INTT INTT(<<ct0>>^ )0 and temp ct0 here
                temp_2_data_a = NTT_out_u;
                temp_2_data_b = NTT_out_d;
                temp_2_addr_a = {NTT_index,NTT_addr_u};
                temp_2_addr_b = {NTT_index,NTT_addr_d};
                temp_2_en_a   = NTT_out_ready;
                temp_2_en_b   = NTT_out_ready;
                temp_2_we_a   = NTT_out_ready;
                temp_2_we_b   = NTT_out_ready;
            end
            {SignGen,6'd18}:begin //PWM (𝐰 − ⟨⟨𝑐𝐬2⟩⟩) + <<ct0>>, sned out ct0 data 
                temp_2_addr_a = AG_4_addr_a;
                temp_2_addr_b = AG_4_addr_b;
                temp_2_en_a   = AG_4_addr_en;
                temp_2_en_b   = AG_4_addr_en;
            end
        endcase
    end

    //---temp_3 mem
    always @(*) begin
        temp_3_data_a = 23'd0;
        temp_3_data_b = 23'd0;
        temp_3_addr_a = 10'd0;
        temp_3_addr_b = 10'd0;
        temp_3_en_a   = 1'd0;
        temp_3_en_b   = 1'd0;
        temp_3_we_a   = 1'd0;
        temp_3_we_b   = 1'd0;
        case (ctrl_sign)
            {SignGen,6'd5}:begin //NTT y and temp here
                temp_3_data_a = NTT_out_u;
                temp_3_data_b = NTT_out_d;
                temp_3_addr_a = {NTT_index,NTT_addr_u};
                temp_3_addr_b = {NTT_index,NTT_addr_d};
                temp_3_en_a   = NTT_out_ready;
                temp_3_en_b   = NTT_out_ready;
                temp_3_we_a   = NTT_out_ready;
                temp_3_we_b   = NTT_out_ready;
            end
            {SignGen,6'd6}:begin //PWM W^ = A^ * y^
                temp_3_addr_a = {PWM_index, AG_4_addr_a[7:0]};
                temp_3_addr_b = {PWM_index, AG_4_addr_a[7:0]} + 1'b1;
                temp_3_en_a   = AG_4_addr_en;
                temp_3_en_b   = AG_4_addr_en;
            end
            {SignGen,6'd7}:begin //INTT W^
                temp_3_data_a = NTT_out_u;
                temp_3_data_b = NTT_out_d;
                temp_3_addr_a = {NTT_index,NTT_addr_u};
                temp_3_addr_b = {NTT_index,NTT_addr_d};
                temp_3_en_a   = NTT_out_ready;
                temp_3_en_b   = NTT_out_ready;
                temp_3_we_a   = NTT_out_ready;
                temp_3_we_b   = NTT_out_ready;
            end
            {SignGen,6'd8}:begin // Decomposer w1 =Decomp(w) and Enocder w1 TX
                temp_3_addr_a = AG_2_addr_a;
                temp_3_addr_b = AG_2_addr_b;
                temp_3_en_a   = AG_2_addr_en;
                temp_3_en_b   = AG_2_addr_en;
            end
            {SignGen,6'd15}:begin //PWM w_cs2 = 𝐰 − ⟨⟨𝑐𝐬2⟩⟩ and LowBits(w_cs2)
                temp_3_addr_a = AG_4_addr_a;
                temp_3_addr_b = AG_4_addr_b;
                temp_3_en_a   = AG_4_addr_en;
                temp_3_en_b   = AG_4_addr_en;
            end
            {SignGen,6'd16}:begin //NTT y and temp here
                temp_3_data_a = NTT_out_u;
                temp_3_data_b = NTT_out_d;
                temp_3_addr_a = {NTT_index,NTT_addr_u};
                temp_3_addr_b = {NTT_index,NTT_addr_d};
                temp_3_en_a   = NTT_out_ready;
                temp_3_en_b   = NTT_out_ready;
                temp_3_we_a   = NTT_out_ready;
                temp_3_we_b   = NTT_out_ready;
            end
        endcase
    end

    //---temp_4 mem
    always @(*) begin
        temp_4_data_a = 23'd0;
        temp_4_data_b = 23'd0;
        temp_4_addr_a = 10'd0;
        temp_4_addr_b = 10'd0;
        temp_4_en_a   = 1'd0;
        temp_4_en_b   = 1'd0;
        temp_4_we_a   = 1'd0;
        temp_4_we_b   = 1'd0;
        case (ctrl_sign)
            {SignGen,6'd14}:begin //PWM z = y + <<cs1>>
                temp_4_data_a = PWM_out_a;
                temp_4_data_b = PWM_out_b;
                temp_4_addr_a = AG_4_addr_a - 2'd2;
                temp_4_addr_b = AG_4_addr_a - 2'd1;
                temp_4_en_a   = AG_4_data_valid;
                temp_4_en_b   = AG_4_data_valid;
                temp_4_we_a   = AG_4_data_valid;
                temp_4_we_b   = AG_4_data_valid;
            end
        endcase
    end

    //---PWM_temp mem
    always @(*) begin
        PWM_temp_data_a = 23'd0;
        PWM_temp_data_b = 23'd0;
        PWM_temp_addr_a = 10'd0;
        PWM_temp_addr_b = 10'd0;
        PWM_temp_en_a   = 1'd0;
        PWM_temp_en_b   = 1'd0;
        PWM_temp_we_a   = 1'd0;
        PWM_temp_we_b   = 1'd0;
        case (ctrl_sign)
            {KeyGen,6'd5}:begin  //PWM t^ = A^ * s1^
                if(PWM_index[0])begin
                    PWM_temp_addr_a = AG_4_addr_a;
                    PWM_temp_addr_b = AG_4_addr_a + 1'b1;
                    PWM_temp_en_a   = AG_4_addr_en;
                    PWM_temp_en_b   = AG_4_addr_en;
                end
                else begin
                    PWM_temp_data_a = PWM_out_a;
                    PWM_temp_data_b = PWM_out_b;
                    PWM_temp_addr_a = AG_4_addr_a - 2'd2;
                    PWM_temp_addr_b = AG_4_addr_a - 2'd1;
                    PWM_temp_en_a   = AG_4_data_valid;
                    PWM_temp_en_b   = AG_4_data_valid;
                    PWM_temp_we_a   = AG_4_data_valid;
                    PWM_temp_we_b   = AG_4_data_valid;
                end  
            end
            {SignGen,6'd6}:begin  //PWM W^ = A^ * y^
                if(PWM_index[0])begin
                    PWM_temp_addr_a = AG_4_addr_a;
                    PWM_temp_addr_b = AG_4_addr_a + 1'b1;
                    PWM_temp_en_a   = AG_4_addr_en;
                    PWM_temp_en_b   = AG_4_addr_en;
                end
                else begin
                    PWM_temp_data_a = PWM_out_a;
                    PWM_temp_data_b = PWM_out_b;
                    PWM_temp_addr_a = AG_4_addr_a - 2'd2;
                    PWM_temp_addr_b = AG_4_addr_a - 2'd1;
                    PWM_temp_en_a   = AG_4_data_valid;
                    PWM_temp_en_b   = AG_4_data_valid;
                    PWM_temp_we_a   = AG_4_data_valid;
                    PWM_temp_we_b   = AG_4_data_valid;
                end  
            end
            {SignGen,6'd13}:begin // PWM <<cs2>> = c^ * s2^ and store <<cs2>>^ here
                PWM_temp_data_a = PWM_out_a;
                PWM_temp_data_b = PWM_out_b;
                PWM_temp_addr_a = AG_4_addr_a - 2'd2;
                PWM_temp_addr_b = AG_4_addr_a - 2'd1;
                PWM_temp_en_a   = AG_4_data_valid;
                PWM_temp_en_b   = AG_4_data_valid;
                PWM_temp_we_a   = AG_4_data_valid;
                PWM_temp_we_b   = AG_4_data_valid;
            end
            {SignGen,6'd14}:begin // INTT <<cs2>>^, send out <<cs2>>^ data
                PWM_temp_addr_a = {NTT_index, AG_2_addr_a[7:0]};
                PWM_temp_addr_b = {NTT_index, AG_2_addr_a[7:0]} + 1'b1;
                PWM_temp_en_a   = AG_2_addr_en;
                PWM_temp_en_b   = AG_2_addr_en;
            end
            {SignGen,6'd15}:begin //w-cs2 = 𝐰 − ⟨⟨𝑐𝐬2⟩⟩) store here
                PWM_temp_data_a = PWM_out_a;
                PWM_temp_data_b = PWM_out_b;
                PWM_temp_addr_a = AG_4_addr_a - 2'd2;
                PWM_temp_addr_b = AG_4_addr_a - 2'd1;
                PWM_temp_en_a   = AG_4_data_valid;
                PWM_temp_en_b   = AG_4_data_valid;
                PWM_temp_we_a   = AG_4_data_valid;
                PWM_temp_we_b   = AG_4_data_valid;
            end
            {SignGen,6'd18}:begin //PWM (𝐰 − ⟨⟨𝑐𝐬2⟩⟩) + <<ct0>>, sned out w-cs2 data 
                PWM_temp_addr_a = AG_4_addr_a;
                PWM_temp_addr_b = AG_4_addr_b;
                PWM_temp_en_a   = AG_4_addr_en;
                PWM_temp_en_b   = AG_4_addr_en;
            end
        endcase
    end
    /*---Data_Mem---*/ //------------------------------------------end


    /*---AG---*/ //------------------------------------------str
    Address_generate AG_1
    (   
        .clk(clk),
        .reset(reset),
        .addr_adder(AG_1_addr_adder),
        .last_addr(AG_1_last_addr),
        .star_addr(AG_1_star_addr),
        .triger(AG_1_triger),
        .pause(AG_1_pasue),
        .addr_en(AG_1_addr_en),
        .addr_a(AG_1_addr_a),
        .addr_b(AG_1_addr_b),
        .data_valid(AG_1_data_valid),
        .clean(AG_1_clean),
        .done(AG_1_done)
    ); 

    Address_generate AG_2
    (   
        .clk(clk),
        .reset(reset),
        .addr_adder(AG_2_addr_adder),
        .last_addr(AG_2_last_addr),
        .star_addr(AG_2_star_addr),
        .triger(AG_2_triger),
        .pause(AG_2_pasue),
        .addr_en(AG_2_addr_en),
        .addr_a(AG_2_addr_a),
        .addr_b(AG_2_addr_b),
        .data_valid(AG_2_data_valid),
        .clean(AG_2_clean),
        .done(AG_2_done)
    ); 

    Address_generate AG_3
    (   
        .clk(clk),
        .reset(reset),
        .addr_adder(AG_3_addr_adder),
        .last_addr(AG_3_last_addr),
        .star_addr(AG_3_star_addr),
        .triger(AG_3_triger),
        .pause(AG_3_pasue),
        .addr_en(AG_3_addr_en),
        .addr_a(AG_3_addr_a),
        .addr_b(AG_3_addr_b),
        .data_valid(AG_3_data_valid),
        .clean(AG_3_clean),
        .done(AG_3_done)
    ); 

    Address_generate AG_4
    (   
        .clk(clk),
        .reset(reset),
        .addr_adder(AG_4_addr_adder),
        .last_addr(AG_4_last_addr),
        .star_addr(AG_4_star_addr),
        .triger(AG_4_triger),
        .pause(AG_4_pasue),
        .addr_en(AG_4_addr_en),
        .addr_a(AG_4_addr_a),
        .addr_b(AG_4_addr_b),
        .data_valid(AG_4_data_valid),
        .clean(AG_4_clean),
        .done(AG_4_done)
    ); 



    always @(*) begin
        AG_1_addr_adder  = 2'd0;
        AG_1_star_addr   = 12'd0;
        AG_1_last_addr   = 12'd255;
        AG_1_pasue       = 1'b0;
        case (ctrl_sign)
            {KeyGen,6'd2},
            {KeyGen,6'd3}: begin  //Gen s1,s2 and take the seed from mem to keccak
                AG_1_addr_adder  = 2'd1;
                AG_1_star_addr   = 12'd4;
                AG_1_last_addr   = 12'd11;
            end 
            {KeyGen,6'd4}: begin  //Gen A and take the seed from mem to keccak
                AG_1_addr_adder  = 2'd1;
                AG_1_star_addr   = 12'd0;
                AG_1_last_addr   = 12'd3;
            end 
            {KeyGen,6'd8}: begin  //Gen pk and take the seed p from mem to keccak
                AG_1_pasue  = sha_buffer_full;
                if(~main_mem_sel[0])begin
                    AG_1_addr_adder  = 2'd1;
                    AG_1_star_addr   = 12'd0;
                    AG_1_last_addr   = 12'd3;
                end
                else begin
                    AG_1_addr_adder  = 2'd1;
                    AG_1_star_addr   = 12'd0;
                    AG_1_last_addr   = 12'd159;
                end
            end
            {KeyGen,6'd9}: begin  //Gen pk and take the seed p from mem to keccak
                if(~main_mem_sel[0])begin
                    AG_1_addr_adder  = 2'd1;
                    AG_1_star_addr   = 12'd0;
                    AG_1_last_addr   = 12'd3;
                end
                else begin
                    AG_1_addr_adder  = 2'd1;
                    AG_1_star_addr   = 12'd0;
                    AG_1_last_addr   = 12'd159;
                end
            end
            {KeyGen,6'd10}: begin  //Gen pk and take the seed p from mem to keccak
                AG_1_addr_adder  = 2'd1;
                case (main_mem_sel)
                    4'd0:begin //p
                        AG_1_star_addr   = 12'd0;
                        AG_1_last_addr   = 12'd3;
                    end
                    4'd1:begin //K
                        AG_1_star_addr   = 12'd12;
                        AG_1_last_addr   = 12'd15;
                    end
                    4'd2:begin //tr
                        AG_1_star_addr   = 12'd0;
                        AG_1_last_addr   = 12'd7;
                    end
                    4'd3:begin //s1_pack
                        AG_1_star_addr   = 12'd0;
                        AG_1_last_addr   = 12'd47;
                    end
                    4'd4:begin //s2_pack
                        AG_1_star_addr   = 12'd0;
                        AG_1_last_addr   = 12'd47; 
                    end
                    4'd5:begin //t0_pack
                        AG_1_star_addr   = 12'd0;
                        AG_1_last_addr   = 12'd207;
                    end
                endcase
            end 
            {SignGen,6'd2}: begin  //wait K and rnd data send in by MLDSA_in_A then take u data out
                AG_1_addr_adder  = 2'd1;
                AG_1_star_addr   = 12'd0;
                AG_1_last_addr   = 12'd7;
            end 
            {SignGen,6'd3}: begin  //Gen y and take p'' from seed mem to keccak
                AG_1_addr_adder  = 2'd1;
                AG_1_star_addr   = 12'd0;
                AG_1_last_addr   = 12'd7;
            end 
            {SignGen,6'd20}: begin  //store p from MLDSA_in_B (stage_4-1)
                AG_1_addr_adder  = {1'b0,MLDSA_i_ready_B & MLDSA_i_valid_B};
                AG_1_star_addr   = 12'd8;
                AG_1_last_addr   = 12'd11;
            end 
            {SignGen,6'd4},        //Gen A and take the seed from mem to keccak
            {SignGen,6'd5}: begin  //Gen A and take the seed from mem to keccak
                AG_1_addr_adder  = 2'd1;
                AG_1_star_addr   = 12'd8;
                AG_1_last_addr   = 12'd11;
            end 
            {SignGen,6'd9}: begin  //Gen pk and take the seed p from mem to keccak
                AG_1_pasue  = sha_buffer_full;
                if(~main_mem_sel[0])begin
                    AG_1_addr_adder  = 2'd1;
                    AG_1_star_addr   = 12'd0;
                    AG_1_last_addr   = 12'd7;
                end
                else begin
                    AG_1_addr_adder  = 2'd1;
                    AG_1_star_addr   = 12'd0;
                    AG_1_last_addr   = 12'd95;
                end
            end
            {SignGen,6'd10}: begin  //Gen c and take the c_tilde from mem to keccak
                AG_1_addr_adder  = 2'd1;
                AG_1_star_addr   = 12'd0;
                AG_1_last_addr   = 12'd3;
            end
            {SignGen,6'd15}: begin  //Gen y and take p'' from seed mem to keccak
                AG_1_addr_adder  = 2'd1;
                AG_1_star_addr   = 12'd0;
                AG_1_last_addr   = 12'd7;
            end 
        endcase
    end

    always @(*) begin
        AG_2_addr_adder  = 2'd0;
        AG_2_star_addr   = 12'd0;
        AG_2_last_addr   = 12'd255;
        AG_2_pasue       = 1'b0;
        case (ctrl_sign)
            {KeyGen,6'd3}: begin  // NTT s1
                AG_2_addr_adder  = 2'd1;
                AG_2_star_addr   = 12'd0;
                AG_2_last_addr   = 12'd127;
            end 
            {KeyGen,6'd4}: begin //take 3 bits s1 data to encoder and change it to 64bits
                AG_2_addr_adder  = 2'd2;
                AG_2_star_addr   = 12'd0;
                AG_2_last_addr   = 12'd1022;
            end
            {KeyGen,6'd5}: begin //take 3 bits s2 data to encoder and change it to 64bits
                AG_2_addr_adder  = 2'd2;
                AG_2_star_addr   = 12'd0;
                AG_2_last_addr   = 12'd1022;
            end  
            {KeyGen,6'd6}: begin  //INTT ^A*^s1
                AG_2_addr_adder  = 2'd2;
                AG_2_star_addr   = 12'd0;
                AG_2_last_addr   = 12'd254;
            end 
            {KeyGen,6'd8}: begin //take 23 bits t data to encoder and change it to 10bits t0 and store in 64bits mem
                AG_2_addr_adder  = 2'd2;
                AG_2_star_addr   = 12'd0;
                AG_2_last_addr   = 12'd1022;
            end 
            {SignGen,6'd2}: begin  // NTT s1
                AG_2_addr_adder  = 2'd1;
                AG_2_star_addr   = 12'd0;
                AG_2_last_addr   = 12'd127;
            end  
            {SignGen,6'd3}: begin  // NTT s2
                AG_2_addr_adder  = 2'd1;
                AG_2_star_addr   = 12'd0;
                AG_2_last_addr   = 12'd127;
            end 
            {SignGen,6'd4}: begin  // NTT t0
                AG_2_addr_adder  = 2'd1;
                AG_2_star_addr   = 12'd0;
                AG_2_last_addr   = 12'd127;
            end 
            {SignGen,6'd5}: begin  // NTT y
                AG_2_addr_adder  = 2'd1;
                AG_2_star_addr   = 12'd0;
                AG_2_last_addr   = 12'd127;
            end 
            {SignGen,6'd7}: begin  //INTT W^
                AG_2_addr_adder  = 2'd2;
                AG_2_star_addr   = 12'd0;
                AG_2_last_addr   = 12'd254;
            end 
            {SignGen,6'd8}: begin  // Decomposer w1 =Decomp(w) and Enocder w1 TX
                AG_2_addr_adder  = {ENC_ready_i,1'b0};
                AG_2_star_addr   = 12'd0;
                AG_2_last_addr   = 12'd1022;
            end
            {SignGen,6'd11}: begin  // NTT c -> c_hat
                AG_2_addr_adder  = 2'd1;
                AG_2_star_addr   = 12'd0;
                AG_2_last_addr   = 12'd127;
            end
            {SignGen,6'd13}: begin  // INTT <<cs1>>^
                AG_2_addr_adder  = 2'd2;
                AG_2_star_addr   = 12'd0;
                AG_2_last_addr   = 12'd254;
            end
            {SignGen,6'd14}: begin  // INTT <<cs2>>^
                AG_2_addr_adder  = 2'd2;
                AG_2_star_addr   = 12'd0;
                AG_2_last_addr   = 12'd254;
            end  
            {SignGen,6'd16}: begin  // NTT y
                AG_2_addr_adder  = 2'd1;
                AG_2_star_addr   = 12'd0;
                AG_2_last_addr   = 12'd127;
            end 
            {SignGen,6'd17}: begin  // INTT(<<ct0>>^ )
                AG_2_addr_adder  = 2'd2;
                AG_2_star_addr   = 12'd0;
                AG_2_last_addr   = 12'd254;
            end  
        endcase
    end

    always @(*) begin
        AG_3_addr_adder  = 2'd0;
        AG_3_star_addr   = 12'd0;
        AG_3_last_addr   = 12'd255;
        AG_3_pasue       = 1'b0;
        case (ctrl_sign)
            {KeyGen,6'd4}: begin //store 64bits s1 data to mem
                AG_3_addr_adder  = {1'b0,ENC_valid_o};
                AG_3_star_addr   = 12'd0;
                AG_3_last_addr   = 12'd48;//speical to add 1 to make wait ENC_valid_o high
            end 
            {KeyGen,6'd5}: begin //store 64bits s2 data to mem
                AG_3_addr_adder  = {1'b0,ENC_valid_o};
                AG_3_star_addr   = 12'd0;
                AG_3_last_addr   = 12'd48;//speical to add 1 to make wait ENC_valid_o high
            end 
            {KeyGen,6'd7}: begin //store 64bits s2 data to mem
                AG_3_addr_adder  = {1'b0,ENC_valid_o};
                AG_3_star_addr   = 12'd0;
                AG_3_last_addr   = 12'd160;//speical to add 1 to make wait ENC_valid_o high
            end 
            {KeyGen,6'd8}: begin //store 64bits s2 data to mem
                AG_3_addr_adder  = {1'b0,ENC_valid_o};
                AG_3_star_addr   = 12'd0;
                AG_3_last_addr   = 12'd208;//speical to add 1 to make wait ENC_valid_o high
            end 
            {SignGen,6'd1}: begin //store 3bits s1 data to mem s1
                AG_3_addr_adder  = {DEC_valid_o,1'b0};
                AG_3_star_addr   = 12'd0;
                AG_3_last_addr   = 12'd1024;//speical to add 1 to make wait ENC_valid_o high
            end 
            {SignGen,6'd2}: begin //store 3bits s2 data to mem s2
                AG_3_addr_adder  = {DEC_valid_o,1'b0};
                AG_3_star_addr   = 12'd0;
                AG_3_last_addr   = 12'd1024;//speical to add 1 to make wait ENC_valid_o high
            end
            {SignGen,6'd3}: begin //store 13bits t0 data to mem t0
                AG_3_addr_adder  = {DEC_valid_o,1'b0};
                AG_3_star_addr   = 12'd0;
                AG_3_last_addr   = 12'd1024;//speical to add 1 to make wait ENC_valid_o high
            end
            {SignGen,6'd8}: begin //store 64bits w1 data to mem
                AG_3_addr_adder  = {1'b0,ENC_valid_o};
                AG_3_star_addr   = 12'd0;
                AG_3_last_addr   = 12'd96;//speical to add 1 to make wait ENC_valid_o high
            end 
        endcase
    end

    always @(*) begin
        AG_4_addr_adder  = 2'd0;
        AG_4_star_addr   = 12'd0;
        AG_4_last_addr   = 12'd255;
        AG_4_pasue       = 1'b0;
        case (ctrl_sign)
            {KeyGen,6'd1}: begin  //after keccak gen seed, take seed to mem
                AG_4_addr_adder  = 2'd2;
                AG_4_star_addr   = 12'd0;
                AG_4_last_addr   = 12'd14;
            end
            {KeyGen,6'd5}: begin  //PWM ^A * ^s1
                AG_4_addr_adder  = 2'd2;
                AG_4_star_addr   = 12'd0;
                AG_4_last_addr   = 12'd1022;
            end 
            {KeyGen,6'd7}: begin  //PWM A*s1 + s2
                AG_4_addr_adder  = 2'd2;
                AG_4_star_addr   = 12'd0;
                AG_4_last_addr   = 12'd1022;
            end
             {KeyGen,6'd8}: begin  //Gen pk and take the seed t1_pack from mem to keccak
                AG_4_addr_adder  = 2'd2;
                AG_4_star_addr   = 12'd0;
                AG_4_last_addr   = 12'd6;
            end 
            {SignGen,6'd1}: begin  //after keccak gen u, take u to mem
                AG_4_addr_adder  = 2'd2;
                AG_4_star_addr   = 12'd0;
                AG_4_last_addr   = 12'd6;
            end
            {SignGen,6'd2}: begin  //after keccak gen p_prime_prime, take p_prime_prime to mem
                AG_4_addr_adder  = 2'd2;
                AG_4_star_addr   = 12'd0;
                AG_4_last_addr   = 12'd6;
            end
            {SignGen,6'd6}: begin  //PWM W^ = A^ * y^
                AG_4_addr_adder  = 2'd2;
                AG_4_star_addr   = 12'd0;
                AG_4_last_addr   = 12'd1022;
            end 
            {SignGen,6'd9}: begin  //Gen c_tilde by keccak and take data to c_tilde mem 
                AG_4_addr_adder  = 2'd2;
                AG_4_star_addr   = 12'd0;
                AG_4_last_addr   = 12'd2;
            end 
            {SignGen,6'd12}: begin  //PWM　<<cs1>> = c^ * s1^
                AG_4_addr_adder  = 2'd2;
                AG_4_star_addr   = 12'd0;
                AG_4_last_addr   = 12'd1022;;
            end
            {SignGen,6'd13}: begin  //PWM <<cs2>> = c^ * s2^
                AG_4_addr_adder  = 2'd2;
                AG_4_star_addr   = 12'd0;
                AG_4_last_addr   = 12'd1022;;
            end
            {SignGen,6'd14}: begin  //PWM z = y + <<cs1>>
                AG_4_addr_adder  = 2'd2;
                AG_4_star_addr   = 12'd0;
                AG_4_last_addr   = 12'd1022;;
            end
            {SignGen,6'd15}: begin  // PWM w_cs2 = 𝐰 − ⟨⟨𝑐𝐬2⟩⟩ and LowBits(w_cs2)
                AG_4_addr_adder  = 2'd2;
                AG_4_star_addr   = 12'd0;
                AG_4_last_addr   = 12'd1022;;
            end
            {SignGen,6'd16}: begin  //PWM <<ct0>>^ = c^ * t0^
                AG_4_addr_adder  = 2'd2;
                AG_4_star_addr   = 12'd0;
                AG_4_last_addr   = 12'd1022;;
            end
            {SignGen,6'd18}: begin  //PWM (𝐰 − ⟨⟨𝑐𝐬2⟩⟩) + <<ct0>>
                AG_4_addr_adder  = 2'd2;
                AG_4_star_addr   = 12'd0;
                AG_4_last_addr   = 12'd1022;;
            end
        endcase
    end
    /*---AG---*/ //------------------------------------------end

    /*---Sampler---*/ //------------------------------------------str
    Sampler Sampler_(
        .clk(clk),
        .reset(reset),

        /*---Control----*/
        .mode(sampler_mode),
        .sampler_in_ready(sampler_in_ready),
        .sampler_in(sha_out),
        .sampler_squeeze(sampler_squeeze),
        .next_element(next_element),

        /*---ExpandS----*/
        .z0(z0),
        .z1(z1),
        .addr_z0(addr_z0),
        .addr_z1(addr_z1),
        .en_z0(en_z0),
        .we_z0(we_z0),
        .en_z1(en_z1),
        .we_z1(we_z1),

        /*---ExpandA----*/
        .A0(A0),
        .A1(A1),
        .addr_A0(addr_A0),
        .addr_A1(addr_A1),
        .en_A0(en_A0),
        .we_A0(we_A0),
        .en_A1(en_A1),
        .we_A1(we_A1),

        /*---ExpandMask----*/
        .y0(y0),
        .y1(y1),
        .addr_y0(addr_y0),
        .addr_y1(addr_y1),
        .en_y(en_y),
        .we_y(we_y),

        /*---SampleInBall----*/
        .ci(ci),
        .addr_ci(addr_ci),
        .addr_cj(addr_cj),
        .en_ci(en_ci),
        .en_cj(en_cj),
        .we_ci(we_ci),
        .we_cj(we_cj)
    );
    /*---Sampler---*/ //------------------------------------------end

    /*---NTT---*/ //------------------------------------------str
    assign NTT_reset = reset | NTT_done;

    NTT #(.BIT_LEN(BIT_LEN)) NTT_(
        .clk(clk),
        .reset(NTT_reset),
        .mode(NTT_mode),
        .in_ready(AG_2_addr_en & NTT_in_ready),
        .NTT_in_u(NTT_in_u),
        .NTT_in_d(NTT_in_d),
        .NTT_out_u(NTT_out_u),
        .NTT_out_d(NTT_out_d),
        .NTT_addr_u(NTT_addr_u),
        .NTT_addr_d(NTT_addr_d),
        .done(NTT_done),
        .out_ready(NTT_out_ready)
    );

    always @(*) begin
        NTT_in_u = 23'd0;
        NTT_in_d = 23'd0;
        case (ctrl_sign)
            {KeyGen,6'd3}:begin
                NTT_in_u = s1_q_a[2] ?  {{20{1'b1}}, s1_q_a} + 23'd8380417 : {20'd0, s1_q_a};
                NTT_in_d = s1_q_b[2] ?  {{20{1'b1}}, s1_q_b} + 23'd8380417 : {20'd0, s1_q_b}; 
            end
            {KeyGen,6'd6}:begin
                NTT_in_u = t_q_a;
                NTT_in_d = t_q_b; 
            end
            {SignGen,6'd2}:begin
                NTT_in_u = s1_q_a[2] ?  {{20{1'b1}}, s1_q_a} + 23'd8380417 : {20'd0, s1_q_a};
                NTT_in_d = s1_q_b[2] ?  {{20{1'b1}}, s1_q_b} + 23'd8380417 : {20'd0, s1_q_b}; 
            end
            {SignGen,6'd3}:begin
                NTT_in_u = s2_q_a[2] ?  {{20{1'b1}}, s2_q_a} + 23'd8380417 : {20'd0, s2_q_a};
                NTT_in_d = s2_q_b[2] ?  {{20{1'b1}}, s2_q_b} + 23'd8380417 : {20'd0, s2_q_b}; 
            end
            {SignGen,6'd4}:begin
                NTT_in_u = t0_q_a;
                NTT_in_d = t0_q_b; 
            end
            {SignGen,6'd5}:begin //NTT(y)
                NTT_in_u = y_q_a;
                NTT_in_d = y_q_b; 
            end
            {SignGen,6'd7}:begin
                NTT_in_u = t_q_a;
                NTT_in_d = t_q_b; 
            end
            {SignGen,6'd11}:begin
                NTT_in_u = c_q_a;
                NTT_in_d = c_q_b; 
            end
            {SignGen,6'd13}:begin  // INTT <<cs1>>^
                NTT_in_u = t_q_a;
                NTT_in_d = t_q_b; 
            end
            {SignGen,6'd14}:begin  // INTT <<cs2>>^
                NTT_in_u = PWM_temp_q_a;
                NTT_in_d = PWM_temp_q_b; 
            end
            {SignGen,6'd16}:begin // NTT(y)
                NTT_in_u = y_q_a;
                NTT_in_d = y_q_b; 
            end
            {SignGen,6'd17}:begin // NTT(y)
                NTT_in_u = temp_1_q_a;
                NTT_in_d = temp_1_q_b; 
            end
            default: begin
                NTT_in_u = 23'd0;
                NTT_in_d = 23'd0;
            end
        endcase
    end
    /*---NTT---*/ //------------------------------------------end

    /*---Encoder---*/ //------------------------------------------str
    encoder enc_(
        .reset(reset),
        .clk(clk),
        .sec_lvl(ENC_sec_lvl),
        .encode_mode(ENC_encode_mode),
        .valid_i(ENC_valid_i),
        .ready_i(ENC_ready_i),
        .di(ENC_di),
        .dout(ENC_dout),
        .valid_o(ENC_valid_o),
        .ready_o(ENC_ready_o)
    );

    always @(*) begin
        ENC_sec_lvl = 3'd0;
        ENC_encode_mode = 3'd0;
        ENC_di = 46'd0;
        ENC_valid_i = 1'b0;
        ENC_ready_o = 1'b0;
        case (ctrl_sign)
            {KeyGen,6'd4}:begin
                ENC_sec_lvl = 3'd2;
                ENC_encode_mode = 3'd2;
                ENC_di = {{20'd0,s1_q_b},{20'd0,s1_q_a}};
                ENC_valid_i = AG_2_data_valid;
                ENC_ready_o = 1'b1;
            end
            {KeyGen,6'd5}:begin
                ENC_sec_lvl = 3'd2;
                ENC_encode_mode = 3'd2;
                ENC_di = {{20'd0,s2_q_b},{20'd0,s2_q_a}};
                ENC_valid_i = AG_2_data_valid;
                ENC_ready_o = 1'b1;
            end
            {KeyGen,6'd7}:begin
                ENC_sec_lvl = 3'd2;
                ENC_encode_mode = 3'd1;
                ENC_di = {PWM_out_b,PWM_out_a};
                ENC_valid_i = AG_4_data_valid;
                ENC_ready_o = 1'b1;
            end
            {KeyGen,6'd8}:begin
                ENC_sec_lvl = 3'd2;
                ENC_encode_mode = 3'd0;
                ENC_di = {t_q_b,t_q_a};
                ENC_valid_i = AG_2_data_valid;
                ENC_ready_o = 1'b1;
            end
            {SignGen,6'd8}:begin
                ENC_sec_lvl = 3'd2;
                ENC_encode_mode = 3'd4;
                ENC_di = {{17'd0,Decomposer_w1_b},{17'd0,Decomposer_w1_a}};
                ENC_valid_i = AG_2_data_valid;
                ENC_ready_o = 1'b1;
            end
        endcase
    end
    /*---Encoder---*/ //------------------------------------------end


    /*---Decoder---*/ //------------------------------------------str
    decoder dec_(
        .reset(reset),
        .clk(clk),
        .sec_lvl(DEC_sec_lvl),
        .decode_mode(DEC_mode),
        .valid_i(DEC_valid_i),
        .ready_i(DEC_ready_i),
        .di(DEC_di),
        .dout(DEC_dout),
        .valid_o(DEC_valid_o),
        .ready_o(DEC_ready_o)
    );

     always @(*) begin
        DEC_sec_lvl = 3'd0;
        DEC_mode = 3'd0;
        DEC_di = 46'd0;
        DEC_valid_i = 1'b0;
        DEC_ready_o = 1'b0;
        case (ctrl_sign)
            {SignGen,6'd1}:begin
                DEC_sec_lvl = 3'd2;
                DEC_mode = 3'd2;
                DEC_di = MLDSA_data_in_B;
                DEC_valid_i = MLDSA_i_valid_B & MLDSA_i_ready_B;
                DEC_ready_o = 1'b1;
            end
            {SignGen,6'd2}:begin
                DEC_sec_lvl = 3'd2;
                DEC_mode = 3'd3;
                DEC_di = MLDSA_data_in_B;
                DEC_valid_i = MLDSA_i_valid_B & MLDSA_i_ready_B;
                DEC_ready_o = 1'b1;
            end
            {SignGen,6'd3}:begin
                DEC_sec_lvl = 3'd2;
                DEC_mode = 3'd0;
                DEC_di = MLDSA_data_in_B;
                DEC_valid_i = MLDSA_i_valid_B & MLDSA_i_ready_B;
                DEC_ready_o = 1'b1;
            end
        endcase
    end
    /*---Decoder---*/ //------------------------------------------end


    /*---PWM---*/ //------------------------------------------str
    PWM PWM_(  
        .mode(PWM_mode),
        .in_a0(PWM_in_a0),  /*vector data*/
        .in_a1(PWM_in_a1),  /*vector or matrix data*/
        .in_a2(PWM_in_a2),  /*origin data*/
        .out_a(PWM_out_a),
        .in_b0(PWM_in_b0),  /*vector data*/
        .in_b1(PWM_in_b1),  /*vector or matrix data*/
        .in_b2(PWM_in_b2),  /*origin data*/
        .out_b(PWM_out_b)
    );

    always @(*) begin
        PWM_mode  = 2'd0;
        PWM_in_a0 = 23'd0;
        PWM_in_a1 = 23'd0;
        PWM_in_a2 = 23'd0;
        PWM_in_b0 = 23'd0;
        PWM_in_b1 = 23'd0;
        PWM_in_b2 = 23'd0;
        case (ctrl_sign)
            {KeyGen,6'd5}:begin
                PWM_mode  = MATRIX_VECTOR;
                PWM_in_a0 = temp_0_q_a; //s1
                PWM_in_a1 = A_q_a; 
                PWM_in_a2 = PWM_index[0] ? PWM_temp_q_a : t_q_a; 
                PWM_in_b0 = temp_0_q_b;
                PWM_in_b1 = A_q_b;
                PWM_in_b2 = PWM_index[0] ? PWM_temp_q_b : t_q_b; 
            end
            {KeyGen,6'd7}:begin
                PWM_mode  = ADD_VECTOR;
                PWM_in_a1 = s2_q_a[2] ?  {{20{1'b1}}, s2_q_a} + 23'd8380417 : {20'd0, s2_q_a};
                PWM_in_a2 = temp_0_q_a; 
                PWM_in_b1 = s2_q_b[2] ?  {{20{1'b1}}, s2_q_b} + 23'd8380417 : {20'd0, s2_q_b};
                PWM_in_b2 = temp_0_q_b; 
            end
            {SignGen,6'd6}:begin
                PWM_mode  = MATRIX_VECTOR;
                PWM_in_a0 = temp_3_q_a; //y^
                PWM_in_a1 = A_q_a;      //A
                PWM_in_a2 = PWM_index[0] ? PWM_temp_q_a : t_q_a;  //w
                PWM_in_b0 = temp_3_q_b; //y^
                PWM_in_b1 = A_q_b;      //A
                PWM_in_b2 = PWM_index[0] ? PWM_temp_q_b : t_q_b;  //w
            end
            {SignGen,6'd12}:begin  //PWM <<cs1>> = c^ * s1^
                PWM_mode  = SCALAR_VECTOR;
                PWM_in_a0 = temp_0_q_a; //s1^
                PWM_in_a1 = c_hat_q_a;      //c^
                PWM_in_b0 = temp_0_q_b; //s1^
                PWM_in_b1 = c_hat_q_b;      //c^
            end
            {SignGen,6'd13}:begin //PWM <<cs2>> = c^ * s2^
                PWM_mode  = SCALAR_VECTOR;
                PWM_in_a0 = temp_1_q_a; //s1^
                PWM_in_a1 = c_hat_q_a;      //c^
                PWM_in_b0 = temp_1_q_b; //s1^
                PWM_in_b1 = c_hat_q_b;      //c^
            end
            {SignGen,6'd14}:begin //PWM z = y + <<cs1>>
                PWM_mode  = ADD_VECTOR;
                PWM_in_a1 = temp_0_q_a; //<<cs1>>
                PWM_in_a2 = y_q_a;      //y
                PWM_in_b1 = temp_0_q_b; //<<cs1>>
                PWM_in_b2 = y_q_b;      //y
            end
            {SignGen,6'd15}:begin // PWM w_cs2 = 𝐰 − ⟨⟨𝑐𝐬2⟩⟩ and LowBits(w_cs2)
                PWM_mode  = ADD_VECTOR;
                PWM_in_a1 = 23'd8380417 - temp_1_q_a; //<<cs2>>
                PWM_in_a2 = temp_3_q_a; //w
                PWM_in_b1 = 23'd8380417 - temp_1_q_b; //<<cs2>>
                PWM_in_b2 = temp_3_q_b; //w
            end
            {SignGen,6'd16}:begin  //PWM <<ct0>>^ = c^ * t0^
                PWM_mode  = SCALAR_VECTOR;
                PWM_in_a0 = temp_2_q_a; //t0^
                PWM_in_a1 = c_hat_q_a;  //c^
                PWM_in_b0 = temp_2_q_b; //t0^
                PWM_in_b1 = c_hat_q_b;  //c^
            end
            {SignGen,6'd18}:begin //PWM (𝐰 − ⟨⟨𝑐𝐬2⟩⟩) + <<ct0>>
                PWM_mode  = ADD_VECTOR;
                PWM_in_a1 = temp_2_q_a; //<<ct0>>
                PWM_in_a2 = PWM_temp_q_a; //w_cs2
                PWM_in_b1 = temp_2_q_b; //<<ct0>>
                PWM_in_b2 = PWM_temp_q_b; //w_cs2
            end
        endcase
    end
    /*---PWM---*/ //------------------------------------------end


    /*---Decomposer---*/ //------------------------------------------str
    reg  [22:0] Decomposer_in_a;
    reg  [22:0] Decomposer_in_b;

    wire [17:0] Decomposer_w0_a;
    wire [17:0] Decomposer_w0_b;
    
    wire [5:0] Decomposer_w1_a;
    wire [5:0] Decomposer_w1_b;

    Decomposer Decomposer_(
        //protocol 0
        .r_in_a(Decomposer_in_a),
        .r0_out_a(Decomposer_w0_a),
        .r1_out_a(Decomposer_w1_a),

        //protocol 1
        .r_in_b(Decomposer_in_b),
        .r0_out_b(Decomposer_w0_b),
        .r1_out_b(Decomposer_w1_b)
    );

    always @(*) begin
        Decomposer_in_a = 23'd0;
        Decomposer_in_b = 23'd0;
        case (ctrl_sign)
            {SignGen,6'd8}:begin //Decomposer w1 =Decomp(w)
                Decomposer_in_a = temp_3_q_a;
                Decomposer_in_b = temp_3_q_b;
            end
            {SignGen,6'd15}:begin // PWM w_cs2 = 𝐰 − ⟨⟨𝑐𝐬2⟩⟩ and LowBits(w_cs2)
                Decomposer_in_a = PWM_out_a;
                Decomposer_in_b = PWM_out_b;
            end
        endcase
    end
    /*---Decomposer---*/ //------------------------------------------end


    /*---infinity_norm---*/ //------------------------------------------str
    wire [22:0] z_mod_half_q_a;
    wire [22:0] z_mod_half_q_b;

    wire [22:0] z_a;
    wire [22:0] z_b;

    wire [17:0] r0_a;
    wire [17:0] r0_b;

    assign z_mod_half_q_a = (PWM_out_a > (8380417>>1)) ? PWM_out_a - 8380417 : PWM_out_a;
    assign z_mod_half_q_b = (PWM_out_b > (8380417>>1)) ? PWM_out_b - 8380417 : PWM_out_b;

    assign z_a = z_mod_half_q_a[22] ? 24'b1000_0000_0000_0000_0000_0000 - z_mod_half_q_a : z_mod_half_q_a;
    assign z_b = z_mod_half_q_b[22] ? 24'b1000_0000_0000_0000_0000_0000 - z_mod_half_q_b : z_mod_half_q_b;

    always @(posedge clk) begin
        if(reset)begin
            z_fail <= 1'b0;
        end
        else if(ctrl_sign == {SignGen,6'd6})begin
            z_fail <= 1'b0;
        end
        else if(ctrl_sign == {SignGen,6'd14} && AG_4_data_valid)begin
            if(z_a >= (GAMMA1 - Beta) || z_b >= (GAMMA1 - Beta))begin
                z_fail <= 1'b1;
            end
        end
    end

    assign r0_a = Decomposer_w0_a[17] ? 19'b100_0000_0000_0000_0000 - Decomposer_w0_a : Decomposer_w0_a;
    assign r0_b = Decomposer_w0_b[17] ? 19'b100_0000_0000_0000_0000 - Decomposer_w0_b : Decomposer_w0_b;

    always @(posedge clk) begin
        if(reset)begin
            r0_fail <= 1'b0;
        end
        else if(ctrl_sign == {SignGen,6'd6})begin
            r0_fail <= 1'b0;
        end
        else if(ctrl_sign == {SignGen,6'd15} && AG_4_data_valid)begin
            if(r0_a >= (GAMMA2 - Beta) || r0_b >= (GAMMA2 - Beta))begin
                r0_fail <= 1'b1;
            end
        end
    end    
    /*---infinity_norm---*/ //------------------------------------------end


    /*---Hint---*/ //------------------------------------------str

    /*---Hint---*/ //------------------------------------------end


    /*---AXI Stream input protocol B---*/ //------------------------------------------str
    // always @(*) begin
    //     MLDSA_i_ready_B = 1'b0;
    //     case (ctrl_sign)
    //         {SignGen,6'd1}:begin
    //             MLDSA_i_ready_B = DEC_ready_i;
    //         end
    //         {SignGen,6'd2}:begin
    //             MLDSA_i_ready_B = DEC_ready_i;
    //         end
    //     endcase
    // end

    /*---AXI Stream input protocol B---*/ //------------------------------------------end


    /*---AXI Stream output protocol---*/ //------------------------------------------str
    always @(*) begin
        MLDSA_o_valid = 1'b0;
        case (ctrl_sign)
            {KeyGen,6'd9}:begin
                MLDSA_o_valid = AG_1_data_valid;
            end
            {KeyGen,6'd10}:begin
                MLDSA_o_valid = AG_1_data_valid;
            end
        endcase
    end

    always @(*) begin
        MLDSA_data_out = 64'd0;
        case (ctrl_sign)
            {KeyGen,6'd9}:begin
                if(~main_mem_sel[0])
                    MLDSA_data_out = seed_q_a; 
                else
                    MLDSA_data_out = t1_pack_q_a;
            end
            {KeyGen,6'd10}:begin
                case (main_mem_sel)
                    4'd0: MLDSA_data_out = seed_q_a;
                    4'd1: MLDSA_data_out = seed_q_a;
                    4'd2: MLDSA_data_out = tr_q_a;
                    4'd3: MLDSA_data_out = s1_pack_q_a;
                    4'd4: MLDSA_data_out = s2_pack_q_a;
                    4'd5: MLDSA_data_out = t0_pack_q_a;
                endcase
            end
        endcase
    end

    always @(*) begin
        MLDSA_o_last = 1'b0;
        case (ctrl_sign)
            {KeyGen,6'd9}:begin
                MLDSA_o_last = AG_1_done & main_mem_sel[0];
            end
            {KeyGen,6'd10}:begin
                MLDSA_o_last = AG_1_done & main_mem_sel == 4'd5;
            end
        endcase
    end
    /*---AXI Stream output protocol---*/ //------------------------------------------end


endmodule

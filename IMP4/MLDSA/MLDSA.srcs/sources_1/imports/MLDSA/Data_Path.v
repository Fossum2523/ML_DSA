module Data_Path(   
    input           clk,
    input           reset,

    input  [8:0]    ctrl_sign,
    /*---Keack---*/
    input           sha_en,
    input  [3:0]    sha_type,
    output          sha_buffer_full,
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
    output          PWM_done,

    /*---AG---*/
    input [3:0]    main_mem_sel,

    input           AG_1_triger,
    input           AG_1_clean,
    output          AG_1_addr_en, //spercial add to send p at SginGen stage 4_1
    output          AG_1_data_valid, //spercial add to send p at SginGen stage 4_1
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
    input               MLDSA_i_ready_A,

    //Sampler Rejection
    output  reg             z_fail,
    output  reg             r0_fail,
    output  reg             ct0_fail,
    output  reg             hint_fail,

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
    localparam BIT_LEN =23;

    //vaiable
    localparam Beta   = 78;
    localparam GAMMA1 = 131072;
    localparam GAMMA2 = 95232;
    localparam ALPHA = 2 * GAMMA2;


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

    //Data MEM KEN
    localparam  DLEN    = 23;
    localparam  L_DLEN  = 64;
    localparam  TA_HLEN = 12;
    localparam  T_HLEN  = 10;
    localparam  L_HLEN  = 4;

    //Mem_Data Control
    localparam          SAMPLER_ADDR = 1'b0,
                        PWM_ADDR     = 1'b1;

    //PWM mode
    localparam [1:0]    MATRIX_VECTOR = 2'd0, /*path 1(in_a0, in_a1, in_a2)*/ /*path 2(in_b0, in_b1, in_b2)*/
                        SCALAR_VECTOR = 2'd1, /*path 1(in_a0, in_a1)*/        /*path 2(in_b0, in_b1)*/     
                        ADD_VECTOR    = 2'd2; /*path 1(in_a1, in_a2)*/        /*path 2(in_b1, in_b2)*/
    
    /*---Sample Rejection num---*/
    reg [15:0]       kappa;

    /*---Data_Mem signals---*/
    // temp_A
    reg  [DLEN-1:0]      temp_A_data_a;
    reg  [DLEN-1:0]      temp_A_data_b;
    reg  [TA_HLEN-1:0]   temp_A_addr_a;
    reg  [TA_HLEN-1:0]   temp_A_addr_b;
    reg                  temp_A_en_a;
    reg                  temp_A_en_b;
    reg                  temp_A_we_a;
    reg                  temp_A_we_b;
    wire [DLEN-1:0]      temp_A_q_a;
    wire [DLEN-1:0]      temp_A_q_b;
    // temp_PWM
    reg  [DLEN-1:0]      temp_PWM_data_a;
    reg  [DLEN-1:0]      temp_PWM_data_b;
    reg  [T_HLEN-1:0]    temp_PWM_addr_a;
    reg  [T_HLEN-1:0]    temp_PWM_addr_b;
    reg                  temp_PWM_en_a;
    reg                  temp_PWM_en_b;
    reg                  temp_PWM_we_a;
    reg                  temp_PWM_we_b;
    wire [DLEN-1:0]      temp_PWM_q_a;
    wire [DLEN-1:0]      temp_PWM_q_b;
    // temp_0
    reg  [DLEN-1:0]      temp_0_data_a;
    reg  [DLEN-1:0]      temp_0_data_b;
    reg  [T_HLEN-1:0]    temp_0_addr_a;
    reg  [T_HLEN-1:0]    temp_0_addr_b;
    reg                  temp_0_en_a;
    reg                  temp_0_en_b;
    reg                  temp_0_we_a;
    reg                  temp_0_we_b;
    wire [DLEN-1:0]      temp_0_q_a;
    wire [DLEN-1:0]      temp_0_q_b;
    // temp_1
    reg  [DLEN-1:0]      temp_1_data_a;
    reg  [DLEN-1:0]      temp_1_data_b;
    reg  [T_HLEN-1:0]    temp_1_addr_a;
    reg  [T_HLEN-1:0]    temp_1_addr_b;
    reg                  temp_1_en_a;
    reg                  temp_1_en_b;
    reg                  temp_1_we_a;
    reg                  temp_1_we_b;
    wire [DLEN-1:0]      temp_1_q_a;
    wire [DLEN-1:0]      temp_1_q_b;
    // temp_2
    reg  [DLEN-1:0]      temp_2_data_a;
    reg  [DLEN-1:0]      temp_2_data_b;
    reg  [T_HLEN-1:0]    temp_2_addr_a;
    reg  [T_HLEN-1:0]    temp_2_addr_b;
    reg                  temp_2_en_a;
    reg                  temp_2_en_b;
    reg                  temp_2_we_a;
    reg                  temp_2_we_b;
    wire [DLEN-1:0]      temp_2_q_a;
    wire [DLEN-1:0]      temp_2_q_b;
    // temp_3
    reg  [DLEN-1:0]      temp_3_data_a;
    reg  [DLEN-1:0]      temp_3_data_b;
    reg  [T_HLEN-1:0]    temp_3_addr_a;
    reg  [T_HLEN-1:0]    temp_3_addr_b;
    reg                  temp_3_en_a;
    reg                  temp_3_en_b;
    reg                  temp_3_we_a;
    reg                  temp_3_we_b;
    wire [DLEN-1:0]      temp_3_q_a;
    wire [DLEN-1:0]      temp_3_q_b;
    // temp_4
    reg  [DLEN-1:0]      temp_4_data_a;
    reg  [DLEN-1:0]      temp_4_data_b;
    reg  [T_HLEN-1:0]    temp_4_addr_a;
    reg  [T_HLEN-1:0]    temp_4_addr_b;
    reg                  temp_4_en_a;
    reg                  temp_4_en_b;
    reg                  temp_4_we_a;
    reg                  temp_4_we_b;
    wire [DLEN-1:0]      temp_4_q_a;
    wire [DLEN-1:0]      temp_4_q_b;
    // temp_5
    reg  [DLEN-1:0]      temp_5_data_a;
    reg  [DLEN-1:0]      temp_5_data_b;
    reg  [T_HLEN-1:0]    temp_5_addr_a;
    reg  [T_HLEN-1:0]    temp_5_addr_b;
    reg                  temp_5_en_a;
    reg                  temp_5_en_b;
    reg                  temp_5_we_a;
    reg                  temp_5_we_b;
    wire [DLEN-1:0]      temp_5_q_a;
    wire [DLEN-1:0]      temp_5_q_b;
    // temp_6
    reg  [DLEN-1:0]      temp_6_data_a;
    reg  [DLEN-1:0]      temp_6_data_b;
    reg  [T_HLEN-1:0]    temp_6_addr_a;
    reg  [T_HLEN-1:0]    temp_6_addr_b;
    reg                  temp_6_en_a;
    reg                  temp_6_en_b;
    reg                  temp_6_we_a;
    reg                  temp_6_we_b;
    wire [DLEN-1:0]      temp_6_q_a;
    wire [DLEN-1:0]      temp_6_q_b;
    // temp_7
    reg  [DLEN-1:0]      temp_7_data_a;
    reg  [DLEN-1:0]      temp_7_data_b;
    reg  [T_HLEN-1:0]    temp_7_addr_a;
    reg  [T_HLEN-1:0]    temp_7_addr_b;
    reg                  temp_7_en_a;
    reg                  temp_7_en_b;
    reg                  temp_7_we_a;
    reg                  temp_7_we_b;
    wire [DLEN-1:0]      temp_7_q_a;
    wire [DLEN-1:0]      temp_7_q_b;
    // temp_8
    reg  [DLEN-1:0]      temp_8_data_a;
    reg  [DLEN-1:0]      temp_8_data_b;
    reg  [T_HLEN-1:0]    temp_8_addr_a;
    reg  [T_HLEN-1:0]    temp_8_addr_b;
    reg                  temp_8_en_a;
    reg                  temp_8_en_b;
    reg                  temp_8_we_a;
    reg                  temp_8_we_b;
    wire [DLEN-1:0]      temp_8_q_a;
    wire [DLEN-1:0]      temp_8_q_b;
    // temp_9
    reg  [DLEN-1:0]      temp_9_data_a;
    reg  [DLEN-1:0]      temp_9_data_b;
    reg  [T_HLEN-1:0]    temp_9_addr_a;
    reg  [T_HLEN-1:0]    temp_9_addr_b;
    reg                  temp_9_en_a;
    reg                  temp_9_en_b;
    reg                  temp_9_we_a;
    reg                  temp_9_we_b;
    wire [DLEN-1:0]      temp_9_q_a;
    wire [DLEN-1:0]      temp_9_q_b;
    // temp_L
    reg  [L_DLEN-1:0]     temp_L_data_a;
    reg  [L_DLEN-1:0]     temp_L_data_b;
    reg  [L_HLEN-1:0]     temp_L_addr_a;
    reg  [L_HLEN-1:0]     temp_L_addr_b;
    reg                   temp_L_en_a;
    reg                   temp_L_en_b;
    reg                   temp_L_we_a;
    reg                   temp_L_we_b;
    wire [L_DLEN-1:0]     temp_L_q_a;
    wire [L_DLEN-1:0]     temp_L_q_b;
    // temp_seed
    reg  [L_DLEN-1:0]     temp_seed_data_a;
    reg  [L_DLEN-1:0]     temp_seed_data_b;
    reg  [L_HLEN-1:0]     temp_seed_addr_a;
    reg  [L_HLEN-1:0]     temp_seed_addr_b;
    reg                   temp_seed_en_a;
    reg                   temp_seed_en_b;
    reg                   temp_seed_we_a;
    reg                   temp_seed_we_b;
    wire [L_DLEN-1:0]     temp_seed_q_a;
    wire [L_DLEN-1:0]     temp_seed_q_b;



    /*---Adress Generate signals---*/
    reg  [1:0]   AG_1_addr_adder;
    reg  [11:0]  AG_1_last_addr;
    reg  [11:0]  AG_1_star_addr;
    reg          AG_1_pasue;
    // wire         AG_1_addr_en;
    wire [11:0]  AG_1_addr_a;
    wire [11:0]  AG_1_addr_b;
    // wire         AG_1_data_valid;

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



    /*---Keack signals---*/
    reg             sha_data_valid;
    wire            sha_in_ready;
    wire            sha_is_last;
    wire            sha_squeeze;
    wire            sha_mode;
    wire            sha_hold;
    // wire            sha_buffer_full;
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



    /*---Sampler signals---*/
    //---Control
    wire            sampler_squeeze;
    //---ExpandS
    wire [22:0]     z0;
    wire [22:0]     z1;
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
    reg                 NTT_i_valid;
    wire                NTT_i_ready;
    wire                NTT_o_valid;
    reg                 NTT_o_ready;
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
    reg                  PWM_i_valid;
    wire                 PWM_i_ready;
    wire                 PWM_o_valid;
    reg                  PWM_o_ready;
    reg  [BIT_LEN - 1:0] PWM_in_a0;
    reg  [BIT_LEN - 1:0] PWM_in_a1;
    reg  [BIT_LEN - 1:0] PWM_in_a2;
    wire [BIT_LEN - 1:0] PWM_out_a;
    wire [10 - 1:0]      PWM_addr_a;
    reg  [BIT_LEN - 1:0] PWM_in_b0;
    reg  [BIT_LEN - 1:0] PWM_in_b1;
    reg  [BIT_LEN - 1:0] PWM_in_b2;
    wire [BIT_LEN - 1:0] PWM_out_b;
    wire [10 - 1:0]      PWM_addr_b;


    /*---Encoder signals---*/
    reg  [2:0]  ENC_encode_mode;
    reg         ENC_valid_i;
    reg         ENC_ready_o;
    reg  [45:0] ENC_di;
    wire        ENC_ready_i;
    wire        ENC_valid_o;
    wire [63:0] ENC_dout;

    /*---Decoder signals---*/
    reg [2:0]   DEC_mode;
    reg         DEC_valid_i;
    reg         DEC_ready_o;
    reg [63:0]  DEC_di;
    // wire        DEC_ready_i;
    wire        DEC_valid_o;
    wire [45:0] DEC_dout;

    /*---Decomposer signals---*/
    reg         Decomp_valid_i;
    wire        Decomp_ready_i;
    reg  [45:0] Decomp_di;
    wire [45:0] Decomp_doa;
    wire [45:0] Decomp_dob;
    wire        Decomp_valid_o;
    reg         Decomp_ready_o;

    /*---MakeHint signals---*/
    wire MH_reset;
    reg [2:0]   MH_sec_lvl;
    wire        MH_reject_hint;
    reg [45:0]  MH_poly0_ie;
    reg [45:0]  MH_poly1_ie;
    reg         MH_poly_valid_ie;
    wire        MH_poly_ready_i;
    wire [63:0] MH_hint_o;
    wire        MH_hint_valid_o;
    reg         MH_hint_ready_o;
    reg [45:0]  MH_PWM_data_delay_BF;
    reg         MH_PWM_valid_delay_BF;
    
    /*---infinity_norm signals---*/
    wire [22:0] z_mod_half_q_a;
    wire [22:0] z_mod_half_q_b;
    wire [22:0] z_a;
    wire [22:0] z_b;
    wire [22:0] r0_mod_half_q_a;
    wire [22:0] r0_mod_half_q_b;
    wire [22:0] r0_a;
    wire [22:0] r0_b;
    wire [22:0] ct0_mod_half_q_a;
    wire [22:0] ct0_mod_half_q_b;
    wire [22:0] ct0_a;
    wire [22:0] ct0_b;

    
    /*---Data_Mem---*/ //------------------------------------------str
    Data_Mem DM_ (
        .clk(clk),
        .reset(reset),

        /*---temp_A---*/
        .temp_A_data_a(temp_A_data_a),
        .temp_A_data_b(temp_A_data_b),
        .temp_A_addr_a(temp_A_addr_a),
        .temp_A_addr_b(temp_A_addr_b),
        .temp_A_en_a(temp_A_en_a),
        .temp_A_en_b(temp_A_en_b),
        .temp_A_we_a(temp_A_we_a),
        .temp_A_we_b(temp_A_we_b),
        .temp_A_q_a(temp_A_q_a),
        .temp_A_q_b(temp_A_q_b),

        /*---temp_PWM---*/
        .temp_PWM_data_a(temp_PWM_data_a),
        .temp_PWM_data_b(temp_PWM_data_b),
        .temp_PWM_addr_a(temp_PWM_addr_a),
        .temp_PWM_addr_b(temp_PWM_addr_b),
        .temp_PWM_en_a(temp_PWM_en_a),
        .temp_PWM_en_b(temp_PWM_en_b),
        .temp_PWM_we_a(temp_PWM_we_a),
        .temp_PWM_we_b(temp_PWM_we_b),
        .temp_PWM_q_a(temp_PWM_q_a),
        .temp_PWM_q_b(temp_PWM_q_b),

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

        /*---temp_5---*/
        .temp_5_data_a(temp_5_data_a),
        .temp_5_data_b(temp_5_data_b),
        .temp_5_addr_a(temp_5_addr_a),
        .temp_5_addr_b(temp_5_addr_b),
        .temp_5_en_a(temp_5_en_a),
        .temp_5_en_b(temp_5_en_b),
        .temp_5_we_a(temp_5_we_a),
        .temp_5_we_b(temp_5_we_b),
        .temp_5_q_a(temp_5_q_a),
        .temp_5_q_b(temp_5_q_b),

        /*---temp_6---*/
        .temp_6_data_a(temp_6_data_a),
        .temp_6_data_b(temp_6_data_b),
        .temp_6_addr_a(temp_6_addr_a),
        .temp_6_addr_b(temp_6_addr_b),
        .temp_6_en_a(temp_6_en_a),
        .temp_6_en_b(temp_6_en_b),
        .temp_6_we_a(temp_6_we_a),
        .temp_6_we_b(temp_6_we_b),
        .temp_6_q_a(temp_6_q_a),
        .temp_6_q_b(temp_6_q_b),

        /*---temp_7---*/
        .temp_7_data_a(temp_7_data_a),
        .temp_7_data_b(temp_7_data_b),
        .temp_7_addr_a(temp_7_addr_a),
        .temp_7_addr_b(temp_7_addr_b),
        .temp_7_en_a(temp_7_en_a),
        .temp_7_en_b(temp_7_en_b),
        .temp_7_we_a(temp_7_we_a),
        .temp_7_we_b(temp_7_we_b),
        .temp_7_q_a(temp_7_q_a),
        .temp_7_q_b(temp_7_q_b),

        /*---temp_8---*/
        .temp_8_data_a(temp_8_data_a),
        .temp_8_data_b(temp_8_data_b),
        .temp_8_addr_a(temp_8_addr_a),
        .temp_8_addr_b(temp_8_addr_b),
        .temp_8_en_a(temp_8_en_a),
        .temp_8_en_b(temp_8_en_b),
        .temp_8_we_a(temp_8_we_a),
        .temp_8_we_b(temp_8_we_b),
        .temp_8_q_a(temp_8_q_a),
        .temp_8_q_b(temp_8_q_b),

        /*---temp_9---*/
        .temp_9_data_a(temp_9_data_a),
        .temp_9_data_b(temp_9_data_b),
        .temp_9_addr_a(temp_9_addr_a),
        .temp_9_addr_b(temp_9_addr_b),
        .temp_9_en_a(temp_9_en_a),
        .temp_9_en_b(temp_9_en_b),
        .temp_9_we_a(temp_9_we_a),
        .temp_9_we_b(temp_9_we_b),
        .temp_9_q_a(temp_9_q_a),
        .temp_9_q_b(temp_9_q_b),

        /*---temp_L---*/
        .temp_L_data_a(temp_L_data_a),
        .temp_L_data_b(temp_L_data_b),
        .temp_L_addr_a(temp_L_addr_a),
        .temp_L_addr_b(temp_L_addr_b),
        .temp_L_en_a(temp_L_en_a),
        .temp_L_en_b(temp_L_en_b),
        .temp_L_we_a(temp_L_we_a),
        .temp_L_we_b(temp_L_we_b),
        .temp_L_q_a(temp_L_q_a),
        .temp_L_q_b(temp_L_q_b),

        /*---temp_seed---*/
        .temp_seed_data_a(temp_seed_data_a),
        .temp_seed_data_b(temp_seed_data_b),
        .temp_seed_addr_a(temp_seed_addr_a),
        .temp_seed_addr_b(temp_seed_addr_b),
        .temp_seed_en_a(temp_seed_en_a),
        .temp_seed_en_b(temp_seed_en_b),
        .temp_seed_we_a(temp_seed_we_a),
        .temp_seed_we_b(temp_seed_we_b),
        .temp_seed_q_a(temp_seed_q_a),
        .temp_seed_q_b(temp_seed_q_b)

    );

    always @(*) begin
        temp_A_data_a = 23'd0;
        temp_A_data_b = 23'd0;
        temp_A_addr_a = 10'd0;
        temp_A_addr_b = 10'd0;
        temp_A_en_a   = 1'd0;
        temp_A_en_b   = 1'd0;
        temp_A_we_a   = 1'd0;
        temp_A_we_b   = 1'd0;
        case (ctrl_sign)
            {KeyGen,6'd4}:begin //"Gen(A)", Store A generated by the Sampler
                temp_A_data_a = A0;
                temp_A_data_b = A1;
                temp_A_addr_a = {A_index,addr_A0};
                temp_A_addr_b = {A_index,addr_A1};
                temp_A_en_a   = en_A0;
                temp_A_en_b   = en_A1;
                temp_A_we_a   = we_A0;
                temp_A_we_b   = we_A1;
            end
            {KeyGen,6'd5}:begin //"As1_hat = A_hat ‧ s1_hat", read out A_hat data to perform the PWM
                temp_A_addr_a = {AG_4_addr_a[9:8], PWM_index, AG_4_addr_a[7:0]};
                temp_A_addr_b = {AG_4_addr_a[9:8], PWM_index, AG_4_addr_b[7:0]};
                temp_A_en_a   = AG_4_addr_en;
                temp_A_en_b   = AG_4_addr_en;
            end
            {SignGen,6'd5},      //"Gen(A)", Store A generated by the Sampler
            {SignGen,6'd6}:begin //"Gen(A)", Store A generated by the Sampler
                temp_A_data_a = A0;
                temp_A_data_b = A1;
                temp_A_addr_a = {A_index,addr_A0};
                temp_A_addr_b = {A_index,addr_A1};
                temp_A_en_a   = en_A0;
                temp_A_en_b   = en_A1;
                temp_A_we_a   = we_A0;
                temp_A_we_b   = we_A1;
            end
            {SignGen,6'd7}:begin //"w_hat = A ‧ y_hat", read out A_hat data to perform the PWM
                temp_A_addr_a = {AG_4_addr_a[9:8], PWM_index,AG_4_addr_a[7:0]};
                temp_A_addr_b = {AG_4_addr_a[9:8], PWM_index,AG_4_addr_b[7:0]};
                temp_A_en_a   = AG_4_addr_en;
                temp_A_en_b   = AG_4_addr_en;
            end
            default:begin
                temp_A_data_a = 23'd0;
                temp_A_data_b = 23'd0;
                temp_A_addr_a = 10'd0;
                temp_A_addr_b = 10'd0;
                temp_A_en_a   = 1'd0;
                temp_A_en_b   = 1'd0;
                temp_A_we_a   = 1'd0;
                temp_A_we_b   = 1'd0;
            end
        endcase
    end

    always @(*) begin
        temp_PWM_data_a = 23'd0;
        temp_PWM_data_b = 23'd0;
        temp_PWM_addr_a = 10'd0;
        temp_PWM_addr_b = 10'd0;
        temp_PWM_en_a   = 1'd0;
        temp_PWM_en_b   = 1'd0;
        temp_PWM_we_a   = 1'd0;
        temp_PWM_we_b   = 1'd0;
        case (ctrl_sign)
            {KeyGen,6'd5}:begin //"As1_hat = A_hat ‧ s1_hat", read out As1_hat temp data to perform the PWM
                if(PWM_index[0])begin
                    temp_PWM_addr_a = AG_4_addr_a;
                    temp_PWM_addr_b = AG_4_addr_b;
                    temp_PWM_en_a   = AG_4_addr_en;
                    temp_PWM_en_b   = AG_4_addr_en;
                    temp_PWM_we_a   = 1'd0;
                    temp_PWM_we_b   = 1'd0;
                end
                else begin
                    temp_PWM_data_a = PWM_out_a;
                    temp_PWM_data_b = PWM_out_b;
                    temp_PWM_addr_a = PWM_addr_a;
                    temp_PWM_addr_b = PWM_addr_b;
                    temp_PWM_en_a   = PWM_o_valid;
                    temp_PWM_en_b   = PWM_o_valid;
                    temp_PWM_we_a   = PWM_o_valid;
                    temp_PWM_we_b   = PWM_o_valid;
                end  
            end
            {SignGen,6'd7}:begin ////"w_hat = A ‧ y_hat", w_hat temp data to perform the PWM
                if(PWM_index[0])begin
                    temp_PWM_addr_a = AG_4_addr_a;
                    temp_PWM_addr_b = AG_4_addr_b;
                    temp_PWM_en_a   = AG_4_addr_en;
                    temp_PWM_en_b   = AG_4_addr_en;
                    temp_PWM_we_a   = 1'd0;
                    temp_PWM_we_b   = 1'd0;
                end
                else begin
                    temp_PWM_data_a = PWM_out_a;
                    temp_PWM_data_b = PWM_out_b;
                    temp_PWM_addr_a = PWM_addr_a;
                    temp_PWM_addr_b = PWM_addr_b;
                    temp_PWM_en_a   = PWM_o_valid;
                    temp_PWM_en_b   = PWM_o_valid;
                    temp_PWM_we_a   = PWM_o_valid;
                    temp_PWM_we_b   = PWM_o_valid;
                end
            end
            default:begin
                temp_PWM_data_a = 23'd0;
                temp_PWM_data_b = 23'd0;
                temp_PWM_addr_a = 10'd0;
                temp_PWM_addr_b = 10'd0;
                temp_PWM_en_a   = 1'd0;
                temp_PWM_en_b   = 1'd0;
                temp_PWM_we_a   = 1'd0;
                temp_PWM_we_b   = 1'd0;
            end
        endcase
    end


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
            {KeyGen,6'd2}:begin //"Gen(s1)", Store s1 generated by the Sampler
                temp_0_data_a = z0;
                temp_0_data_b = z1;
                temp_0_addr_a = {s1_index[1:0],addr_z0};
                temp_0_addr_b = {s1_index[1:0],addr_z1};
                temp_0_en_a   = en_z0;
                temp_0_en_b   = en_z1;
                temp_0_we_a   = we_z0;
                temp_0_we_b   = we_z1;
            end
            {KeyGen,6'd3}:begin //"s1_hat = NTT(s1)", Read out s1 data to perform the NTT
                temp_0_addr_a = {NTT_index,AG_2_addr_a[7:0]};
                temp_0_addr_b = {NTT_index,(AG_2_addr_a[7:0] + 8'd128)};
                temp_0_en_a   = AG_2_addr_en;
                temp_0_en_b   = AG_2_addr_en;
            end
            {KeyGen,6'd4}:begin //"Pack(s1)", Read out s1 to perform the Encoder
                temp_0_addr_a = AG_2_addr_a[9:0];
                temp_0_addr_b = AG_2_addr_b[9:0];
                temp_0_en_a   = AG_2_addr_en;
                temp_0_en_b   = AG_2_addr_en;
            end
            {KeyGen,6'd5}:begin //"As1_hat = A_hat ‧ s1_hat", read out As1_hat temp data to perform the PWM, last As1_hat store here
                if(~PWM_index[0])begin
                    temp_0_addr_a = AG_4_addr_a;
                    temp_0_addr_b = AG_4_addr_b;
                    temp_0_en_a   = AG_4_addr_en;
                    temp_0_en_b   = AG_4_addr_en;
                    temp_0_we_a   = 1'd0;
                    temp_0_we_b   = 1'd0;
                end
                else begin
                    temp_0_data_a = PWM_out_a;
                    temp_0_data_b = PWM_out_b;
                    temp_0_addr_a = PWM_addr_a;
                    temp_0_addr_b = PWM_addr_b;
                    temp_0_en_a   = PWM_o_valid;
                    temp_0_en_b   = PWM_o_valid;
                    temp_0_we_a   = PWM_o_valid;
                    temp_0_we_b   = PWM_o_valid;
                end
            end
            {KeyGen,6'd6}:begin //"As1 = INTT(As1_hat)", Read out As1_hat data to perform the INTT
                temp_0_addr_a = {NTT_index,AG_2_addr_a[7:0]};
                temp_0_addr_b = {NTT_index,AG_2_addr_b[7:0]};
                temp_0_en_a   = AG_2_addr_en;
                temp_0_en_b   = AG_2_addr_en;
            end
            {KeyGen,6'd7}:begin //"t = As1+ s2",  After performing the PWM, the resulting t store here
                temp_0_data_a = PWM_out_a;
                temp_0_data_b = PWM_out_b;
                temp_0_addr_a = PWM_addr_a;
                temp_0_addr_b = PWM_addr_b;
                temp_0_en_a   = PWM_o_valid;
                temp_0_en_b   = PWM_o_valid;
                temp_0_we_a   = PWM_o_valid;
                temp_0_we_b   = PWM_o_valid;
            end
            {KeyGen,6'd8},      //"Pack(t1)",  Read out t to perform the Encoder and poroduce pack_t1
            {KeyGen,6'd9}:begin //"Pack(t0)",  Read out t to perform the Encoder and poroduce pack_t0
                temp_0_addr_a = AG_2_addr_a[9:0];
                temp_0_addr_b = AG_2_addr_b[9:0];
                temp_0_en_a   = AG_2_addr_en;
                temp_0_en_b   = AG_2_addr_en;
            end
            {SignGen,6'd1}:begin //""Unpack(s1)", Store the s1 obtained from the Decoder.
                temp_0_data_a = DEC_dout[22:0];
                temp_0_data_b = DEC_dout[45:23];
                temp_0_addr_a = AG_3_addr_a;
                temp_0_addr_b = AG_3_addr_b;
                temp_0_en_a   = DEC_valid_o;
                temp_0_en_b   = DEC_valid_o;
                temp_0_we_a   = DEC_valid_o;
                temp_0_we_b   = DEC_valid_o;
            end
            {SignGen,6'd2}:begin //"s1_hat = NTT(s1)", Read out s1 data to perform the NTT
                temp_0_addr_a = {NTT_index,AG_2_addr_a[7:0]};
                temp_0_addr_b = {NTT_index,(AG_2_addr_a[7:0] + 8'd128)};
                temp_0_en_a   = AG_2_addr_en;
                temp_0_en_b   = AG_2_addr_en;
            end
            {SignGen,6'd3}:begin //"Gen(y)", Store y generated by the Sampler
                temp_0_data_a = y0;
                temp_0_data_b = y1;
                temp_0_addr_a = {y_index,addr_y0};
                temp_0_addr_b = {y_index,addr_y1};
                temp_0_en_a   = en_y;
                temp_0_en_b   = en_y;
                temp_0_we_a   = we_y;
                temp_0_we_b   = we_y;
            end
            {SignGen,6'd6}:begin //"y_hat = NTT(y)", Read out y data to perform the NTT
                temp_0_addr_a = {NTT_index,AG_2_addr_a[7:0]};
                temp_0_addr_b = {NTT_index,(AG_2_addr_a[7:0] + 8'd128)};
                temp_0_en_a   = AG_2_addr_en;
                temp_0_en_b   = AG_2_addr_en;
            end
            {SignGen,6'd15}:begin //"z = y + cs1", read y out to PWM
                temp_0_addr_a = AG_4_addr_a;
                temp_0_addr_b = AG_4_addr_b;
                temp_0_en_a   = AG_4_addr_en;
                temp_0_en_b   = AG_4_addr_en;
            end
            {SignGen,6'd16}:begin //"Gen(y)", Store y generated by the Sampler
                temp_0_data_a = y0;
                temp_0_data_b = y1;
                temp_0_addr_a = {y_index,addr_y0};
                temp_0_addr_b = {y_index,addr_y1};
                temp_0_en_a   = en_y;
                temp_0_en_b   = en_y;
                temp_0_we_a   = we_y;
                temp_0_we_b   = we_y;
            end
            {SignGen,6'd17}:begin //"y_hat = NTT(y)", Read out y data to perform the NTT
                temp_0_addr_a = {NTT_index,AG_2_addr_a[7:0]};
                temp_0_addr_b = {NTT_index,(AG_2_addr_a[7:0] + 8'd128)};
                temp_0_en_a   = AG_2_addr_en;
                temp_0_en_b   = AG_2_addr_en;
            end
            {SignVer,6'd1}:begin //"clean", clean mem 0-255 to zero for Sampler c
                temp_0_data_a = 23'd0;
                temp_0_data_b = 23'd0;
                temp_0_addr_a = AG_2_addr_a;
                temp_0_addr_b = AG_2_addr_b;
                temp_0_en_a   = AG_2_addr_en;
                temp_0_en_b   = AG_2_addr_en;
                temp_0_we_a   = AG_2_addr_en;
                temp_0_we_b   = AG_2_addr_en;
            end
            default:begin
                temp_0_data_a = 23'd0;
                temp_0_data_b = 23'd0;
                temp_0_addr_a = 10'd0;
                temp_0_addr_b = 10'd0;
                temp_0_en_a   = 1'd0;
                temp_0_en_b   = 1'd0;
                temp_0_we_a   = 1'd0;
                temp_0_we_b   = 1'd0;
            end
        endcase
    end

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
            {KeyGen,6'd3}:begin //"Gen(s2)", Store s2 generated by the Sampler
                temp_1_data_a = z0;
                temp_1_data_b = z1;
                temp_1_addr_a = {s2_index[1:0],addr_z0};
                temp_1_addr_b = {s2_index[1:0],addr_z1};
                temp_1_en_a   = en_z0;
                temp_1_en_b   = en_z1;
                temp_1_we_a   = we_z0;
                temp_1_we_b   = we_z1;
            end
            {KeyGen,6'd5}:begin //"Pack(s2)", Read out s2 to perform the Encoder
                temp_1_addr_a = AG_2_addr_a[9:0];
                temp_1_addr_b = AG_2_addr_b[9:0];
                temp_1_en_a   = AG_2_addr_en;
                temp_1_en_b   = AG_2_addr_en;
            end
            {KeyGen,6'd7}:begin //"t = As1+ s2", read out s2 data to perform the PWM
                temp_1_addr_a = AG_4_addr_a[9:0];
                temp_1_addr_b = AG_4_addr_b[9:0];
                temp_1_en_a   = AG_4_addr_en;
                temp_1_en_b   = AG_4_addr_en;
            end
            {SignGen,6'd2}:begin //"Unpack(s2)", store s2 generated by the Decoder
                temp_1_data_a = DEC_dout[22:0];
                temp_1_data_b = DEC_dout[45:23];
                temp_1_addr_a = AG_3_addr_a;
                temp_1_addr_b = AG_3_addr_b;
                temp_1_en_a   = DEC_valid_o;
                temp_1_en_b   = DEC_valid_o;
                temp_1_we_a   = DEC_valid_o;
                temp_1_we_b   = DEC_valid_o;
            end
            {SignGen,6'd3}:begin //"s2_hat = NTT(s2)", Read out s2 data to perform the NTT
                temp_1_addr_a = {NTT_index,AG_2_addr_a[7:0]};
                temp_1_addr_b = {NTT_index,(AG_2_addr_a[7:0] + 8'd128)};
                temp_1_en_a   = AG_2_addr_en;
                temp_1_en_b   = AG_2_addr_en;
            end
            {SignGen,6'd6}:begin //"y_hat = NTT(y)", NTT y and store here
                temp_1_data_a = NTT_out_u;
                temp_1_data_b = NTT_out_d;
                temp_1_addr_a = {NTT_index,NTT_addr_u};
                temp_1_addr_b = {NTT_index,NTT_addr_d};
                temp_1_en_a   = NTT_o_valid;
                temp_1_en_b   = NTT_o_valid;
                temp_1_we_a   = NTT_o_valid;
                temp_1_we_b   = NTT_o_valid;
            end
            {SignGen,6'd7}:begin //"w_hat = A ‧ y_hat", read out y_hat to PWM
                temp_1_addr_a = {PWM_index, AG_4_addr_a[7:0]};
                temp_1_addr_b = {PWM_index, AG_4_addr_b[7:0]};
                temp_1_en_a   = AG_4_addr_en;
                temp_1_en_b   = AG_4_addr_en;
            end
            {SignGen,6'd8}:begin //"w = INTT(w_hat)", After performing the INTT on w_hat, the resulting w store here
                temp_1_data_a = NTT_out_u;
                temp_1_data_b = NTT_out_d;
                temp_1_addr_a = {NTT_index,NTT_addr_u};
                temp_1_addr_b = {NTT_index,NTT_addr_d};
                temp_1_en_a   = NTT_o_valid;
                temp_1_en_b   = NTT_o_valid;
                temp_1_we_a   = NTT_o_valid;
                temp_1_we_b   = NTT_o_valid;
            end
            {SignGen,6'd9}:begin //"H_w = High(w)", read out w to Deomposer and get Highbits
                temp_1_addr_a = AG_2_addr_a;
                temp_1_addr_b = AG_2_addr_b;
                temp_1_en_a   = AG_2_addr_en;
                temp_1_en_b   = AG_2_addr_en;
            end
            {SignGen,6'd16}:begin //"w_cs2 = w - cs2", read out w to PWM
                temp_1_addr_a = AG_4_addr_a;
                temp_1_addr_b = AG_4_addr_b;
                temp_1_en_a   = AG_4_addr_en;
                temp_1_en_b   = AG_4_addr_en;
            end
            {SignGen,6'd17}:begin //"y_hat = NTT(y)", NTT y and store here
                temp_1_data_a = NTT_out_u;
                temp_1_data_b = NTT_out_d;
                temp_1_addr_a = {NTT_index,NTT_addr_u};
                temp_1_addr_b = {NTT_index,NTT_addr_d};
                temp_1_en_a   = NTT_o_valid;
                temp_1_en_b   = NTT_o_valid;
                temp_1_we_a   = NTT_o_valid;
                temp_1_we_b   = NTT_o_valid;
            end
            {SignVer,6'd1}:begin //"Unpack(t1)", store t1 generated by the Decoder
                temp_1_data_a = DEC_dout[22:0];
                temp_1_data_b = DEC_dout[45:23];
                temp_1_addr_a = AG_3_addr_a;
                temp_1_addr_b = AG_3_addr_b;
                temp_1_en_a   = DEC_valid_o;
                temp_1_en_b   = DEC_valid_o;
                temp_1_we_a   = DEC_valid_o;
                temp_1_we_b   = DEC_valid_o;
            end
            default:begin
                temp_1_data_a = 23'd0;
                temp_1_data_b = 23'd0;
                temp_1_addr_a = 10'd0;
                temp_1_addr_b = 10'd0;
                temp_1_en_a   = 1'd0;
                temp_1_en_b   = 1'd0;
                temp_1_we_a   = 1'd0;
                temp_1_we_b   = 1'd0;
            end
        endcase
    end

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
            {KeyGen,6'd3}:begin //"s1_hat = NTT(s1)", After performing the NTT on s1, the resulting s1_hat store here
                temp_2_data_a = NTT_out_u;
                temp_2_data_b = NTT_out_d;
                temp_2_addr_a = {NTT_index,NTT_addr_u};
                temp_2_addr_b = {NTT_index,NTT_addr_d};
                temp_2_en_a   = NTT_o_valid;
                temp_2_en_b   = NTT_o_valid;
                temp_2_we_a   = NTT_o_valid;
                temp_2_we_b   = NTT_o_valid;
            end
            {KeyGen,6'd5}:begin //"As1_hat = A_hat ‧ s1_hat", read out s1_hat data to perform the PWM
                temp_2_addr_a = {PWM_index, AG_4_addr_a[7:0]};
                temp_2_addr_b = {PWM_index, AG_4_addr_b[7:0]};
                temp_2_en_a   = AG_4_addr_en;
                temp_2_en_b   = AG_4_addr_en;
            end
            {KeyGen,6'd6}:begin //"As1 = INTT(As1_hat)", After performing the INTT on As1_hat, the resulting As1 store here
                temp_2_data_a = NTT_out_u;
                temp_2_data_b = NTT_out_d;
                temp_2_addr_a = {NTT_index,NTT_addr_u};
                temp_2_addr_b = {NTT_index,NTT_addr_d};
                temp_2_en_a   = NTT_o_valid;
                temp_2_en_b   = NTT_o_valid;
                temp_2_we_a   = NTT_o_valid;
                temp_2_we_b   = NTT_o_valid;
            end
            {KeyGen,6'd7}:begin //"t = As1+ s2", read out As1 data to perform the PWM
                temp_2_addr_a = AG_4_addr_a[9:0];
                temp_2_addr_b = AG_4_addr_b[9:0];
                temp_2_en_a   = AG_4_addr_en;
                temp_2_en_b   = AG_4_addr_en;
            end
            {SignGen,6'd3}:begin //"Unpack(t0)", Decocder pack_t0 to t0
                temp_2_data_a = DEC_dout[22:0];
                temp_2_data_b = DEC_dout[45:23];
                temp_2_addr_a = AG_3_addr_a;
                temp_2_addr_b = AG_3_addr_b;
                temp_2_en_a   = DEC_valid_o;
                temp_2_en_b   = DEC_valid_o;
                temp_2_we_a   = DEC_valid_o;
                temp_2_we_b   = DEC_valid_o;
            end
            {SignGen,6'd5}:begin //"t0_hat = NTT(t0)", Read out t0 data to perform the NTT
                temp_2_addr_a = {NTT_index,AG_2_addr_a[7:0]};
                temp_2_addr_b = {NTT_index,(AG_2_addr_a[7:0] + 8'd128)};
                temp_2_en_a   = AG_2_addr_en;
                temp_2_en_b   = AG_2_addr_en;
            end
            {SignGen,6'd7}:begin //"w_hat = A ‧ y_hat", store w_hat
                if(~PWM_index[0])begin
                    temp_2_addr_a = AG_4_addr_a;
                    temp_2_addr_b = AG_4_addr_b;
                    temp_2_en_a   = AG_4_addr_en;
                    temp_2_en_b   = AG_4_addr_en;
                end
                else begin
                    temp_2_data_a = PWM_out_a;
                    temp_2_data_b = PWM_out_b;
                    temp_2_addr_a = PWM_addr_a;
                    temp_2_addr_b = PWM_addr_b;
                    temp_2_en_a   = PWM_o_valid;
                    temp_2_en_b   = PWM_o_valid;
                    temp_2_we_a   = PWM_o_valid;
                    temp_2_we_b   = PWM_o_valid;
                end
            end
            {SignGen,6'd8}:begin //"w = INTT(w_hat)", Read out w_hat data to perform the INTT
                temp_2_addr_a = {NTT_index,AG_2_addr_a[7:0]};
                temp_2_addr_b = {NTT_index,AG_2_addr_b[7:0]};
                temp_2_en_a   = AG_2_addr_en;
                temp_2_en_b   = AG_2_addr_en;
            end
            {SignGen,6'd9}:begin //"H_w = High(w)", Decomposer w to H_w
                temp_2_data_a = Decomp_dob[22:0];
                temp_2_data_b = Decomp_dob[45:23];
                temp_2_addr_a = AG_3_addr_a;
                temp_2_addr_b = AG_3_addr_b;
                temp_2_en_a   = Decomp_valid_o;
                temp_2_en_b   = Decomp_valid_o;
                temp_2_we_a   = Decomp_valid_o;
                temp_2_we_b   = Decomp_valid_o;
            end
            {SignGen,6'd10}:begin //"w1 = Encode(H_W) ", read out w1 to Enocder to w1
                temp_2_addr_a = AG_2_addr_a;
                temp_2_addr_b = AG_2_addr_b;
                temp_2_en_a   = AG_2_addr_en;
                temp_2_en_b   = AG_2_addr_en;
            end
            {SignGen,6'd13}:begin //"cs1_hat = c_hat ‧ s1_hat", store cs1_hat after PWM
                temp_2_data_a = PWM_out_a;
                temp_2_data_b = PWM_out_b;
                temp_2_addr_a = PWM_addr_a;
                temp_2_addr_b = PWM_addr_b;
                temp_2_en_a   = PWM_o_valid;
                temp_2_en_b   = PWM_o_valid;
                temp_2_we_a   = PWM_o_valid;
                temp_2_we_b   = PWM_o_valid;
            end
            {SignGen,6'd14}:begin //"cs1 = INTT(cs1_hat)", read out cs1_hat to NTT
                temp_2_addr_a = {NTT_index,AG_2_addr_a[7:0]};
                temp_2_addr_b = {NTT_index,AG_2_addr_b[7:0]};
                temp_2_en_a   = AG_2_addr_en;
                temp_2_en_b   = AG_2_addr_en;
            end
            {SignGen,6'd15}:begin //"cs2 = INTT(cs2_hat)", After performing the INTT on cs2_hat, the resulting cs2 store here
                temp_2_data_a = NTT_out_u;
                temp_2_data_b = NTT_out_d;
                temp_2_addr_a = {NTT_index,NTT_addr_u};
                temp_2_addr_b = {NTT_index,NTT_addr_d};
                temp_2_en_a   = NTT_o_valid;
                temp_2_en_b   = NTT_o_valid;
                temp_2_we_a   = NTT_o_valid;
                temp_2_we_b   = NTT_o_valid;
            end
            {SignGen,6'd16}:begin //"w_cs2 = w - cs2", read out cs2 to PWM
                temp_2_addr_a = AG_4_addr_a;
                temp_2_addr_b = AG_4_addr_b;
                temp_2_en_a   = AG_4_addr_en;
                temp_2_en_b   = AG_4_addr_en;
            end
            {SignGen,6'd17}:begin //"ct0_hat = c_hat ‧ t0_hat, store ct0_hat after PWM
                temp_2_data_a = PWM_out_a;
                temp_2_data_b = PWM_out_b;
                temp_2_addr_a = PWM_addr_a;
                temp_2_addr_b = PWM_addr_b;
                temp_2_en_a   = PWM_o_valid;
                temp_2_en_b   = PWM_o_valid;
                temp_2_we_a   = PWM_o_valid;
                temp_2_we_b   = PWM_o_valid;
            end
            {SignGen,6'd18}:begin //"ct0 = INTT(ct0_hat)", Read out ct0_hat data to perform the INTT
                temp_2_addr_a = {NTT_index,AG_2_addr_a[7:0]};
                temp_2_addr_b = {NTT_index,AG_2_addr_b[7:0]};
                temp_2_en_a   = AG_2_addr_en;
                temp_2_en_b   = AG_2_addr_en;
            end
            default:begin
                temp_2_data_a = 23'd0;
                temp_2_data_b = 23'd0;
                temp_2_addr_a = 10'd0;
                temp_2_addr_b = 10'd0;
                temp_2_en_a   = 1'd0;
                temp_2_en_b   = 1'd0;
                temp_2_we_a   = 1'd0;
                temp_2_we_b   = 1'd0;
            end
        endcase
    end

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
            {SignGen,6'd7}:begin //"clean", clean mem 0-255 to zero for Sampler c
                temp_3_data_a = 23'd0;
                temp_3_data_b = 23'd0;
                temp_3_addr_a = AG_2_addr_a;
                temp_3_addr_b = AG_2_addr_b;
                temp_3_en_a   = AG_2_addr_en;
                temp_3_en_b   = AG_2_addr_en;
                temp_3_we_a   = AG_2_addr_en;
                temp_3_we_b   = AG_2_addr_en;
            end
            {SignGen,6'd11}:begin //"Gen(c)", Store sc generated by the Sampler
                temp_3_data_a = ci;
                temp_3_data_b = temp_3_q_a;
                temp_3_addr_a = addr_ci;
                temp_3_addr_b = addr_cj;
                temp_3_en_a   = en_ci;
                temp_3_en_b   = en_cj;
                temp_3_we_a   = we_ci;
                temp_3_we_b   = we_cj;
            end
            {SignGen,6'd12}:begin //"c_hat = NTT(c)", read out c to NTT
                temp_3_addr_a = {NTT_index,AG_2_addr_a[7:0]};
                temp_3_addr_b = {NTT_index,(AG_2_addr_a[7:0] + 8'd128)};
                temp_3_en_a   = AG_2_addr_en;
                temp_3_en_b   = AG_2_addr_en;
            end
            {SignGen,6'd14}:begin //"cs1 = INTT(cs1_hat)", After performing the INTT on cs1_hat, the resulting cs1 store here
                temp_3_data_a = NTT_out_u;
                temp_3_data_b = NTT_out_d;
                temp_3_addr_a = {NTT_index,NTT_addr_u};
                temp_3_addr_b = {NTT_index,NTT_addr_d};
                temp_3_en_a   = NTT_o_valid;
                temp_3_en_b   = NTT_o_valid;
                temp_3_we_a   = NTT_o_valid;
                temp_3_we_b   = NTT_o_valid;
            end
            {SignGen,6'd15}:begin //"z = y + cs1", read out cs1 to PWM
                temp_3_addr_a = AG_4_addr_a;
                temp_3_addr_b = AG_4_addr_b;
                temp_3_en_a   = AG_4_addr_en;
                temp_3_en_b   = AG_4_addr_en;   
            end
            {SignGen,6'd16}:begin //"w_cs2" = w - cs2", store w_cs2
                temp_3_data_a = PWM_out_a;
                temp_3_data_b = PWM_out_b;
                temp_3_addr_a = PWM_addr_a;
                temp_3_addr_b = PWM_addr_b;
                temp_3_en_a   = PWM_o_valid;
                temp_3_en_b   = PWM_o_valid;
                temp_3_we_a   = PWM_o_valid;
                temp_3_we_b   = PWM_o_valid;
            end
            {SignGen,6'd19}:begin //"w_cs2  + ct0", send w_cs2 data to PWM
                temp_3_addr_a = AG_4_addr_a;
                temp_3_addr_b = AG_4_addr_b;
                temp_3_en_a   = AG_4_addr_en;
                temp_3_en_b   = AG_4_addr_en;
            end
            default:begin
                temp_3_data_a = 23'd0;
                temp_3_data_b = 23'd0;
                temp_3_addr_a = 10'd0;
                temp_3_addr_b = 10'd0;
                temp_3_en_a   = 1'd0;
                temp_3_en_b   = 1'd0;
                temp_3_we_a   = 1'd0;
                temp_3_we_b   = 1'd0;
            end
        endcase
    end

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
            {SignGen,6'd14}:begin //"cs2_hat = c_hat ‧ s2_hat", store cs2_hat after PWM
                temp_4_data_a = PWM_out_a;
                temp_4_data_b = PWM_out_b;
                temp_4_addr_a = PWM_addr_a;
                temp_4_addr_b = PWM_addr_b;
                temp_4_en_a   = PWM_o_valid;
                temp_4_en_b   = PWM_o_valid;
                temp_4_we_a   = PWM_o_valid;
                temp_4_we_b   = PWM_o_valid;
            end
            {SignGen,6'd15}:begin //"cs2 = INTT(cs2_hat)", read out cs2_hat to NTT
                temp_4_addr_a = {NTT_index,AG_2_addr_a[7:0]};
                temp_4_addr_b = {NTT_index,AG_2_addr_b[7:0]};
                temp_4_en_a   = AG_2_addr_en;
                temp_4_en_b   = AG_2_addr_en;
            end
            {SignGen,6'd16}:begin //"r1, r0 = Decomp(w_cs2)", store r1 for Stage-19 make hint
                temp_4_data_a = Decomp_dob[22:0];
                temp_4_data_b = Decomp_dob[45:23];
                temp_4_addr_a = AG_3_addr_a;
                temp_4_addr_b = AG_3_addr_b;
                temp_4_en_a   = Decomp_valid_o;
                temp_4_en_b   = Decomp_valid_o;
                temp_4_we_a   = Decomp_valid_o;
                temp_4_we_b   = Decomp_valid_o;
            end
            {SignGen,6'd19}:begin //"h = MakeHint", send out r1 to make hint
                temp_4_addr_a = AG_2_addr_a;
                temp_4_addr_b = AG_2_addr_b;
                temp_4_en_a   = Decomp_valid_o;
                temp_4_en_b   = Decomp_valid_o;
            end
            default:begin
                temp_4_data_a = 23'd0;
                temp_4_data_b = 23'd0;
                temp_4_addr_a = 10'd0;
                temp_4_addr_b = 10'd0;
                temp_4_en_a   = 1'd0;
                temp_4_en_b   = 1'd0;
                temp_4_we_a   = 1'd0;
                temp_4_we_b   = 1'd0;
            end
        endcase
    end

    always @(*) begin
        temp_5_data_a = 23'd0;
        temp_5_data_b = 23'd0;
        temp_5_addr_a = 10'd0;
        temp_5_addr_b = 10'd0;
        temp_5_en_a   = 1'd0;
        temp_5_en_b   = 1'd0;
        temp_5_we_a   = 1'd0;
        temp_5_we_b   = 1'd0;
        case (ctrl_sign)
            {SignGen,6'd15}:begin //"z = y + cs1", store z after PWM
                temp_5_data_a = PWM_out_a;
                temp_5_data_b = PWM_out_b;
                temp_5_addr_a = PWM_addr_a;
                temp_5_addr_b = PWM_addr_b;
                temp_5_en_a   = PWM_o_valid;
                temp_5_en_b   = PWM_o_valid;
                temp_5_we_a   = PWM_o_valid;
                temp_5_we_b   = PWM_o_valid;
            end
            {SignGen,6'd21}:begin //"Pack(z)", read out z to Enocder
                temp_5_addr_a = AG_2_addr_a;
                temp_5_addr_b = AG_2_addr_b;
                temp_5_en_a   = AG_2_addr_en;
                temp_5_en_b   = AG_2_addr_en;   
            end
            default:begin
                temp_5_data_a = 23'd0;
                temp_5_data_b = 23'd0;
                temp_5_addr_a = 10'd0;
                temp_5_addr_b = 10'd0;
                temp_5_en_a   = 1'd0;
                temp_5_en_b   = 1'd0;
                temp_5_we_a   = 1'd0;
                temp_5_we_b   = 1'd0;
            end
        endcase
    end

    always @(*) begin
        temp_6_data_a = 23'd0;
        temp_6_data_b = 23'd0;
        temp_6_addr_a = 10'd0;
        temp_6_addr_b = 10'd0;
        temp_6_en_a   = 1'd0;
        temp_6_en_b   = 1'd0;
        temp_6_we_a   = 1'd0;
        temp_6_we_b   = 1'd0;
        case (ctrl_sign)
            {SignGen,6'd12}:begin //"c_hat = NTT(c)", store c_hat after NTT
                temp_6_data_a = NTT_out_u;
                temp_6_data_b = NTT_out_d;
                temp_6_addr_a = NTT_addr_u;
                temp_6_addr_b = NTT_addr_d;
                temp_6_en_a   = NTT_o_valid;
                temp_6_en_b   = NTT_o_valid;
                temp_6_we_a   = NTT_o_valid;
                temp_6_we_b   = NTT_o_valid;
            end
            {SignGen,6'd13}:begin //"cs1_hat = c_hat ‧ s1_hat", send c_hat data to PWM
                temp_6_addr_a = AG_4_addr_a[7:0];
                temp_6_addr_b = AG_4_addr_b[7:0];
                temp_6_en_a   = AG_4_addr_en;
                temp_6_en_b   = AG_4_addr_en;
            end
            {SignGen,6'd14}:begin //"cs2_hat = c_hat ‧ s2_hat", send c_hat data to PWM
                temp_6_addr_a = AG_4_addr_a[7:0];
                temp_6_addr_b = AG_4_addr_b[7:0];
                temp_6_en_a   = AG_4_addr_en;
                temp_6_en_b   = AG_4_addr_en;
            end
            {SignGen,6'd17}:begin //"ct0_hat = c_hat ‧ t0_hat", send c_hat data to PWM
                temp_6_addr_a = AG_4_addr_a[7:0];
                temp_6_addr_b = AG_4_addr_b[7:0];
                temp_6_en_a   = AG_4_addr_en;
                temp_6_en_b   = AG_4_addr_en;
            end
            {SignGen,6'd18}:begin //"ct0 = INTT(ct0_hat)", After performing the INTT on ct0_hat, the resulting ct0 store here
                temp_6_data_a = NTT_out_u;
                temp_6_data_b = NTT_out_d;
                temp_6_addr_a = {NTT_index,NTT_addr_u};
                temp_6_addr_b = {NTT_index,NTT_addr_d};
                temp_6_en_a   = NTT_o_valid;
                temp_6_en_b   = NTT_o_valid;
                temp_6_we_a   = NTT_o_valid;
                temp_6_we_b   = NTT_o_valid;
            end
            {SignGen,6'd19}:begin //"w_cs2  + ct0", send ct0 data to PWM
                temp_6_addr_a = AG_4_addr_a;
                temp_6_addr_b = AG_4_addr_b;
                temp_6_en_a   = AG_4_addr_en;
                temp_6_en_b   = AG_4_addr_en;
            end
            default:begin
                temp_6_data_a = 23'd0;
                temp_6_data_b = 23'd0;
                temp_6_addr_a = 10'd0;
                temp_6_addr_b = 10'd0;
                temp_6_en_a   = 1'd0;
                temp_6_en_b   = 1'd0;
                temp_6_we_a   = 1'd0;
                temp_6_we_b   = 1'd0;
            end
        endcase
    end

    always @(*) begin
        temp_7_data_a = 23'd0;
        temp_7_data_b = 23'd0;
        temp_7_addr_a = 10'd0;
        temp_7_addr_b = 10'd0;
        temp_7_en_a   = 1'd0;
        temp_7_en_b   = 1'd0;
        temp_7_we_a   = 1'd0;
        temp_7_we_b   = 1'd0;
        case (ctrl_sign)
            {SignGen,6'd2}:begin //"s1_hat = NTT(s1)", After performing the NTT on s1, the resulting s1_hat store here
                temp_7_data_a = NTT_out_u;
                temp_7_data_b = NTT_out_d;
                temp_7_addr_a = {NTT_index,NTT_addr_u};
                temp_7_addr_b = {NTT_index,NTT_addr_d};
                temp_7_en_a   = NTT_o_valid;
                temp_7_en_b   = NTT_o_valid;
                temp_7_we_a   = NTT_o_valid;
                temp_7_we_b   = NTT_o_valid;
            end
            {SignGen,6'd13}:begin //"cs1_hat = c_hat ‧ s1_hat", send s1_hat data to PWM
                temp_7_addr_a = AG_4_addr_a;
                temp_7_addr_b = AG_4_addr_b;
                temp_7_en_a   = AG_4_addr_en;
                temp_7_en_b   = AG_4_addr_en;
            end
            default:begin
                temp_7_data_a = 23'd0;
                temp_7_data_b = 23'd0;
                temp_7_addr_a = 10'd0;
                temp_7_addr_b = 10'd0;
                temp_7_en_a   = 1'd0;
                temp_7_en_b   = 1'd0;
                temp_7_we_a   = 1'd0;
                temp_7_we_b   = 1'd0;
            end
        endcase
    end

    always @(*) begin
        temp_8_data_a = 23'd0;
        temp_8_data_b = 23'd0;
        temp_8_addr_a = 10'd0;
        temp_8_addr_b = 10'd0;
        temp_8_en_a   = 1'd0;
        temp_8_en_b   = 1'd0;
        temp_8_we_a   = 1'd0;
        temp_8_we_b   = 1'd0;
        case (ctrl_sign)
            {SignGen,6'd3}:begin //"s2_hat = NTT(s2)", After performing the NTT on s2, the resulting s2_hat store here
                temp_8_data_a = NTT_out_u;
                temp_8_data_b = NTT_out_d;
                temp_8_addr_a = {NTT_index,NTT_addr_u};
                temp_8_addr_b = {NTT_index,NTT_addr_d};
                temp_8_en_a   = NTT_o_valid;
                temp_8_en_b   = NTT_o_valid;
                temp_8_we_a   = NTT_o_valid;
                temp_8_we_b   = NTT_o_valid;
            end
            {SignGen,6'd14}:begin //"cs2_hat = c_hat ‧ s2_hat", send s2_hat data to PWM
                temp_8_addr_a = AG_4_addr_a;
                temp_8_addr_b = AG_4_addr_b;
                temp_8_en_a   = AG_4_addr_en;
                temp_8_en_b   = AG_4_addr_en;
            end
            default:begin
                temp_8_data_a = 23'd0;
                temp_8_data_b = 23'd0;
                temp_8_addr_a = 10'd0;
                temp_8_addr_b = 10'd0;
                temp_8_en_a   = 1'd0;
                temp_8_en_b   = 1'd0;
                temp_8_we_a   = 1'd0;
                temp_8_we_b   = 1'd0;
            end
        endcase
    end

    always @(*) begin
        temp_9_data_a = 23'd0;
        temp_9_data_b = 23'd0;
        temp_9_addr_a = 10'd0;
        temp_9_addr_b = 10'd0;
        temp_9_en_a   = 1'd0;
        temp_9_en_b   = 1'd0;
        temp_9_we_a   = 1'd0;
        temp_9_we_b   = 1'd0;
        case (ctrl_sign)
            {SignGen,6'd5}:begin //"t0_hat = NTT(t0)", After performing the NTT on t0, the resulting t0_hat store here
                temp_9_data_a = NTT_out_u;
                temp_9_data_b = NTT_out_d;
                temp_9_addr_a = {NTT_index,NTT_addr_u};
                temp_9_addr_b = {NTT_index,NTT_addr_d};
                temp_9_en_a   = NTT_o_valid;
                temp_9_en_b   = NTT_o_valid;
                temp_9_we_a   = NTT_o_valid;
                temp_9_we_b   = NTT_o_valid;
            end
            {SignGen,6'd17}:begin //"ct0_hat = c_hat ‧ t0_hat", send t0_hat data to PWM
                temp_9_addr_a = AG_4_addr_a;
                temp_9_addr_b = AG_4_addr_b;
                temp_9_en_a   = AG_4_addr_en;
                temp_9_en_b   = AG_4_addr_en;
            end
            default:begin
                temp_9_data_a = 23'd0;
                temp_9_data_b = 23'd0;
                temp_9_addr_a = 10'd0;
                temp_9_addr_b = 10'd0;
                temp_9_en_a   = 1'd0;
                temp_9_en_b   = 1'd0;
                temp_9_we_a   = 1'd0;
                temp_9_we_b   = 1'd0;
            end
        endcase
    end

    always @(*) begin
        temp_L_data_a = 64'd0;
        temp_L_data_b = 64'd0;
        temp_L_addr_a = 4'd0;
        temp_L_addr_b = 4'd0;
        temp_L_en_a   = 1'd0; 
        temp_L_en_b   = 1'd0; 
        temp_L_we_a   = 1'd0; 
        temp_L_we_b   = 1'd0; 
        case (ctrl_sign)
            {SignGen,6'd1}:begin //"u = H(𝑡𝑟 || 𝑀′)", store u generated after the Keccak
                temp_L_data_a = sha_out >> (AG_4_addr_a << 6);
                temp_L_data_b = sha_out >> (AG_4_addr_b << 6);
                temp_L_addr_a = AG_4_addr_a[3:0];
                temp_L_addr_b = AG_4_addr_b[3:0];
                temp_L_en_a  =  AG_4_addr_en;
                temp_L_en_b  =  AG_4_addr_en;
                temp_L_we_a  =  AG_4_addr_en;
                temp_L_we_b  =  AG_4_addr_en;
            end
            {SignGen,6'd2}:begin 
                //"p'' = H(𝐾 || 𝑟𝑛𝑑 || u)", read out u to Keccak
                temp_L_addr_a = AG_1_addr_a[3:0];
                temp_L_en_a  =  AG_1_addr_en;
                //"p'' = H(𝐾 || 𝑟𝑛𝑑 || u)", store p'' generated after the Keccak
                temp_L_data_b = sha_out >> (AG_4_addr_a << 6);
                temp_L_addr_b = AG_4_addr_a[3:0] + 4'd8;
                temp_L_en_b  =  AG_4_addr_en;
                temp_L_we_b  =  AG_4_addr_en;
            end
            {SignGen,6'd3}:begin //"Gen(y)", read out the seed  p''
                temp_L_addr_a = AG_1_addr_a[3:0];
                temp_L_en_a   = AG_1_addr_en;
            end
            {SignGen,6'd10}:begin //"c_tilde = H(u || w1)", read out u to Keccak
                temp_L_addr_a = AG_1_addr_a[3:0];
                temp_L_en_a  =  AG_1_addr_en;
            end
            {SignGen,6'd16}:begin //"Gen(y)", read out the seed  p''
                temp_L_addr_a = AG_1_addr_a[3:0];
                temp_L_en_a   = AG_1_addr_en;
            end
            {SignVer,6'd1}:begin //"tr = H(pk)", after keccak gen tr, store tr
                temp_L_data_a = sha_out >> (AG_4_addr_a << 6);
                temp_L_data_b = sha_out >> (AG_4_addr_b << 6);
                temp_L_addr_a = AG_4_addr_a[3:0];
                temp_L_addr_b = AG_4_addr_b[3:0];
                temp_L_en_a  =  AG_4_addr_en;
                temp_L_en_b  =  AG_4_addr_en;
                temp_L_we_a  =  AG_4_addr_en;
                temp_L_we_b  =  AG_4_addr_en;
            end
            default:begin
                temp_L_data_a = 64'd0;
                temp_L_data_b = 64'd0;
                temp_L_addr_a = 4'd0;
                temp_L_addr_b = 4'd0;
                temp_L_en_a   = 1'd0; 
                temp_L_en_b   = 1'd0; 
                temp_L_we_a   = 1'd0; 
                temp_L_we_b   = 1'd0; 
            end
         endcase
    end
    
    always @(*) begin
        temp_seed_data_a = 64'd0;
        temp_seed_data_b = 64'd0;
        temp_seed_addr_a = 4'd0;
        temp_seed_addr_b = 4'd0;
        temp_seed_en_a   = 1'd0; 
        temp_seed_en_b   = 1'd0; 
        temp_seed_we_a   = 1'd0; 
        temp_seed_we_b   = 1'd0; 
        case (ctrl_sign)
            {KeyGen,6'd1}:begin //"p, p', K = H(𝜉+x04+x04)", Store the seed generated after the Keccak
                temp_seed_data_a = sha_out >> (AG_4_addr_a << 6);
                temp_seed_data_b = sha_out >> (AG_4_addr_b << 6);
                temp_seed_addr_a = AG_4_addr_a[3:0];
                temp_seed_addr_b = AG_4_addr_b[3:0];
                temp_seed_en_a  =  AG_4_addr_en;
                temp_seed_en_b  =  AG_4_addr_en;
                temp_seed_we_a  =  AG_4_addr_en;
                temp_seed_we_b  =  AG_4_addr_en;
            end
            {KeyGen,6'd2}:begin 
                //"Gen(s1)", read out the seed  p'
                temp_seed_addr_a = AG_1_addr_a[3:0];
                temp_seed_en_a  =  AG_1_addr_en;
                //"pk, sk → "p"", SendOut
                temp_seed_addr_b = AG_4_addr_a[3:0];
                temp_seed_en_b  =  AG_4_addr_en;
            end
            {KeyGen,6'd3}:begin 
                //"Gen(s2)", read out the seed  p'
                temp_seed_addr_a = AG_1_addr_a[3:0];
                temp_seed_en_a  =  AG_1_addr_en;
                //"sk → "K"", SendOut
                temp_seed_addr_b = AG_4_addr_a[3:0];
                temp_seed_en_b  =  AG_4_addr_en;
            end
            {KeyGen,6'd4}:begin //"Gen(A)", read out the seed  p
                temp_seed_addr_a = AG_1_addr_a[3:0];
                temp_seed_en_a  =  AG_1_addr_en;
            end
            {KeyGen,6'd8}:begin //"tr = H(p || t1)", read out the seed  p
                temp_seed_addr_a = AG_1_addr_a[3:0];
                temp_seed_en_a  =  AG_1_addr_en;
            end
            {SignGen,6'd4}:begin //"Send p", store p from MLDSA_in_B
                temp_seed_data_a = MLDSA_data_in_B;
                temp_seed_addr_a = AG_1_addr_a[3:0];
                temp_seed_en_a  =  MLDSA_i_ready_B & MLDSA_i_valid_B;
                temp_seed_we_a  =  MLDSA_i_ready_B & MLDSA_i_valid_B;
            end
            {SignGen,6'd5},      //"Gen(A)", read out the seed  p
            {SignGen,6'd6}:begin //"Gen(A)", read out the seed  p
                temp_seed_addr_a = AG_1_addr_a[3:0];
                temp_seed_en_a  =  AG_1_addr_en;
            end
            {SignGen,6'd10}:begin //"c_tilde = H(u || w1)", store c_tilde
                temp_seed_data_a = sha_out >> (AG_4_addr_a << 6);
                temp_seed_data_b = sha_out >> (AG_4_addr_b << 6);
                temp_seed_addr_a = AG_4_addr_a[3:0];
                temp_seed_addr_b = AG_4_addr_b[3:0];
                temp_seed_en_a  =  AG_4_addr_en;
                temp_seed_en_b  =  AG_4_addr_en;
                temp_seed_we_a  =  AG_4_addr_en;
                temp_seed_we_b  =  AG_4_addr_en;
            end
            {SignGen,6'd11}:begin //"Gen(c)", read out c_tilde
                temp_seed_addr_a = AG_1_addr_a[3:0];
                temp_seed_en_a  =  AG_1_addr_en;
            end
            {SignGen,6'd19}:begin //"h = MakeHint", store hint
                temp_seed_data_a = MH_hint_o;
                temp_seed_addr_a = AG_3_addr_a;
                temp_seed_en_a   = MH_hint_valid_o;
                temp_seed_we_a   = MH_hint_valid_o;
            end
            {SignGen,6'd20}:begin //"sig → "c_tilde""
                temp_seed_addr_a = AG_1_addr_a[1:0];
                temp_seed_en_a  =  AG_1_addr_en;
            end 
            {SignGen,6'd22}:begin //"sig → "h""
                temp_seed_addr_a = AG_1_addr_a; 
                temp_seed_en_a  =  AG_1_addr_en;
            end
            // {SignVer,6'd1}:begin //"Send p", store p from MLDSA_in_A
            //     temp_seed_data_a = MLDSA_data_in_A;
            //     temp_seed_addr_a = AG_1_addr_a[3:0];
            //     temp_seed_en_a  =  MLDSA_i_ready_A & MLDSA_i_valid_A;
            //     temp_seed_we_a  =  MLDSA_i_ready_A & MLDSA_i_valid_A;
            // end
            default:begin
                temp_seed_data_a = 64'd0;
                temp_seed_data_b = 64'd0;
                temp_seed_addr_a = 4'd0;
                temp_seed_addr_b = 4'd0;
                temp_seed_en_a   = 1'd0; 
                temp_seed_en_b   = 1'd0; 
                temp_seed_we_a   = 1'd0; 
                temp_seed_we_b   = 1'd0; 
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
        case (ctrl_sign)
            {KeyGen,6'd2},        //"Gen(s1)", read out the seed  p' from the temp seed
            {KeyGen,6'd3}: begin  //"Gen(s2)", read out the seed  p' from the temp seed
                AG_1_addr_adder  = 2'd1;
                AG_1_star_addr   = 12'd4;
                AG_1_last_addr   = 12'd11;
            end 
            {KeyGen,6'd4}: begin  //"Gen(A)", read out the seed  p from the temp seed
                AG_1_addr_adder  = 2'd1;
                AG_1_star_addr   = 12'd0;
                AG_1_last_addr   = 12'd3;
            end 
            {KeyGen,6'd8}: begin  //"tr = H(p || t1)", read out the seed  p from the temp seed
                AG_1_addr_adder  = 2'd1;
                AG_1_star_addr   = 12'd0;
                AG_1_last_addr   = 12'd3;
            end
            {SignGen,6'd2}: begin  //"p'' = H(𝐾 || 𝑟𝑛𝑑 || u)", wait K and rnd data send in by MLDSA_in_A then take u data out
                AG_1_addr_adder  = 2'd1;
                AG_1_star_addr   = 12'd0;
                AG_1_last_addr   = 12'd7;
            end 
            {SignGen,6'd3}: begin  //"Gen(y)", read p''out to keccak
                AG_1_addr_adder  = 2'd1;
                AG_1_star_addr   = 12'd8;
                AG_1_last_addr   = 12'd15;
            end
            {SignGen,6'd4}: begin  //"Send p", store p from MLDSA_in_B
                AG_1_addr_adder  = {1'b0,MLDSA_i_ready_B & MLDSA_i_valid_B};
                AG_1_star_addr   = 12'd0;
                AG_1_last_addr   = 12'd3;
            end 
            {SignGen,6'd5},        //"Gen(A)", read seed p to keccak
            {SignGen,6'd6}: begin  //"Gen(A)", read seed p to keccak
                AG_1_addr_adder  = 2'd1;
                AG_1_star_addr   = 12'd0;
                AG_1_last_addr   = 12'd3;
            end 
            {SignGen,6'd10}: begin //"c_tilde = H(u || w1)",read u to keccak 
                AG_1_addr_adder  = 2'd1;
                AG_1_star_addr   = 12'd0;
                AG_1_last_addr   = 12'd7;
            end
            {SignGen,6'd11}: begin  //"Gen(c)", read out c_tilde to keccak
                AG_1_addr_adder  = 2'd1;
                AG_1_star_addr   = 12'd0;
                AG_1_last_addr   = 12'd3;
            end
            {SignGen,6'd16}: begin  //"Gen(y)", read p''out to keccak
                AG_1_addr_adder  = 2'd1;
                AG_1_star_addr   = 12'd8;
                AG_1_last_addr   = 12'd15;
            end
            {SignGen,6'd20}: begin  //"sig → "c_tilde""
                AG_1_addr_adder  = 2'd1;
                AG_1_star_addr   = 12'd0;
                AG_1_last_addr   = 12'd3;
            end 
            {SignGen,6'd22}: begin  //"sig → "h""
                AG_1_addr_adder  = 2'd1;
                AG_1_star_addr   = 12'd4;
                AG_1_last_addr   = 12'd14;
            end
            // {SignVer,6'd1}: begin  //"Send p", store p from MLDSA_in_A
            //     AG_1_addr_adder  = 2'd1;
            //     AG_1_star_addr   = 12'd0;
            //     AG_1_last_addr   = 12'd3;
            // end  
            default:begin
                AG_1_addr_adder  = 2'd0;
                AG_1_star_addr   = 12'd0;
                AG_1_last_addr   = 12'd255;
                AG_1_pasue       = 1'b0;
            end
        endcase
    end

    always @(*) begin
        case (ctrl_sign)
           {KeyGen,6'd3}: begin  //"s1_hat = NTT(s1)"
                AG_2_addr_adder  = 2'd1;
                AG_2_star_addr   = 12'd0;
                AG_2_last_addr   = 12'd127;
            end 
            {KeyGen,6'd4},       //"Pack(s1)", take s1 data to encoder and change it to 64bits
            {KeyGen,6'd5}: begin //"Pack(s2)", take s2 data to encoder and change it to 64bits
                AG_2_addr_adder  = 2'd2;
                AG_2_star_addr   = 12'd0;
                AG_2_last_addr   = 12'd1022;
            end
            {KeyGen,6'd6}: begin  //"As1 = INTT(As1_hat)"
                AG_2_addr_adder  = 2'd2;
                AG_2_star_addr   = 12'd0;
                AG_2_last_addr   = 12'd254;
            end 
            {KeyGen,6'd8}: begin //"Pack(t1)", take 23 bits t data to encoder and change it to 10bits t0 and store in 64bits mem
                AG_2_addr_adder  = 2'd2;
                AG_2_star_addr   = 12'd0;
                AG_2_last_addr   = 12'd1022;
            end
            {KeyGen,6'd9}: begin //"Pack(t0)", take 23 bits t data to encoder and change it to 13bits t0 and store in 64bits mem
                AG_2_addr_adder  = 2'd2;
                AG_2_star_addr   = 12'd0;
                AG_2_last_addr   = 12'd1022;
            end 
            {SignGen,6'd2}: begin  //"s1_hat = NTT(s1)", read s1 out
                AG_2_addr_adder  = 2'd1;
                AG_2_star_addr   = 12'd0;
                AG_2_last_addr   = 12'd127;
            end
            {SignGen,6'd3}: begin  //"s2_hat = NTT(s2)s"
                AG_2_addr_adder  = 2'd1;
                AG_2_star_addr   = 12'd0;
                AG_2_last_addr   = 12'd127;
            end 
            {SignGen,6'd5}: begin  //"t0_hat = NTT(t0)"
                AG_2_addr_adder  = 2'd1;
                AG_2_star_addr   = 12'd0;
                AG_2_last_addr   = 12'd127;
            end 
            {SignGen,6'd6}: begin  //"y_hat = NTT(y)"
                AG_2_addr_adder  = 2'd1;
                AG_2_star_addr   = 12'd0;
                AG_2_last_addr   = 12'd127;
            end 
            {SignGen,6'd7}: begin  //"clean c"
                AG_2_addr_adder  = 2'd2;
                AG_2_star_addr   = 12'd0;
                AG_2_last_addr   = 12'd254;
            end 
            {SignGen,6'd8}: begin  //"w = INTT(w_hat)"
                AG_2_addr_adder  = 2'd2;
                AG_2_star_addr   = 12'd0;
                AG_2_last_addr   = 12'd254;
            end
            {SignGen,6'd9}: begin  //"H_w = High(w)", store H_w
                AG_2_addr_adder  = {Decomp_ready_i,1'b0};
                AG_2_star_addr   = 12'd0;
                AG_2_last_addr   = 12'd1022;
            end
            {SignGen,6'd10}: begin //"w1 = Encode(H_w)", read out HighBit(w) data to encoder
                AG_2_addr_adder  = 2'd2;
                AG_2_star_addr   = 12'd0;
                AG_2_last_addr   = 12'd1022;
            end 
            {SignGen,6'd12}: begin  //"c_hat = NTT(c)"
                AG_2_addr_adder  = 2'd1;
                AG_2_star_addr   = 12'd0;
                AG_2_last_addr   = 12'd127;
            end
            {SignGen,6'd14}: begin  //"cs1 = INTT(cs1_hat)"
                AG_2_addr_adder  = 2'd2;
                AG_2_star_addr   = 12'd0;
                AG_2_last_addr   = 12'd254;
            end
            {SignGen,6'd15}: begin  //"cs2 = INTT(cs2_hat)"
                AG_2_addr_adder  = 2'd2;
                AG_2_star_addr   = 12'd0;
                AG_2_last_addr   = 12'd254;
            end  
            {SignGen,6'd17}: begin  //"y_hat = NTT(y)"
                AG_2_addr_adder  = 2'd1;
                AG_2_star_addr   = 12'd0;
                AG_2_last_addr   = 12'd127;
            end 
            {SignGen,6'd18}: begin  //ct0 = INTT(ct0_hat)
                AG_2_addr_adder  = 2'd2;
                AG_2_star_addr   = 12'd0;
                AG_2_last_addr   = 12'd254;
            end 
            {SignGen,6'd19}: begin  //"h = MakeHint", read r1 to hint
                AG_2_addr_adder  = {Decomp_valid_o, 1'b0};
                AG_2_star_addr   = 12'd0;
                AG_2_last_addr   = 12'd1024;
            end 
            {SignGen,6'd21}: begin //"Pack(z)", take 18 bits z data to encoder and change it to 64bits
                AG_2_addr_adder  = 2'd2;
                AG_2_star_addr   = 12'd0;
                AG_2_last_addr   = 12'd1022;
            end
            {SignVer,6'd1}: begin  //"clean c"
                AG_2_addr_adder  = 2'd2;
                AG_2_star_addr   = 12'd0;
                AG_2_last_addr   = 12'd254;
            end 
            default:begin
                AG_2_addr_adder  = 2'd0;
                AG_2_star_addr   = 12'd0;
                AG_2_last_addr   = 12'd255;
                AG_2_pasue       = 1'b0;
            end
        endcase
    end

    always @(*) begin
        case (ctrl_sign)
            {KeyGen,6'd4},       //"Pack(s1)", send out s1_pack to tb
            {KeyGen,6'd5}: begin //"Pack(s2)", send out s2_pack to tb
                AG_3_addr_adder  = {1'b0,ENC_valid_o};
                AG_3_star_addr   = 12'd0;
                AG_3_last_addr   = 12'd48;//speical to add 1 to make wait ENC_valid_o high
            end
            {KeyGen,6'd8}: begin //"Pack(t1)", send out t1_pack to tb and Keccak 
                AG_3_addr_adder  = {1'b0,(ENC_valid_o & (~sha_buffer_full))};
                AG_3_star_addr   = 12'd0;
                AG_3_last_addr   = 12'd160;//speical to add 1 to make wait ENC_valid_o high
            end 
            {KeyGen,6'd8}: begin //"Pack(t0)", send out t0_pack to tb
                AG_3_addr_adder  = {1'b0,(ENC_valid_o)};
                AG_3_star_addr   = 12'd0;
                AG_3_last_addr   = 12'd160;//speical to add 1 to make wait ENC_valid_o high
            end 
            {KeyGen,6'd9}: begin //"Pack(t1)", send out t1_pack to tb
                AG_3_addr_adder  = {1'b0,(ENC_valid_o)};
                AG_3_star_addr   = 12'd0;
                AG_3_last_addr   = 12'd208;//speical to add 1 to make wait ENC_valid_o high
            end
            {SignGen,6'd1}: begin //"Unpack(s1)", store s1 data
                AG_3_addr_adder  = {DEC_valid_o,1'b0};
                AG_3_star_addr   = 12'd0;
                AG_3_last_addr   = 12'd1024;//speical to add 1 to make wait DEC_valid_o high
            end
            {SignGen,6'd2}: begin //"Unpack(s2)", store s2 data
                AG_3_addr_adder  = {DEC_valid_o,1'b0};
                AG_3_star_addr   = 12'd0;
                AG_3_last_addr   = 12'd1024;//speical to add 1 to make wait DEC_valid_o high
            end
            {SignGen,6'd3}: begin //"Unpack(t0)", store t0 data
                AG_3_addr_adder  = {DEC_valid_o,1'b0};
                AG_3_star_addr   = 12'd0;
                AG_3_last_addr   = 12'd1024;//speical to add 1 to make wait DEC_valid_o high
            end
            {SignGen,6'd9}: begin //"H_w = High(w)", store H_w data to mem
                AG_3_addr_adder  = {Decomp_valid_o,1'b0};
                AG_3_star_addr   = 12'd0;
                AG_3_last_addr   = 12'd1024;//speical to add 1 to make wait Decomp_valid_o high
            end
            {SignGen,6'd10}: begin //"w1 = Encode(H_w)", after encoder to w1
                AG_3_addr_adder  = {1'b0,(ENC_valid_o)};
                AG_3_star_addr   = 12'd0;
                AG_3_last_addr   = 12'd96;
            end 
            {SignGen,6'd16}: begin //"r1, r0 = Decomp(w_cs2)", store r1 data to mem
                AG_3_addr_adder  = {Decomp_valid_o,1'b0};
                AG_3_star_addr   = 12'd0;
                AG_3_last_addr   = 12'd1024;//speical to add 1 to make wait Decomp_valid_o high
            end
            {SignGen,6'd19}: begin //"h = MakeHint", store hint to mem
                AG_3_addr_adder  = {1'b0,MH_hint_valid_o};
                AG_3_star_addr   = 12'd4;
                AG_3_last_addr   = 12'd14;
            end 
            {SignGen,6'd21}: begin //"Pack(z)", cnt pack_z out num after enocder
                AG_3_addr_adder  = {1'b0,ENC_valid_o};
                AG_3_star_addr   = 12'd0;
                AG_3_last_addr   = 12'd288;//speical to add 1 to make wait ENC_valid_o high
            end
            {SignVer,6'd1}: begin //"Unpack(t1)", store t1 data
                AG_3_addr_adder  = {DEC_valid_o,1'b0};
                AG_3_star_addr   = 12'd0;
                AG_3_last_addr   = 12'd1024;//speical to add 1 to make wait DEC_valid_o high
            end
            default:begin
                AG_3_addr_adder  = 2'd0;
                AG_3_star_addr   = 12'd0;
                AG_3_last_addr   = 12'd255;
                AG_3_pasue       = 1'b0;
            end
        endcase
    end

    always @(*) begin
        case (ctrl_sign)
            {KeyGen,6'd1}: begin  //"p, p', K = H(𝜉+x04+x04) ", after keccak gen seed, take seed to mem
                AG_4_addr_adder  = 2'd2;
                AG_4_star_addr   = 12'd0;
                AG_4_last_addr   = 12'd14;
            end
            {KeyGen,6'd2}: begin  //"pk, sk → "p"", SendOut
                AG_4_addr_adder  = 2'd1;
                AG_4_star_addr   = 12'd0;
                AG_4_last_addr   = 12'd3;
            end
            {KeyGen,6'd3}: begin  //"sk → "K"", SendOut
                AG_4_addr_adder  = 2'd1;
                AG_4_star_addr   = 12'd12;
                AG_4_last_addr   = 12'd15;
            end
             {KeyGen,6'd5}: begin  //"As1_hat = A_hat ‧ s1_hat", PWM
                AG_4_addr_adder  = 2'd2;
                AG_4_star_addr   = 12'd0;
                AG_4_last_addr   = 12'd1022;
            end 
            {KeyGen,6'd7}: begin  //"t = As1+ s2", PWM
                AG_4_addr_adder  = 2'd2;
                AG_4_star_addr   = 12'd0;
                AG_4_last_addr   = 12'd1022;
            end
             {KeyGen,6'd8}: begin  //"tr = H(p + t1)", send out tr data
                AG_4_addr_adder  = 2'd1;
                AG_4_star_addr   = 12'd0;
                AG_4_last_addr   = 12'd7;
            end 
            {SignGen,6'd1}: begin  //"u = H(𝑡𝑟 || 𝑀′)", after keccak gen u, take u to mem
                AG_4_addr_adder  = 2'd2;
                AG_4_star_addr   = 12'd0;
                AG_4_last_addr   = 12'd6;
            end
            {SignGen,6'd2}: begin  //"p'' = H(𝐾 || 𝑟𝑛𝑑 || u)", after keccak gen p'', store p'' data
                AG_4_addr_adder  = 2'd1;
                AG_4_star_addr   = 12'd0;
                AG_4_last_addr   = 12'd7;
            end
            {SignGen,6'd7}: begin  //"w_hat = A ‧ y_hat", PWM
                AG_4_addr_adder  = 2'd2;
                AG_4_star_addr   = 12'd0;
                AG_4_last_addr   = 12'd1022;
            end
            {SignGen,6'd10}: begin  //"c_tilde = H(u || w1)", store c_tilde
                AG_4_addr_adder  = 2'd2;
                AG_4_star_addr   = 12'd0;
                AG_4_last_addr   = 12'd2;
            end 
            {SignGen,6'd13}: begin  //"cs1_hat = c_hat ‧ s1_hat", PWM
                AG_4_addr_adder  = 2'd2;
                AG_4_star_addr   = 12'd0;
                AG_4_last_addr   = 12'd1022;
            end
            {SignGen,6'd14}: begin  //"cs2_hat = c_hat ‧ s2_hat", PWM
                AG_4_addr_adder  = 2'd2;
                AG_4_star_addr   = 12'd0;
                AG_4_last_addr   = 12'd1022;
            end
            {SignGen,6'd15}: begin  //"z = y + cs1", PWM
                AG_4_addr_adder  = 2'd2;
                AG_4_star_addr   = 12'd0;
                AG_4_last_addr   = 12'd1022;
            end
            {SignGen,6'd16}: begin  //"w_cs2 = w - cs2", PWM
                AG_4_addr_adder  = 2'd2;
                AG_4_star_addr   = 12'd0;
                AG_4_last_addr   = 12'd1022;
            end
            {SignGen,6'd17}: begin  //"ct0_hat = c_hat ‧ t0_hat", PWM
                AG_4_addr_adder  = 2'd2;
                AG_4_star_addr   = 12'd0;
                AG_4_last_addr   = 12'd1022;
            end
            {SignGen,6'd19}: begin  //"w_cs2  + ct0", PWM
                AG_4_addr_adder  = 2'd2;
                AG_4_star_addr   = 12'd0;
                AG_4_last_addr   = 12'd1022;
            end
            {SignVer,6'd1}: begin  //"tr = H(pk)", after keccak gen tr, take tr to mem
                AG_4_addr_adder  = 2'd2;
                AG_4_star_addr   = 12'd0;
                AG_4_last_addr   = 12'd6;
            end
            default:begin
                AG_4_addr_adder  = 2'd0;
                AG_4_star_addr   = 12'd0;
                AG_4_last_addr   = 12'd255;
                AG_4_pasue       = 1'b0;
            end
        endcase
    end
    /*---AG---*/ //------------------------------------------end



    /*---Keccak---*/ //------------------------------------------str
    always @(posedge clk) begin
        if(reset)
            kappa <= 16'd0;
        else if(y_index == 3 && next_element)
            kappa <= kappa + 16'd4;
    end

    always @(*) begin
        case (ctrl_sign)
            {KeyGen,6'd1}:begin  //"p, p', K = H(𝜉+x04+x04) ", valid from MLDSA_i_valid_A
                sha_data_valid = MLDSA_i_valid_A;
            end
            {KeyGen,6'd2},      //"Gen(s1)"
            {KeyGen,6'd3}:begin //"Gen(s2)"
                sha_data_valid = AG_1_data_valid;
            end
            {KeyGen,6'd4}:begin //"Gen(A)"
                sha_data_valid = AG_1_data_valid;
            end
            {KeyGen,6'd8}:begin //"tr = H(p || t1)"
                if(~main_mem_sel[0])
                    sha_data_valid = AG_1_data_valid;
                else
                    sha_data_valid = ENC_valid_o;
            end
            {SignGen,6'd1}:begin
                sha_data_valid = MLDSA_i_valid_A;
            end
            {SignGen,6'd2}:begin
                sha_data_valid = MLDSA_i_valid_A | AG_1_data_valid;
            end
            {SignGen,6'd3}:begin
                sha_data_valid = AG_1_data_valid;
            end
            {SignGen,6'd5},
            {SignGen,6'd6}:begin
                sha_data_valid = AG_1_data_valid;
            end
            {SignGen,6'd10}:begin
                sha_data_valid = AG_1_data_valid | ENC_valid_o;
            end
            {SignGen,6'd11}:begin
                sha_data_valid = AG_1_data_valid;
            end
            {SignGen,6'd16}:begin
                sha_data_valid = AG_1_data_valid;
            end
            {SignVer,6'd1}:begin
                sha_data_valid = MLDSA_i_valid_A && MLDSA_i_ready_A;
            end
            default:sha_data_valid = 1'b0;
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
            2'd0: kk_sub_1_in = temp_seed_q_a;   //seed mem
            2'd1: kk_sub_1_in = temp_L_q_a;      //u mem
            2'd2: kk_sub_1_in = 64'd0;     //w1 mem
            2'd3: kk_sub_1_in = ENC_dout;     //t1_pack mem
        endcase
    end

    always @(*) begin
        kk_sub_2_in = 64'd0;
        case (kk_sub_sel_2)
            2'd0: kk_sub_2_in = 64'd0;     //c1_tilde mem
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



    /*---Sampler---*/ //------------------------------------------str
    wire sampler_reset;

    assign sampler_reset = ctrl_sign == {{SignGen,6'd7}} || reset;

    Sampler Sampler_(
        .clk(clk),
        .reset(sampler_reset),

        /*---Control----*/
        .mode(sampler_mode),
        .sampler_in_ready(sampler_in_ready & sha_out_ready),
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

    NTT NTT_ (
        .clk(clk),
        .reset(NTT_reset),
        .mode(NTT_mode),
        .i_valid(NTT_i_valid),
        .i_ready(NTT_i_ready),
        .NTT_in_u(NTT_in_u),
        .NTT_in_d(NTT_in_d),
        .NTT_out_u(NTT_out_u),
        .NTT_out_d(NTT_out_d),
        .NTT_addr_u(NTT_addr_u),
        .NTT_addr_d(NTT_addr_d),
        .o_valid(NTT_o_valid),
        .o_ready(NTT_o_ready),
        .done(NTT_done)
    );

    always @(*) begin
        case (ctrl_sign)
            {KeyGen,6'd3}:begin //"s1_hat = NTT(s1)"
                NTT_i_valid = AG_2_data_valid & NTT_in_ready;
                NTT_o_ready = 1'b1;
                NTT_in_u = temp_0_q_a;
                NTT_in_d = temp_0_q_b; 
            end
            {KeyGen,6'd6}:begin //"As1 = INTT(As1_hat)"
                NTT_i_valid = AG_2_data_valid & NTT_in_ready;
                NTT_o_ready = 1'b1;
                NTT_in_u = temp_0_q_a;
                NTT_in_d = temp_0_q_b; 
            end
            {SignGen,6'd2}:begin //"s1_hat = NTT(s1)"
                NTT_i_valid = AG_2_data_valid & NTT_in_ready;
                NTT_o_ready = 1'b1;
                NTT_in_u = temp_0_q_a;
                NTT_in_d = temp_0_q_b; 
            end
            {SignGen,6'd3}:begin //"s2_hat = NTT(s2)"
                NTT_i_valid = AG_2_data_valid & NTT_in_ready;
                NTT_o_ready = 1'b1;
                NTT_in_u = temp_1_q_a;
                NTT_in_d = temp_1_q_b; 
            end
            {SignGen,6'd5}:begin //"t0_hat = NTT(t0)"
                NTT_i_valid = AG_2_data_valid & NTT_in_ready;
                NTT_o_ready = 1'b1;
                NTT_in_u = temp_2_q_a;
                NTT_in_d = temp_2_q_b; 
            end
            {SignGen,6'd6}:begin //"y_hat = NTT(y)"
                NTT_i_valid = AG_2_data_valid & NTT_in_ready;
                NTT_o_ready = 1'b1;
                NTT_in_u = temp_0_q_a;
                NTT_in_d = temp_0_q_b; 
            end
            {SignGen,6'd8}:begin //"w = INTT(w_hat)"
                NTT_i_valid = AG_2_data_valid & NTT_in_ready;
                NTT_o_ready = 1'b1;
                NTT_in_u = temp_2_q_a;
                NTT_in_d = temp_2_q_b; 
            end
            {SignGen,6'd12}:begin //"c_hat = NTT(c)"
                NTT_i_valid = AG_2_data_valid & NTT_in_ready;
                NTT_o_ready = 1'b1;
                NTT_in_u = temp_3_q_a;
                NTT_in_d = temp_3_q_b; 
            end
            {SignGen,6'd14}:begin //"cs1 = INTT(cs1_hat)"
                NTT_i_valid = AG_2_data_valid & NTT_in_ready;
                NTT_o_ready = 1'b1;
                NTT_in_u = temp_2_q_a;
                NTT_in_d = temp_2_q_b; 
            end
            {SignGen,6'd15}:begin //"cs2 = INTT(cs2_hat)"
                NTT_i_valid = AG_2_data_valid & NTT_in_ready;
                NTT_o_ready = 1'b1;
                NTT_in_u = temp_4_q_a;
                NTT_in_d = temp_4_q_b; 
            end
            {SignGen,6'd17}:begin //"y_hat = NTT(y)"
                NTT_i_valid = AG_2_data_valid & NTT_in_ready;
                NTT_o_ready = 1'b1;
                NTT_in_u = temp_0_q_a;
                NTT_in_d = temp_0_q_b; 
            end
            {SignGen,6'd18}:begin //"cs2 = INTT(cs2_hat)"
                NTT_i_valid = AG_2_data_valid & NTT_in_ready;
                NTT_o_ready = 1'b1;
                NTT_in_u = temp_2_q_a;
                NTT_in_d = temp_2_q_b; 
            end
            default:begin
                NTT_in_u = 23'd0;
                NTT_in_d = 23'd0;
                NTT_i_valid = 1'b0;
                NTT_o_ready = 1'b0;
            end
        endcase
    end
    /*---NTT---*/ //------------------------------------------end



     /*---PWM---*/ //------------------------------------------str
    PWM PWM_(
        .clk(clk),
        .reset(reset),
        .mode(PWM_mode),
        .i_valid(PWM_i_valid),
        .i_ready(PWM_i_ready),
        .o_ready(PWM_o_ready),
        .o_valid(PWM_o_valid),
        .done(PWM_done),
        .in_a0(PWM_in_a0),  /*vector data*/
        .in_a1(PWM_in_a1),  /*vector or matrix data*/
        .in_a2(PWM_in_a2),  /*origin data*/
        .out_a(PWM_out_a), 
        .addr_a(PWM_addr_a),
        .in_b0(PWM_in_b0),  /*vector data*/
        .in_b1(PWM_in_b1),  /*vector or matrix data*/
        .in_b2(PWM_in_b2),  /*origin data*/
        .out_b(PWM_out_b), 
        .addr_b(PWM_addr_b)
    );

    always @(*) begin
        case (ctrl_sign)
            {KeyGen,6'd5}:begin //"As1_hat = A_hat ‧ s1_hat"
                if(PWM_index == 0)begin
                    PWM_in_a2 = 23'd0;
                    PWM_in_b2 = 23'd0;
                end
                else begin
                    PWM_in_a2 = PWM_index[0] ? temp_PWM_q_a : temp_0_q_a;    //As1_hat 
                    PWM_in_b2 = PWM_index[0] ? temp_PWM_q_b : temp_0_q_b;    //As1_hat
                end
                PWM_mode  = MATRIX_VECTOR;
                PWM_i_valid = AG_4_data_valid;
                PWM_o_ready = 1'b1;
                PWM_in_a0 = temp_2_q_a;     //s1_hat
                PWM_in_a1 = temp_A_q_a;     //A_hat
                PWM_in_b0 = temp_2_q_b;     //s1_hat
                PWM_in_b1 = temp_A_q_b;     //A_hat
            end
            {KeyGen,6'd7}:begin //"t = As1+ s2"
                PWM_mode  = ADD_VECTOR;
                PWM_i_valid = AG_4_data_valid;
                PWM_o_ready = 1'b1;
                PWM_in_a1 = temp_1_q_a;
                PWM_in_a2 = temp_2_q_a; 
                PWM_in_b1 = temp_1_q_b;
                PWM_in_b2 = temp_2_q_b; 
            end
            {SignGen,6'd7}:begin //"w_hat = A ‧ y_hat"
                if(PWM_index == 0)begin
                    PWM_in_a2 = 23'd0;
                    PWM_in_b2 = 23'd0;
                end
                else begin
                    PWM_in_a2 = PWM_index[0] ? temp_PWM_q_a : temp_2_q_a;  //w_hat
                    PWM_in_b2 = PWM_index[0] ? temp_PWM_q_b : temp_2_q_b;  //w_hat
                end
                PWM_mode    = MATRIX_VECTOR;
                PWM_i_valid = AG_4_data_valid;
                PWM_o_ready = 1'b1;
                PWM_in_a0   = temp_1_q_a;     //y_hat
                PWM_in_a1   = temp_A_q_a;     //A_hat
                PWM_in_b0   = temp_1_q_b;     //y_hat
                PWM_in_b1   = temp_A_q_b;     //A_hat
            end
            {SignGen,6'd13}:begin //"cs1_hat = c_hat ‧ s1_hat"
                PWM_mode    = SCALAR_VECTOR;
                PWM_i_valid = AG_4_data_valid;
                PWM_o_ready = 1'b1;
                PWM_in_a0   = temp_7_q_a;   //s1_hat
                PWM_in_a1   = temp_6_q_a;   //c_hat
                PWM_in_b0   = temp_7_q_b;   //s1_hat
                PWM_in_b1   = temp_6_q_b;   //c_hat
            end
            {SignGen,6'd14}:begin //"cs2_hat = c_hat ‧ s2_hat"
                PWM_mode    = SCALAR_VECTOR;
                PWM_i_valid = AG_4_data_valid;
                PWM_o_ready = 1'b1;
                PWM_in_a0   = temp_8_q_a;   //s2_hat
                PWM_in_a1   = temp_6_q_a;   //c_hat
                PWM_in_b0   = temp_8_q_b;   //s2_hat
                PWM_in_b1   = temp_6_q_b;   //c_hat
            end
            {SignGen,6'd15}:begin //"z = y + cs1"
                PWM_mode    = ADD_VECTOR;
                PWM_i_valid = AG_4_data_valid;
                PWM_o_ready = 1'b1;
                PWM_in_a1   = temp_3_q_a;   //cs1
                PWM_in_a2   = temp_0_q_a;   //y
                PWM_in_b1   = temp_3_q_b;   //cs1
                PWM_in_b2   = temp_0_q_b;   //y
            end
            {SignGen,6'd16}:begin //"w_cs2 = w - cs2"
                PWM_mode    = ADD_VECTOR;
                PWM_i_valid = AG_4_data_valid;
                PWM_o_ready = 1'b1;
                PWM_in_a1   = 23'd8380417 - temp_2_q_a;   //cs2
                PWM_in_a2   = temp_1_q_a;   //w
                PWM_in_b1   = 23'd8380417 - temp_2_q_b;   //cs2
                PWM_in_b2   = temp_1_q_b;   //w
            end
            {SignGen,6'd17}:begin //"ct0_hat = c_hat ‧ t0_hat"
                PWM_mode    = SCALAR_VECTOR;
                PWM_i_valid = AG_4_data_valid;
                PWM_o_ready = 1'b1;
                PWM_in_a0   = temp_9_q_a;   //t0_hat
                PWM_in_a1   = temp_6_q_a;   //c_hat
                PWM_in_b0   = temp_9_q_b;   //t0_hat
                PWM_in_b1   = temp_6_q_b;   //c_hat
            end
            {SignGen,6'd19}:begin //"w_cs2  + ct0"
                PWM_mode    = ADD_VECTOR;
                PWM_i_valid = AG_4_data_valid;
                PWM_o_ready = 1'b1;
                PWM_in_a1   = temp_3_q_a;   //w_cs2
                PWM_in_a2   = temp_6_q_a;   //ct0
                PWM_in_b1   = temp_3_q_b;   //w_cs2
                PWM_in_b2   = temp_6_q_b;   //ct0
            end
            default:begin
                PWM_mode  = 2'd0;
                PWM_i_valid = 1'b0;
                PWM_o_ready = 1'b0;
                PWM_in_a0 = 23'd0;
                PWM_in_a1 = 23'd0;
                PWM_in_a2 = 23'd0;
                PWM_in_b0 = 23'd0;
                PWM_in_b1 = 23'd0;
                PWM_in_b2 = 23'd0;
            end
        endcase
    end
    /*---PWM---*/ //------------------------------------------end



    /*---Encoder---*/ //------------------------------------------str
    Encoder Enc_(
        .reset(reset),
        .clk(clk),
        .encode_mode(ENC_encode_mode),
        .valid_i(ENC_valid_i),
        .ready_i(ENC_ready_i),
        .di(ENC_di),
        .dout(ENC_dout),
        .valid_o(ENC_valid_o),
        .ready_o(ENC_ready_o)
    );

    always @(*) begin
        case (ctrl_sign)
            {KeyGen,6'd4}:begin //"Pack(s1)" 
                ENC_encode_mode = 3'd2;
                ENC_di = {temp_0_q_b,temp_0_q_a};
                ENC_valid_i = AG_2_data_valid;
                ENC_ready_o = 1'b1;
            end
            {KeyGen,6'd5}:begin //"Pack(s2)" 
                ENC_encode_mode = 3'd3;
                ENC_di = {temp_1_q_b,temp_1_q_a};
                ENC_valid_i = AG_2_data_valid;
                ENC_ready_o = 1'b1;
            end
            {KeyGen,6'd8}:begin //"Pack(t1)" 
                ENC_encode_mode = 3'd1;
                ENC_di = {temp_0_q_b,temp_0_q_a};
                ENC_valid_i = AG_2_data_valid;
                ENC_ready_o = 1'b1;
            end
            {KeyGen,6'd9}:begin //"Pack(t0)" 
                ENC_encode_mode = 3'd0;
                ENC_di = {temp_0_q_b,temp_0_q_a};
                ENC_valid_i = AG_2_data_valid;
                ENC_ready_o = 1'b1;
            end
            {SignGen,6'd10}:begin //"w1 = Encode(H_w) " 
                ENC_encode_mode = 3'd4;
                ENC_di = {temp_2_q_b,temp_2_q_a};
                ENC_valid_i = AG_2_data_valid;
                ENC_ready_o = 1'b1;
            end
            {SignGen,6'd21}:begin //"Pack(z)"
                ENC_encode_mode = 3'd5;
                ENC_di = {temp_5_q_b,temp_5_q_a};
                ENC_valid_i = AG_2_data_valid;
                ENC_ready_o = 1'b1;
            end
            default:begin
                ENC_encode_mode = 3'd1;
                ENC_di = 46'd0;
                ENC_valid_i = 1'b0;
                ENC_ready_o = 1'b0;
            end
        endcase
    end
    /*---Encoder---*/ //------------------------------------------end


    /*---Decoder---*/ //------------------------------------------str
    Decoder Dec_(
        .reset(reset),
        .clk(clk),
        .decode_mode(DEC_mode),
        .valid_i(DEC_valid_i),
        .ready_i(DEC_ready_i),
        .di(DEC_di),
        .dout(DEC_dout),
        .valid_o(DEC_valid_o),
        .ready_o(DEC_ready_o)
    );

     always @(*) begin
        DEC_mode = 3'd0;
        DEC_di = 46'd0;
        DEC_valid_i = 1'b0;
        DEC_ready_o = 1'b0;
        case (ctrl_sign)
            {SignGen,6'd1}:begin //"Unpack(s1)", Decode the pack_s1 data received from the testbench
                DEC_mode = 3'd2;
                DEC_di = MLDSA_data_in_B;
                DEC_valid_i = MLDSA_i_valid_B & MLDSA_i_ready_B;
                DEC_ready_o = 1'b1;
            end
            {SignGen,6'd2}:begin //"Unpack(s2)", Decode the pack_s2 data received from the testbench
                DEC_mode = 3'd3;
                DEC_di = MLDSA_data_in_B;
                DEC_valid_i = MLDSA_i_valid_B & MLDSA_i_ready_B;
                DEC_ready_o = 1'b1;
            end
            {SignGen,6'd3}:begin //"Unpack(t0)", Decode the pack_t0 data received from the testbench
                DEC_mode = 3'd0;
                DEC_di = MLDSA_data_in_B;
                DEC_valid_i = MLDSA_i_valid_B & MLDSA_i_ready_B;
                DEC_ready_o = 1'b1;
            end
            {SignVer,6'd1}:begin //"Unpack(t1)", Decode the pack_t1 data received from the testbench
                DEC_mode = 3'd1;
                DEC_di = MLDSA_data_in_B;
                DEC_valid_i = MLDSA_i_valid_B & MLDSA_i_ready_B;
                DEC_ready_o = 1'b1;
            end
        endcase
    end
    /*---Decoder---*/ //------------------------------------------end



    /*---Decomposer---*/ //------------------------------------------str
    Decomposer Decomp_(
        .reset(reset),
        .clk(clk),
        .valid_i(Decomp_valid_i),
        .ready_i(Decomp_ready_i),
        .di(Decomp_di),
        .doa(Decomp_doa),
        .dob(Decomp_dob),
        .valid_o(Decomp_valid_o),
        .ready_o(Decomp_ready_o)
    );

    always @(*) begin
        case (ctrl_sign)
            {SignGen,6'd9}:begin //"H_w = High(w)"
                Decomp_valid_i = AG_2_data_valid;
                Decomp_di      = {temp_1_q_b,temp_1_q_a};
                Decomp_ready_o = 1'b1;
            end
            {SignGen,6'd16}:begin //"r0 = LowBits(w_cs2)"
                Decomp_valid_i = PWM_o_valid;
                Decomp_di      = {PWM_out_b,PWM_out_a};
                Decomp_ready_o = 1'b1;
            end
            {SignGen,6'd19}:begin //"h = MakeHint", use w_cast + ct0 after PWM to generate HighBit(w_cast + ct0)
                Decomp_valid_i = PWM_o_valid;
                Decomp_di      = {PWM_out_b,PWM_out_a};
                Decomp_ready_o = 1'b1;
            end
            default:begin
                Decomp_valid_i = 1'b0;
                Decomp_di      = 46'd0;
                Decomp_ready_o = 1'b0;
            end
        endcase
    end
    /*---Decomposer---*/ //------------------------------------------end



    /*---Hint---*/ //------------------------------------------str
    assign MH_reset = reset || ctrl_sign == {SignGen,6'd7};

    makehint makehint_(
        .reset(reset),
        .clk(clk),
        .reject_hint(MH_reject_hint),
        .poly0_ie(MH_poly0_ie),
        .poly1_ie(MH_poly1_ie),
        .poly_valid_ie(MH_poly_valid_ie),
        .poly_ready_i(MH_poly_ready_i),
        .hint_o(MH_hint_o),
        .hint_valid_o(MH_hint_valid_o),
        .hint_ready_o(MH_hint_ready_o)
    );


    always @(posedge clk) begin
        if(reset)
            MH_PWM_data_delay_BF <= 46'd0;
        else
            MH_PWM_data_delay_BF <= Decomp_dob;
    end

    always @(posedge clk) begin
        if(reset)
            MH_PWM_valid_delay_BF <= 1'd0;
        else
            MH_PWM_valid_delay_BF <= Decomp_valid_o;
    end


    always @(*) begin
        MH_poly0_ie = 46'd0;
        MH_poly1_ie = 46'd0;
        MH_poly_valid_ie = 1'b0;
        MH_hint_ready_o = 1'b0;
        case (ctrl_sign)
            {SignGen,6'd19}:begin
                MH_poly0_ie = MH_PWM_data_delay_BF;
                MH_poly1_ie = {temp_4_q_b,temp_4_q_a};
                MH_poly_valid_ie = MH_PWM_valid_delay_BF;
                MH_hint_ready_o = 1'b1;
            end
        endcase
    end

    always @(posedge clk) begin
        if(reset)begin
            hint_fail <= 1'b0;
        end
        else if(ctrl_sign == {SignGen,6'd7})begin
            hint_fail <= 1'b0;
        end
        else if(ctrl_sign == {SignGen,6'd19} && MH_reject_hint)begin
            hint_fail <= 1'b1;
        end
    end   
    /*---Hint---*/ //------------------------------------------end



    /*---infinity_norm---*/ //------------------------------------------str
    assign z_mod_half_q_a = (PWM_out_a > (8380417>>1)) ? PWM_out_a - 8380417 : PWM_out_a;
    assign z_mod_half_q_b = (PWM_out_b > (8380417>>1)) ? PWM_out_b - 8380417 : PWM_out_b;

    assign z_a = z_mod_half_q_a[22] ? 24'b1000_0000_0000_0000_0000_0000 - z_mod_half_q_a : z_mod_half_q_a;
    assign z_b = z_mod_half_q_b[22] ? 24'b1000_0000_0000_0000_0000_0000 - z_mod_half_q_b : z_mod_half_q_b;

    always @(posedge clk) begin
        if(reset)begin
            z_fail <= 1'b0;
        end
        else if(ctrl_sign == {SignGen,6'd7})begin
            z_fail <= 1'b0;
        end
        else if(ctrl_sign == {SignGen,6'd15} && PWM_o_valid)begin
            if(z_a >= (GAMMA1 - Beta) || z_b >= (GAMMA1 - Beta))begin
                z_fail <= 1'b1;
            end
        end
    end

    assign r0_mod_half_q_a = (Decomp_doa[22:0]  > (8380417>>1)) ? Decomp_doa[22:0]  - 8380417 : Decomp_doa[22:0];
    assign r0_mod_half_q_b = (Decomp_doa[45:23] > (8380417>>1)) ? Decomp_doa[45:23] - 8380417 : Decomp_doa[45:23];

    assign r0_a = r0_mod_half_q_a[22] ? 24'b1000_0000_0000_0000_0000_0000 - r0_mod_half_q_a : r0_mod_half_q_a;
    assign r0_b = r0_mod_half_q_b[22] ? 24'b1000_0000_0000_0000_0000_0000 - r0_mod_half_q_b : r0_mod_half_q_b;
    
    always @(posedge clk) begin
        if(reset)begin
            r0_fail <= 1'b0;
        end
        else if(ctrl_sign == {SignGen,6'd7})begin
            r0_fail <= 1'b0;
        end
        else if(ctrl_sign == {SignGen,6'd16} && Decomp_valid_o)begin
            if(r0_a >= (GAMMA2 - Beta) || r0_b >= (GAMMA2 - Beta))begin
                r0_fail <= 1'b1;
            end
        end
    end    

    assign ct0_mod_half_q_a = (NTT_out_u > (8380417>>1)) ? NTT_out_u - 8380417 : NTT_out_u;
    assign ct0_mod_half_q_b = (NTT_out_d > (8380417>>1)) ? NTT_out_d - 8380417 : NTT_out_d;

    assign ct0_a = ct0_mod_half_q_a[22] ? 24'b1000_0000_0000_0000_0000_0000 - ct0_mod_half_q_a : ct0_mod_half_q_a;
    assign ct0_b = ct0_mod_half_q_b[22] ? 24'b1000_0000_0000_0000_0000_0000 - ct0_mod_half_q_b : ct0_mod_half_q_b;

    always @(posedge clk) begin
        if(reset)begin
            ct0_fail <= 1'b0;
        end
        else if(ctrl_sign == {SignGen,6'd7})begin
            ct0_fail <= 1'b0;
        end
        else if(ctrl_sign == {SignGen,6'd18} && NTT_o_valid)begin
            if(ct0_a >= GAMMA2 || ct0_b >= GAMMA2)begin
                ct0_fail <= 1'b1;
            end
        end
    end   
    /*---infinity_norm---*/ //------------------------------------------end


    /*---AXI Stream output protocol---*/ //------------------------------------------str
    always @(*) begin
        MLDSA_o_valid = 1'b0;
        case (ctrl_sign)
            {KeyGen,6'd2}:begin  //"pk, sk → "p"", SendOut
                MLDSA_o_valid = AG_4_data_valid;
            end
            {KeyGen,6'd3}:begin  //"sk → "K"", SendOut
                MLDSA_o_valid = AG_4_data_valid;
            end
            {KeyGen,6'd4}:begin  //"sk → "s1"", SendOut
                MLDSA_o_valid = ENC_valid_o;
            end
            {KeyGen,6'd5}:begin  //"sk → "s2"", SendOut
                MLDSA_o_valid = ENC_valid_o;
            end
            {KeyGen,6'd8}:begin  //"sk → "tr", pk → "t1"", SendOut
                MLDSA_o_valid = AG_4_addr_en ? 1'b1 : ENC_valid_o;
            end
            {KeyGen,6'd9}:begin  //"sk → "t0"", SendOut
                MLDSA_o_valid = ENC_valid_o;
            end
            {SignGen,6'd20}:begin
                MLDSA_o_valid = AG_1_data_valid;
            end
            {SignGen,6'd21}:begin
                MLDSA_o_valid = ENC_valid_o;
            end
            {SignGen,6'd22}:begin
                MLDSA_o_valid = AG_1_data_valid;
            end
        endcase
    end

    always @(*) begin
        MLDSA_data_out = 64'd0;
        case (ctrl_sign)
            {KeyGen,6'd2}:begin  //"pk, sk → "p"", SendOut
                MLDSA_data_out = temp_seed_q_b;
            end
            {KeyGen,6'd3}:begin  //"sk → "K"", SendOut
                MLDSA_data_out = temp_seed_q_b;
            end
            {KeyGen,6'd4}:begin  //"sk → "s1"", SendOut
                MLDSA_data_out = ENC_dout;
            end
            {KeyGen,6'd5}:begin  //"sk → "s2"", SendOut
                MLDSA_data_out = ENC_dout;
            end
            {KeyGen,6'd8}:begin //"sk → "tr", pk → "t1"", SendOut
                if(~AG_4_addr_en)
                    MLDSA_data_out = ENC_dout;
                else
                    MLDSA_data_out = sha_out >> (AG_4_addr_a << 6);
            end
            {KeyGen,6'd9}:begin //"sk → "t0"", SendOut
                MLDSA_data_out = ENC_dout;
            end
            {SignGen,6'd20}:begin
                MLDSA_data_out = temp_seed_q_a;
            end
            {SignGen,6'd21}:begin
                MLDSA_data_out = ENC_dout;
            end
            {SignGen,6'd22}:begin
                MLDSA_data_out = temp_seed_q_a;
            end
        endcase
    end

    always @(*) begin
        MLDSA_o_last = 1'b0;
        case (ctrl_sign)
            {KeyGen,6'd9}:begin
                MLDSA_o_last = MLDSA_o_valid & (AG_3_addr_b == AG_3_last_addr); //special to use AG_3_addr_b not AG_3_addr_a, because AG_3_addr_a more add one
            end
            {SignGen,6'd22}:begin
                MLDSA_o_last = AG_1_done;
            end
        endcase
    end
    /*---AXI Stream output protocol---*/ //------------------------------------------end



    
endmodule

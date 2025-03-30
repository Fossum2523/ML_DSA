module Data_Path
#(  parameter DLEN = 23, A_HLEN = 12, T_HLEN = 10, HLEN = 8, BIT_LEN = 23)
    (   
    input           clk,
    input           reset,

    /*---Keack---*/
    input           sha_in_ready, 
    input           sha_is_last,
    input           sha_squeeze, // when squeeze = 0, output once; otherwise, keep squeezing
    input           sha_mode,
    input           sha_hold,
    input   [2:0]   sha_byte_num,
    output          sha_out_ready,
    input           sha_clean,
    input  [1:0]    keccak_in_sel,
    input  [1:0]    mem_sel_1,
    input  [1:0]    mem_sel_2,
    input  [1:0]    index_sel,
    input           in_seed_sel,

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
    input   [3:0]   index,
    input           sampler_in_ready,
    output          next_element,

    /*---NTT---*/
    input           NTT_mode,
	input           NTT_in_ready,
    input [1:0]     NTT_index,
    output          NTT_done,

    /*---PWM---*/
    input           PWM_start,
    input [3:0]     PWM_index,
    output          PWM_done,

    /*---from outside---*/
    input   [63:0]  data_in,
    output  [63:0]  data_out,

    /*---test (Need to chage to wire)---*/
    output  [1343:0]    padder_out,
    output              padder_out_ready,
    output  [1599:0]    f_out,
    output              f_out_ready,
    output  [1343:0]    sha_out
    );  



    /*---parameter---*/
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



    /*---Keack signals---*/
    reg  [63:0]     sha_in;
    reg  [63:0]     mem_1_in;
    reg  [63:0]     mem_2_in;
    reg  [63:0]     index_in;
    reg  [63:0]     in_seed_in;
    
    /*---Data_Mem signals---*/
    //---seed
    wire [63:0]     seed_data_a;
    wire [63:0]     seed_data_b;
    wire [10 - 1:0] seed_addr_a;
    wire [10 - 1:0] seed_addr_b;
    wire            seed_en_a;
    wire            seed_en_b;
    wire            seed_we_a;
    wire            seed_we_b;
    wire [63:0]     seed_q_a;
    wire [63:0]     seed_q_b;
    //---s1
    wire [DLEN-1:0] s1_q_a;
    wire [DLEN-1:0] s1_q_b;
    wire [10 - 1:0] s1_addr_a;
    wire [10 - 1:0] s1_addr_b;
    wire            s1_en_z0;
    wire            s1_we_z0;
    wire            s1_en_z1;
    wire            s1_we_z1;
    //---s2
    wire [DLEN-1:0] s2_q_a;
    wire [DLEN-1:0] s2_q_b;
    wire            s2_en_z0;
    wire            s2_we_z0;
    wire            s2_en_z1;
    wire            s2_we_z1;
    //---A
    wire [DLEN-1:0]   A_data_a;
    wire [DLEN-1:0]   A_data_b;
    wire [A_HLEN-1:0] A_addr_a;
    wire [A_HLEN-1:0] A_addr_b;
    wire              A_en_a;
    wire              A_en_b;
    wire              A_we_a;
    wire              A_we_b;
    wire [DLEN-1:0]   A_q_a;
    wire [DLEN-1:0]   A_q_b;
    //---w
    wire [DLEN-1:0] w_q_a;
    wire [DLEN-1:0] w_q_b;
    //---c
    wire [DLEN-1:0] c_q_a;
    wire [DLEN-1:0] c_q_b;
    //---t
    wire [DLEN-1:0]      t_data_a;
    wire [DLEN-1:0]      t_data_b;
    wire [T_HLEN - 1:0]  t_addr_a;
    wire [T_HLEN - 1:0]  t_addr_b;
    wire                 t_en_a;
    wire                 t_en_b;
    wire                 t_we_a;
    wire                 t_we_b;
    wire [DLEN-1:0]      t_q_a;
    wire [DLEN-1:0]      t_q_b;
    //---temp
    wire [22:0]     temp0;
    wire [22:0]     temp1;
    wire [7:0]      addr_temp0;
    wire [7:0]      addr_temp1;
    wire            en_temp0;
    wire            we_temp0;
    wire            en_temp1;
    wire            we_temp1;


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
    wire                NTT_out_ready;
    //---Data
    wire                NTT_data_en;
    wire [BIT_LEN-1:0]  NTT_in_u;
    wire [BIT_LEN-1:0]  NTT_in_d;
    wire [7:0]          NTT_in_addr_u;
    wire [7:0]          NTT_in_addr_d;
    wire [BIT_LEN-1:0]  NTT_out_u;
    wire [BIT_LEN-1:0]  NTT_out_d;
    wire [7:0]          NTT_addr_u;
    wire [7:0]          NTT_addr_d;

    /*---PWM Signal---*/
    wire [BIT_LEN - 1:0] PWM_in_a0;
    wire [BIT_LEN - 1:0] PWM_in_a1;
    wire                 PWM_in_a_en;
    wire [HLEN - 1:0]    PWM_in_addr_a;
    wire                 PWM_out_a_en;
    wire [BIT_LEN - 1:0] PWM_out_a;
    wire [HLEN - 1:0]    PWM_out_addr_a;
    wire [BIT_LEN - 1:0] PWM_in_b0;
    wire [BIT_LEN - 1:0] PWM_in_b1;
    wire                 PWM_in_b_en;
    wire [HLEN - 1:0]    PWM_in_addr_b;
    wire                 PWM_out_b_en;
    wire [BIT_LEN - 1:0] PWM_out_b;
    wire [HLEN - 1:0]    PWM_out_addr_b;


    assign sampler_squeeze = 1'b0;

    /*---Keccak---*/ //------------------------------------------str
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
        // .buffer_full(buffer_full),
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
        case (in_seed_sel)
            1'b0: in_seed_in = data_in;
            1'b1: in_seed_in = 64'h0000_0000_0000_0404;
            default: in_seed_in = 64'd0;
        endcase
    end
    always @(*) begin
        case (keccak_in_sel)
            2'd0: sha_in = mem_1_in;
            2'd1: sha_in = mem_2_in;
            2'd2: sha_in = index_in;
            2'd3: sha_in = in_seed_in;
            default: in_seed_in = 64'd0;
        endcase
    end
    /*---Keccak---*/ //------------------------------------------end

    /*---Data_Mem---*/ //------------------------------------------str
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
        .seed_q_b(seed_q_b)
    );

    // assign seed_data_a = 
    /*---Data_Mem---*/ //------------------------------------------end

    
endmodule

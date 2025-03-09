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
    input   [1:0]   sha_in_sel,
    input   [1:0]   seed_in_sel,

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
    wire [63:0]     sha_in;
    wire [63:0]     seed_in;
    wire [63:0]     seed_produce_in;
    wire [63:0]     sample_in;
    
    /*---Data_Mem signals---*/
    //---seed
    wire [255:0]    Rho_din;
    wire [255:0]    Rho_dout;
    wire [511:0]    Rho_prime_din;
    wire [511:0]    Rho_prime_dout;
    wire [255:0]    Kata_din;
    wire [255:0]    Kata_dout;
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

    
    
    /*---Keack assign---*/
    assign sha_reset = reset | sha_clean;
    assign sha_in = (sha_in_sel == OUSIDE) ? seed_produce_in :
                    (sha_in_sel == SAMPLE) ? sample_in : 64'd0;
    //---seed_last
    assign seed_produce_in = sha_is_last ? 64'h0000_0000_0000_0404 : data_in; //64'h0000_0404 k & l
    //---sampler
    assign sample_in = sha_is_last ? seed_last_in : seed_in; //64'h0000_0404 k & l
    assign seed_last_in = (sampler_mode == S_mode) ? {61'd0,index} :
                          (sampler_mode == A_mode) ? {48'd0,{6'd0,index[3:2]},{6'd0,index[1:0]}} : 64'd0;
    
    
    
    //---seed
    assign seed_in = (seed_in_sel == RHO)       ? Rho_dout[63:0]       :
                     (seed_in_sel == RHO_PRIME) ? Rho_prime_dout[63:0] :
                     (seed_in_sel == KATA)      ? Kata_dout[63:0]      : 64'd0 ;
    
    /*---Data_Mem assign---*/
    //---seed
    assign Rho_din          = sha_out[255:0];
    assign Rho_prime_din    = sha_out[767:256];
    assign Kata_din         = sha_out[1023:768];
    //---enable s1 mem
    assign s1_addr_a = mem_sel ? {NTT_index[1:0],NTT_in_addr_u} : {index[1:0],addr_z0};
    assign s1_addr_b = mem_sel ? {NTT_index[1:0],NTT_in_addr_d} : {index[1:0],addr_z1};
    assign s1_en_z0 = (~index[3]) & (en_z0 | NTT_data_en);
    assign s1_we_z0 = (~index[3]) & we_z0;
    assign s1_en_z1 = (~index[3]) & (en_z1 | NTT_data_en);
    assign s1_we_z1 = (~index[3]) & we_z1;
    //---enable s2 mem
    assign s2_en_z0 = index[3] & en_z0;
    assign s2_we_z0 = index[3] & we_z0;
    assign s2_en_z1 = index[3] & en_z1;
    assign s2_we_z1 = index[3] & we_z1;
    //---A
    assign A_data_a = A0;
    assign A_data_b = A1;
    assign A_addr_a = A_mem_sel ? {PWM_index[3:0], PWM_in_addr_a} : {index,addr_A0};
    assign A_addr_b = A_mem_sel ? {PWM_index[3:0], PWM_in_addr_b} : {index,addr_A1};
    assign A_en_a = A_mem_sel ? PWM_in_a_en: en_A0;
    assign A_en_b = A_mem_sel ? PWM_in_a_en: en_A1;
    assign A_we_a = we_A0;
    assign A_we_b = we_A1;
    //---t
    assign t_data_a = NTT_out_u;
    assign t_data_b = NTT_out_d;
    assign t_addr_a = t_mem_sel ? {PWM_index[1:0], PWM_in_addr_a} : {NTT_index[1:0],NTT_addr_u};
    assign t_addr_b = t_mem_sel ? {PWM_index[1:0], PWM_in_addr_b} : {NTT_index[1:0],NTT_addr_d};
    assign t_en_a = t_mem_sel ? PWM_in_a_en: NTT_out_ready;
    assign t_en_b = t_mem_sel ? PWM_in_a_en: NTT_out_ready;
    assign t_we_a = NTT_out_ready;
    assign t_we_b = NTT_out_ready;

    /*---NTT---*/
    assign NTT_in_u = s1_q_a;
    assign NTT_in_d = s1_q_b;

    /*---PWM---*/
    assign PWM_in_a0 = t_q_a;
    assign PWM_in_a1 = A_q_a;
    assign PWM_in_b0 = t_q_b;
    assign PWM_in_b1 = A_q_b;

    


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

    Data_Mem DM(
        .clk(clk),
        .reset(reset),

        /*---Rho---*/
        .Rho_en(Rho_en),
        .Rho_mode(Rho_mode),
        .Rho_din(Rho_din),
        .Rho_dout(Rho_dout),

        /*---Rho_prime---*/
        .Rho_prime_en(Rho_prime_en),
        .Rho_prime_mode(Rho_prime_mode),
        .Rho_prime_din(Rho_prime_din),
        .Rho_prime_dout(Rho_prime_dout),

        /*---Kata---*/
        .Kata_en(Kata_en),
        .Kata_mode(Kata_mode),
        .Kata_din(Kata_din),
        .Kata_dout(Kata_dout),

        /*---s1---*/
        .s1_data_a(z0),
        .s1_data_b(z1),//
        .s1_addr_a(s1_addr_a),
        .s1_addr_b(s1_addr_b),
        .s1_en_a(s1_en_z0),
        .s1_en_b(s1_en_z1),
        .s1_we_a(s1_we_z0),
        .s1_we_b(s1_we_z1),
        .s1_q_a(s1_q_a),
        .s1_q_b(s1_q_b),

        /*---s2---*/
        .s2_data_a(z0),
        .s2_data_b(z1),//
        .s2_addr_a({index[1:0],addr_z0}),
        .s2_addr_b({index[1:0],addr_z1}),
        .s2_en_a(s2_en_z0),
        .s2_en_b(s2_en_z1),
        .s2_we_a(s2_we_z0),
        .s2_we_b(s2_we_z1),
        .s2_q_a(s2_q_a),
        .s2_q_b(s2_q_b),

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
        .y_data_a(y0),
        .y_data_b(y1),//
        .y_addr_a({index[1:0],addr_y0}),
        .y_addr_b({index[1:0],addr_y1}),
        .y_en_a(en_y),
        .y_en_b(en_y),
        .y_we_a(we_y),
        .y_we_b(we_y),
        .y_q_a(y_q_a),
        .y_q_b(y_q_b),

        /*---c---*/
        .c_data_a(ci),
        .c_data_b(c_q_a),//
        .c_addr_a(addr_ci),
        .c_addr_b(addr_cj),
        .c_en_a(en_ci),
        .c_en_b(en_cj),
        .c_we_a(we_ci),
        .c_we_b(we_cj),
        .c_q_a(c_q_a),
        .c_q_b(c_q_b),

        /*---t---*/
        .t_data_a(t_data_a),
        .t_data_b(t_data_b),//
        .t_addr_a(t_addr_a),
        .t_addr_b(t_addr_b),
        .t_en_a(t_en_a),
        .t_en_b(t_en_b),
        .t_we_a(t_we_a),
        .t_we_b(t_we_b),
        .t_q_a(t_q_a),
        .t_q_b(t_q_b)

        // /*---temp---*/
        // .temp_data_a(temp0),
        // .temp_data_b(temp1),//
        // .temp_addr_a(addr_temp0),
        // .temp_addr_b(addr_temp1),
        // .temp_en_a(en_temp0),
        // .temp_en_b(en_temp1),
        // .temp_we_a(we_temp0),
        // .temp_we_b(we_temp1),
        // .temp_q_a(temp0_q_a),
        // .temp_q_b(temp1_q_b)
    );

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

    NTT #(.BIT_LEN(BIT_LEN)) NTT_(
        .clk(clk),
        .reset(reset),
        .mode(NTT_mode),//
        .in_ready(NTT_in_ready),//
        .data_en(NTT_data_en),
        .NTT_in_u(NTT_in_u),//
        .NTT_in_d(NTT_in_d),//
        .NTT_in_addr_u(NTT_in_addr_u),
        .NTT_in_addr_d(NTT_in_addr_d),
        .NTT_out_u(NTT_out_u),
        .NTT_out_d(NTT_out_d),
        .NTT_addr_u(NTT_addr_u),
        .NTT_addr_d(NTT_addr_d),
        .done(NTT_done),
        .out_ready(NTT_out_ready)//
    );

    PWM PWM_(
    .clk(clk),
    .reset(reset),
    .start(PWM_start),
    .done(PWM_done),
    .in_a0(PWM_in_a0),
    .in_a1(PWM_in_a1),
    .in_a_en(PWM_in_a_en),
    .in_addr_a(PWM_in_addr_a),
    .out_a(PWM_out_a),
    .out_a_en(PWM_out_a_en),
    .out_addr_a(PWM_out_addr_a),
    .in_b0(PWM_in_b0),
    .in_b1(PWM_in_b1),
    .in_b_en(PWM_in_b_en),
    .in_addr_b(PWM_in_addr_b),
    .out_b(PWM_out_b),
    .out_b_en(PWM_out_b_en),
    .out_addr_b(PWM_out_addr_b)
);

endmodule

module Data_Path
#(  parameter DLEN = 23, HLEN = 10 )
    (   
    input           clk,
    input           reset,
    
    /*---Controller---*/
    input  [1:0]    main_mode, //KeyGen, SignGen, SignVer

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
    input           Rho_en,
    input           Rho_prime_en,
    input           Kata_en,
    input           Rho_mode,
    input           Rho_prime_mode,
    input           Kata_mode,

    /*---Sampler---*/
    input   [1:0]   sampler_mode,
    input   [2:0]   index,
    input           sampler_in_ready,
    output          next_element,
    input   [1:0]   sha_in_sel,
    input   [1:0]   seed_in_sel,
    input           s_sel,
    input   [3:0]   mem_sel,

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
    parameter           G           = 1'b0,
                        H           = 1'b1;
    //seed_in_sel
    localparam  [1:0]   RHO         = 2'b00,
                        RHO_PRIME   = 2'b01,
                        KATA        = 2'B10;
    //sha_in_sel
    localparam  [1:0]   OUSIDE      = 2'b00,
                        SAMPLE      = 2'b01;



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
    //---s0
    wire [DLEN-1:0] s0_q_a;
    wire [DLEN-1:0] s0_q_b;
    wire            s0_en_z0;
    wire            s0_we_z0;
    wire            s0_en_z1;
    wire            s0_we_z1;
    //---s1
    wire [DLEN-1:0] s1_q_a;
    wire [DLEN-1:0] s1_q_b;
    wire            s1_en_z0;
    wire            s1_we_z0;
    wire            s1_en_z1;
    wire            s1_we_z1;
    //---A
    wire [DLEN-1:0] A_q_a;
    wire [DLEN-1:0] A_q_b;
    //---w
    wire [DLEN-1:0] w_q_a;
    wire [DLEN-1:0] w_q_b;
    //---c
    wire [DLEN-1:0] c_q_a;
    wire [DLEN-1:0] c_q_b;

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
    wire            s0_en_z;
    wire            s0_we_z;
    wire            s1_en_z;
    wire            s1_we_z;
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

    
    
    /*---Keack assign---*/
    assign sha_reset = reset | sha_clean;
    assign sha_in = (sha_in_sel == OUSIDE) ? seed_produce_in :
                    (sha_in_sel == SAMPLE) ? sample_in : 64'd0;
    //---seed_last
    assign seed_produce_in = sha_is_last ? 64'h0000_0000_0000_0404 : data_in; //64'h0000_0404 k & l
    //---sampler
    assign sample_in = sha_is_last ? {61'd0,index} : seed_in; //64'h0000_0404 k & l
    //---seed
    assign seed_in = (seed_in_sel == RHO)       ? Rho_dout[63:0]       :
                     (seed_in_sel == RHO_PRIME) ? Rho_prime_dout[63:0] :
                     (seed_in_sel == KATA)      ? Kata_dout[63:0]      : 64'd0 ;
    
    /*---Data_Mem assign---*/
    //---seed
    assign Rho_din          = sha_out[255:0];
    assign Rho_prime_din    = sha_out[767:256];
    assign Kata_din         = sha_out[1023:768];
    //---enable s0 mem
    assign s0_en_z0 = (~s_sel) & en_z0;
    assign s0_we_z0 = (~s_sel) & we_z0;
    assign s0_en_z1 = (~s_sel) & en_z1;
    assign s0_we_z1 = (~s_sel) & we_z1;
    //---enable s1 mem
    assign s1_en_z0 = s_sel & en_z0;
    assign s1_we_z0 = s_sel & we_z0;
    assign s1_en_z1 = s_sel & en_z1;
    assign s1_we_z1 = s_sel & we_z1;



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

        /*---s0---*/
        .s0_data_a(z0),
        .s0_data_b(z1),//
        .s0_addr_a({mem_sel[1:0],addr_z0}),
        .s0_addr_b({mem_sel[1:0],addr_z1}),
        .s0_en_a(s0_en_z0),
        .s0_en_b(s0_en_z1),
        .s0_we_a(s0_we_z0),
        .s0_we_b(s0_we_z1),
        .s0_q_a(s0_q_a),
        .s0_q_b(s0_q_b),

        /*---s1---*/
        .s1_data_a(z0),
        .s1_data_b(z1),//
        .s1_addr_a({mem_sel[1:0],addr_z0}),
        .s1_addr_b({mem_sel[1:0],addr_z1}),
        .s1_en_a(s1_en_z0),
        .s1_en_b(s1_en_z1),
        .s1_we_a(s1_we_z0),
        .s1_we_b(s1_we_z1),
        .s1_q_a(s1_q_a),
        .s1_q_b(s1_q_b),

        /*---A---*/
        .A_data_a(A0),
        .A_data_b(A1),//
        .A_addr_a({mem_sel[3:0],addr_A0}),
        .A_addr_b({mem_sel[3:0],addr_A1}),
        .A_en_a(en_A0),
        .A_en_b(en_A1),
        .A_we_a(we_A0),
        .A_we_b(we_A1),
        .A_q_a(A_q_a),
        .A_q_b(A_q_b),

        /*---y---*/
        .y_data_a(y0),
        .y_data_b(y1),//
        .y_addr_a({mem_sel[1:0],addr_y0}),
        .y_addr_b({mem_sel[1:0],addr_y1}),
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
        .c_q_b(c_q_b)
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
endmodule

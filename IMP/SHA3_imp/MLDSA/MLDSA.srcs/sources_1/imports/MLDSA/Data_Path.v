module Data_Path
#(  parameter DLEN = 23, HLEN = 10 )
    (   
    input               clk,
    input               reset,
    
    // from Controller //
    input   [1:0]       main_mode, //KeyGen, SignGen, SignVer

    /*---Sha---*/
    input               sha_in_ready, 
    input               sha_is_last,
    input               sha_squeeze, // when squeeze = 0, output once; otherwise, keep squeezing
    input               sha_mode,
    input               sha_hold,
    input      [2:0]    sha_byte_num,
    output              sha_out_ready,
    input               sha_clean,
    /*---Seed---*/
    input Rho_en,
    input Rho_prime_en,
    input Kata_en,
    input Rho_mode,
    input Rho_prime_mode,
    input Kata_mode,
    /*---Sample---*/
    input [2:0] index,
    input [1:0] sha_in_sel,
    input [1:0] seed_in_sel,

    // from outside //
    input   [63:0]      data_in,
    output  [63:0]      data_out,

    //test
    output       [1343:0]padder_out,
    output               padder_out_ready,
    output       [1599:0]f_out,
    output               f_out_ready,
    output       [1343:0]sha_out,

    //Sampler
    input       sampler_in_ready,
    output      next_element
    );  


    parameter   G     = 1'b0,
                H     = 1'b1;

    // wire [1343:0]       sha_out;
    wire [63:0]         sha_in;
    wire [255:0]        Rho_din;
    wire [255:0]        Rho_dout;
    wire [511:0]        Rho_prime_din;
    wire [511:0]        Rho_prime_dout;
    wire [255:0]        Kata_din;
    wire [255:0]        Kata_dout;
    
    // wire   [DLEN-1:0]      s1_data_a;
    // wire   [DLEN-1:0]      s1_data_b;
    // wire   [HLEN-1:0]      s1_addr_a;
    // wire   [HLEN-1:0]      s1_addr_b;
    // wire                   s1_we_a;
    // wire                   s1_we_b;
    wire  [DLEN-1:0]       s1_q_a;
    wire  [DLEN-1:0]       s1_q_b;

    // Sampler signals
    wire                sampler_squeeze;
    wire                next_element;
    wire [22:0]         z0;
    wire [22:0]         z1;
    wire [9:0]          waddr_z0;
    wire [9:0]          waddr_z1;
    wire                wen_z;

    
    wire [63:0]         seed_in;
    wire [63:0]         seed_produce_in;
    wire [63:0]         sample_in;
    //seed_in_sel
    localparam  [1:0]   RHO         = 2'b00,
                        RHO_PRIME   = 2'b01,
                        KATA        = 2'B10;

    //sha_in_sel
    localparam  [1:0]   OUSIDE  = 2'b00,
                        SAMPLE  = 2'b01;
    assign sha_reset = reset | sha_clean;
    assign sha_in = (sha_in_sel == OUSIDE) ? seed_produce_in :
                    (sha_in_sel == SAMPLE) ? sample_in : 64'd0;
    
    assign seed_produce_in = sha_is_last ? 64'h0000_0000_0000_0404 : data_in; //64'h0000_0404 k & l
    assign sample_in = sha_is_last ? {61'd0,index} : seed_in; //64'h0000_0404 k & l

    assign seed_in = (seed_in_sel == RHO)       ? Rho_dout[63:0]       :
                     (seed_in_sel == RHO_PRIME) ? Rho_prime_dout[63:0] :
                     (seed_in_sel == KATA)      ? Kata_dout[63:0]      : 64'd0 ;
    
    

    assign Rho_din              = sha_out[255:0];
    assign Rho_prime_din        = sha_out[767:256];
    assign Kata_din             = sha_out[1023:768];

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

        /*---S1---*/
        .s1_data_a(z0),
        .s1_data_b(z1),
        .s1_addr_a(waddr_z0),
        .s1_addr_b(waddr_z1),
        .s1_we_a(wen_z),
        .s1_we_b(wen_z),
        .s1_q_a(s1_q_a),
        .s1_q_b(s1_q_b)
    );

    Sampler Sampler_(
        .clk(clk),
        .reset(reset),
        .sampler_in_ready(sampler_in_ready),
        .sampler_in(sha_out),
        .sampler_squeeze(sampler_squeeze),
        .next_element(next_element),
        .z0(z0),
        .z1(z1),
        .waddr_z0(waddr_z0),
        .waddr_z1(waddr_z1),
        .wen_z(wen_z)
    );
endmodule

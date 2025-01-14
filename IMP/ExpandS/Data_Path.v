

module Data_Path
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
    input               sha_sha_hold,
    input      [1:0]    sha_byte_num,
    output              sha_out_ready,
    /*---Seed---*/
    input Rho_prime_en,
    input Rho_en,
    input Kata_en,


    // from outside //
    input   [63:0]      data_in,
    output  [63:0]      data_out
    );  

    parameter   G     = 1'b0,
                H     = 1'b1;

    wire [1343:0]   sha_out;

    assign sha_in = sha_is_last ? data_in : 64'h0000_0404; //64'h0000_0404 k & l

    assign Rho_din          = sha_out[255:0];
    assign Rho_prime_din    = sha_out[767:256];
    assign Rho_din          = sha_out[1023:768];

    Keccak_Dilithium uut2 (
        .clk(clk),
        .reset(reset),
        .in(sha_in),
        .in_ready(sha_in_ready),
        .is_last(sha_is_last),
        .squeeze(sha_squeeze),
        .mode(sha_mode),
        .sha_hold(sha_hold),
        .byte_num(sha_byte_num),
        // .buffer_full(buffer_full),
        // .buffer_last(buffer_last),
        .out(sha_out),
        .out_ready(sha_out_ready)
    );

    Data_Mem DM(
        .clk(clk),
        .reset(reset),

        /*---Rho---*/
        .Rho_en(Rho_en),
        .Rho_din(Rho_din),
        .Rho_dout(Rho_dout),

        /*---Rho_prime---*/
        .Rho_prime_en(Rho_prime_en),
        .Rho_prime_din(Rho_prime_din),
        .Rho_prime_dout(Rho_prime_dout),

        /*---Kata---*/
        .Kata_en(Kata_en),
        .Kata_din(Kata_din),
        .Kata_dout(Kata_dout)
    );
endmodule

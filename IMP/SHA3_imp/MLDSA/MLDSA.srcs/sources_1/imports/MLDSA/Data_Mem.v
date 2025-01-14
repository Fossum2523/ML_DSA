module Data_Mem
#(  parameter DLEN = 23, HLEN = 10 )
(
    input clk,
    input reset,

    /*---Rho---*/
    input Rho_en,
    input Rho_mode,
    input  [255:0] Rho_din,
    output reg [255:0] Rho_dout,

    /*---Rho_prime---*/
    input Rho_prime_en,
    input Rho_prime_mode,
    input [511:0] Rho_prime_din,
    output reg [511:0] Rho_prime_dout,

    /*---Kata---*/
    input Kata_en,
    input Kata_mode,
    input [255:0] Kata_din,
    output reg [255:0] Kata_dout,
    
    /*---s1---*/
    input   [DLEN-1:0]      s1_data_a,
    input   [DLEN-1:0]      s1_data_b,
    input   [HLEN-1:0]      s1_addr_a,
    input   [HLEN-1:0]      s1_addr_b,
    input                   s1_we_a,
    input                   s1_we_b,
    output  [DLEN-1:0]      s1_q_a,
    output  [DLEN-1:0]      s1_q_b
    );

    localparam  LOAD_SEED = 1'b0,
                PUSH_SEED = 1'b1;

    always @(posedge clk or posedge reset) begin
        if (reset)
            Rho_dout <= 256'd0;
        else if (Rho_en)
            Rho_dout <= Rho_mode ? {Rho_dout[63:0], Rho_dout[255:64]}: Rho_din;
    end

    always @(posedge clk or posedge reset) begin
        if (reset)
            Rho_prime_dout <= 512'd0;
        else if (Rho_prime_en)       
            Rho_prime_dout <= Rho_prime_mode ? {Rho_prime_dout[63:0], Rho_prime_dout[511:64]} :Rho_prime_din;
    end

    always @(posedge clk or posedge reset) begin
        if (reset)
            Kata_dout <= 256'd0;
        else if (Kata_en)
            Kata_dout <= Kata_mode ? {Kata_dout[63:0], Kata_dout[255:64]}: Kata_din;
    end

    Dual_Port_Ram_Single_clk s1(
        .clk(clk),
        .data_a(s1_data_a),
        .data_b(s1_data_b),
        .addr_a(s1_addr_a),
        .addr_b(s1_addr_b),
        .we_a(s1_we_a),
        .we_b(s1_we_b),
        .q_a(s1_q_a),
        .q_b(s1_q_b)
    );

endmodule

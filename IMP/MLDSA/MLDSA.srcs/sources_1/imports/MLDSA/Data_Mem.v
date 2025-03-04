module Data_Mem
#(  parameter DLEN = 23, S_HLEN = 10, A_HLEN = 12, Y_HLEN = 10, C_HLEN = 8, T_HLEN = 10)
(
    input clk,
    input reset,

    /*---Rho---*/
    input Rho_en,
    input Rho_mode,
    input [255:0] Rho_din,
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
    input   [S_HLEN-1:0]    s1_addr_a,
    input   [S_HLEN-1:0]    s1_addr_b,
    input                   s1_en_a,
    input                   s1_en_b,
    input                   s1_we_a,
    input                   s1_we_b,
    output  [DLEN-1:0]      s1_q_a,
    output  [DLEN-1:0]      s1_q_b,

    /*---s2---*/
    input   [DLEN-1:0]      s2_data_a,
    input   [DLEN-1:0]      s2_data_b,
    input   [S_HLEN-1:0]    s2_addr_a,
    input   [S_HLEN-1:0]    s2_addr_b,
    input                   s2_en_a,
    input                   s2_en_b,
    input                   s2_we_a,
    input                   s2_we_b,
    output  [DLEN-1:0]      s2_q_a,
    output  [DLEN-1:0]      s2_q_b,

    /*---A---*/
    input   [DLEN-1:0]      A_data_a,
    input   [DLEN-1:0]      A_data_b,
    input   [A_HLEN-1:0]    A_addr_a,
    input   [A_HLEN-1:0]    A_addr_b,
    input                   A_en_a,
    input                   A_en_b,
    input                   A_we_a,
    input                   A_we_b,
    output  [DLEN-1:0]      A_q_a,
    output  [DLEN-1:0]      A_q_b,

    /*---y---*/
    input   [DLEN-1:0]      y_data_a,
    input   [DLEN-1:0]      y_data_b,
    input   [Y_HLEN - 1:0]  y_addr_a,
    input   [Y_HLEN - 1:0]  y_addr_b,
    input                   y_en_a,
    input                   y_en_b,
    input                   y_we_a,
    input                   y_we_b,
    output  [DLEN-1:0]      y_q_a,
    output  [DLEN-1:0]      y_q_b,

    /*---c---*/
    input   [DLEN-1:0]      c_data_a,
    input   [DLEN-1:0]      c_data_b,
    input   [C_HLEN - 1:0]  c_addr_a,
    input   [C_HLEN - 1:0]  c_addr_b,
    input                   c_en_a,
    input                   c_en_b,
    input                   c_we_a,
    input                   c_we_b,
    output  [DLEN-1:0]      c_q_a,
    output  [DLEN-1:0]      c_q_b,

    /*---t---*/
    input   [DLEN-1:0]      t_data_a,
    input   [DLEN-1:0]      t_data_b,
    input   [T_HLEN - 1:0]  t_addr_a_t0,
    input   [T_HLEN - 1:0]  t_addr_b_t1,
    input                   t_en_a,
    input                   t_en_b,
    input                   t_we_a,
    input                   t_we_b,
    output  [DLEN-1:0]      t_q_a,
    output  [DLEN-1:0]      t_q_b
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

    /*---s1---*/
    Dual_Port_Ram_Single_clk #(.DLEN(DLEN), .HLEN(S_HLEN)) s1(
        .clk_a(clk),
        .clk_b(clk),
        .data_a(s1_data_a),
        .data_b(s1_data_b),
        .addr_a(s1_addr_a),
        .addr_b(s1_addr_b),
        .en_a(s1_en_a),
        .en_b(s1_en_b),
        .we_a(s1_we_a),
        .we_b(s1_we_b),
        .q_a(s1_q_a),
        .q_b(s1_q_b)
    );

    /*---s2---*/
    Dual_Port_Ram_Single_clk #(.DLEN(DLEN), .HLEN(S_HLEN)) s2(
        .clk_a(clk),
        .clk_b(clk),
        .data_a(s2_data_a),
        .data_b(s2_data_b),
        .addr_a(s2_addr_a),
        .addr_b(s2_addr_b),
        .en_a(s2_en_a),
        .en_b(s2_en_b),
        .we_a(s2_we_a),
        .we_b(s2_we_b),
        .q_a(s2_q_a),
        .q_b(s2_q_b)
    );
    
    /*---A---*/
    Dual_Port_Ram_Single_clk #(.DLEN(DLEN), .HLEN(A_HLEN)) A(
        .clk_a(clk),
        .clk_b(clk),
        .data_a(A_data_a),
        .data_b(A_data_b),
        .addr_a(A_addr_a),
        .addr_b(A_addr_b),
        .en_a(A_en_a),
        .en_b(A_en_b),
        .we_a(A_we_a),
        .we_b(A_we_b),
        .q_a(A_q_a),
        .q_b(A_q_b)
    );

    /*---y---*/
    Dual_Port_Ram_Single_clk #(.DLEN(DLEN), .HLEN(Y_HLEN)) y(
        .clk_a(clk),
        .clk_b(clk),
        .data_a(y_data_a),
        .data_b(y_data_b),
        .addr_a(y_addr_a),
        .addr_b(y_addr_b),
        .en_a(y_en_a),
        .en_b(y_en_b),
        .we_a(y_we_a),
        .we_b(y_we_b),
        .q_a(y_q_a),
        .q_b(y_q_b)
    );

    /*---c---*/
    Dual_Port_Ram_Single_clk #(.DLEN(DLEN), .HLEN(C_HLEN)) c(
        .clk_a(clk),
        .clk_b(clk),
        .data_a(c_data_a),
        .data_b(c_data_b),
        .addr_a(c_addr_a),
        .addr_b(c_addr_b),
        .en_a(c_en_a),
        .en_b(c_en_b),
        .we_a(c_we_a),
        .we_b(c_we_b),
        .q_a(c_q_a),
        .q_b(c_q_b)
    );

endmodule

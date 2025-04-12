module Data_Mem
#(  parameter DLEN = 23, SEED_DLEN = 64, S_DLEN = 3, SEED_HLEN = 4, S_HLEN = 10, A_HLEN = 12, Y_HLEN = 10, C_HLEN = 8, T_HLEN = 10)
(
    input clk,
    input reset,

    /*---Seed---*/
    input   [SEED_DLEN-1:0] seed_data_a,
    input   [SEED_DLEN-1:0] seed_data_b,
    input   [SEED_HLEN-1:0] seed_addr_a,
    input   [SEED_HLEN-1:0] seed_addr_b,
    input                   seed_en_a,
    input                   seed_en_b,
    input                   seed_we_a,
    input                   seed_we_b,
    output  [SEED_DLEN-1:0] seed_q_a,
    output  [SEED_DLEN-1:0] seed_q_b,
    
    /*---s1---*/
    input   [S_DLEN-1:0]    s1_data_a,
    input   [S_DLEN-1:0]    s1_data_b,
    input   [S_HLEN-1:0]    s1_addr_a,
    input   [S_HLEN-1:0]    s1_addr_b,
    input                   s1_en_a,
    input                   s1_en_b,
    input                   s1_we_a,
    input                   s1_we_b,
    output  [S_DLEN-1:0]    s1_q_a,
    output  [S_DLEN-1:0]    s1_q_b,

    /*---s2---*/
    input   [S_DLEN-1:0]    s2_data_a,
    input   [S_DLEN-1:0]    s2_data_b,
    input   [S_HLEN-1:0]    s2_addr_a,
    input   [S_HLEN-1:0]    s2_addr_b,
    input                   s2_en_a,
    input                   s2_en_b,
    input                   s2_we_a,
    input                   s2_we_b,
    output  [S_DLEN-1:0]    s2_q_a,
    output  [S_DLEN-1:0]    s2_q_b,

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
    input   [T_HLEN - 1:0]  t_addr_a,
    input   [T_HLEN - 1:0]  t_addr_b,
    input                   t_en_a,
    input                   t_en_b,
    input                   t_we_a,
    input                   t_we_b,
    output  [DLEN-1:0]      t_q_a,
    output  [DLEN-1:0]      t_q_b,

    /*---temp_0---*/
    input   [DLEN-1:0]      temp_0_data_a,
    input   [DLEN-1:0]      temp_0_data_b,
    input   [T_HLEN - 1:0]  temp_0_addr_a,
    input   [T_HLEN - 1:0]  temp_0_addr_b,
    input                   temp_0_en_a,
    input                   temp_0_en_b,
    input                   temp_0_we_a,
    input                   temp_0_we_b,
    output  [DLEN-1:0]      temp_0_q_a,
    output  [DLEN-1:0]      temp_0_q_b,

    /*---tr---*/
    input   [63:0]          tr_data_a,
    input   [63:0]          tr_data_b,
    input   [2:0]           tr_addr_a,
    input   [2:0]           tr_addr_b,
    input                   tr_en_a,
    input                   tr_en_b,
    input                   tr_we_a,
    input                   tr_we_b,
    output  [63:0]          tr_q_a,
    output  [63:0]          tr_q_b,


    /*---s1_pack---*/
    input   [63:0]          s1_pack_data_a,
    input   [63:0]          s1_pack_data_b,
    input   [5:0]           s1_pack_addr_a,
    input   [5:0]           s1_pack_addr_b,
    input                   s1_pack_en_a,
    input                   s1_pack_en_b,
    input                   s1_pack_we_a,
    input                   s1_pack_we_b,
    output  [63:0]          s1_pack_q_a,
    output  [63:0]          s1_pack_q_b,

    /*---s2_pack---*/
    input   [63:0]          s2_pack_data_a,
    input   [63:0]          s2_pack_data_b,
    input   [5:0]           s2_pack_addr_a,  //48th data
    input   [5:0]           s2_pack_addr_b,  //48th data
    input                   s2_pack_en_a,
    input                   s2_pack_en_b,
    input                   s2_pack_we_a,
    input                   s2_pack_we_b,
    output  [63:0]          s2_pack_q_a,
    output  [63:0]          s2_pack_q_b,

    /*---t1_pack---*/
    input   [63:0]          t1_pack_data_a,
    input   [63:0]          t1_pack_data_b,
    input   [7:0]           t1_pack_addr_a,  //160th data
    input   [7:0]           t1_pack_addr_b,  //160th data
    input                   t1_pack_en_a,
    input                   t1_pack_en_b,
    input                   t1_pack_we_a,
    input                   t1_pack_we_b,
    output  [63:0]          t1_pack_q_a,
    output  [63:0]          t1_pack_q_b,

    /*---t0_pack---*/
    input   [63:0]          t0_pack_data_a,
    input   [63:0]          t0_pack_data_b,
    input   [7:0]           t0_pack_addr_a,  //208th data
    input   [7:0]           t0_pack_addr_b,  //208th data
    input                   t0_pack_en_a,
    input                   t0_pack_en_b,
    input                   t0_pack_we_a,
    input                   t0_pack_we_b,
    output  [63:0]          t0_pack_q_a,
    output  [63:0]          t0_pack_q_b,

    /*---PWM_temp---*/
    input   [DLEN-1:0]      PWM_temp_data_a,
    input   [DLEN-1:0]      PWM_temp_data_b,
    input   [T_HLEN - 1:0]  PWM_temp_addr_a,
    input   [T_HLEN - 1:0]  PWM_temp_addr_b,
    input                   PWM_temp_en_a,
    input                   PWM_temp_en_b,
    input                   PWM_temp_we_a,
    input                   PWM_temp_we_b,
    output  [DLEN-1:0]      PWM_temp_q_a,
    output  [DLEN-1:0]      PWM_temp_q_b
    );

    localparam  LOAD_SEED = 1'b0,
                PUSH_SEED = 1'b1;

    // always @(posedge clk or posedge reset) begin
    //     if (reset)
    //         Rho_dout <= 256'd0;
    //     else if (Rho_en)
    //         Rho_dout <= Rho_mode ? {Rho_dout[63:0], Rho_dout[255:64]}: Rho_din;
    // end

    // always @(posedge clk or posedge reset) begin
    //     if (reset)
    //         Rho_prime_dout <= 512'd0;
    //     else if (Rho_prime_en)          
    //         Rho_prime_dout <= Rho_prime_mode ? {Rho_prime_dout[63:0], Rho_prime_dout[511:64]} :Rho_prime_din;
    // end

    // always @(posedge clk or posedge reset) begin
    //     if (reset)
    //         Kata_dout <= 256'd0;
    //     else if (Kata_en)
    //         Kata_dout <= Kata_mode ? {Kata_dout[63:0], Kata_dout[255:64]}: Kata_din;
    // end

    /*---Seed---*/
    Dual_Port_Ram_Single_clk #(.DLEN(64), .HLEN(SEED_HLEN)) seed(
        .clk_a(clk),
        .clk_b(clk),
        .data_a(seed_data_a),
        .data_b(seed_data_b),
        .addr_a(seed_addr_a),
        .addr_b(seed_addr_b),
        .en_a(seed_en_a),
        .en_b(seed_en_b),
        .we_a(seed_we_a),
        .we_b(seed_we_b),
        .q_a(seed_q_a),
        .q_b(seed_q_b)
    );

    /*---s1---*/
    Dual_Port_Ram_Single_clk #(.DLEN(S_DLEN), .HLEN(S_HLEN)) s1(
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
    Dual_Port_Ram_Single_clk #(.DLEN(S_DLEN), .HLEN(S_HLEN)) s2(
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

    /*---t---*/
    Dual_Port_Ram_Single_clk #(.DLEN(DLEN), .HLEN(T_HLEN)) t(
        .clk_a(clk),
        .clk_b(clk),
        .data_a(t_data_a),
        .data_b(t_data_b),
        .addr_a(t_addr_a),
        .addr_b(t_addr_b),
        .en_a(t_en_a),
        .en_b(t_en_b),
        .we_a(t_we_a),
        .we_b(t_we_b),
        .q_a(t_q_a),
        .q_b(t_q_b)
    );

    /*---tr---*/
    Dual_Port_Ram_Single_clk #(.DLEN(64), .HLEN(3)) tr(
        .clk_a(clk),
        .clk_b(clk),
        .data_a(tr_data_a),
        .data_b(tr_data_b),
        .addr_a(tr_addr_a),
        .addr_b(tr_addr_b),
        .en_a(tr_en_a),
        .en_b(tr_en_b),
        .we_a(tr_we_a),
        .we_b(tr_we_b),
        .q_a(tr_q_a),
        .q_b(tr_q_b)
    );

    /*---temp_0---*/
    Dual_Port_Ram_Single_clk #(.DLEN(DLEN), .HLEN(T_HLEN)) temp_0(
        .clk_a(clk),
        .clk_b(clk),
        .data_a(temp_0_data_a),
        .data_b(temp_0_data_b),
        .addr_a(temp_0_addr_a),
        .addr_b(temp_0_addr_b),
        .en_a(temp_0_en_a),
        .en_b(temp_0_en_b),
        .we_a(temp_0_we_a),
        .we_b(temp_0_we_b),
        .q_a(temp_0_q_a),
        .q_b(temp_0_q_b)
    );

    /*---s1_pack---*/
    Dual_Port_Ram_Single_clk #(.DLEN(64), .HLEN(6)) s1_pack(
        .clk_a(clk),
        .clk_b(clk),
        .data_a(s1_pack_data_a),
        .data_b(s1_pack_data_b),
        .addr_a(s1_pack_addr_a),
        .addr_b(s1_pack_addr_b),
        .en_a(s1_pack_en_a),
        .en_b(s1_pack_en_b),
        .we_a(s1_pack_we_a),
        .we_b(s1_pack_we_b),
        .q_a(s1_pack_q_a),
        .q_b(s1_pack_q_b)
    );

    /*---s2_pack---*/
    Dual_Port_Ram_Single_clk #(.DLEN(64), .HLEN(6)) s2_pack(
        .clk_a(clk),
        .clk_b(clk),
        .data_a(s2_pack_data_a),
        .data_b(s2_pack_data_b),
        .addr_a(s2_pack_addr_a),
        .addr_b(s2_pack_addr_b),
        .en_a(s2_pack_en_a),
        .en_b(s2_pack_en_b),
        .we_a(s2_pack_we_a),
        .we_b(s2_pack_we_b),
        .q_a(s2_pack_q_a),
        .q_b(s2_pack_q_b)
    );

    /*---t1_pack---*/
    Dual_Port_Ram_Single_clk #(.DLEN(64), .HLEN(8)) t1_pack(
        .clk_a(clk),
        .clk_b(clk),
        .data_a(t1_pack_data_a),
        .data_b(t1_pack_data_b),
        .addr_a(t1_pack_addr_a),
        .addr_b(t1_pack_addr_b),
        .en_a(t1_pack_en_a),
        .en_b(t1_pack_en_b),
        .we_a(t1_pack_we_a),
        .we_b(t1_pack_we_b),
        .q_a(t1_pack_q_a),
        .q_b(t1_pack_q_b)
    );

    /*---t0_pack---*/
    Dual_Port_Ram_Single_clk #(.DLEN(64), .HLEN(8)) t0_pack(
        .clk_a(clk),
        .clk_b(clk),
        .data_a(t0_pack_data_a),
        .data_b(t0_pack_data_b),
        .addr_a(t0_pack_addr_a),
        .addr_b(t0_pack_addr_b),
        .en_a(t0_pack_en_a),
        .en_b(t0_pack_en_b),
        .we_a(t0_pack_we_a),
        .we_b(t0_pack_we_b),
        .q_a(t0_pack_q_a),
        .q_b(t0_pack_q_b)
    );

    /*---PWM_temp---*/
    Dual_Port_Ram_Single_clk #(.DLEN(DLEN), .HLEN(T_HLEN)) PWM_temp(
        .clk_a(clk),
        .clk_b(clk),
        .data_a(PWM_temp_data_a),
        .data_b(PWM_temp_data_b),
        .addr_a(PWM_temp_addr_a),
        .addr_b(PWM_temp_addr_b),
        .en_a(PWM_temp_en_a),
        .en_b(PWM_temp_en_b),
        .we_a(PWM_temp_we_a),
        .we_b(PWM_temp_we_b),
        .q_a(PWM_temp_q_a),
        .q_b(PWM_temp_q_b)
    );
endmodule

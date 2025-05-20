`timescale 1ns / 1ps

module mod_add
#(
    parameter BIT_LEN = 23
)(
    input [BIT_LEN - 1:0] a,
    input [BIT_LEN - 1:0] b,
    output [BIT_LEN - 1:0] out
);
    wire [BIT_LEN:0] a_plus_b;
    wire [BIT_LEN:0]a_plus_b_minus_q;

    assign a_plus_b = a + b;

    assign a_plus_b_minus_q = a_plus_b + 24'd8396799;

    assign out = a_plus_b_minus_q[23] ? a_plus_b[22:0]: a_plus_b_minus_q[22:0];
    // Modular_Reduction MR({{(BIT_LEN - 1){1'b0}}, a_plus_b}, out);
endmodule
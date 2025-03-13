module mod_mul
#(
    parameter BIT_LEN = 23
)(
    input [BIT_LEN - 1:0] a,
    input [BIT_LEN - 1:0] b,
    output [BIT_LEN - 1:0] out
);
    wire [BIT_LEN * 2 - 1:0] a_mul_b;

    assign a_mul_b = a * b;

    // assign out = a_mul_b % 8380417;
    Modular_Reduction MR(a_mul_b, out);
endmodule
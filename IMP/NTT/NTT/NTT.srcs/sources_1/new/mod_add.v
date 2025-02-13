module mod_add
#(
    parameter BIT_LEN = 23
)(
    input [BIT_LEN - 1:0] a,
    input [BIT_LEN - 1:0] b,
    output [BIT_LEN - 1:0] out
);
    wire [BIT_LEN:0] a_plus_b;

    assign a_plus_b = a + b;

    // assign out = a_plus_b % 8380417;
    Modular_Reduction MR({{(BIT_LEN - 1){1'b0}}, a_plus_b}, out);
endmodule
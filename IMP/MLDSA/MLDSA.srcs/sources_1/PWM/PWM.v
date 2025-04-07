module PWM
#(
    parameter BIT_LEN = 23
)(  
    input                   clk,
    input                   reset,
    //---Path 1
    input   [BIT_LEN - 1:0] in_a0,
    input   [BIT_LEN - 1:0] in_a1,
    output  [BIT_LEN - 1:0] out_a,
    //---Path 2
    input   [BIT_LEN - 1:0] in_b0,
    input   [BIT_LEN - 1:0] in_b1,
    output  [BIT_LEN - 1:0] out_b
);

    wire [BIT_LEN * 2 - 1:0] mul_a;
    wire [BIT_LEN * 2 - 1:0] mul_b;

    assign mul_a = in_a0 * in_a1;
    assign mul_b = in_b0 * in_b1;

    Modular_Reduction MR0(mul_a, out_a);
    Modular_Reduction MR1(mul_b, out_b);

endmodule
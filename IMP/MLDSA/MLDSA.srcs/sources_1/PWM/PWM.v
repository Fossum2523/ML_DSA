module PWM
#(
    parameter BIT_LEN = 23
)(  
    input                   mode,
    //---Path 1
    input   [BIT_LEN - 1:0] in_a0,
    input   [BIT_LEN - 1:0] in_a1,
    input   [BIT_LEN - 1:0] in_a2,
    output  [BIT_LEN - 1:0] out_a,
    //---Path 2
    input   [BIT_LEN - 1:0] in_b0,
    input   [BIT_LEN - 1:0] in_b1,
    input   [BIT_LEN - 1:0] in_b2,
    output  [BIT_LEN - 1:0] out_b
);
    //mode
    localparam SCALAR_VECTOR = 1'b0,
               MATRIX_VECTOR = 1'b1; 
               
    wire [BIT_LEN * 2 - 1:0] mul_a;
    wire [BIT_LEN * 2 - 1:0] mul_b;
    wire [BIT_LEN - 1:0] mode_mul_a;
    wire [BIT_LEN - 1:0] mode_mul_b;
    wire [BIT_LEN - 1:0] w_a;
    wire [BIT_LEN - 1:0] w_b;
    

    assign mul_a = in_a0 * in_a1;
    assign mul_b = in_b0 * in_b1;

    Modular_Reduction MR0(mul_a, mode_mul_a);
    Modular_Reduction MR1(mul_b, mode_mul_b);

    mod_add mod_add0(mode_mul_a,in_a2,w_a);
    mod_add mod_add1(mode_mul_b,in_b2,w_b);

    assign out_a = mode ? /*MATRIX_VECTOR*/w_a 
                        : /*SCALAR_VECTOR*/mode_mul_a;
    assign out_b = mode ? /*MATRIX_VECTOR*/w_b 
                        : /*SCALAR_VECTOR*/mode_mul_b;
endmodule
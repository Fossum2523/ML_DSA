module PWM
#(
    parameter BIT_LEN = 23
)(  
    input   [1:0]           mode,
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
    //PWM mode
    localparam [1:0]    MATRIX_VECTOR = 2'd0, /*path 1(in_a0, in_a1, in_a2)*/ /*path 2(in_b0, in_b1, in_b2)*/
                        SCALAR_VECTOR = 2'd1, /*path 1(in_a0, in_a1)*/        /*path 2(in_b0, in_b1)*/     
                        ADD_VECTOR    = 2'd2; /*path 1(in_a1, in_a2)*/        /*path 2(in_b1, in_b2)*/
               
    wire [BIT_LEN * 2 - 1:0] mul_a;
    wire [BIT_LEN * 2 - 1:0] mul_b;

    wire [BIT_LEN - 1:0] mod_mul_a;
    wire [BIT_LEN - 1:0] mod_mul_b;
    
    wire [BIT_LEN - 1:0] mod_in_a;
    wire [BIT_LEN - 1:0] mod_in_b;

    wire [BIT_LEN - 1:0] w_a;
    wire [BIT_LEN - 1:0] w_b;
    
    assign mul_a = in_a0 * in_a1;
    assign mul_b = in_b0 * in_b1;

    Modular_Reduction MR0(mul_a, mod_mul_a);
    Modular_Reduction MR1(mul_b, mod_mul_b);

    assign mod_in_a = mode[1] ? in_a1 : mod_mul_a;
    assign mod_in_b = mode[1] ? in_b1 : mod_mul_b;

    mod_add mod_add0(mod_in_a,in_a2,w_a);
    mod_add mod_add1(mod_in_b,in_b2,w_b);

    assign out_a = mode[0]  ? /*SCALAR_VECTOR*/mod_mul_a
                            : /*MATRIX_VECTOR*/w_a;
    assign out_b = mode[0]  ? /*SCALAR_VECTOR*/mod_mul_b
                            : /*MATRIX_VECTOR*/w_b ;
endmodule
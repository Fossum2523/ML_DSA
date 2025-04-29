`timescale 1ns / 1ps

module mod_mul
#(
    parameter BIT_LEN = 23
)(  
    input                 clk,
    input                 reset,
    input [BIT_LEN - 1:0] a,
    input [BIT_LEN - 1:0] b,
    output [BIT_LEN - 1:0] out
);
    reg     [BIT_LEN * 2 - 1:0] a_mul_b;    

    Modular_Reduction MR(clk,reset,a_mul_b, out);

    always @(posedge clk or posedge reset) begin
        if(reset)
            a_mul_b <= 46'd0;
        else
            a_mul_b <= a * b;
    end   
endmodule
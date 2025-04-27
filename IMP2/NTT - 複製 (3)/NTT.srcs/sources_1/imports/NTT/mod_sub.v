`timescale 1ns / 1ps

module mod_sub
#(
    parameter BIT_LEN = 23,
    parameter q = 8380417
)(
    input [BIT_LEN - 1:0] a,
    input [BIT_LEN - 1:0] b,
    output [BIT_LEN - 1:0] out
);
    assign out = (a >= b) ? (a - b) : (q + a - b);
endmodule
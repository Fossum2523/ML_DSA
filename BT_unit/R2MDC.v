`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:15:47 11/06/2024 
// Design Name: 
// Module Name:    R2MDC 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module R2MDC
#(  parameter bit_len = 14)
(   
    input   clk,
    input   reset,
    input   en,
    input   signed [bit_len-1:0] A_in,
    input   signed [bit_len-1:0] B_in,
    input   signed [bit_len-1:0] zeta,
    output  reg signed [bit_len-1:0] A_out,
    output  reg signed [bit_len-1:0] B_out,
    output  reg valid
);

wire d_out_A_d2_0;
wire d_out_A_d2_1;
wire d_out_A_d1_0;

wire d_out_B_d2_0;
wire d_out_B_d2_1;
wire d_out_B_d1_0;


BT_unit BT_1(
        .clk(clk), 
		.reset(reset), 
		.en(en), 
		.A_in(A_in), 
		.B_in(B_in), 
		.zeta(zeta), 
		.A_out(A_out), 
		.B_out(B_out), 
		.valid(valid));

D_FF A_D2_0(        
    .clk(clk), 
    .reset(reset), 
    .d_in(B_out), 
    .d_out(d_out_A_d2_0));

D_FF A_D2_1(        
    .clk(clk), 
    .reset(reset), 
    .d_in(d_out_A_d2_0), 
    .d_out(d_out_A_d2_1));


endmodule

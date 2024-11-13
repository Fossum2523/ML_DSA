`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:10:52 12/08/2024
// Design Name:   NTT
// Module Name:   C:/Users/USER/Desktop/ML_DSA_syn/NTT/NTT/NTT_tb.v
// Project Name:  NTT
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: NTT
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module NTT_tb;

	// Inputs
	reg clk;
	reg reset;
	reg [12:0] in0;
	reg [12:0] in1;
	reg [12:0] phi;

	// Outputs
	wire [12:0] out0;
	wire [12:0] out1;

	// Instantiate the Unit Under Test (UUT)
	NTT uut (
		.clk(clk), 
		.reset(reset), 
		.in0(in0), 
		.in1(in1), 
		.phi(phi), 
		.out0(out0), 
		.out1(out1)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		in0 = 1;
		in1 = 3;
		phi = 3383;

		// Wait 100 ns for global reset to finish
		#100;
		reset = 0;
		#10;
		reset = 1;
        
		// Add stimulus here

	end
	
	always begin
		clk = ~clk;
		#5;
	end
endmodule


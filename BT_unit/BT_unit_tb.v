`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:52:38 11/01/2024
// Design Name:   BT_unit
// Module Name:   C:/Users/fossu/Desktop/ML_DSA_Syn/BT_unit/BT_unit_tb.v
// Project Name:  BT_unit
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: BT_unit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module BT_unit_tb;

	// Inputs
	reg clk;
	reg reset;
	reg en;
	reg [22:0] A_in;
	reg [22:0] B_in;
	reg [22:0] zeta;

	// Outputs
	wire [22:0] A_out;
	wire [22:0] B_out;
	wire valid;

	// Instantiate the Unit Under Test (UUT)
	BT_unit uut (
		.clk(clk), 
		.reset(reset), 
		.en(en), 
		.A_in(A_in), 
		.B_in(B_in), 
		.zeta(zeta), 
		.A_out(A_out), 
		.B_out(B_out), 
		.valid(valid)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		en = 0;
		A_in = 0;
		B_in = 0;
		zeta = 0;
		#10;
		reset = 0;
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		reset = 1;
		A_in = 1;
		B_in = 3;
		zeta = 3383;
		#10;
		en = 1;
		
	end

	always begin
		clk = ~clk;
		#5;
	end
      
endmodule


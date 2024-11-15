`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:22:59 11/13/2024
// Design Name:   NTT
// Module Name:   C:/Users/fossu/Desktop/NTT/NTT/NTT_tb.v
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
`define clk_period 5                // clk period. DO NOT modify period

`define tb1

`ifdef tb1
  `define PAT "./s1.dat"
`endif

module NTT_tb;

	// Inputs
	reg clk;
	reg reset;

	
	reg [22:0] s1_mem [255:0];

	reg TB_wen;
	reg [7:0]TB_waddr;
	reg [22:0]TB_din;
	reg [7:0]TB_raddr;
	
	
	//NTT variable definition
	reg NTT_en;
	reg NTT_wen;
	wire [22:0] NTT_din;
	wire [22:0] NTT_dout;
	wire [7:0] NTT_addr;

	
	//BRAM s1 variable definition
	wire [22:0] s1_dout;
	wire s1_wen;
	wire [7:0]s1_waddr;
	wire [22:0]s1_din;
	wire [7:0]s1_raddr;

	integer i;

	assign s1_wen = NTT_en ? NTT_wen : TB_wen;
	assign s1_din = NTT_en ? NTT_dout : TB_din;
	assign s1_waddr = NTT_en ? NTT_addr : TB_waddr;
	assign s1_raddr = NTT_addr;

	assign NTT_din = s1_dout;
	// Instantiate the Unit Under Test (UUT)
	NTT NTT1(
		.clk(clk),
		.reset(reset),
		.NTT_en(NTT_en),
		.NTT_din(NTT_din),
		.NTT_wen(NTT_wen),
		.NTT_dout(NTT_dout),
		.NTT_addr(NTT_addr)
	);

	BRAM s1(
		.clk(clk),
        .wen(s1_wen),
        .waddr(s1_waddr),
        .din(s1_din),
        .raddr(s1_raddr),
        .dout(s1_dout)
	);
	
	initial $readmemh(`PAT, s1_mem);

	initial clk = 1'b0;

	always begin #(`clk_period/2) clk = ~clk; end

	initial begin
	#0 reset = 1'b1;
	#`clk_period reset = 1'b0;
	#(`clk_period*2) reset = 1'b1;
	end

	initial begin
		//write s1 data to testbench s1_mem
		#0 
		NTT_wen = 1'b0;
		TB_wen = 1'b0;
		NTT_en = 1'b0;
		i = 0;
		#(`clk_period*5);
		@(negedge clk) 
		TB_wen = 1'b1;
		TB_din = s1_mem[i];
		TB_waddr = i;
		for (i=1;i<256;i=i+1) 
			@(negedge clk) begin
			TB_din = s1_mem[i];
			TB_waddr = i;
		end
		@(negedge clk) 
		TB_wen = 1'b0;
		TB_din = 8'b0;
		i = 0;

		//read s1 data from testbench s1_mem to NTT mdoule
		// @(negedge clk)
		// NTT_en = 1'b1;
		// for (i=1;i<256;i=i+1) 
		// 	@(negedge clk) begin
		// 	bram_raddr = i;
		// 	NTT_din = bram_dout;
		// end

		@(negedge clk)
		NTT_en = 1'b1;
	end


      
endmodule


`timescale 1ns / 1ps

module axi_wrctrl(
	input ACLK,
	input ARESETn,
   /*********/
	input AWID,
	input [31:0] AWADDR,
	input [7:0] AWLEN,
	input [2:0] AWSIZE,
	input [1:0] AWBURST,
	input AWVALID,
	output AWREADY,
	/********/
	input WID,
	input [31:0] WDATA,
	input [3:0] WSTRB,
	input WLAST,
	input WVALID,
	output WREADY,
   /*********/	
	input BREADY,
	output BID,
	output [1:0] BRESP,
	output BVALID,
	
	//~~~~~~~~~~~~//
	input ARID,
	input [31:0] ARADDR,
	input [7:0] ARLEN,
	input [2:0] ARSIZE,
	input [1:0] ARBURST,
	input ARVALID,
	output ARREADY,
	/********/
	input RREADY,
	output RID,
	output [31:0] RDATA,
	output [1:0] RRESP,
	output RLAST,
	output RVALID,
	
	input r_valid,
	input r_last,
	input [31:0] data_out
    );
	 
	axi_write axi_write(
		.ACLK( ACLK ),
		.ARESETn ( ARESETn ),
		.AWID ( AWID ),
		.AWADDR ( AWADDR ),
		.AWLEN ( AWLEN ),
		.AWSIZE ( AWSIZE ),
		.AWBURST ( AWBURST ),
		.AWVALID ( AWVALID ),
		.AWREADY ( AWREADY ),
		.WID ( WID ),
		.WDATA ( WDATA ),
		.WSTRB ( WSTRB ),
		.WLAST ( WLAST ),
		.WVALID ( WVALID ),
		.WREADY ( WREADY ),
		.BREADY ( BREADY ),
		.BID ( BID ),
		.BRESP ( BRESP ),
		.BVALID ( BVALID )
	);
	
	axi_read axi_read(
		.ACLK ( ACLK ),
		.ARESETn ( ARESETn ),
		.ARID ( ARID ),
		.ARADDR ( ARADDR ),
		.ARLEN ( ARLEN ),
		.ARSIZE ( ARSIZE ),
		.ARBURST ( ARBURST ),
		.ARVALID ( ARVALID ),
		.ARREADY ( ARREADY ),
		.RID ( RID ),
		.RDATA ( RDATA ),
		.RRESP ( RRESP ),
		.RLAST ( RLAST ),
		.RVALID ( RVALID ),
		.RREADY ( RREADY ),
		.r_valid ( r_valid ),
		.r_last ( r_last ),
		.data_out ( data_out )
	);
	
	
endmodule

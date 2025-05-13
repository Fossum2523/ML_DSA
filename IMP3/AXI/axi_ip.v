`timescale 1ns / 1ps

module axi_ip(
	input 			ACLK,
	input 			ARESETn,

	/*--- Write address channel ---*/
	input 			AWID,
	input [31:0] 	AWADDR,
	input [7:0] 	AWLEN,
	input [2:0] 	AWSIZE,
	input [1:0] 	AWBURST,
	input 			AWVALID,
	output 			AWREADY,

	/*--- Write data channel ---*/
	input 			WID,
	input [31:0] 	WDATA,
	input [3:0] 	WSTRB,
	input 			WLAST,
	input 			WVALID,
	output 			WREADY,

	/*--- Write response channel ---*/
	input 			BREADY,
	output 			BID,
	output [1:0] 	BRESP,
	output 			BVALID,
	
	/*--- Read address channel ---*/
	input 			ARID,
	input [31:0] 	ARADDR,
	input [7:0] 	ARLEN,
	input [2:0] 	ARSIZE,
	input [1:0] 	ARBURST,
	input	 		ARVALID,
	output 			ARREADY,

	/*--- Read data channel ---*/
	input 			RREADY,
	output 			RID,
	output [31:0] 	RDATA,
	output [1:0] 	RRESP,
	output 			RLAST,
	output 			RVALID,
	
	/*--- MLDSA ---*/
	input 			clk,
	input 			reset_n
    );
	
	wire www_en_w_fifo;
	wire www_en_r_fifo;
	wire [1:0] sel;
	
	wire rrr_en_w_fifo;
	wire rrr_en_r_fifo;
	
	wire r_last;
	wire r_valid;
	wire [31:0] data_out;
	
	wire [7:0] data_in_out_value;
	wire flag;

	wire f_out_ok;
	wire [7:0] in_outdata;
	wire in_go;
	wire out_en_addr;
	wire [31:0] araddr_new;
	wire [2:0] full_state;
	
	localparam idle = 3'b000, block = 3'b001, many_pad = 3'b010, c_pad = 3'b011, f_fun = 3'b100, f_out = 3'b101;
		
	//~~~~~~~~~~ axi_awaddr ~~~~~~~~~~~~~~~~~~~~~~
	awaddr_mod awaddr_mod(
		.ACLK ( ACLK ),
		.ARESETn ( ARESETn ),
		.AWADDR ( AWADDR ),
		.sel_in ( sel ),
		.www_en_w_fifo ( www_en_w_fifo ),
		.www_en_r_fifo ( www_en_r_fifo )
	);

	//~~~~~~~~~ axi_araddr ~~~~~~~~~~~~~~~~~~~~~~~
	araddr_mod_rrr araddr_mod(
		.ACLK ( ACLK ),
		.ARESETn ( ARESETn ),
		.ARADDR ( araddr_new ),
		.rrr_en_w_fifo ( rrr_en_w_fifo ),
		.rrr_en_r_fifo ( rrr_en_r_fifo )
	);
	assign araddr_new = (out_en_addr == 1'b1)? ARADDR + 32'd1 : ARADDR;

	//~~~~~~~~~~ write_read_ctrl ~~~~~~~~~~~~~~~~~	
	axi_wrctrl write_read(
		.ACLK ( ACLK ),
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
		.BVALID ( BVALID ),
		
		.ARID ( ARID ),
		.ARADDR ( ARADDR ),
		.ARLEN ( ARLEN ),
		.ARSIZE ( ARSIZE ),
		.ARBURST ( ARBURST ),
		.ARVALID ( ARVALID ),
		.ARREADY ( ARREADY ),
		.RREADY ( RREADY ),
		.RID ( RID ),
		.RDATA ( RDATA ),
		.RRESP ( RRESP ),
		.RLAST ( RLAST ),
		.RVALID ( RVALID ),
		.r_valid ( r_valid ),
		.r_last( r_last ),
		.data_out ( data_out )
	);

//~~~~~~~~~~~~~~~~~ fifo ~~~~~~~~~~~~~~~~~~~~~~~~	
	axi_input_fifo input_fifo(
		.sel ( sel ),
		.wclk( ACLK ),
		.ARESETn ( ARESETn ),
		.wenable( WVALID && www_en_w_fifo ),
		.WSTRB ( WSTRB ),
		.WLAST ( WLAST ),
		.data_in ( WDATA ),
		.rclk ( clk ),
		.reset_n ( reset_n ),
		.in_go ( in_go ),
		.data_go ( www_en_r_fifo ),
		.full_state ( full_state ),
		.outdata ( in_outdata ),
		.flag ( flag )
	);

	axi_output_fifo output_fifo(
		.wclk ( clk ),
		.reset_n ( reset_n ),
		.wenable( out_go && rrr_en_w_fifo ),
		.data_in ( data_in_out_value ),
		.rclk ( ACLK ),
		.ARESETn ( ARESETn ),
		.renable ( out_en_addr && rrr_en_r_fifo ),
		.sel ( sel ),
		.r_last ( r_last ),
		.full_state ( full_state ),
		.r_valid ( r_valid ),
		.data_out ( data_out ),
		.out_en_addr ( out_en_addr )
	);
	
//~~~~~~~~~~~~~~~ sha_3 ~~~~~~~~~~~~~~~~~~~~~~~~
	sha_3_axi sha_3(
		.clk ( clk ),
		.reset_n ( reset_n ),
		.sel ( sel ),
		.flag ( flag ),
		.in ( in_outdata ),
		.in_go ( in_go ),
		.data_go ( www_en_r_fifo ), 
		.out_value ( data_in_out_value ),
		.out_go ( out_go ),
		.full_state ( full_state )
	);
	
endmodule

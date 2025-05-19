`timescale 1ns / 1ps

module axi_read
	(
	input ACLK,
	input ARESETn,
	/***********/
	input ARID,
	input [31:0] ARADDR,
	input [7:0] ARLEN,
	input [2:0] ARSIZE,
	input [1:0] ARBURST,
	input ARVALID,
	output reg ARREADY,
	/**********/
	input RREADY,
	output RID,/**/
	output [31:0] RDATA,
	output [1:0] RRESP,/**/
	output RLAST, /**/
	output RVALID, /**/
	
	input r_valid,
	input r_last,
	input [31:0]data_out
    );
	
	reg  cnt_go;
	reg  [7:0] cnt_len;
	wire [7:0] ARLEN_1;
	
/////////////////////////////////
	
	//assign ARID = 1'd1;
	assign RID = 1'd1;
	assign RRESP = 2'd0;
	assign RDATA = data_out;
	
	assign RLAST = r_last;
	assign RVALID = r_valid;
//~~~~~~~~~~ ARADDR_araddr ~~~~~~~~~~~~~

//~~~~~~~~~~ ARREADY_arready ~~~~~~~~~~~
	always @( posedge ACLK or negedge ARESETn )begin
		if( !ARESETn )begin
			ARREADY <= 1'd1;
		end
		else begin
			if( ARVALID == 1'd1 )begin
				ARREADY <= 1'd0;
			end
			else if( r_last == 1'd1 )begin
				ARREADY <= 1'd1;
			end
		end
	end
	
//~~~~~~~~~~ cnt_go ~~~~~~~~~~~~~~~~~~~~
	always @( posedge ACLK or negedge ARESETn )begin
		if( !ARESETn )begin
			cnt_go <= 1'd0;
		end
		else begin
			if( ARVALID == 1'd1 && ARREADY == 1'd1 )begin
				cnt_go <= 1'd1;
			end
			else if( cnt_len == ARLEN )begin
				cnt_go <= 1'd0;
			end
		end
	end
	//***** cnt_len *****//
	always @( posedge ACLK or negedge ARESETn )begin
		if( !ARESETn )begin
			cnt_len <= 7'd0;
		end
		else begin
			if( cnt_go == 1'd1 )begin
				cnt_len <= cnt_len + 8'd1;
			end
			else begin
				cnt_len <= 8'd0;
			end
		end
	end
	
//~~~~~~~~~~~ RLAST ~~~~~~~~~~~~~~~~~
/*	always @( * )begin
		if( ARLEN == 8'd0 )begin
			ARLEN_1 = 8'd0;
		end
		else begin
			ARLEN_1 = ARLEN - 8'd1;
		end
	end
			
	always @( posedge ACLK or negedge ARESETn )begin
		if( !ARESETn )begin
			RLAST <= 1'd0;
		end
		else begin
			if( ARLEN == 8'd0 && AWVALID == 1'd1 )begin
				RLAST <= 1'd1;
			end
			else if( cnt_len == ARLEN_1 )begin
				RLAST <= 1'd1;
			end
		end
	end*/

//~~~~~~~~~~~ RVALID ~~~~~~~~~~~~~~~~ 	
/*	always @( posedge ACLK or negedge ARESETn )begin
		if( !ARESETn )begin
			RVALID <= 1'd0;
		end
		else begin
			if( ARVALID == 1'd1 && ARREADY == 1'd1 )begin
				RVALID <= 1'd1;
			end
			else if( cnt_len == ARLEN )begin
				RVALID <= 1'd0;
			end
		end
	end
*/
endmodule

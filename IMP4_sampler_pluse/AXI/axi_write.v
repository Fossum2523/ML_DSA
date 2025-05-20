`timescale 1ns / 1ps

module axi_write
	(
		input ACLK,
		input ARESETn,
		/***********/
		input AWID,
		input [31:0] AWADDR,
		input [7:0] AWLEN,
		input [2:0] AWSIZE,
		input [1:0] AWBURST,
		input AWVALID,
		output reg AWREADY,
		/***********/
		input WID,
		input [31:0] WDATA,
		input [3:0] WSTRB,
		input WLAST,
		input WVALID,
		output WREADY,
		/**********/
		input BREADY,
		output BID,
		output [1:0] BRESP,
		output BVALID
    );
	
///////////////////////////////////////////////	

	assign BRESP = 2'd0;
	
	assign BID = 1'd0;
	
	assign WREADY = 1'd1;

	assign BVALID = WLAST;
//~~~~~~~~~~~~~~~ AWREADY_awready ~~~~~~~~~~~~~~	
	always @( posedge ACLK or negedge ARESETn )begin
		if( !ARESETn )begin
			AWREADY <= 1'd1;
		end
		else begin
			if( AWVALID == 1'd1 )begin
				AWREADY <= 1'd0;
			end
			else if ( BVALID == 1'd1 )begin
				AWREADY <= 1'd1;
			end
		end
	end

//~~~~~~~~~~~~~ WREADY_wready ~~~~~~~~~~~~~~~~
	/*always @( posedge ACLK or negedge ARESETn )begin
		if( !ARESETn )begin
			WREADY <= 1'd0;
		end
		else begin
			if( WVALID == 1'd1 )begin
				WREADY <= 1'd1;
			end
			else if( WLAST == 1'd1 )begin
				WREADY <= 1'd0;
			end
			else begin
				WREADY <= WREADY;
			end
		end
	end*/
//	assign WREADY = 1'd1;

//~~~~~~~~~~~~~ BVALID_bvalid ~~~~~~~~~~~~~~~~
	/*always @( posedge ACLK or negedge ARESETn )begin
		if( !ARESETn )begin
			BVALID <= 1'd0;
		end
		else begin
			if( WLAST != 1'b1 )begin
				BVALID <= 1'b0;
			end
			else begin
				BVALID <= 1'b1;
			end
		end
	end*/

endmodule

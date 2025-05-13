`timescale 1ns / 1ps

module awaddr_mod(
	input ACLK,
	input ARESETn,
	input [31:0] AWADDR,
	
	output reg [1:0] sel_in,
	output reg www_en_w_fifo,
	output reg www_en_r_fifo
    );
	localparam idle = 32'h 0000_0000, sel_en = 32'h 0000_001x, w_fifo = 32'h 0000_0100, r_fifo = 32'h 0000_1000;

 	reg [1:0] mod_sel;
	reg en_sel_in;
	
	always @( posedge ACLK or negedge ARESETn )begin
		if( !ARESETn )begin
			mod_sel <= 2'd0;
		end
		else begin
			casex ( AWADDR )
				idle: mod_sel <= 2'd0;
				sel_en:	mod_sel <= 2'd1;
				w_fifo:	mod_sel <= 2'd2;
				r_fifo: mod_sel <= 2'd3;
			endcase
		end
	end
				
	always @( posedge ACLK or negedge ARESETn )begin
		if( !ARESETn )begin
			en_sel_in <= 1'd0;
			www_en_w_fifo <= 1'd0;
			www_en_r_fifo <= 1'd0;
		end
		else begin
			case ( mod_sel )
				2'd0 : begin
					en_sel_in <= 1'd0;
					www_en_w_fifo <= 1'd0;
					www_en_r_fifo <= 1'd0;
				end
				
				2'd1 : begin
					en_sel_in <= 1'd1;
					www_en_w_fifo <= 1'd0;
					www_en_r_fifo <= 1'd0;
				end
				
				2'd2 : begin
					en_sel_in <= 1'd0;
					www_en_w_fifo <= 1'd1;
					www_en_r_fifo <= 1'd0;
				end
				
				2'd3 : begin
					en_sel_in <= 1'd0;
					www_en_w_fifo <= 1'd0;
					www_en_r_fifo <= 1'd1;
				end
				
				default : begin
					en_sel_in <= 1'd0;
					www_en_w_fifo <= 1'd0;
					www_en_r_fifo <= 1'd0;
				end	
			endcase
		end
	end
	
	always @( posedge ACLK or negedge ARESETn )begin
		if( !ARESETn )begin
			sel_in <= 2'd0;
		end
		else begin
			if( AWADDR[7:4] == 4'd1 )begin
				sel_in <= {AWADDR[1] , AWADDR[0]};
			end
			else begin
				sel_in <= sel_in;
			end
		end
	end

endmodule 
`timescale 1ns / 1ps

module araddr_mod_rrr(	
	input ACLK,
	input ARESETn,
	input [31:0] ARADDR,
	
	output reg rrr_en_w_fifo,
	output reg rrr_en_r_fifo
    );
parameter idle = 32'h 0000_0000, w_fifo = 32'h 0000_0010, r_fifo = 32'h 0000_0011;

 	reg [1:0] mod_sel;
	
	always @( posedge ACLK or negedge ARESETn )begin
		if( !ARESETn )begin
			mod_sel <= 2'd0;
		end
		else begin
			if( ARADDR == idle ) begin
				mod_sel <= 2'd0;
			end
			else if ( ARADDR == w_fifo )begin
				mod_sel <= 2'd1;
			end
			else if ( ARADDR == r_fifo )begin
				mod_sel <= 2'd2;
			end
		end
	end
				
	always @( posedge ACLK or negedge ARESETn )begin
		if( !ARESETn )begin
			rrr_en_w_fifo <= 1'd0;
			rrr_en_r_fifo <= 1'd0;
		end
		else begin
			case ( mod_sel )
				2'd0 : begin
					rrr_en_w_fifo <= 1'd0;
					rrr_en_r_fifo <= 1'd0;
				end
				
				2'd1 : begin
					rrr_en_w_fifo <= 1'd1;
					rrr_en_r_fifo <= 1'd0;
				end
				
				2'd2 : begin
					rrr_en_w_fifo <= 1'd0;
					rrr_en_r_fifo <= 1'd1;
				end

				default : begin
					rrr_en_w_fifo <= 1'd0;
					rrr_en_r_fifo <= 1'd0;
				end	
			endcase
		end
	end

endmodule

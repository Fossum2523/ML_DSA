`timescale 1ns / 1ps

module axi_output_fifo
	(
	input wclk, 
	input reset_n,
	input wenable,
	//input [4-1:0] waddr,
	input [7:0] data_in,
	
	input rclk,
	input ARESETn,
	input renable,
	
	input [1:0] sel,
	output reg r_last,
	output r_valid,
	output [31:0] data_out,
   output reg out_en_addr,
	
	input [2:0] full_state
	);
	 
	localparam mem_layer = 1 << 4;
	reg [1:0] rcnt;
	reg [1:0] wcntx;
	reg [3:0] wcnty;
	reg wcnt_state;
//	reg [1:0] wcnt;
	reg [31:0] data_store;
	reg [3:0] out_stop;
	reg [3:0] last_num;
	reg [31 : 0] mem [0 : 15];
	//reg renable;
	reg [4:0] waddr_cnt;
	reg [4:0] raddr_cnt;
	wire [4:0] g_waddr_cnt;
	wire [4:0] g_raddr_cnt;
	////// read //////
	//reg out_en_addr;
	
	/***** full & empty *****/
	wire full_flag;
	wire empty_flag;
	
localparam idle = 3'b000, block = 3'b001, many_pad = 3'b010, c_pad = 3'b011, f_fun = 3'b100, f_out = 3'b101;

////////////// wdata ///////////////////
	always @( posedge wclk or negedge ARESETn )begin
		if( !ARESETn )begin
			waddr_cnt <= 5'd0;
		end
		else begin
			if( full_state == block )begin
				waddr_cnt <= 5'd0;
			end
			else if( (wenable == 1'd1) && ( wcntx == 2'd3 ) &&(full_flag == 1'd0) )begin
				waddr_cnt <= waddr_cnt + 5'd1;
			end
		end
	end
	
	always @( posedge wclk or negedge reset_n )begin
		if( !reset_n )begin
			data_store <= 32'd0;
		end
		else begin
			if( wenable )begin
				data_store <= { data_in, data_store[31:8] };
			end
		end
	end
	
	always @( posedge wclk or negedge reset_n )begin
		if( !reset_n )begin
			rcnt <= 2'd0;
		end
		else begin
			if( wenable == 1'd1 )begin
				rcnt <= rcnt + 2'd1;
			end
		end
	end
	
	always @( posedge wclk or negedge reset_n )begin
		if( !reset_n )begin
			wcnty <= 4'd0;
		end
		else begin
			if( wenable == 1'd1 )begin
				wcnty <= ( wcntx == 2'd3 )? wcnty + 4'd1 : wcnty;
			end
			else begin
				wcnty <= 4'd0;
			end
		end
	end
	
	always @( posedge wclk or negedge reset_n )begin
		if( !reset_n )begin
			wcnt_state <= 1'd0;
		end
		else begin
			if( (wcnty == out_stop) && (wcntx == 2'd3) )begin
				wcnt_state <= 1'd0;
			end
			else if( wenable == 1'd1 )begin
				wcnt_state <= 1'd1;
			end
		end
	end
				
	always @( posedge wclk or negedge reset_n )begin
		if( !reset_n )begin
			wcntx <= 2'd0;
		end
		else begin
			if( wcnt_state == 1'd1 )begin
				wcntx <= wcntx + 2'd1;
			end
		end
	end
	
	always @( posedge wclk )begin
		if( wcntx == 2'd3 )begin
			mem[waddr_cnt[3:0]] <= data_store;
		end
	end
//~~~~~~~~~~ sel_output ~~~~~~~~~~
	always @( * )begin
		case ( sel )
			2'd0 : out_stop = 4'd6;
			2'd1 : out_stop = 4'd7;
			2'd2 : out_stop = 4'd11;
			2'd3 : out_stop = 4'd15;
			
			default : out_stop = 4'd6;
		endcase
	end
	
	always @( * )begin
		case ( sel )
			2'd0 : last_num = 4'd5;
			2'd1 : last_num = 4'd6;
			2'd2 : last_num = 4'd10;
			2'd3 : last_num = 4'd14;
			
			default : last_num = 4'd5;
		endcase
	end
	
//~~~~~~~~~~~ renable ~~~~~~~~~~~~~
/*	always @( posedge rclk or negedge ARESETn )begin
		if( !ARESETn )begin
			renable <= 1'd0;
		end
		else begin
			if( raddr_cnt[3:0] == out_stop )begin
				renable <= 1'd0;
			end
			else if ( ARVALID == 1'd1 )begin
				renable <= 1'd1;
			end
		end
	end*/
		
//~~~~~~~~~~~ rdata ~~~~~~~~~~~~~~~
	always @( posedge rclk or negedge ARESETn )begin
		if( !ARESETn )begin
			out_en_addr <= 1'd0;
		end
		else begin
			if( raddr_cnt[3:0] == out_stop )begin
				out_en_addr <= 1'd0;
			end
			else if( (wcnty == out_stop) && (wcntx == 2'd3) )begin
				out_en_addr <= 1'd1;
			end
		end
	end
	
	always @( posedge rclk or negedge ARESETn )begin
		if( !ARESETn )begin
			raddr_cnt <= 5'd0;
		end
		else begin
			if( (renable == 1'd1) && (empty_flag == 1'd0) )begin
				raddr_cnt <= raddr_cnt + 5'd1;
			end
			else begin
				raddr_cnt <= 5'd0;
			end
		end
	end
	
	assign data_out = mem[raddr_cnt[3:0]];

//~~~~~~~~~ r_last ~~~~~~~~~~~
	always @( posedge wclk or negedge ARESETn )begin
		if( !ARESETn )begin
			r_last <= 1'd0;
		end
		else begin
			if( raddr_cnt[3:0] == last_num )begin
				r_last <= 1'd1;
			end
			else begin
				r_last <= 1'd0;
			end
		end
	end
	
//~~~~~~~~~ RVALID r_valid ~~~~~~~~~~~~~~~
	/*always @( posedge wclk or negedge ARESETn )begin
		if( !ARESETn )begin
			r_valid <= 1'd0;
		end
		else begin
			if( renable == 1'd1 )begin
				r_valid <= 1'd1;
			end
			else begin
				r_valid <= 1'd0;
			end
		end
	end*/
	assign r_valid = renable;	
//~~~~~~~~~~~~~~~~~~~ full $$ empty ~~~~~~~~~~~~~~~~~~~~~
	assign g_waddr_cnt = ( waddr_cnt >> 1 ) ^ waddr_cnt;
	assign g_raddr_cnt = ( raddr_cnt >> 1 ) ^ raddr_cnt;
	
	assign full_flag = ( g_waddr_cnt == { ~(g_raddr_cnt[4:3]), g_raddr_cnt[2:0] } )? 1'd1 : 1'd0;
	assign empty_flag = ( g_waddr_cnt == g_raddr_cnt )? 1'd1 : 1'd0; 

endmodule

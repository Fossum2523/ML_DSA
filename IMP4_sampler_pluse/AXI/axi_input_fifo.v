`timescale 1ns / 1ps

module axi_input_fifo
	(
	input [1:0] sel,
	input wclk, 
	input ARESETn,
	input wenable,
	input [3:0] WSTRB,
	input WLAST,
	input [31:0] data_in,
	input rclk,
	input reset_n,
	input in_go,
	input data_go,
	input [2:0] full_state,
	output reg [7:0] outdata,
	
	output reg flag,
	output reg flag_cnt_go
   );

	//localparam mem_layer = 1 << 6;
	reg mem_v;
	reg [31 : 0] mem [0 : 63];
//******** flag **********
	reg [1:0] data_x_amount;
 	wire [5:0] data_y_amount;
	//reg flag_cnt_go;
	reg [5:0] flag_axi_cnty;
	reg [1:0] flag_axi_cntx;
	reg renable;
	reg [5:0] flag_sha_cnty;
	reg [1:0] flag_sha_cntx;
//***** read ********
//	reg renable;
	reg [6:0] waddr_cnt;
	wire [6:0] g_waddr_cnt;
	reg [6:0] raddr_cnt;
	wire [6:0] g_raddr_cnt;
	reg [5:0] stop_read_cnt;
	reg [5:0] stop_read;
	reg [1:0] rcnt;
	wire [31:0] rdata;

//***** full & empty *****
	wire full_flag;
	wire empty_flag;
	
localparam idle = 3'b000, block = 3'b001, many_pad = 3'b010, c_pad = 3'b011, f_fun = 3'b100, f_out = 3'b101;

/////////////// wdata /////////////////////	
	always @( posedge wclk or negedge ARESETn )begin
		if( !ARESETn )begin
			waddr_cnt <= 7'd0;
		end
		else begin
			if( full_state == block )begin
				waddr_cnt <= 7'd0;
			end
			else if( (wenable == 1'd1) && (full_flag == 1'd0) )begin
				waddr_cnt <= waddr_cnt + 7'd1;
			end
		end
	end
	
	always @( posedge wclk )begin
		if( (wenable == 1'd1) && (full_flag == 1'd0) )begin
			mem[waddr_cnt[5:0]] <= data_in;
		end
	end

//~~~~~~~~~~~ rdata ~~~~~~~~~~~~~~~
	always @( posedge rclk or negedge reset_n )begin
		if( !reset_n )begin
			renable <= 1'd0;
		end
		else begin
			if( (stop_read == stop_read_cnt) && (rcnt == 2'd3) )begin
				renable <= 1'd0;
			end
			else if( (in_go == 1'd1) || (full_state == idle && data_go == 1'd1) )begin
				renable <= 1'd1;
			end
		end
	end
	/*** stop_read ***/
	always @( * )begin
		case ( sel )
			2'd0 : stop_read = 6'd35;
			2'd1 : stop_read = 6'd33;
			2'd2 : stop_read = 6'd25;
			2'd3 : stop_read = 6'd17;
		endcase
	end
		
	always @( posedge rclk or negedge reset_n )begin
		if( !reset_n )begin
			stop_read_cnt <= 6'd0;
		end
		else begin
			if( (stop_read == stop_read_cnt) && (rcnt == 2'd3) )begin
				stop_read_cnt <= 6'd0;
			end
			else if( renable == 1'd1 && rcnt == 2'd3 )begin
				stop_read_cnt <= stop_read_cnt + 6'd1;
			end
		end
	end
	
	always @( posedge rclk or negedge reset_n )begin
		if( !reset_n )begin
			raddr_cnt <= 7'd0;
		end
		else begin
			if( full_state == f_out )begin
				raddr_cnt <= 7'd0;
			end
			else if( (renable == 1'd1 && rcnt == 2'd3) && (empty_flag == 1'd0) )begin
				raddr_cnt <= raddr_cnt + 7'd1;
			end
		end
	end
	
	assign rdata = mem[raddr_cnt[5:0]]; 
	
	always @( * )begin
		case (rcnt)
			2'd0 : outdata = rdata [31:24]; //31:24
			2'd1 : outdata = rdata [23:16]; //23:16
			2'd2 : outdata = rdata [15:8];  //15:8
			2'd3 : outdata = rdata [7:0];   //7:0
		endcase
	end
	
//************* flag_axi_ACLK ************************
	always @( posedge rclk or negedge reset_n )begin
		if( !reset_n )begin
			mem_v <= 1'd0;
		end
		else begin
			if( WLAST == 1'd1 )begin
				mem_v <= 1'd0;
			end
			else if( wenable == 1'd1 )begin
				mem_v <= 1'd1;
			end
		end
	end
	
	always @( posedge rclk or negedge reset_n )begin
		if( !reset_n )begin
			flag <= 1'd0;
		end
		else begin
			if( mem_v == 1'd1 )begin
				flag <= 1'd1;
			end
			else if( flag_axi_cntx != 2'd0 )begin
				if( (flag_axi_cnty == flag_sha_cnty) && (flag_axi_cntx == flag_sha_cntx) )begin
					flag <= 1'd0;
				end
			end
			else if((flag_axi_cnty == flag_sha_cnty) && (rcnt == 2'd3) )begin
				flag <= 1'd0;
			end
		end			
	end
	
	assign data_y_amount = ( WSTRB == 4'd15 )? 6'd1 : 6'd0;
	
	always @(*)begin
		case ( WSTRB )
			4'b0001 : data_x_amount = 2'd1;
			4'b0011 : data_x_amount = 2'd2;
			4'b0111 : data_x_amount = 2'd3;
			default : data_x_amount = 2'd0;
		endcase
	end
	
	always @( posedge wclk or negedge ARESETn )begin
		if( !ARESETn )begin
			flag_cnt_go <= 1'd0;
		end
		else begin
			if( WLAST == 1'd1 )begin
				flag_cnt_go <= 1'd0;
			end
			else if( wenable == 1'd1 )begin
				flag_cnt_go <= 1'd1;
			end
		end
	end
	
	always @( posedge wclk or negedge ARESETn )begin
		if( !ARESETn )begin
			flag_axi_cnty <= 6'd0;
		end
		else begin
			if( full_state == f_out )begin
				flag_axi_cnty <= 6'd0;
			end
			else if( flag_cnt_go == 1'd1 )begin
				flag_axi_cnty <= flag_axi_cnty + data_y_amount;
			end
		end
	end
	
	always @( posedge wclk or negedge ARESETn )begin
		if( !ARESETn )begin
			flag_axi_cntx <= 2'd0;
		end
		else begin
			if( full_state == f_out )begin
				flag_axi_cntx <= 2'd0;
			end
			else begin
				flag_axi_cntx <= flag_axi_cntx + data_x_amount;
			end
		end
	end
	
	/***** SHA_CLK *****/
	always @( posedge rclk or negedge reset_n )begin
		if( !reset_n )begin
			rcnt <= 2'd0;
		end
		else begin
			if( full_state == f_out )begin
				rcnt <= 2'd0;
			end
			else if( renable == 1'd1 )begin
				rcnt <= rcnt + 2'd1;
			end
		end
	end
	
	always @( posedge rclk or negedge reset_n )begin
		if( !reset_n )begin
			flag_sha_cnty <= 6'd0;
		end
		else begin
			if( full_state == f_out )begin
				flag_sha_cnty <= 6'd0;
			end
			else if( rcnt == 2'd3 )begin
				flag_sha_cnty <= flag_sha_cnty + 6'd1;
			end
			else begin
				flag_sha_cnty <= flag_sha_cnty;
			end
		end
	end
	
	always @( posedge rclk or negedge reset_n )begin
		if( !reset_n )begin
			flag_sha_cntx <= 2'd0;
		end
		else begin
			if( full_state == f_out )begin
				flag_sha_cntx <= 2'd0;
			end
			else if( (flag_sha_cntx != 2'd0) && (flag_sha_cnty == flag_axi_cnty) && (renable == 1'd1) )begin
				flag_sha_cntx <=  flag_sha_cntx + 2'd1;
			end
		end
	end

//*************** full && empty ****************************
	assign g_waddr_cnt = ( waddr_cnt >> 1 ) ^ waddr_cnt;
	assign g_raddr_cnt = ( raddr_cnt >> 1 ) ^ raddr_cnt;
	
	assign full_flag = ( g_waddr_cnt == { ~(g_raddr_cnt[6:5]), g_raddr_cnt[4:0] } )? 1'd1 : 1'd0;
	assign empty_flag = ( g_waddr_cnt == g_raddr_cnt )? 1'd1 : 1'd0; 
	
endmodule

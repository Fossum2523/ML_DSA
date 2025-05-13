`timescale 1ns / 1ps

module sha_3_axi(
	input clk,
	input reset_n,
	input [1:0] sel,
	input data_go,
	input flag,
	input [7:0] in,
	
	output reg in_go,
	output reg [7:0] out_value,
	output reg [2:0] full_state,
	output reg out_go,
	output reg [63:0] s0_0,
	output reg [63:0] s1_0,
	output reg [63:0] s2_0,
	output reg [63:0] s3_0,
	output reg [63:0] s4_0,

	output reg [63:0] s0_1,
	output reg [63:0] s1_1,
	output reg [63:0] s2_1,
	output reg [63:0] s3_1,
	output reg [63:0] s4_1,

	output reg [63:0] s0_2,
	output reg [63:0] s1_2,
	output reg [63:0] s2_2,
	output reg [63:0] s3_2,
	output reg [63:0] s4_2,

	output reg [63:0] s0_3,
	output reg [63:0] s1_3,
	output reg [63:0] s2_3,
	output reg [63:0] s3_3,
	output reg [63:0] s4_3,

	output reg [63:0] s0_4,
	output reg [63:0] s1_4,
	output reg [63:0] s2_4,
	output reg [63:0] s3_4,
	output reg [63:0] s4_4
);

	reg p_cnt_state;
	reg [2:0] px_cnt, py_cnt, pz_cnt;
	reg [2:0] x_cnt, y_cnt, z_cnt;
	reg [2:0] outx, outz;
	
	reg [4:0] round;
	//reg [3:0] full_state;

	reg [2:0] stop_x, stop_y;
	reg [2:0] stop_xgo, stop_ygo;
	reg [2:0] out_stopx;
	reg [2:0] out_stopz;
	
	reg padstate;
	reg c_pad_ok;
	reg [63:0] data_store;
	
	reg [7:0] constant;
	reg [63:0] round_constant;
	
	reg f_out_ok;
	reg signal;
////////////////////////////////////////////////		
	
	
//////////////////////////////////////////////
	reg [63:0] comea0_0;
	reg [63:0] comea1_0;
	reg [63:0] comea2_0;
	reg [63:0] comea3_0;
	reg [63:0] comea4_0;
	
	reg [63:0] comea0_1;
	reg [63:0] comea1_1;
	reg [63:0] comea2_1;
	reg [63:0] comea3_1;
	reg [63:0] comea4_1;
	
	reg [63:0] comea0_2;
	reg [63:0] comea1_2;
	reg [63:0] comea2_2;
	reg [63:0] comea3_2;
	reg [63:0] comea4_2;
	
	reg [63:0] comea0_3;
	reg [63:0] comea1_3;
	reg [63:0] comea2_3;
	reg [63:0] comea3_3;
	reg [63:0] comea4_3;

	reg [63:0] comea0_4;
	reg [63:0] comea1_4;
	reg [63:0] comea2_4;
	reg [63:0] comea3_4;
	reg [63:0] comea4_4;
///////////////////////////////////////////////////////////////////////////
	reg [63:0] comeb0_0;
	reg [63:0] comeb1_0;
	reg [63:0] comeb2_0;
	reg [63:0] comeb3_0;
	reg [63:0] comeb4_0;
	
	reg [63:0] comeb0_1;
	reg [63:0] comeb1_1;
	reg [63:0] comeb2_1;
	reg [63:0] comeb3_1;
	reg [63:0] comeb4_1;
	
	reg [63:0] comeb0_2;
	reg [63:0] comeb1_2;
	reg [63:0] comeb2_2;
	reg [63:0] comeb3_2;
	reg [63:0] comeb4_2;
	
	reg [63:0] comeb0_3;
	reg [63:0] comeb1_3;
	reg [63:0] comeb2_3;
	reg [63:0] comeb3_3;
	reg [63:0] comeb4_3;

	reg [63:0] comeb0_4;
	reg [63:0] comeb1_4;
	reg [63:0] comeb2_4;
	reg [63:0] comeb3_4;
	reg [63:0] comeb4_4;
	
///////////////////////////////////////////////////////////////////////////
	reg [63:0] comec0_0;
	reg [63:0] comec1_0;
	reg [63:0] comec2_0;
	reg [63:0] comec3_0;
	reg [63:0] comec4_0;
	
	reg [63:0] comec0_1;
	reg [63:0] comec1_1;
	reg [63:0] comec2_1;
	reg [63:0] comec3_1;
	reg [63:0] comec4_1;

	reg [63:0] comec0_2;
	reg [63:0] comec1_2;
	reg [63:0] comec2_2;
	reg [63:0] comec3_2;
	reg [63:0] comec4_2;
	
	reg [63:0] comec0_3;
	reg [63:0] comec1_3;
	reg [63:0] comec2_3;
	reg [63:0] comec3_3;
	reg [63:0] comec4_3;

	reg [63:0] comec0_4;
	reg [63:0] comec1_4;
	reg [63:0] comec2_4;
	reg [63:0] comec3_4;
	reg [63:0] comec4_4;
///////////////////////////////////////////////////////////////////////////
	reg [63:0] theta0;
	reg [63:0] theta1;
	reg [63:0] theta2;
	reg [63:0] theta3;
	reg [63:0] theta4;

	reg f_fun_ok;
	//reg f_out_ok;
	reg data_cnt_state;

localparam idle = 3'b000, block = 3'b001, many_pad = 3'b010, c_pad = 3'b011, f_fun = 3'b100, f_out = 3'b101;
/**********************************************************************/
/**********************************************************************/
/**********************************************************************/
	
	///////// stop_block ///////////
	always @(*)begin
		case(sel)
			2'd0 : begin 
				stop_x = 2'd2; 
				stop_y = 2'd3;
			end
			2'd1 : begin
				stop_x = 2'd1; 
				stop_y = 2'd3;
			end
			2'd2 : begin 	
				stop_x = 2'd2; 
				stop_y = 2'd2;
			end 
			2'd3 : begin
				stop_x = 2'd3; 
				stop_y = 2'd1;
			end
		endcase
	end	
	
	////////// stop_go ///////////
	always @(*)begin
		case(sel)
			2'd0 : begin 
				stop_xgo = 3'd3; 
				stop_ygo = 3'd3;
			end
			2'd1 : begin
				stop_xgo = 3'd2; 
				stop_ygo = 3'd3;
			end
			2'd2 : begin 	
				stop_xgo = 3'd3; 
				stop_ygo = 3'd2;
			end 
			2'd3 : begin
				stop_xgo = 3'd4; 
				stop_ygo = 3'd1;
			end
		endcase
	end
			
	///////// stop_out ///////////
	always @(*)begin
		case(sel)
			2'd0 : begin 
				out_stopx = 3'd3; 
				out_stopz = 3'd3;
			end
			2'd1 : begin
				out_stopx = 3'd3; 
				out_stopz = 3'd7;
			end
			2'd2 : begin 	
				out_stopx = 3'd5;
				out_stopz = 3'd7;
			end 
			2'd3 : begin
				out_stopx = 3'd7; 
				out_stopz = 3'd7;
			end
		endcase
	end

//**************** full_state *******************************
wire  stop_condition;
assign stop_condition = x_cnt == stop_x && y_cnt == stop_y && z_cnt == 3'd7;

	always @( posedge clk or negedge reset_n )begin
		if( !reset_n )begin
			full_state <= idle;
		end
		else begin
			case ( full_state )
				idle : begin
					full_state <= ( flag == 1'd1 && data_go == 1'd1 )? block : idle;
				end
				
				block : begin
					if( flag == 1'b1 )
						full_state <= ( stop_condition == 1'b1 )? c_pad : block;
					else  //flag == 0
						full_state <= many_pad;
				end
				
				many_pad : begin
					full_state <= ( stop_condition == 1'b1 )? c_pad : many_pad;
				end
				
				c_pad : begin
					full_state <= ( c_pad_ok == 1'd1 )? f_fun : c_pad;
				end
				
				f_fun : begin
					case ({flag , f_fun_ok})
						2'b01:	full_state <= f_out;
						2'b11:	full_state <= idle;
						default: full_state <= f_fun;
					endcase
					/*
					if( flag == 1'd1 )begin
						full_state <= ( f_fun_ok == 1'd1 )? idle : f_fun;
					end
					else begin
						full_state <= ( f_fun_ok == 1'd1 )? f_out : f_fun;
					end*/
				end
				
				f_out : begin
					full_state <= (f_out_ok == 1'd1)? idle :f_out;
				end
				
			endcase
		end
	end
//****************** in_go	*****************************************
	wire wait_condition;
	assign wait_condition = (x_cnt == stop_x && y_cnt == stop_y && z_cnt == 3'd7)? 1'b1 : 1'b0;
	always @( posedge clk or posedge reset_n)begin
		if (reset_n)
			in_go <= 1'd0;
		else begin
			case (full_state)
				idle:	in_go <= (flag == 1'b1 && data_go == 1'b1)? 1'd1 : 1'd0;
				block:	in_go <= (wait_condition == 1'b1)? 1'b0 : 1'b1;
				//many_pad: in_go <= (wait_condition == 1'b1)? 1'b0 : 1'b1;
				default:
					in_go <= 1'b0;
			/*if( full_state != idle && ((x_cnt > stop_xgo && y_cnt == stop_ygo) || (x_cnt == stop_xgo && y_cnt == stop_ygo && z_cnt == 3'd0) || y_cnt > stop_ygo))begin
				in_go <= 1'd0;
			end
			else if( full_state == block && flag == 1'd1 )begin
				in_go <= 1'd1;
			end
			else begin
				in_go <= 1'd0;
			end*/
			endcase
		end
	end

//******************* xyz_cnt *******************************
	always @( posedge clk or negedge reset_n )begin
		if( !reset_n )begin
			x_cnt <= 3'd0;
			y_cnt <= 3'd0;
			z_cnt <= 3'd0;
		end
		else begin
			if( full_state == idle && flag == 1'd1 ) begin
				z_cnt <= 3'd0;
				x_cnt <= 3'd0;
				y_cnt <= 3'd0;
			end
			else if( full_state != idle )begin
				if( x_cnt != 3'd4 || y_cnt != 3'd4 || z_cnt != 3'd7  )begin
					z_cnt <= z_cnt+3'd1;
			
					x_cnt <= (z_cnt == 3'd7)? ((x_cnt == 3'd4)? 3'd0 : x_cnt+3'd1) : x_cnt;
			
					y_cnt <= (z_cnt == 3'd7 && x_cnt == 3'd4)? ((y_cnt == 3'd4)? 3'd0 : y_cnt+3'd1) : y_cnt;
				end
			end
		end
	end
	
//****************** signal ****************************
	always @( posedge clk or negedge reset_n  )begin
		if( !reset_n )begin
			signal <= 1'd0;
		end
		else begin
			if( full_state == idle && flag == 1'd1 )begin
				signal <= 1'd1;
			end
			else if( full_state == f_out )begin
				signal <= 1'd1;
			end
			else begin
				signal <= 1'd0;
			end
		end
	end
//****************** p_cnt_state ***********************
	always @( posedge clk or negedge reset_n )begin
		if( !reset_n )begin
			p_cnt_state <= 1'd0;
		end
		else begin
			if( px_cnt == 3'd4 && py_cnt == 3'd4 && pz_cnt == 3'd7 )begin
				p_cnt_state <= 1'd0;
			end
			else if( full_state == block && signal == 1'd1 )begin
				p_cnt_state <= 1'd1;
			end
		end
	end
	
//****************** pxyz_cnt ***********************
	always @( posedge clk or negedge reset_n )begin
		if( !reset_n )begin
			px_cnt <= 3'd0;
			py_cnt <= 3'd0;
			pz_cnt <= 3'd0;
		end 
		else begin
			if( p_cnt_state == 1'd1 )begin
				pz_cnt <= ( pz_cnt == 3'd7 )? 3'd0 : pz_cnt + 3'd1;
				px_cnt <= ( pz_cnt == 3'd7 )? (( px_cnt == 3'd4 )? 3'd0 : px_cnt + 3'd1 ) : px_cnt;
				py_cnt <= ( pz_cnt == 3'd7 && px_cnt == 3'd4 )? (( py_cnt == 3'd4 )? 3'd0 : py_cnt + 3'd1) : py_cnt;
			end
		end
	end
	
//**************** data_store **************************************
	always @( posedge clk or negedge reset_n )begin
		if( !reset_n )begin
			data_store <= 64'd0;
			//padstate <= 1'd0;
		end
		else begin
			case ( full_state )
				idle : begin
					data_store <= data_store;
					//padstate <= 1'd0;
				end
				
				block : begin
					//if( data_go == 1'd1 )begin
						if( flag == 1'd1 )begin
							data_store <= {in , data_store[63:8]};
							//padstate <= padstate;
						end
						else begin //flag = 0
							if( x_cnt == stop_x && y_cnt == stop_y && z_cnt == 3'd7)begin// && padstate == 1'd0 
								data_store <= {8'b1000_0110 , data_store[63:8]};
								//padstate <= padstate;
							end
							else begin //06
								data_store <= {8'b0000_0110 , data_store[63:8]};
								//padstate <= 1'd1;
							end
						end
					//end
				end
				
				many_pad : begin
					if(x_cnt == stop_x && y_cnt == stop_y && z_cnt == 3'd7)begin //80 && padstate == 1'b1
						data_store <= {8'b1000_0000 , data_store[63:8]};
					end
					else begin
						data_store <= {8'b0000_0000 , data_store[63:8]};
					end
				end
				
				c_pad : begin
					data_store <= {8'b0000_0000 , data_store[63:8]};
					//padstate <= 1'd0;
				end
				
				default : begin
					data_store <= 64'd0;
					//padstate <= 1'd0;
				end
				
			endcase
		end
	end
	
//****************** c_pad ********************************
	always @( posedge clk or negedge reset_n )begin
		if( !reset_n )begin
			c_pad_ok <= 1'd0;
		end
		else begin
			if( px_cnt == 3'd4 && py_cnt == 3'd4 && pz_cnt == 3'd7 )begin
				c_pad_ok <= 1'd1;
			end
			else begin
				c_pad_ok <= 1'd0;
			end
		end
	end
//******************* 25 lane ********************************
	always @( posedge clk or negedge reset_n )begin
		if( !reset_n )begin
			s0_0 <= 64'd0;
			s1_0 <= 64'd0;
			s2_0 <= 64'd0;
			s3_0 <= 64'd0;
			s4_0 <= 64'd0;
			
			s0_1 <= 64'd0;
			s1_1 <= 64'd0;
			s2_1 <= 64'd0;
			s3_1 <= 64'd0;
			s4_1 <= 64'd0;
			
			s0_2 <= 64'd0;
			s1_2 <= 64'd0;
			s2_2 <= 64'd0;
			s3_2 <= 64'd0;
			s4_2 <= 64'd0;
			
			s0_3 <= 64'd0;
			s1_3 <= 64'd0;
			s2_3 <= 64'd0;
			s3_3 <= 64'd0;
			s4_3 <= 64'd0;
			
			s0_4 <= 64'd0;
			s1_4 <= 64'd0;
			s2_4 <= 64'd0;
			s3_4 <= 64'd0;
			s4_4 <= 64'd0;
		end
		else begin
			if( full_state == f_fun )begin
				s0_0 <= comec0_0;
				s1_0 <= comec1_0;
				s2_0 <= comec2_0;
				s3_0 <= comec3_0;
				s4_0 <= comec4_0;

				s0_1 <= comec0_1;
				s1_1 <= comec1_1;
				s2_1 <= comec2_1;
				s3_1 <= comec3_1;
				s4_1 <= comec4_1;
					
				s0_2 <= comec0_2;
				s1_2 <= comec1_2;
				s2_2 <= comec2_2;
				s3_2 <= comec3_2;
				s4_2 <= comec4_2;
					
				s0_3 <= comec0_3;
				s1_3 <= comec1_3;
				s2_3 <= comec2_3;
				s3_3 <= comec3_3;
				s4_3 <= comec4_3;
				
				s0_4 <= comec0_4;
				s1_4 <= comec1_4;
				s2_4 <= comec2_4;
				s3_4 <= comec3_4;
				s4_4 <= comec4_4;	
			end
			else if( pz_cnt == 3'd7 )begin	
				case( {px_cnt, py_cnt} )
					6'b000_000 : s0_0 <= data_store ^ s0_0;
					6'b001_000 : s1_0 <= data_store ^ s1_0;
					6'b010_000 : s2_0 <= data_store ^ s2_0;
					6'b011_000 : s3_0 <= data_store ^ s3_0;
					6'b100_000 : s4_0 <= data_store ^ s4_0;
						
					6'b000_001 : s0_1 <= data_store ^ s0_1;
					6'b001_001 : s1_1 <= data_store ^ s1_1;
					6'b010_001 : s2_1 <= data_store ^ s2_1;
					6'b011_001 : s3_1 <= data_store ^ s3_1;
					6'b100_001 : s4_1 <= data_store ^ s4_1;
						
					6'b000_010 : s0_2 <= data_store ^ s0_2;
					6'b001_010 : s1_2 <= data_store ^ s1_2;
					6'b010_010 : s2_2 <= data_store ^ s2_2;
					6'b011_010 : s3_2 <= data_store ^ s3_2;
					6'b100_010 : s4_2 <= data_store ^ s4_2;
					
					6'b000_011 : s0_3 <= data_store ^ s0_3;
					6'b001_011 : s1_3 <= data_store ^ s1_3;
					6'b010_011 : s2_3 <= data_store ^ s2_3;
					6'b011_011 : s3_3 <= data_store ^ s3_3;
					6'b100_011 : s4_3 <= data_store ^ s4_3;
						
					6'b000_100 : s0_4 <= data_store ^ s0_4;
					6'b001_100 : s1_4 <= data_store ^ s1_4;
					6'b010_100 : s2_4 <= data_store ^ s2_4;
					6'b011_100 : s3_4 <= data_store ^ s3_4;
					6'b100_100 : s4_4 <= data_store ^ s4_4;
						
					default : s0_0 <= 64'd0;
				endcase
			end
			else begin
				s0_0 <= s0_0;
				s1_0 <= s1_0;
				s2_0 <= s2_0;
				s3_0 <= s3_0;
				s4_0 <= s4_0;
				
				s0_1 <= s0_1;
				s1_1 <= s1_1;
				s2_1 <= s2_1;
				s3_1 <= s3_1;
				s4_1 <= s4_1;
						
				s0_2 <= s0_2;
				s1_2 <= s1_2;
				s2_2 <= s2_2;
				s3_2 <= s3_2;
				s4_2 <= s4_2;
						
				s0_3 <= s0_3;
				s1_3 <= s1_3;
				s2_3 <= s2_3;
				s3_3 <= s3_3;
				s4_3 <= s4_3;
					
				s0_4 <= s0_4;
				s1_4 <= s1_4;
				s2_4 <= s2_4;
				s3_4 <= s3_4;
				s4_4 <= s4_4;
			end
		end
	end
	
/////////////// theta //////////////////////////////
	always @( * )begin	
		theta0 = (s0_0 ^ s0_1) ^ (s0_2 ^ s0_3) ^ s0_4;
		theta1 = (s1_0 ^ s1_1) ^ (s1_2 ^ s1_3) ^ s1_4;
		theta2 = (s2_0 ^ s2_1) ^ (s2_2 ^ s2_3) ^ s2_4;
		theta3 = (s3_0 ^ s3_1) ^ (s3_2 ^ s3_3) ^ s3_4;
		theta4 = (s4_0 ^ s4_1) ^ (s4_2 ^ s4_3) ^ s4_4;
	end
			
///////////////// comea ///////////////////////////////
	always @( * )begin
		comea0_0 = s0_0 ^ theta4 ^ ( {theta1[62:0] , theta1[63]} );
		comea1_0 = s1_0 ^ theta0 ^ ( {theta2[62:0] , theta2[63]} );
		comea2_0 = s2_0 ^ theta1 ^ ( {theta3[62:0] , theta3[63]} );
		comea3_0 = s3_0 ^ theta2 ^ ( {theta4[62:0] , theta4[63]} );
		comea4_0 = s4_0 ^ theta3 ^ ( {theta0[62:0] , theta0[63]} );
		
		comea0_1 = s0_1 ^ theta4 ^ ( {theta1[62:0] , theta1[63]} );
		comea1_1 = s1_1 ^ theta0 ^ ( {theta2[62:0] , theta2[63]} );
		comea2_1 = s2_1 ^ theta1 ^ ( {theta3[62:0] , theta3[63]} );
		comea3_1 = s3_1 ^ theta2 ^ ( {theta4[62:0] , theta4[63]} );
		comea4_1 = s4_1 ^ theta3 ^ ( {theta0[62:0] , theta0[63]} );
		
		comea0_2 = s0_2 ^ theta4 ^ ( {theta1[62:0] , theta1[63]} );
		comea1_2 = s1_2 ^ theta0 ^ ( {theta2[62:0] , theta2[63]} );
		comea2_2 = s2_2 ^ theta1 ^ ( {theta3[62:0] , theta3[63]} );
		comea3_2 = s3_2 ^ theta2 ^ ( {theta4[62:0] , theta4[63]} );
		comea4_2 = s4_2 ^ theta3 ^ ( {theta0[62:0] , theta0[63]} );
			
		comea0_3 = s0_3 ^ theta4 ^ ( {theta1[62:0] , theta1[63]} );
		comea1_3 = s1_3 ^ theta0 ^ ( {theta2[62:0] , theta2[63]} );
		comea2_3 = s2_3 ^ theta1 ^ ( {theta3[62:0] , theta3[63]} );
		comea3_3 = s3_3 ^ theta2 ^ ( {theta4[62:0] , theta4[63]} );
		comea4_3 = s4_3 ^ theta3 ^ ( {theta0[62:0] , theta0[63]} );
		
		comea0_4 = s0_4 ^ theta4 ^ ( {theta1[62:0] , theta1[63]} );
		comea1_4 = s1_4 ^ theta0 ^ ( {theta2[62:0] , theta2[63]} );
		comea2_4 = s2_4 ^ theta1 ^ ( {theta3[62:0] , theta3[63]} );
		comea3_4 = s3_4 ^ theta2 ^ ( {theta4[62:0] , theta4[63]} );
		comea4_4 = s4_4 ^ theta3 ^ ( {theta0[62:0] , theta0[63]} );
	end

////////////////////// comeb ////////////////////////////////	
	always @ ( * )begin
		comeb0_0 = comea0_0;
		comeb1_0 = { comea1_1[19:0], comea1_1[63:20] };
		comeb2_0 = { comea2_2[20:0], comea2_2[63:21] };
		comeb3_0 = { comea3_3[42:0], comea3_3[63:43] };
		comeb4_0 = { comea4_4[49:0], comea4_4[63:50] };

		comeb0_1 = { comea3_0[35:0], comea3_0[63:36] };
		comeb1_1 = { comea4_1[43:0], comea4_1[63:44] };
		comeb2_1 = { comea0_2[60:0], comea0_2[63:61] };
		comeb3_1 = { comea1_3[18:0], comea1_3[63:19] };
		comeb4_1 = { comea2_4[2:0],  comea2_4[63:3] };
					
		comeb0_2 = { comea1_0[62:0], comea1_0[63] };
		comeb1_2 = { comea2_1[57:0], comea2_1[63:58] };
		comeb2_2 = { comea3_2[38:0], comea3_2[63:39] };
		comeb3_2 = { comea4_3[55:0], comea4_3[63:56] };
		comeb4_2 = { comea0_4[45:0], comea0_4[63:46] };
					
		comeb0_3 = { comea4_0[36:0], comea4_0[63:37] };
		comeb1_3 = { comea0_1[27:0], comea0_1[63:28] };
		comeb2_3 = { comea1_2[53:0], comea1_2[63:54] };
		comeb3_3 = { comea2_3[48:0], comea2_3[63:49] };
		comeb4_3 = { comea3_4[7:0], comea3_4[63:8] };
					
		comeb0_4 = { comea2_0[1:0], comea2_0[63:2] };
		comeb1_4 = { comea3_1[8:0], comea3_1[63:9] };
		comeb2_4 = { comea4_2[24:0], comea4_2[63:25] };
		comeb3_4 = { comea0_3[22:0], comea0_3[63:23] };
		comeb4_4 = { comea1_4[61:0], comea1_4[63:62] };
	end	
///////////////// comec ///////////////////////////////
	always @( * )begin
		comec0_0 = comeb0_0 ^ ( (~comeb1_0) & comeb2_0 ) ^ round_constant;
		comec1_0 = comeb1_0 ^ ( (~comeb2_0) & comeb3_0 );
		comec2_0 = comeb2_0 ^ ( (~comeb3_0) & comeb4_0 );
		comec3_0 = comeb3_0 ^ ( (~comeb4_0) & comeb0_0 );
		comec4_0 = comeb4_0 ^ ( (~comeb0_0) & comeb1_0 );
		
		comec0_1 = comeb0_1 ^ ( (~comeb1_1) & comeb2_1 );
		comec1_1 = comeb1_1 ^ ( (~comeb2_1) & comeb3_1 );
		comec2_1 = comeb2_1 ^ ( (~comeb3_1) & comeb4_1 );
		comec3_1 = comeb3_1 ^ ( (~comeb4_1) & comeb0_1 );
		comec4_1 = comeb4_1 ^ ( (~comeb0_1) & comeb1_1 );
		
		comec0_2 = comeb0_2 ^ ( (~comeb1_2) & comeb2_2 );
		comec1_2 = comeb1_2 ^ ( (~comeb2_2) & comeb3_2 );
		comec2_2 = comeb2_2 ^ ( (~comeb3_2) & comeb4_2 );
		comec3_2 = comeb3_2 ^ ( (~comeb4_2) & comeb0_2 );
		comec4_2 = comeb4_2 ^ ( (~comeb0_2) & comeb1_2 );
			
		comec0_3 = comeb0_3 ^ ( (~comeb1_3) & comeb2_3 );
		comec1_3 = comeb1_3 ^ ( (~comeb2_3) & comeb3_3 );
		comec2_3 = comeb2_3 ^ ( (~comeb3_3) & comeb4_3 );
		comec3_3 = comeb3_3 ^ ( (~comeb4_3) & comeb0_3 );
		comec4_3 = comeb4_3 ^ ( (~comeb0_3) & comeb1_3 );
		
		comec0_4 = comeb0_4 ^ ( (~comeb1_4) & comeb2_4 );
		comec1_4 = comeb1_4 ^ ( (~comeb2_4) & comeb3_4 );
		comec2_4 = comeb2_4 ^ ( (~comeb3_4) & comeb4_4 );
		comec3_4 = comeb3_4 ^ ( (~comeb4_4) & comeb0_4 );
		comec4_4 = comeb4_4 ^ ( (~comeb0_4) & comeb1_4 );
	end

/////////////////// f_fun_ok //////////////////////////
	//always @( posedge clk or negedge reset_n )begin
	always@(*) begin
		f_fun_ok = 1'b0;
		if (round == 5'd23)
			f_fun_ok = 1'b1;
		/*if( !reset_n )begin
			f_fun_ok <= 1'd0;
		end
		else begin
			if( round == 5'd22 )begin
				f_fun_ok <= 1'd1;
			end
			else begin
				f_fun_ok <= 1'd0;
			end
		end*/
	end
 
///////////////////// round ///////////////////////////
	always @( posedge clk or negedge reset_n )begin
		if( !reset_n )begin	
			round <= 5'd0;
		end
		else begin
			if( full_state == f_fun )begin
				round <= ( round == 5'd23 )? 5'd0 : round + 5'd1;
			end
			else begin
				round <= 5'd0;
			end
		end
	end
		
///////////////// round_constant	//////////////////////
	always @( * )begin
		case ( round )
			5'd0  : constant = 8'h01;
			5'd1  : constant = 8'h32;
			5'd2  : constant = 8'hBA;
			5'd3  : constant = 8'hE0;
			5'd4  : constant = 8'h3B;
			5'd5  : constant = 8'h41;
			5'd6  : constant = 8'hF1;
			5'd7  : constant = 8'hA9;
			5'd8  : constant = 8'h1A;
			5'd9  : constant = 8'h18;
			5'd10 : constant = 8'h69;
			5'd11 : constant = 8'h4A;
			5'd12 : constant = 8'h7B;
			5'd13 : constant = 8'h9B;
			5'd14 : constant = 8'hB9;
			5'd15 : constant = 8'hA3;
			5'd16 : constant = 8'hA2;
			5'd17 : constant = 8'h90;
			5'd18 : constant = 8'h2A;
			5'd19 : constant = 8'hCA;
			5'd20 : constant = 8'hF1;
			5'd21 : constant = 8'hB0;
			5'd22 : constant = 8'h41;
			5'd23 : constant = 8'hE8;
			default : constant = 8'h01;
		endcase
	end

////////////// round_constant ////////////////////////
	always @( * )begin
		round_constant = { constant[7], 31'd0, constant[6], 15'd0, constant[5], 7'd0, constant[4], 3'd0, constant[3:0] };
	end

////////////////*** f_out ***///////////////
	always @( posedge clk or negedge reset_n )begin
		if( !reset_n )begin
			f_out_ok <= 1'd0;
		end
		else begin
			if( full_state == f_out )begin
				if( outx == out_stopx && outz == out_stopz )begin
					f_out_ok <= 1'd1;
				end
				else begin 
					f_out_ok <= 1'd0;
				end
			end
			else begin
				f_out_ok <= 1'd0;
			end
		end
	end
	
/*	always @( posedge clk or negedge reset_n )begin
		if( !reset_n )begin
			data_cnt_state <= 1'd0;
		end
		else begin
			if( outx == out_stopx && outz == out_stopz )begin
				data_cnt_state <= 1'd0;
			end
			else if( full_state == f_fun && f_fun_ok == 1'd1 && flag == 1'd0 )begin
				data_cnt_state <= 1'd1;
			end
		end
	end*/
  
	always @( posedge clk or negedge reset_n )begin
		if( !reset_n )begin
			out_go <= 1'b0;
		end
		else begin
			if( f_out_ok == 1'd1 )begin//outx == out_stopx && outz == out_stopz
				out_go <= 1'd0;
			end
			else if ( full_state == f_out && signal == 1'd1 ) begin
				out_go <= 1'b1;
			end
		end
	end
	
	always @( posedge clk or negedge reset_n )begin
		if( !reset_n )begin
			outx <= 3'd0;
			outz <= 3'd0;
		end
		else begin
			if( signal == 1'b1 )begin
				outz <=  outz + 3'd1;
				outx <= ( outz == 3'd7 )? ( ( outx == 3'd7 )? 3'd0 : outx + 3'd1 ) : outx;
			end
			else begin 
				outz <= 3'd0;
				outx <= 3'd0;
			end
		end
	end
	
	always @( posedge clk or negedge reset_n )begin
		if( !reset_n )begin
			out_value <= 8'd0;
		end
		else begin
			case ( {outx, outz } )
				6'b000_000 : out_value <= s0_0[7:0];
				6'b000_001 : out_value <= s0_0[15:8];
				6'b000_010 : out_value <= s0_0[23:16];
				6'b000_011 : out_value <= s0_0[31:24];
				6'b000_100 : out_value <= s0_0[39:32];
				6'b000_101 : out_value <= s0_0[47:40];
				6'b000_110 : out_value <= s0_0[55:48];
				6'b000_111 : out_value <= s0_0[63:56];
				
				6'b001_000 : out_value <= s1_0[7:0];
				6'b001_001 : out_value <= s1_0[15:8];
				6'b001_010 : out_value <= s1_0[23:16];
				6'b001_011 : out_value <= s1_0[31:24];
				6'b001_100 : out_value <= s1_0[39:32];
				6'b001_101 : out_value <= s1_0[47:40];
				6'b001_110 : out_value <= s1_0[55:48];
				6'b001_111 : out_value <= s1_0[63:56];
				
				6'b010_000 : out_value <= s2_0[7:0];
				6'b010_001 : out_value <= s2_0[15:8];
				6'b010_010 : out_value <= s2_0[23:16];
				6'b010_011 : out_value <= s2_0[31:24];
				6'b010_100 : out_value <= s2_0[39:32];
				6'b010_101 : out_value <= s2_0[47:40];
				6'b010_110 : out_value <= s2_0[55:48];
				6'b010_111 : out_value <= s2_0[63:56];
			
				6'b011_000 : out_value <= s3_0[7:0];
				6'b011_001 : out_value <= s3_0[15:8];
				6'b011_010 : out_value <= s3_0[23:16];
				6'b011_011 : out_value <= s3_0[31:24];
				6'b011_100 : out_value <= s3_0[39:32];
				6'b011_101 : out_value <= s3_0[47:40];
				6'b011_110 : out_value <= s3_0[55:48];
				6'b011_111 : out_value <= s3_0[63:56];
				
				6'b100_000 : out_value <= s4_0[7:0];
				6'b100_001 : out_value <= s4_0[15:8];
				6'b100_010 : out_value <= s4_0[23:16];
				6'b100_011 : out_value <= s4_0[31:24];
				6'b100_100 : out_value <= s4_0[39:32];
				6'b100_101 : out_value <= s4_0[47:40];
				6'b100_110 : out_value <= s4_0[55:48];
				6'b100_111 : out_value <= s4_0[63:56];

				6'b101_000 : out_value <= s0_1[7:0];
				6'b101_001 : out_value <= s0_1[15:8];
				6'b101_010 : out_value <= s0_1[23:16];
				6'b101_011 : out_value <= s0_1[31:24];
				6'b101_100 : out_value <= s0_1[39:32];
				6'b101_101 : out_value <= s0_1[47:40];
				6'b101_110 : out_value <= s0_1[55:48];
				6'b101_111 : out_value <= s0_1[63:56];
			
				6'b110_000 : out_value <= s1_1[7:0];
				6'b110_001 : out_value <= s1_1[15:8];
				6'b110_010 : out_value <= s1_1[23:16];
				6'b110_011 : out_value <= s1_1[31:24];
				6'b110_100 : out_value <= s1_1[39:32];
				6'b110_101 : out_value <= s1_1[47:40];
				6'b110_110 : out_value <= s1_1[55:48];
				6'b110_111 : out_value <= s1_1[63:56];
				
				6'b111_000 : out_value <= s2_1[7:0];
				6'b111_001 : out_value <= s2_1[15:8];
				6'b111_010 : out_value <= s2_1[23:16];
				6'b111_011 : out_value <= s2_1[31:24];
				6'b111_100 : out_value <= s2_1[39:32];
				6'b111_101 : out_value <= s2_1[47:40];
				6'b111_110 : out_value <= s2_1[55:48];
				6'b111_111 : out_value <= s2_1[63:56];
				
				default : out_value <= s0_0[7:0];
			endcase
		end
	end
	//reg [63:0] temp;
	
/*	always@( posedge clk or negedge reset_n ) begin
		if ( !reset_n )
			temp <= 64'd0;
		else begin
			case (outx)
				3'd0:	temp <= s0_0;
				3'd1:	temp <= s1_0;
				3'd2: temp <= s2_0;
				3'd3: temp <= s3_0;
				3'd4: temp <= s4_0;
				3'd5: temp <= s0_1;
				3'd6: temp <= s1_1;
				3'd7: temp <= s2_1;
			endcase
		end
	end
	
	always@( posedge clk or negedge reset_n ) begin
		case ( outz )
			3'b000 : out_value <= temp[7:0];
			3'b001 : out_value <= temp[15:8];
			3'b010 : out_value <= temp[23:16];
			3'b011 : out_value <= temp[31:24];
			3'b100 : out_value <= temp[39:32];
			3'b101 : out_value <= temp[47:40];
			3'b110 : out_value <= temp[55:48];
			3'b111 : out_value <= temp[63:56];
		endcase
	end*/


endmodule
/*case ( {outx, outz } )
				6'b000_000 : out_value = s0_0[7:0];
				6'b000_001 : out_value = s0_0[15:8];
				6'b000_010 : out_value = s0_0[23:16];
				6'b000_011 : out_value = s0_0[31:24];
				6'b000_100 : out_value = s0_0[39:32];
				6'b000_101 : out_value = s0_0[47:40];
				6'b000_110 : out_value = s0_0[55:48];
				6'b000_111 : out_value = s0_0[63:56];
				
				6'b001_000 : out_value = s1_0[7:0];
				6'b001_001 : out_value = s1_0[15:8];
				6'b001_010 : out_value = s1_0[23:16];
				6'b001_011 : out_value = s1_0[31:24];
				6'b001_100 : out_value = s1_0[39:32];
				6'b001_101 : out_value = s1_0[47:40];
				6'b001_110 : out_value = s1_0[55:48];
				6'b001_111 : out_value = s1_0[63:56];
				
				6'b010_000 : out_value = s2_0[7:0];
				6'b010_001 : out_value = s2_0[15:8];
				6'b010_010 : out_value = s2_0[23:16];
				6'b010_011 : out_value = s2_0[31:24];
				6'b010_100 : out_value = s2_0[39:32];
				6'b010_101 : out_value = s2_0[47:40];
				6'b010_110 : out_value = s2_0[55:48];
				6'b010_111 : out_value = s2_0[63:56];
			
				6'b011_000 : out_value = s3_0[7:0];
				6'b011_001 : out_value = s3_0[15:8];
				6'b011_010 : out_value = s3_0[23:16];
				6'b011_011 : out_value = s3_0[31:24];
				6'b011_100 : out_value = s3_0[39:32];
				6'b011_101 : out_value = s3_0[47:40];
				6'b011_110 : out_value = s3_0[55:48];
				6'b011_111 : out_value = s3_0[63:56];
				
				6'b100_000 : out_value = s4_0[7:0];
				6'b100_001 : out_value = s4_0[15:8];
				6'b100_010 : out_value = s4_0[23:16];
				6'b100_011 : out_value = s4_0[31:24];
				6'b100_100 : out_value = s4_0[39:32];
				6'b100_101 : out_value = s4_0[47:40];
				6'b100_110 : out_value = s4_0[55:48];
				6'b100_111 : out_value = s4_0[63:56];

				6'b101_000 : out_value = s0_1[7:0];
				6'b101_001 : out_value = s0_1[15:8];
				6'b101_010 : out_value = s0_1[23:16];
				6'b101_011 : out_value = s0_1[31:24];
				6'b101_100 : out_value = s0_1[39:32];
				6'b101_101 : out_value = s0_1[47:40];
				6'b101_110 : out_value = s0_1[55:48];
				6'b101_111 : out_value = s0_1[63:56];
			
				6'b110_000 : out_value = s1_1[7:0];
				6'b110_001 : out_value = s1_1[15:8];
				6'b110_010 : out_value = s1_1[23:16];
				6'b110_011 : out_value = s1_1[31:24];
				6'b110_100 : out_value = s1_1[39:32];
				6'b110_101 : out_value = s1_1[47:40];
				6'b110_110 : out_value = s1_1[55:48];
				6'b110_111 : out_value = s1_1[63:56];
				
				6'b111_000 : out_value = s2_1[7:0];
				6'b111_001 : out_value = s2_1[15:8];
				6'b111_010 : out_value = s2_1[23:16];
				6'b111_011 : out_value = s2_1[31:24];
				6'b111_100 : out_value = s2_1[39:32];
				6'b111_101 : out_value = s2_1[47:40];
				6'b111_110 : out_value = s2_1[55:48];
				6'b111_111 : out_value = s2_1[63:56];
				
				default : out_value = s0_0[7:0];*/

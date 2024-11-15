`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:05:40 11/12/2024 
// Design Name: 
// Module Name:    NTT 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module NTT#(
    parameter BIT_LEN = 23
    )(
	input clk,
	input reset,
	input NTT_en,
	input [BIT_LEN-1:0] NTT_din,
    output reg NTT_wen,
	output reg [BIT_LEN-1:0] NTT_dout,
	output [7:0]NTT_addr
    );
	 
localparam [3:0]IDLE = 4'd0,
                OVER = 4'd1,
                S0 = 4'd2,
                S1 = 4'd3,
                S2 = 4'd4,
                S3 = 4'd5,
                S4 = 4'd6,
                S5 = 4'd7,
                S6 = 4'd8,
                S7 = 4'd9,
                S8 = 4'd10,
                S9 = 4'd11,
                S10 = 4'd12,
                S11 = 4'd13,
                S12 = 4'd14,
                S13 = 4'd15;

//zeta rom 
reg twiddle_en;
wire [7:0] twiddle_addr; 
wire [22:0] twiddle_do;
rom TWIDDLE_RAM1 (clk, twiddle_en, twiddle_addr,twiddle_do);

//variable definition str----------------------------
reg [3:0]curr_state;
reg [3:0]next_state;

reg [22:0]w[255:0];
reg [7:0]j;

reg [7:0]k;

reg [7:0]start;
reg [7:0]length;

wire [7:0]j_plusd_length;
wire [12:0]fd;

wire [22:0] BT_out0;
wire [22:0] BT_out1;

reg [22:0] zeta;

wire [7:0]fs;

assign fd = start + (length << 1);
assign fs = length >> 1;
// assign fd = start + 1'b1;
assign j_plusd_length = j + length;
assign NTT_addr = curr_state == IDLE ? 8'd0 : j + 1'b1;
assign twiddle_addr = k + 1'b1;

//variable definition end----------------------------

BT uut (
		.clk(clk), 
		.reset(reset), 
		.in0(w[j]), 
		.in1(w[j_plusd_length]), 
		.phi(zeta), 
		.out0(BT_out0), 
		.out1(BT_out1)
	);

//ALU sharing str----------------------------------

//ALU sharing end----------------------------------

//state control str----------------------------------
always @(posedge clk or negedge reset) begin
    if(!reset)curr_state <= IDLE;
    else curr_state <= next_state;
end

always @(*) begin
    case(curr_state)
        IDLE:begin
            if(NTT_en) next_state = S0;
            else next_state = IDLE;
        end
        S0:begin
			if(j == 255) next_state = S1;
            else next_state = S0;
        end
        S1:begin    
            next_state = S2;
        end
        S2:begin
            next_state = S3;
        end
        S3:begin
            if(j < start + length) next_state = S3;
            else next_state = S4;
            // next_state = S4;
        end
        S4:begin
            if(fd < 256) next_state = S2;
            else next_state = S5;
            // next_state = S5;
        end
        S5:begin
            // if(fs >= 1) next_state = S1;
            // else next_state = S6;
            next_state = S6;
        end
        S6:begin
            
        end
        S7:begin

        end
        S8:begin

        end
        S9:begin

        end
        S10:begin

        end
        S11:begin

        end
        S12:begin

        end
        S13:begin

        end
        OVER:begin

        end
        default: next_state = IDLE;
    endcase
end
//state control end----------------------------------

//RTL operation str----------------------------------
always @(posedge clk) begin
    case(curr_state)
        IDLE:begin
			k <= 8'd0;
            start <= 8'd0;
			length <= 8'd128;
            j <= 8'd0;
            
            twiddle_en <= 1'b0;
        end
        S0:begin
			w[j] <= NTT_din;
            j <= j + 1'b1;

            twiddle_en <= 1'b1;
        end
        S1:begin
            start <= 8'd0;
            
        end
        S2:begin
            k <= k + 1'b1;
            j <= start;
            zeta <= twiddle_do;
        end
        S3:begin
            w[j] <= BT_out0;
            w[j_plusd_length] <= BT_out1;
            j <= j + 1'b1;
        end
        S4:begin
            start <= fd;//how to change this to {a,b}
        end
        S5:begin
            length <= fs;
        end
        S6:begin
            
        end
        S7:begin

        end
        S8:begin

        end
        S9:begin

        end
        S10:begin

        end
        S11:begin

        end
        S12:begin

        end
        S13:begin

        end
        OVER:begin

        end
    endcase
end
//RTL operation end----------------------------------

endmodule

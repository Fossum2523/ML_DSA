`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/01 00:20:15
// Design Name: 
// Module Name: BT_unit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module BT_unit 
#(  parameter bit_len = 13)
(   
    input   clk,
    input   reset,
    input   en,
    input   [bit_len-1:0]A_in,
    input   [bit_len-1:0]B_in,
    input   [bit_len-1:0]zeta,
    output  reg [bit_len-1:0]A_out,
    output  reg [bit_len-1:0]B_out,
    output  reg valid
);

reg [1:0]curr_state;
reg [1:0]next_state;

reg [bit_len-1:0]multi;

assign en_BT = (en == 1'b1) & (valid == 1'b0);

always @(posedge clk or negedge reset) begin
    if(!reset)begin
        curr_state <= 2'd0;
    end
    else if(en_BT)begin
        curr_state <= next_state;
    end
end

always @(*) begin
    case (curr_state)
        2'd0:begin
            next_state <= 2'd1;
        end
        2'd1:begin
            next_state <= 2'd2;
        end
        2'd2:begin
            next_state <= 2'd3;
        end
        2'd3:begin
            next_state <= next_state;
        end
        default: 
            next_state <= 2'd0;
    endcase
end


always @(posedge clk or negedge reset) begin
    if(!reset)begin
        A_out <= 13'd0;
        B_out <= 13'd0;
        valid <= 1'b0;
    end
    if(en_BT)begin
        case (curr_state)
            2'd0:begin
                B_out <= B_in * zeta;
            end
            2'd1:begin
                B_out <= B_out % 13'd8380417;
            end
            2'd2:begin
                A_out <= A_in + B_out;
                B_out <= A_in - B_out;
            end
            2'd3:begin
                A_out <= A_out % 13'd8380417;
                B_out <= B_out % 13'd8380417;
                valid <= 1'b1;
            end
            default: 
                next_state <= 2'd0;
    endcase
    end
end

endmodule
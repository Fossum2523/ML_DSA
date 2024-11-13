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
#(  parameter bit_len = 14)
(   
    input   clk,
    input   reset,
    input   en,
    input   signed [bit_len-1:0] A_in,
    input   signed [bit_len-1:0] B_in,
    input   signed [bit_len-1:0] zeta,
    output  reg signed [bit_len-1:0] A_out,
    output  reg signed [bit_len-1:0] B_out,
    output  reg valid
);

reg [1:0] curr_state;
reg [1:0] next_state;

reg signed [2*bit_len-1:0] multi;

always @(posedge clk or negedge reset) begin
    if(!reset)begin
        curr_state <= 2'd0;
    end
    else begin
        curr_state <= next_state;
    end
end

always @(*) begin
    case (curr_state)
        2'd0:begin
            if(en)begin
                next_state <= 2'd1;
            end
            else begin
                next_state <= 2'd0;
            end
        end
        2'd1:begin
            next_state <= 2'd2;
        end
        2'd2:begin
            next_state <= 2'd3;
        end
        2'd3:begin
            next_state <= 2'd0;
        end
        default: 
            next_state <= 2'd0;
    endcase
end

always @(posedge clk or negedge reset) begin
    if(!reset)begin
        A_out <= 14'd0;
        B_out <= 14'd0;
        multi <= 46'd0;
        valid <= 1'b0;
    end
    else begin
        case (curr_state)
            2'd0:begin
                A_out <= 14'd0;
                B_out <= 14'd0;
                multi <= 46'd0;
                valid <= 1'b0;
                multi <= B_in * zeta;
            end
            2'd1:begin
                B_out <= multi % 14'd7681;
            end
            2'd2:begin
                A_out <= A_in + B_out;
                B_out <= A_in - B_out;
            end
            2'd3:begin
                A_out <= A_out % 14'd7681;
                if(B_out[13] == 1)begin
                    B_out <= (B_out + 14'd7681) % 14'd7681;
                end
                else begin
                    B_out <= B_out % 14'd7681;
                end
                valid <= 1'b1;
            end
            default: 
                next_state <= 2'd0;
        endcase
    end
end

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:18:25 11/06/2024 
// Design Name: 
// Module Name:    D_FF 
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
module D_FF(
    input clk,
    input reset,
    input d_in,
    output reg d_out
);

always @(posedge clk or negedge reset) begin
    if(!reset)begin
        d_out <= 1'b0;
    end
    else begin
        d_out <= d_in;
    end
end

endmodule

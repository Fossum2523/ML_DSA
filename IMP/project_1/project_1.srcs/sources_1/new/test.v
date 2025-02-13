`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/02/07 17:05:20
// Design Name: 
// Module Name: test
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


module test(
    input clk,
    input  reset,
    input start,
    output reg a
    );
    
    always @(posedge clk or negedge reset) begin
        if(!reset)
            a <= 1'b0;
        else 
            a <= 1'b1;
    end
endmodule

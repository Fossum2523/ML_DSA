`timescale 1ns / 1ps

module BRAM #(
    parameter DLEN = 23, 
    parameter HLEN = 10
    )(
    input                 clk,
    input                 wen,
    input      [HLEN-1:0] waddr,
    input      [DLEN-1:0] din,
    input      [HLEN-1:0] raddr,
    output     [DLEN-1:0] dout
    );

// bram
(* rom_style = "distributed" *) reg [DLEN-1:0] ram [(1<<HLEN)-1:0];

// read operation
    assign dout = ram[raddr];

// write operation
always @(posedge clk) begin
    if(wen)
        ram[waddr] <= din;
end


endmodule

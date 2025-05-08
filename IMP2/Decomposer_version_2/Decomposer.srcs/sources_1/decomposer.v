`timescale 1ns / 1ps

module decomposer #(
    parameter OUTPUT_W    = 2,
    parameter COEFF_W     = 23
    ) (
    input reset,
    input clk,
    input  valid_i,
    output ready_i,
    input  [OUTPUT_W*COEFF_W-1:0] di,
    output [OUTPUT_W*COEFF_W-1:0] doa,
    output [OUTPUT_W*COEFF_W-1:0] dob,
    output valid_o,
    input ready_o
    );
    
    wire [0:OUTPUT_W-1] valid_coeff_o;
    assign valid_o = &valid_coeff_o;
    wire [OUTPUT_W-1:0] ready_i_sub;
    assign ready_i = |ready_i_sub;
    
    
    genvar i;
    generate
        for (i = 0; i < OUTPUT_W; i = i + 1) begin
            coeff_decomposer COEFF_DECOMP(
                reset, clk, valid_i, ready_i_sub[i], di[COEFF_W*i+:COEFF_W],
                doa[COEFF_W*i+:COEFF_W], dob[COEFF_W*i+:COEFF_W], valid_coeff_o[i], ready_o
            );
        end
        
    endgenerate
    
endmodule

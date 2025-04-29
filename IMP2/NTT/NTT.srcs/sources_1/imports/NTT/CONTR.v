`timescale 1ns / 1ps

module CONTR#(
    parameter BIT_LEN = 23,
    parameter depth = 64
    )(
    input   clk,
    input   reset,
    input   mode,
    input   i_valid,
    output  [$clog2(128/(depth)) - 1:0]   zeta_addr                       
    );

    localparam  NTT_mode  = 1'b0,
                INTT_mode = 1'b1;

    (* shreg_extract = "no" *) reg [depth-1:0] triger_buf;
    
    reg     [$clog2(128/(depth)) - 1:0]     addr;

    assign zeta_addr = mode ? {($clog2(128/(depth))){1'b1}} - addr : addr;

    integer k;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            triger_buf <= {1'b1, {(depth-1){1'b0}}};
        end
        else if (i_valid) begin
            if (depth == 1)
                triger_buf <= triger_buf;
            else
                triger_buf <= {triger_buf[depth-2:0], triger_buf[depth-1]};
        end
    end



    always @(posedge clk or posedge reset) begin
        if(reset)
            addr <= {($clog2(128/(depth))){1'b0}};
        else
            addr <= addr + (i_valid & triger_buf[depth-1]);
    end

endmodule
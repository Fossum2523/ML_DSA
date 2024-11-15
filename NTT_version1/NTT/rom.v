
`timescale 1ns / 1ps
module rom #(parameter WIDTH=23, LENGTH=256, INIT_FILE="C:/Users/fossu/Desktop/NTT/NTT/zetas.txt") (clk,en,addr,do);
    input clk,en;
    input [$clog2(LENGTH)-1:0] addr;
    output [WIDTH-1:0] do;
    (* rom_style = "distributed" *) reg[WIDTH-1:0] ram [LENGTH-1:0];
    reg[WIDTH-1:0] do;
    
    always @(posedge clk) begin 
        if (en) begin
            do <= ram[addr];
        end
    end
    
    
    integer i;
    initial begin
        if (INIT_FILE != "") begin
            $readmemh(INIT_FILE, ram);
        end else begin
            for (i = 0; i < LENGTH; i = i + 1)
                ram[i] = 0;
        end
    end
    
endmodule
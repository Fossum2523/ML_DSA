module Dual_Port_Ram_Single_clk 
#(  parameter DLEN = 23, HLEN = 10 )( //256 * 4, s1 have four element
    input                     clk_a,
    input                     clk_b,
    input      [DLEN-1:0]     data_a,
    input      [DLEN-1:0]     data_b,
    input      [HLEN-1:0]     addr_a,
    input      [HLEN-1:0]     addr_b,
    input                     en_a,
    input                     en_b,
    input                     we_a,
    input                     we_b,
    output reg [DLEN-1:0]     q_a,
    output reg [DLEN-1:0]     q_b
);
    // Declare the RAM variable
    reg [DLEN-1:0] ram[(1<<HLEN)-1:0]; // Memory array size is 2^HLEN
    
    initial begin : ram_init
        integer i;
        for(i = 0; i < (1<<HLEN); i = i + 1) begin
            ram[i] = {DLEN{1'b0}};
        end
    end
    
    always @(posedge clk_a) begin
        if (en_a)begin
            if (we_a)
                ram[addr_a] <= data_a;
            q_a <= ram[addr_a];
        end
    end

    always @(posedge clk_b) begin
        if (en_b) begin
            if (we_b)
                ram[addr_b] <= data_b;
            q_b <= ram[addr_b];
        end
    end
endmodule

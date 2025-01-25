module Dual_Port_Ram_Single_clk 
#(  parameter DLEN = 23, HLEN = 10 )( //256 * 4, s1 have four element
    input                     clk,
    input      [DLEN-1:0]     data_a,
    input      [DLEN-1:0]     data_b,
    input      [HLEN-1:0]     addr_a,
    input      [HLEN-1:0]     addr_b,
    input                     we_a,
    input                     we_b,
    output reg [DLEN-1:0]     q_a,
    output reg [DLEN-1:0]     q_b
);
    // Declare the RAM variable
    reg [DLEN-1:0] ram[(1<<HLEN)-1:0]; // Memory array size is 2^HLEN

    // Port A
    always @ (posedge clk) begin
        if (we_a) begin
            ram[addr_a] <= data_a; // Write to memory
            q_a <= data_a;         // Output the same data being written
        end else begin
            q_a <= ram[addr_a];    // Read from memory
        end
    end

    // Port B
    always @ (posedge clk) begin
        if (we_b) begin
            ram[addr_b] <= data_b; // Write to memory
            q_b <= data_b;         // Output the same data being written
        end else begin
            q_b <= ram[addr_b];    // Read from memory
        end
    end

endmodule

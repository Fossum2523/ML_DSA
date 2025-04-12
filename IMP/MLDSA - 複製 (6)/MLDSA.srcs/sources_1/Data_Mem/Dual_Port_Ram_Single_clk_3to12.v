module Dual_Port_Ram_Single_clk_3to12 
#(  parameter DLEN = 12, HLEN = 8 )( //256 * 4, s1 have four element
    input                     clk_a,
    input                     clk_b,
    input      [DLEN-1:0]     data_a,
    input      [DLEN-1:0]     data_b,
    input      [HLEN-1:0]     addr_a,
    input      [HLEN-1:0]     addr_b,
    input                     en_a,
    input                     en_b,
    input      [3:0]          we_a,
    input      [3:0]          we_b,
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
            if (we_a[0]) ram[addr_a[HLEN-1:0]][2:0]  <= data_a[2:0];
            if (we_a[1]) ram[addr_a[HLEN-1:0]][5:3]  <= data_a[5:3];
            if (we_a[2]) ram[addr_a[HLEN-1:0]][8:6]  <= data_a[8:6];
            if (we_a[3]) ram[addr_a[HLEN-1:0]][11:9] <= data_a[11:9];
            q_a <= ram[addr_a];
        end
    end

    always @(posedge clk_b) begin
        if (en_b) begin
            if (we_b[0]) ram[addr_b[HLEN-1:0]][2:0]  <= data_b[2:0];
            if (we_b[1]) ram[addr_b[HLEN-1:0]][5:3]  <= data_b[5:3];
            if (we_b[2]) ram[addr_b[HLEN-1:0]][8:6]  <= data_b[8:6];
            if (we_b[3]) ram[addr_b[HLEN-1:0]][11:9] <= data_b[11:9];
            q_b <= ram[addr_b];
        end
    end

    // Port A
    // always @ (posedge clk) begin
    //     if (we_a) begin
    //         ram[addr_a] <= data_a; // Write to memory
    //         q_a <= data_a;         // Output the same data being written
    //     end else begin
    //         q_a <= ram[addr_a];    // Read from memory
    //     end
    // end
    
    

    // Port B
    // always @ (posedge clk) begin
    //     if (we_b) begin
    //         ram[addr_b] <= data_b; // Write to memory
    //         q_b <= data_b;         // Output the same data being written
    //     end else begin
    //         q_b <= ram[addr_b];    // Read from memory
    //     end
    // end

    
endmodule

module Dual_Port_Ram_Single_clk 
#(  parameter DLEN = 23,
    parameter HLEN = 10,
    parameter INIT_FILE = "C:/Users/USER/Desktop/ML_DSA_syn/IMP/NTT/NTT/NTT.srcs/sources_1/imports/NTT/s1.txt" 
    )( //256 * 4, s1 have four element
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

    // Port A
    // always @ (posedge clk) begin
    //     if (we_a) begin
    //         ram[addr_a] <= data_a; // Write to memory
    //         q_a <= data_a;         // Output the same data being written
    //     end else begin
    //         q_a <= ram[addr_a];    // Read from memory
    //     end
    // end
    
    always @(posedge clk_a) begin
        if (en_a)begin
            if (we_a)
                ram[addr_a] <= data_a;
            q_a <= ram[addr_a];
        end
    end

    // Port B
    // always @ (posedge clk) begin
    //     if (we_b) begin
    //         ram[addr_b] <= data_b; // Write to memory
    //         q_b <= data_b;         // Output the same data being written
    //     end else begin
    //         q_b <= ram[addr_b];    // Read from memory
    //     end
    // end

    always @(posedge clk_b) begin
        if (en_b) begin
            if (we_b)
                ram[addr_b] <= data_b;
            q_b <= ram[addr_b];
        end
    end

    integer i;
    initial begin
        if (INIT_FILE != "") begin
            $readmemh(INIT_FILE, ram);
        end else begin
            for (i = 0; i < (1<<HLEN); i = i + 1)
                ram[i] = 0;
        end
    end
endmodule

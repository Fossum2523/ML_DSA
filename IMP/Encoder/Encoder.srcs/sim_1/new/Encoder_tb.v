`timescale 1ns/1ps

module encoder_tb;

    // Parameters
    parameter OUTPUT_W = 2;
    parameter COEFF_W = 23;
    parameter MAX_LVL = 20;
    parameter W = 64;
    parameter INIT_FILE = "C:/Users/fossu/Desktop/ML_DSA_Syn/IMP/Encoder/Encoder.srcs/sim_1/new/s1.txt";

    // Testbench signals
    reg reset;
    reg clk;
    reg [2:0] sec_lvl;
    reg [2:0] encode_mode; 
    reg valid_i;
    wire ready_i;
    reg [OUTPUT_W*COEFF_W-1:0] di;
    wire [W-1:0] dout;
    wire valid_o;
    reg ready_o;
    reg [22:0] ram [1023:0]; // Memory array size is 2^HLEN
    integer i;

    // Instantiate the encoder module
    encoder #(
        .OUTPUT_W(OUTPUT_W),
        .COEFF_W(COEFF_W),
        .MAX_LVL(MAX_LVL),
        .W(W)
    ) uut (
        .reset(reset),
        .clk(clk),
        .sec_lvl(sec_lvl),
        .encode_mode(encode_mode),
        .valid_i(valid_i),
        .ready_i(ready_i),
        .di(di),
        .dout(dout),
        .valid_o(valid_o),
        .ready_o(ready_o)
    );
    
    // Clock generation
    always #5 clk = ~clk;
    
    initial begin
        if (INIT_FILE != "") begin
            $readmemh(INIT_FILE, ram);
        end
    end

    initial begin
        // Initialize signals
        clk = 1;
        reset = 1;
        sec_lvl = 3'd0;
        encode_mode = 3'd0;
        valid_i = 0;
        di = 0;
        ready_o = 0;
        #10;

        // Reset sequence
        reset = 0;
        #10;

        // Apply test vectors
        valid_i = 1;
        sec_lvl = 3'd2;
        encode_mode = 3'd2;
        ready_o = 1;
        for(i=0;i<512;i=i+1)begin
            di = {ram[i*2 + 1], ram[i*2]};
            #10;
        end

        // ready_o = 1;
        valid_i = 0;
        
        #50;
        $stop;
    end
    
    // Monitor output
    initial begin
        $monitor("Time=%0t | dout=%h | valid_o=%b", $time, dout, valid_o);
    end

endmodule

`timescale 1ns / 1ps

module Keccak_Dilithium_tb();

    // Inputs
    reg clk;
    reg reset;
    reg [63:0] in;
    reg in_ready;
    reg is_last;
    reg squeeze;
    reg mode;
    reg sha_hold;
    reg [1:0] byte_num;

    // Outputs
    wire buffer_full;
    wire buffer_last;
    wire [1343:0] out;
    wire out_ready;

    // Instantiate the Unit Under Test (UUT)
    Keccak_Dilithium uut (
        .clk(clk),
        .reset(reset),
        .in(in),
        .in_ready(in_ready),
        .is_last(is_last),
        .squeeze(squeeze),
        .mode(mode),
        .sha_hold(sha_hold),
        .byte_num(byte_num),
        .buffer_full(buffer_full),
        .buffer_last(buffer_last),
        .out(out),
        .out_ready(out_ready)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100 MHz clock
    end

    // Test stimulus
    initial begin
        // Initialize Inputs
        reset = 1;
        in = 64'd0;
        in_ready = 0;
        is_last = 0;
        squeeze = 0;
        mode = 0; // G mode
        sha_hold = 0;
        byte_num = 2'd0;

        // Wait for global reset
        #100;
        #1;
        reset = 0;

        //padder
        mode = 2'b00; // G mode
        in_ready = 1;
        byte_num = 2'b01;

        in =  64'b1101011111110100101000100011001001100101101111001110110010100101;
        #10;
        in =  64'b0011010011011100011010100110110110000001110000010100101001100000;
        #10;
        in =  64'b0110100000011101010100001011010111110110101010010101111011111101;
        #10;
        in =  64'b1101001100000010101011000000101110000100100011101000010101110001;
        #10;  
        is_last = 1;
        in =  64'b0000000000000000000000000000000000000000111110000010000000100000;
        #10;
        is_last = 0;
        
        wait(out_ready);
        #100;
        $finish;
    end

    always @(posedge clk)begin
		if(out_ready)$display("out: %h.", out[1343:0]);
	end
endmodule

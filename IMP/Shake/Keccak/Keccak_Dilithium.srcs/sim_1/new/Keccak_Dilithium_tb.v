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
    reg [2:0] byte_num;

    // Outputs
    wire buffer_full;
    wire buffer_last;
    wire [1343:0] out;
    wire out_ready;

    wire       [1343:0]   padder_out;
    wire                  padder_out_ready;
    wire       [1599:0]   f_out;
    wire                  f_out_ready;
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
        .out_ready(out_ready),
        .padder_out(padder_out),
        .padder_out_ready(padder_out_ready),
        .f_out(f_out),
        .f_out_ready(f_out_ready)
    );

    // Clock generation
    initial begin
        clk = 1;
        forever #5 clk = ~clk; // 100 MHz clock
    end

    // Test stimulus
    initial begin
        // Initialize Inputs
        reset = 0;
        in = 64'd0;
        in_ready = 0;
        is_last = 0;
        squeeze = 0;
        mode = 0; // G mode
        sha_hold = 0;
        byte_num = 3'd0;

        // Wait for global reset
        #100;
        #1;
        reset = 1;

        //padder
        mode = 2'b01; // G mode
        in_ready = 1;
        byte_num = 3'b001;

        // //in =  64'b1101011111110100101000100011001001100101101111001110110010100101;
        // in = 64'hFFFFFFFFFFFFFFFF;
        // #10;
        // //in =  64'b0011010011011100011010100110110110000001110000010100101001100000;
        // in = 64'hFFFFFFFFFFFFFFFF;
        // #10;
        // //in =  64'b0110100000011101010100001011010111110110101010010101111011111101;
        // in = 64'hFFFFFFFFFFFFFFFF;
        // #10;
        // //in =  64'b1101001100000010101011000000101110000100100011101000010101110001;
        // in = 64'hFFFFFFFFFFFFFFFF;
        // #10;  
        // //in =  64'b0000000000000000000000000000000000000000111110000010000000100000;
        // in = 64'h0000000000000404;
        in = 64'hFFFFFFFFFFFFFFFF;
        #170; 
        #10;
        in = 64'hFFFFFFFFFFFFFFFF;
        #30;
        in = 64'hFFFFFFFFFFFFFFFF;
        is_last = 1;
        #10
        in_ready = 0;
        is_last = 0;
        
        #1000;
        reset = 0;
        #20;
        reset = 1;
        in_ready = 1;
        byte_num = 3'b001;
        in = 64'hFFFFFFFFFFFFFFFF;
        #170; 
        #10;
        in = 64'hFFFFFFFFFFFFFFFF;
        #30;
        in = 64'hFFFFFFFFFFFFFFFF;
        is_last = 1;
        #10
        in_ready = 0;
        is_last = 0;
        // squeeze = 1'b1;
        // #10;
        // squeeze = 1'b0;
        // wait(out_ready);
        #100;
        $finish;
    end
    always @(posedge clk ) begin
        if(f_out_ready)$display("f_out: %h.", f_out);
    end
    always @(posedge clk ) begin
        if(padder_out_ready)$display("padder_out: %h.", padder_out);
    end
    always @(posedge clk)begin
		if(out_ready)$display("out: %h.", out[1343:0]);
	end
endmodule

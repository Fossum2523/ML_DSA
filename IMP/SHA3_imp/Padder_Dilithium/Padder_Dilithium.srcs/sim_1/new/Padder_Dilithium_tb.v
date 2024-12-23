`timescale 1ns / 1ps
module Padder_Dilithium_tb;

  // Inputs
  reg clk;
  reg reset;
  reg [63:0] in;
  reg in_ready;
  reg is_last;
  reg [1:0] mode;
  reg [1:0] byte_num;
  reg f_ack;

  // Outputs
  wire buffer_full;
  wire i_last;
  wire [1343:0] out;
  wire out_ready;

  // Instantiate the Unit Under Test (UUT)
  Padder_Dilithium uut (
    .clk(clk),
    .reset(reset),
    .in(in),
    .in_ready(in_ready),
    .is_last(is_last),
    .mode(mode),
    .byte_num(byte_num),
    .f_ack(f_ack),
    .buffer_full(buffer_full),
    .i_last(i_last),
    .out(out),
    .out_ready(out_ready)
  );

  // Clock generation
  always begin
        clk = ~clk; // 100 MHz clock
        #5;
  end

  
  // Testbench logic
  initial begin
    // Initialize inputs
    clk = 1;
    reset = 1;
    in = 0;
    in_ready = 0;
    is_last = 0;
    mode = 2'b00;
    byte_num = 2'b00;
    f_ack = 0;

    // Apply reset
    #100;
    #1;
    reset = 0;

    // Test Case 1: Normal data input and buffer filling
    mode = 2'b00; // G mode
    in_ready = 1;
    byte_num = 2'b01;

    // repeat (19) begin
    //   in = $random;
    //   #10;
    // end
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

    // // Test Case 2: Last input data
    // is_last = 1;
    // in = 64'hDEADBEEFCAFEBABE;
    // #10;
    // is_last = 0;

    // // Test Case 3: Acknowledge signal
    // f_ack = 1;
    // #10;
    // f_ack = 0;

    // // Test Case 4: Buffer full condition
    // mode = 2'b00; // G mode
    // #10;

    // // Test Case 5: Reset behavior
    // reset = 1;
    // #10;
    // reset = 0;
    wait(out_ready);
    // End of simulation
    #100;
    $stop;
  end

  always @(posedge clk)begin
		if(out_ready)$display("out: %h.", out);
	end

endmodule

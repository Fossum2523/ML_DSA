// // Clock generation
    // initial begin
    //     clk = 0;
    //     forever #5 clk = ~clk; // 100 MHz clock
    // end

    // // Test stimulus
    // initial begin
    //     // Initialize Inputs
    //     reset = 1;
    //     in = 64'd0;
    //     in_ready = 0;
    //     is_last = 0;
    //     squeeze = 0;
    //     mode = 0; // G mode
    //     sha_hold = 0;
    //     byte_num = 2'd0;

    //     // Wait for global reset
    //     #100;
    //     #1;
    //     reset = 0;

    //     //padder
    //     mode = 2'b00; // G mode
    //     in_ready = 1;
    //     byte_num = 2'b01;

    //     in =  64'b1101011111110100101000100011001001100101101111001110110010100101;
    //     #10;
    //     in =  64'b0011010011011100011010100110110110000001110000010100101001100000;
    //     #10;
    //     in =  64'b0110100000011101010100001011010111110110101010010101111011111101;
    //     #10;
    //     in =  64'b1101001100000010101011000000101110000100100011101000010101110001;
    //     #10;  
    //     is_last = 1;
    //     in =  64'b0000000000000000000000000000000000000000111110000010000000100000;
    //     #10;
    //     is_last = 0;
        
    //     wait(out_ready);
    //     #100;
    //     $finish;
    // end

    // always @(posedge clk)begin
	// 	if(out_ready)$display("out: %h.", out[1343:0]);
	// end

`timescale 1ns/1ps

module ExpandS_tb;

    parameter DLEN = 64;
    parameter HLEN = 3;

    reg [63:0] seed_in;
    reg seed_in_ready;
    reg fg;

    wire [63:0] in;
    wire in_ready;
    // Inputs
    reg clk;
    reg reset;
    reg shake_in_ready;
    reg [1343:0] shake_in;
    reg sample_in_ready;

    // Outputs
    wire Rho_prime_wen;
    wire [HLEN-1:0] Rho_prime_waddr;
    wire [DLEN-1:0] Rho_prime_din;
    wire [HLEN-1:0] Rho_prime_raddr;
    wire [DLEN-1:0] sample_out;
    wire sample_ready;
    wire is_last;
    wire squeeze;
    wire sha_mode;
    wire sha_hold;
    wire [1:0] byte_num;

    // Instantiate the Unit Under Test (UUT)
    ExpandS #(DLEN, HLEN) uut (
        .clk(clk),
        .reset(reset),
        .Rho_prime_wen(Rho_prime_wen),
        .Rho_prime_waddr(Rho_prime_waddr),
        .Rho_prime_din(Rho_prime_din),
        .Rho_prime_raddr(Rho_prime_raddr),
        .Rho_prime_dout(64'hDEADBEEFDEADBEEF),
        .sample_out(sample_out),
        .sample_ready(sample_ready),
        .is_last(is_last),
        .squeeze(squeeze),
        .sha_mode(sha_mode),
        .sha_hold(sha_hold),
        .byte_num(byte_num),
        .shake_in(shake_in),
        .shake_in_ready(shake_in_ready),
        .sample_in_ready(sample_in_ready)
    );

    Keccak_Dilithium uut2 (
        .clk(clk),
        .reset(reset),
        .in(in),
        .in_ready(in_ready),
        .is_last(is_last),
        .squeeze(squeeze),
        .mode(shake_mode),
        .sha_hold(sha_hold),
        .byte_num(byte_num),
        .buffer_full(buffer_full),
        .buffer_last(buffer_last),
        .out(shake_in),
        .out_ready(shake_in_ready)
    );

    assign in = fg ? seed_in : sample_out;
    assign in_ready = fg ? seed_in_ready : sample_ready;

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Testbench logic
    initial begin
        // Initialize inputs
        reset = 1;
        shake_in_ready = 0;
        shake_in = 1344'h0;
        sample_in_ready = 0;

        // Apply reset
        #20 reset = 0;

        // Stimulate inputs
        #10;
        shake_in = 1344'h123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0;
        shake_in_ready = 1;

        // Wait and observe
        #20;
        shake_in_ready = 0;

        // Enable sample input ready
        sample_in_ready = 1;
        #40;
        sample_in_ready = 0;

        // End simulation
        #100;
        $stop;
    end

    // Monitor signals
    initial begin
        $monitor($time, 
                 "clk=%b, reset=%b, shake_in_ready=%b, shake_in=%h, Rho_prime_wen=%b, Rho_prime_waddr=%d, Rho_prime_din=%h, Rho_prime_raddr=%d, sample_ready=%b, sample_out=%h",
                 clk, reset, shake_in_ready, shake_in, Rho_prime_wen, Rho_prime_waddr, Rho_prime_din, Rho_prime_raddr, sample_ready, sample_out);
    end

endmodule

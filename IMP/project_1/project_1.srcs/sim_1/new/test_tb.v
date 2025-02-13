`timescale 1ns / 1ps

module tb_test;

    // Testbench signals
    reg clk;
    reg reset;
    reg start;
    wire a;

    // Instantiate the test module
    test uut (
        .clk(clk),
        .reset(reset),
        .start(start),
        .a(a)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100 MHz clock
    end

    // Task to apply reset
    task apply_reset;
        begin
            reset = 1;
            #20;
            reset = 0;
            #100;
            reset = 1;
        end
    endtask

    // Test sequence
    initial begin
        // Initialize signals
        start = 0;

        // Apply reset
        apply_reset();

        // Test case 1: Start signal high
        #10 start = 1;
        #20 start = 0;

        // Test case 2: Toggle start signal
        #30 start = 1;
        #10 start = 0;
        #10 start = 1;
        #10 start = 0;

        // Finish simulation
        #50 $finish;
    end

    // Monitor outputs during simulation
    initial begin
        $monitor($time, " clk=%b, reset=%b, start=%b, a=%b", clk, reset, start, a);
    end

endmodule
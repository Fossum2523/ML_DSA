`timescale 1ns/1ps

module Modular_Reduction_tb;

    // Parameters
    reg clk;
    reg reset;
    reg [45:0] in;
    wire [22:0] out;

    // Instantiate the module under test (MUT)
    Modular_Reduction MUT (
        .clk(clk),
        .reset(reset),
        .in(in),
        .out(out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #10 clk = ~clk; // 100MHz clock
    end

    // Test stimulus
    initial begin
        // Initialize inputs
        reset = 1;
        in = 46'd0;

        // Apply reset
        #40;
        reset = 0;

        // Test Case 1
        in = 46'h123456789ABC;
        #20;

        // Test Case 2
        in = 46'h3FFFFFFFFFFF;
        #20;

        // Test Case 3
        in = 46'h000000000001;
        #20;

        // Test Case 4
        in = 46'h2AAAAAAA5555;
        #20;

        // Test Case 5
        in = 46'h155555555555;
        #20;

        // Random Test
//        repeat (10) begin
//            in = $random;
//            #10;
//        end

        // Finish Simulation
        #20;
        $finish;
    end

    // Monitoring outputs
    initial begin
        $monitor("time=%0t reset=%b in=%h out=%h", $time, reset, in, out);
    end

endmodule
`timescale 1ns / 1ps

module tb_Modular_Reduction;

    // Testbench signals
    reg  [45:0] in;
    wire [22:0] out;

    // Instantiate the Modular_Reduction module
    Modular_Reduction uut (
        .in(in),
        .out(out)
    );

    // Test sequence
    initial begin
        // Initialize input
        in = 46'd0;

        // Test case 1: Zero input
        #10 in = 46'd0;
        #10;

        // Test case 2: Maximum input value
        in = 46'h3FFFFFFFFFFF; // Max 46-bit value
        #10;

        // Test case 3: Mid-range value
        in = 46'd123456789;
        #10;

        // Test case 4: Edge case value
        in = 46'd8380416; // Close to the modulus if using typical reduction
        #10;

        // Test case 5: Random value
        in = 46'd987654321;
        #10;
        
        // Test case 5: Random value
        in = 46'd42344409747208;
        #10;
        
        // Finish simulation
        #50 $finish;
    end

    // Monitor outputs during simulation
    initial begin
        $monitor($time, " in=%h, out=%h", in, out);
    end

endmodule

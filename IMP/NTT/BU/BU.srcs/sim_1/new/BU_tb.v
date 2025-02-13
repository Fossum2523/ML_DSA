`timescale 1ns / 1ps

module tb_BU;

    // Parameters
    parameter BIT_LEN = 23;
    parameter q = 8380417;

    // Testbench signals
    reg [BIT_LEN-1:0] in0;
    reg [BIT_LEN-1:0] in1;
    reg [BIT_LEN-1:0] phi;
    wire [BIT_LEN-1:0] out0;
    wire [BIT_LEN-1:0] out1;

    // Instantiate the BU module
    BU #(.BIT_LEN(BIT_LEN), .q(q)) uut (
        .in0(in0),
        .in1(in1),
        .phi(phi),
        .out0(out0),
        .out1(out1)
    );

    // Test sequence
    initial begin
        // Initialize inputs
        in0 = 23'd0;
        in1 = 23'd0;
        phi = 23'd1;

        // Test case 1: Zero inputs
        #10 in0 = 23'd0; in1 = 23'd0; phi = 23'd1;
        #10;

        // Test case 2: Max values
        in0 = 23'd8380416; in1 = 23'd8380416; phi = 23'd8380416;
        #10;

        // Test case 3: Mid-range values
        in0 = 23'd4190208; in1 = 23'd4190208; phi = 23'd4190208;
        #10;

        // Test case 4: Random values
        in0 = 23'd1234567; in1 = 23'd7654321; phi = 23'd5000000;
        #10;

        // Test case 5: Edge values
        in0 = 23'd1; in1 = 23'd8380416; phi = 23'd2;
        #10;

        // Finish simulation
        #50 $finish;
    end

    // Monitor outputs during simulation
    initial begin
        $monitor($time, " in0=%d, in1=%d, phi=%d, out0=%d, out1=%d", in0, in1, phi, out0, out1);
    end

endmodule

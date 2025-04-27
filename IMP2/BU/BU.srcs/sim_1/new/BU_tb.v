`timescale 1ns / 1ps

module tb_BU;

    // Parameters
    parameter BIT_LEN = 23;
    parameter q = 8380417;

    // Testbench signals
    reg reset ;
    reg clk;
    reg i_valid;
    reg               mode;
    reg [BIT_LEN-1:0] a;
    reg [BIT_LEN-1:0] b;
    reg [BIT_LEN-1:0] zeta;
    wire [BIT_LEN-1:0] out_a;
    wire [BIT_LEN-1:0] out_b;
    wire o_valid;


    // Instantiate the BU module
    BU uut (
        .clk(clk),
        .reset(reset),
        .i_valid(i_valid),
        .mode(mode),
        .a(a),
        .b(b),
        .zeta(zeta),
        .o_valid(o_valid),
        .out_a(out_a),
        .out_b(out_b)
    );

    always begin
        clk = ~clk;
        #5;
    end
    // Test sequence
    initial begin
        clk = 0;
        i_valid = 0;
        reset = 1;
        #100
        reset = 0;
        mode = 0;
//        #1;
        // Initialize inputs
        a = 23'd0;
        b = 23'd0;
        zeta = 23'd1;
        #10

        // Test case 1: Zero inputs
        i_valid = 1;
        a = 23'd0; b = 23'd0; zeta = 23'd1;
        #10;

        // Test case 2: Max values
        i_valid = 1;
        a = 23'd8380416; b = 23'd8380416; zeta = 23'd8380416;
        #10;

        // Test case 3: Mid-range values
        i_valid = 1;
        a = 23'd4190208; b = 23'd4190208; zeta = 23'd4190208;
        #10;

        // Test case 4: Random values
        i_valid = 1;
        a = 23'd1234567; b = 23'd7654321; zeta = 23'd5000000;
        #10;

        // Test case 5: Edge values
        i_valid = 1;
        a = 23'd1; b = 23'd8380416; zeta = 23'd2;
        #10;

        i_valid = 0;

        // Finish simulation
        #50 $finish;
    end

    // Monitor outputs during simulation
    initial begin
        $monitor($time, " a=%d, b=%d, zeta=%d, out_a=%d, out_b=%d", a, b, zeta, out_a, out_b);
    end

endmodule

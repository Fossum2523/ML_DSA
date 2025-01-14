`timescale 1ns / 1ps

module tb_mux_gen;

    // Testbench parameters
    parameter param_in = 1344;
    parameter param_m = 8;
    parameter param_n = 136;

    // Testbench signals
    reg  [param_in - 1 : 0] in;
    reg  [$clog2(param_n) - 1 : 0] sel;
    wire [param_m - 1 : 0] out;

    // Instantiate the mux_gen module
    mux_gen #(
        .param_in(param_in),
        .param_m(param_m),
        .param_n(param_n)
    ) uut (
        .in(in),
        .sel(sel),
        .out(out)
    );

    // // Task to initialize input data
    // task initialize_input;
    //     integer i;
    //     begin
    //         for (i = 0; i < param_n; i = i + 1) begin
    //             in[(i + 1) * param_m - 1 : i * param_m] = i; // Assign each segment of `in` a unique value
    //         end
    //     end
    // endtask

    // Test procedure
    initial begin
        // Initialize signals
        in = 1344'h53bf73fc45a768c77aec54b96d65da20d0baa970640f7410232c5a64d84f854642ff782c849957e7502cb0b9e3acd41c2e6ce9e4a5dc9f3d5eb2339d8c0f34e08a145d5283f326a24c1d6b055c1d0e0a34e522cefc25564a38822716f4c02c55d5f79dce56aa7e0b264321aeaec2b2c7893195347e542e9da95168d4442c7de17c675b5d66a51bdf;
        sel = 0;

        // Apply test cases
        #10 sel = 0;  // Test case 1: Select the first input
        #10 sel = 1;  // Test case 2: Select the second input
        #10 sel = 10; // Test case 3: Select the 11th input
        #10 sel = param_n - 1; // Test case 4: Select the last input
        #10 sel = param_n; // Test case 5: Out of range (should output 'h0 based on design)

        // Finish simulation
        #10 $finish;
    end

    // Monitor output during simulation
    initial begin
        $monitor($time, " sel=%d, out=%h", sel, out);
    end

endmodule

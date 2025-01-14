`timescale 1ns / 1ps

module tb_Sampler;

    // Parameters
    parameter SAMPLER_WIDTH = 1344;

    // Testbench signals
    reg                   clk;
    reg                   reset;
    reg                   sampler_in_ready;
    reg  [SAMPLER_WIDTH-1:0] sampler_in;

    wire                  sampler_squeeze;
    wire                  next_element;
    wire [22:0]           z0;
    wire [22:0]           z1;
    wire [9:0]            waddr_z0;
    wire [9:0]            waddr_z1;
    wire                  wen_z;

    // Instantiate the Sampler module
    Sampler uut (
        .clk(clk),
        .reset(reset),
        .sampler_in_ready(sampler_in_ready),
        .sampler_in(sampler_in),
        .sampler_squeeze(sampler_squeeze),
        .next_element(next_element),
        .z0(z0),
        .z1(z1),
        .waddr_z0(waddr_z0),
        .waddr_z1(waddr_z1),
        .wen_z(wen_z)
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
            #100;
            reset = 0;
        end
    endtask

    // Task to send input
    task send_input;
        input [SAMPLER_WIDTH-1:0] data;
        begin
            sampler_in_ready = 1;
            sampler_in = data;
            #10;
            sampler_in_ready = 0;
        end
    endtask

    // Test sequence
    initial begin
        // Initialize signals
        sampler_in_ready = 0;
        sampler_in = 0;

        // Apply reset
        apply_reset();

        // Test case 1: Send input data
        
        //s0_0
        /***Test Squeeze***/
        #10 send_input(1344'h0000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffff20d0baa970640f7410232c5a64d84f854642ff782c849957e7502cb0b9e3acd41c2e6ce9e4a5dc9f3d5eb2339d8c0f34e08a145d5283f326a24c1d6b055c1d0e0a34e522cefc25564a38822716f4c02c55d5f79dce56aa7e0b264321aeaec2b2c7893195347e542e9da95168d4442c7de17c675b5d66a51f);
        wait(sampler_squeeze);
        #170; //padder
        #240; //f_p
        #10 send_input(1344'h0000000000000000000000000000000000000000000000000000000000000000e0218aa63a8d55e8c73e8806f1f0b46beb012e869fe38398a897a2bf4f3f45790275f275506a4f9c3f8cb944de59a8eb12ff1d4637e35d306a485f486c707148fb29ec61733ef9ccac3c74bd364df7ca9fe80b418626d2a09eaa7895fcadea693ddb067241160c4aea28e6261caafd9a9b6d87384e11f919b63bfa7dd30512f6188bd98dc6f556dd);
        wait(next_element);

        //s0_1
        #170; //padder
        #240; //f_p
        #10 send_input(1344'h000000000000000000000000000000000000000000000000000000000000000053bf73fc45a768c77aec54b96d65da20d0baa970640f7410232c5a64d84f854642ff782c849957e7502cb0b9e3acd41c2e6ce9e4a5dc9f3d5eb2339d8c0f34e08a145d5283f326a24c1d6b055c1d0e0a34e522cefc25564a38822716f4c02c55d5f79dce56aa7e0b264321aeaec2b2c7893195347e542e9da95168d4442c7de17c675b5d66a51bdf);
        wait(next_element);

        //s0_2
        #170; //padder
        #240; //f_p
        #10 send_input(1344'h000000000000000000000000000000000000000000000000000000000000000053bf73fc45a768c77aec54b96d65da20d0baa970640f7410232c5a64d84f854642ff782c849957e7502cb0b9e3acd41c2e6ce9e4a5dc9f3d5eb2339d8c0f34e08a145d5283f326a24c1d6b055c1d0e0a34e522cefc25564a38822716f4c02c55d5f79dce56aa7e0b264321aeaec2b2c7893195347e542e9da95168d4442c7de17c675b5d66a51bdf);
        wait(next_element);

        //s0_3
        #170; //padder
        #240; //f_p
        #10 send_input(1344'h000000000000000000000000000000000000000000000000000000000000000053bf73fc45a768c77aec54b96d65da20d0baa970640f7410232c5a64d84f854642ff782c849957e7502cb0b9e3acd41c2e6ce9e4a5dc9f3d5eb2339d8c0f34e08a145d5283f326a24c1d6b055c1d0e0a34e522cefc25564a38822716f4c02c55d5f79dce56aa7e0b264321aeaec2b2c7893195347e542e9da95168d4442c7de17c675b5d66a51bdf);
        
        
        
        // Finish simulation
        #100 $finish;
    end

    // Monitor outputs during simulation
    initial begin
        $monitor($time, " sampler_squeeze=%b, next_element=%b, z0=%h, z1=%h, waddr_z0=%d, waddr_z1=%d, wen_z=%b", 
            sampler_squeeze, next_element, z0, z1, waddr_z0, waddr_z1, wen_z);
    end

endmodule

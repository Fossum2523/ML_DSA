   `timescale 1ns / 1ps
module Sampler_tb;

    // Parameters
    parameter SAMPLER_WIDTH = 1344;
    parameter DLEN = 23;
    parameter HLEN = 10;


    // Testbench signals
    reg                   clk;
    reg                   reset;
    reg  [1:0]            mode;
    reg                   sampler_in_ready;
    reg  [SAMPLER_WIDTH-1:0] sampler_in;

    wire                  sampler_squeeze;
    wire                  next_element;
    wire [22:0]           z0;
    wire [22:0]           z1;
    wire [9:0]            addr_z0;
    wire [9:0]            addr_z1;
    wire                  en_A;
    wire                  we_z;
    
    wire [22:0]           A0;
    wire [22:0]           A1;
    wire [11:0]           addr_A0;
    wire [11:0]           addr_A1;
    wire                  en_A;
    wire                  we_A;

    // c signals
    wire [22:0]           ci;
    wire [22:0]           cj;
    wire [7:0]            addr_ci;
    wire [7:0]            addr_cj;
    wire                  en_ci;
    wire                  en_cj;
    wire                  we_ci;
    wire                  we_cj;

    wire [DLEN-1:0] c_q_a, c_q_b;


    // Instantiate the Sampler module
    Sampler uut (
        .clk(clk),
        .reset(reset),
        .mode(mode),
        .sampler_in_ready(sampler_in_ready),
        .sampler_in(sampler_in),
        .sampler_squeeze(sampler_squeeze),
        .next_element(next_element),

        .z0(z0),
        .z1(z1),
        .addr_z0(addr_z0),
        .addr_z1(addr_z1),
        .en_z(en_z),
        .we_z(we_z),

        .A0(A0),
        .A1(A1),
        .addr_A0(addr_A0),
        .addr_A1(addr_A1),
        .en_A(en_A),
        .we_A(we_A),

        .ci(ci),
        .cj(cj),
        .addr_ci(addr_ci),
        .addr_cj(addr_cj),
        .en_ci(en_ci),
        .en_cj(en_cj),
        .we_ci(we_ci),
        .we_cj(we_cj)
    );

    Data_Mem DM(
        .clk(clk),
        .reset(reset),

        /*---c---*/
        .c_data_a(ci),
        .c_data_b(c_q_a),//
        .c_addr_a(addr_ci),
        .c_addr_b(addr_cj),
        .c_en_a(en_ci),
        .c_en_b(en_cj),
        // .c_en_b(1'b0),
        .c_we_a(we_ci),
        .c_we_b(we_cj),
        .c_q_a(c_q_a),
        .c_q_b(c_q_b)
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

    // Task to S0
    task S0;
        begin
            
            //s0_0
            /***Test Squeeze***/
            #170; //padder
            #240; //f_p
            mode = 0;
            #10 send_input(1344'h0000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffff20d0baa970640f7410232c5a64d84f854642ff782c849957e7502cb0b9e3acd41c2e6ce9e4a5dc9f3d5eb2339d8c0f34e08a145d5283f326a24c1d6b055c1d0e0a34e522cefc25564a38822716f4c02c55d5f79dce56aa7e0b264321aeaec2b2c7893195347e542e9da95168d4442c7de17c675b5d66a51f);
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
            wait(next_element);
        end
    endtask

    // Task to A
    task A;
        begin
            //A_0
            /***Test Squeeze***/
            #170; //padder
            #240; //f_p
            mode = 1;
            #10 send_input(1344'h0000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffff20d0baa970640f7410232c5a64d84f854642ff782c849957e7502cb0b9e3acd41c2e6ce9e4a5dc9f3d5eb2339d8c0f34e08a145d5283f326a24c1d6b055c1d0e0a34e522cefc25564a38822716f4c02c55d5f79dce56aa7e0b264321aeaec2b2c7893195347e542e9da95168d4442c7de17c675b5d66a51f);
            wait(next_element);

            //A_1
            #170; //padder
            #240; //f_p
            #10 send_input(1344'h000000000000000000000000000000000000000000000000000000000000000053bf73fc45a768c77aec54b96d65da20d0baa970640f7410232c5a64d84f854642ff782c849957e7502cb0b9e3acd41c2e6ce9e4a5dc9f3d5eb2339d8c0f34e08a145d5283f326a24c1d6b055c1d0e0a34e522cefc25564a38822716f4c02c55d5f79dce56aa7e0b264321aeaec2b2c7893195347e542e9da95168d4442c7de17c675b5d66a51bdf);
            wait(next_element);

            //A_2
            #170; //padder
            #240; //f_p
            #10 send_input(1344'h000000000000000000000000000000000000000000000000000000000000000053bf73fc45a768c77aec54b96d65da20d0baa970640f7410232c5a64d84f854642ff782c849957e7502cb0b9e3acd41c2e6ce9e4a5dc9f3d5eb2339d8c0f34e08a145d5283f326a24c1d6b055c1d0e0a34e522cefc25564a38822716f4c02c55d5f79dce56aa7e0b264321aeaec2b2c7893195347e542e9da95168d4442c7de17c675b5d66a51bdf);
            wait(next_element);

            //A_3
            #170; //padder
            #240; //f_p
            #10 send_input(1344'h000000000000000000000000000000000000000000000000000000000000000053bf73fc45a768c77aec54b96d65da20d0baa970640f7410232c5a64d84f854642ff782c849957e7502cb0b9e3acd41c2e6ce9e4a5dc9f3d5eb2339d8c0f34e08a145d5283f326a24c1d6b055c1d0e0a34e522cefc25564a38822716f4c02c55d5f79dce56aa7e0b264321aeaec2b2c7893195347e542e9da95168d4442c7de17c675b5d66a51bdf); 
            wait(next_element);
            
            //A_4
            /***Test Squeeze***/
            #170; //padder
            #240; //f_p
            #10 send_input(1344'h0000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffff20d0baa970640f7410232c5a64d84f854642ff782c849957e7502cb0b9e3acd41c2e6ce9e4a5dc9f3d5eb2339d8c0f34e08a145d5283f326a24c1d6b055c1d0e0a34e522cefc25564a38822716f4c02c55d5f79dce56aa7e0b264321aeaec2b2c7893195347e542e9da95168d4442c7de17c675b5d66a51f);
            wait(next_element);

            //A_5
            #170; //padder
            #240; //f_p
            #10 send_input(1344'h000000000000000000000000000000000000000000000000000000000000000053bf73fc45a768c77aec54b96d65da20d0baa970640f7410232c5a64d84f854642ff782c849957e7502cb0b9e3acd41c2e6ce9e4a5dc9f3d5eb2339d8c0f34e08a145d5283f326a24c1d6b055c1d0e0a34e522cefc25564a38822716f4c02c55d5f79dce56aa7e0b264321aeaec2b2c7893195347e542e9da95168d4442c7de17c675b5d66a51bdf);
            wait(next_element);

            //A_6
            #170; //padder
            #240; //f_p
            #10 send_input(1344'h000000000000000000000000000000000000000000000000000000000000000053bf73fc45a768c77aec54b96d65da20d0baa970640f7410232c5a64d84f854642ff782c849957e7502cb0b9e3acd41c2e6ce9e4a5dc9f3d5eb2339d8c0f34e08a145d5283f326a24c1d6b055c1d0e0a34e522cefc25564a38822716f4c02c55d5f79dce56aa7e0b264321aeaec2b2c7893195347e542e9da95168d4442c7de17c675b5d66a51bdf);
            wait(next_element);

            //A_7
            #170; //padder
            #240; //f_p
            #10 send_input(1344'h000000000000000000000000000000000000000000000000000000000000000053bf73fc45a768c77aec54b96d65da20d0baa970640f7410232c5a64d84f854642ff782c849957e7502cb0b9e3acd41c2e6ce9e4a5dc9f3d5eb2339d8c0f34e08a145d5283f326a24c1d6b055c1d0e0a34e522cefc25564a38822716f4c02c55d5f79dce56aa7e0b264321aeaec2b2c7893195347e542e9da95168d4442c7de17c675b5d66a51bdf);  
            wait(next_element);
            
            //A_8
            /***Test Squeeze***/
            #170; //padder
            #240; //f_p
            #10 send_input(1344'h0000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffff20d0baa970640f7410232c5a64d84f854642ff782c849957e7502cb0b9e3acd41c2e6ce9e4a5dc9f3d5eb2339d8c0f34e08a145d5283f326a24c1d6b055c1d0e0a34e522cefc25564a38822716f4c02c55d5f79dce56aa7e0b264321aeaec2b2c7893195347e542e9da95168d4442c7de17c675b5d66a51f);
            wait(next_element);

            //A_9
            #170; //padder
            #240; //f_p
            #10 send_input(1344'h000000000000000000000000000000000000000000000000000000000000000053bf73fc45a768c77aec54b96d65da20d0baa970640f7410232c5a64d84f854642ff782c849957e7502cb0b9e3acd41c2e6ce9e4a5dc9f3d5eb2339d8c0f34e08a145d5283f326a24c1d6b055c1d0e0a34e522cefc25564a38822716f4c02c55d5f79dce56aa7e0b264321aeaec2b2c7893195347e542e9da95168d4442c7de17c675b5d66a51bdf);
            wait(next_element);

            //A_10
            #170; //padder
            #240; //f_p
            #10 send_input(1344'h000000000000000000000000000000000000000000000000000000000000000053bf73fc45a768c77aec54b96d65da20d0baa970640f7410232c5a64d84f854642ff782c849957e7502cb0b9e3acd41c2e6ce9e4a5dc9f3d5eb2339d8c0f34e08a145d5283f326a24c1d6b055c1d0e0a34e522cefc25564a38822716f4c02c55d5f79dce56aa7e0b264321aeaec2b2c7893195347e542e9da95168d4442c7de17c675b5d66a51bdf);
            wait(next_element);

            //A_11
            #170; //padder
            #240; //f_p
            #10 send_input(1344'h000000000000000000000000000000000000000000000000000000000000000053bf73fc45a768c77aec54b96d65da20d0baa970640f7410232c5a64d84f854642ff782c849957e7502cb0b9e3acd41c2e6ce9e4a5dc9f3d5eb2339d8c0f34e08a145d5283f326a24c1d6b055c1d0e0a34e522cefc25564a38822716f4c02c55d5f79dce56aa7e0b264321aeaec2b2c7893195347e542e9da95168d4442c7de17c675b5d66a51bdf);  
            wait(next_element);
            
            //A_12
            /***Test Squeeze***/
            #170; //padder
            #240; //f_p
            #10 send_input(1344'h0000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffff20d0baa970640f7410232c5a64d84f854642ff782c849957e7502cb0b9e3acd41c2e6ce9e4a5dc9f3d5eb2339d8c0f34e08a145d5283f326a24c1d6b055c1d0e0a34e522cefc25564a38822716f4c02c55d5f79dce56aa7e0b264321aeaec2b2c7893195347e542e9da95168d4442c7de17c675b5d66a51f);
            wait(next_element);

            //A_13
            #170; //padder
            #240; //f_p
            #10 send_input(1344'h000000000000000000000000000000000000000000000000000000000000000053bf73fc45a768c77aec54b96d65da20d0baa970640f7410232c5a64d84f854642ff782c849957e7502cb0b9e3acd41c2e6ce9e4a5dc9f3d5eb2339d8c0f34e08a145d5283f326a24c1d6b055c1d0e0a34e522cefc25564a38822716f4c02c55d5f79dce56aa7e0b264321aeaec2b2c7893195347e542e9da95168d4442c7de17c675b5d66a51bdf);
            wait(next_element);

            //A_14
            #170; //padder
            #240; //f_p
            #10 send_input(1344'h000000000000000000000000000000000000000000000000000000000000000053bf73fc45a768c77aec54b96d65da20d0baa970640f7410232c5a64d84f854642ff782c849957e7502cb0b9e3acd41c2e6ce9e4a5dc9f3d5eb2339d8c0f34e08a145d5283f326a24c1d6b055c1d0e0a34e522cefc25564a38822716f4c02c55d5f79dce56aa7e0b264321aeaec2b2c7893195347e542e9da95168d4442c7de17c675b5d66a51bdf);
            wait(next_element);

            //A_15
            #170; //padder
            #240; //f_p
            #10 send_input(1344'h000000000000000000000000000000000000000000000000000000000000000053bf73fc45a768c77aec54b96d65da20d0baa970640f7410232c5a64d84f854642ff782c849957e7502cb0b9e3acd41c2e6ce9e4a5dc9f3d5eb2339d8c0f34e08a145d5283f326a24c1d6b055c1d0e0a34e522cefc25564a38822716f4c02c55d5f79dce56aa7e0b264321aeaec2b2c7893195347e542e9da95168d4442c7de17c675b5d66a51bdf);  
            wait(next_element);
        end
    endtask

    // Task to S0
    task c;
        begin
            //c
            /***Test Squeeze***/
            #170; //padder
            #240; //f_p
            mode = 3;
            #10 send_input(1344'h0000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffffffffffff20d0baa970640f7410232c5a64d84f854642ff782c849957e7502cb0b9e3acd41c2e6ce9e4a5dc9f3d5eb2339d8c0f34e08a145d5283f326a24c1d6b055c1d0e0a34e522cefc25564a38822716f4c02c55d5f79dce56aa7e0b264321aeaec2b2c7893195347e542e9da95168d4442c7de17c675b5d66a51f);
        end
    endtask

    // Test sequence
    initial begin
        // Initialize signals
        sampler_in_ready = 0;
        sampler_in = 0;
        

        // Apply reset
        apply_reset();

        // // Test case 0: S0
        // S0();

        // // Test case 1: A
        // A();

        // // Test case 2: c
        c();


        // Finish simulation
        #100 $finish;
    end

    // Monitor outputs during simulation
    initial begin
        $monitor($time, " sampler_squeeze=%b, next_element=%b, z0=%h, z1=%h, addr_z0=%d, addr_z1=%d, we_z=%b", 
            sampler_squeeze, next_element, z0, z1, addr_z0, addr_z1, we_z);
    end

    always @(posedge clk) begin
        if(sampler_squeeze)begin
            #170; //padder
            #240; //f_p
            #10 send_input(1344'h0000000000000000000000000000000000000000000000000000000000000000e0218aa63a8d55e8c73e8806f1f0b46beb012e869fe38398a897a2bf4f3f45790275f275506a4f9c3f8cb944de59a8eb12ff1d4637e35d306a485f486c707148fb29ec61733ef9ccac3c74bd364df7ca9fe80b418626d2a09eaa7895fcadea693ddb067241160c4aea28e6261caafd9a9b6d87384e11f919b63bfa7dd30512f6188bd98dc6f556dd);
        end
    end

endmodule

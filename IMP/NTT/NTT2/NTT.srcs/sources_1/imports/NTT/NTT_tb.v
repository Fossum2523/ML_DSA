`timescale 1ns / 1ps

module NTT_tb;

    // Parameters
    parameter BIT_LEN = 23;
	parameter DLEN = 23;
	parameter HLEN = 10;
    parameter CLK_PERIOD = 100; // Clock cycle time in ns (e.g., 10ns for 100MHz)

    // Testbench signals
    reg clk;
    reg reset;
    reg in_ready;
    reg [BIT_LEN-1:0]  NTT_in_u;
    reg [BIT_LEN-1:0]  NTT_in_d;
    wire               out_ready;
    wire [BIT_LEN-1:0] NTT_out_u;
    wire [BIT_LEN-1:0] NTT_out_d;
    wire [7:0] NTT_addr_u;
    wire [7:0] NTT_addr_d;

	reg   [DLEN-1:0]      s1_data_a;
    reg   [DLEN-1:0]      s1_data_b;
    reg   [HLEN-1:0]      s1_addr_a;
    reg   [HLEN-1:0]      s1_addr_b;
    reg                   s1_en_a;
    reg                   s1_en_b;
    reg                   s1_we_a;
    reg                   s1_we_b;
    wire  [DLEN-1:0]      s1_q_a;
    wire  [DLEN-1:0]      s1_q_b;

	reg zeta_en;
    wire        zeta_addr_0;   //?��不是?��以改??? parameter
    wire [22:0] zeta_do_0;

    integer i;

    // Instantiate the NTT module
    NTT #(.BIT_LEN(BIT_LEN)) uut (
        .clk(clk),
        .reset(reset),
        .mode(1'b0),
        .in_ready(in_ready),
        .NTT_in_u(s1_q_a),
        .NTT_in_d(s1_q_b),
        .out_ready(out_ready),
        .NTT_out_u(NTT_out_u),
        .NTT_out_d(NTT_out_d),
        .NTT_addr_u(NTT_addr_u),
        .NTT_addr_d(NTT_addr_d)
    );

    // 	input clk,
	// input reset,
	// input in_ready,
	// input [BIT_LEN-1:0] NTT_in_u,
	// input [BIT_LEN-1:0] NTT_in_d,
	// output [BIT_LEN-1:0] NTT_out_u,
	// output [BIT_LEN-1:0] NTT_out_d,
	// output [7:0]NTT_addr

	Dual_Port_Ram_Single_clk #(
		.DLEN(23),
    	.HLEN(10),
		// .INIT_FILE("C:/Users/USER/Desktop/ML_DSA_syn/IMP/NTT/NTT2/NTT.srcs/sources_1/imports/NTT/s1_0.txt")
		// .INIT_FILE("C:/Users/USER/Desktop/ML_DSA_syn/IMP/NTT/NTT2/NTT.srcs/sources_1/imports/NTT/s1_Hat_0.txt")
		.INIT_FILE("../../../../NTT.srcs/sources_1/imports/NTT/s1_0.txt")
		// .INIT_FILE("C:/Users/fossu/Desktop/ML_DSA_syn/IMP/NTT/NTT2/NTT.srcs/sources_1/imports/NTT/s1_Hat_0.txt")
	)s1(
        .clk_a(clk),
        .clk_b(clk),
        .data_a(s1_data_a),
        .data_b(s1_data_b),
        .addr_a(s1_addr_a),
        .addr_b(s1_addr_b),
        .en_a(s1_en_a),
        .en_b(s1_en_b),
        .we_a(s1_we_a),
        .we_b(s1_we_b),
        .q_a(s1_q_a),
        .q_b(s1_q_b)
    );

    // Clock generation
    initial begin
        clk = 1;
        forever #(CLK_PERIOD / 2) clk = ~clk;
    end

    // Task to apply reset
    task apply_reset;
        begin
            reset = 0;
            #(2 * CLK_PERIOD);
            reset = 1;
            #(10 * CLK_PERIOD);
            reset = 0;
        end
    endtask

    // Task to send input
    task send_NTT_in;
        begin
            s1_en_a = 1;
            s1_en_b = 1;
            for( i = 0 ; i < 128 ; i = i + 1)begin
                if(i == 0)
                    in_ready = 1;
                else
                    in_ready = 0;
                s1_addr_a = i;
                s1_addr_b = i + 128;
                // s1_addr_a = i * 2;
                // s1_addr_b = i * 2 + 1;
                #(CLK_PERIOD);
            end
            s1_en_a = 0;
            s1_en_b = 0;
        end
    endtask

    // Test sequence 
    initial begin
        // Initialize signals
        in_ready = 0;
        NTT_in_u = 0;
        NTT_in_d = 0;

        s1_data_a = 0;
        s1_data_b = 0;
        s1_addr_a = 0;
        s1_addr_b = 0;
        s1_we_a = 0;
        s1_we_b = 0;
        
        // Apply reset
        apply_reset();

        #(10 * CLK_PERIOD);
        // #1;

        // Send s1 data to NTT
        send_NTT_in();


        // // Finish simulation
        // #50 $finish;
    end

    // Monitor outputs during simulation
    // initial begin
    //     $monitor($time, " in_ready=%b, NTT_in_u=%d, NTT_in_d=%d, NTT_out_u=%d, NTT_out_d=%d, NTT_addr=%d", 
    //         in_ready, NTT_in_u, NTT_in_d, NTT_out_u, NTT_out_d, NTT_addr);
    // end

endmodule

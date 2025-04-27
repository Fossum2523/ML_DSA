// `timescale 1ns / 1ps

// module NTT_tb;

//     // Parameters
//     parameter BIT_LEN = 23;
// 	parameter DLEN = 23;
// 	parameter HLEN = 10;
//     parameter CLK_PERIOD = 100; // Clock cycle time in ns (e.g., 10ns for 100MHz)

//     // Testbench signals
//     reg clk;
//     reg reset;
//     reg i_valid;
//     reg [BIT_LEN-1:0]  NTT_in_u;
//     reg [BIT_LEN-1:0]  NTT_in_d;
//     wire               out_ready;
//     wire [BIT_LEN-1:0] NTT_out_u;
//     wire [BIT_LEN-1:0] NTT_out_d;
//     wire [7:0] NTT_addr_u;
//     wire [7:0] NTT_addr_d;

// 	reg   [DLEN-1:0]      s1_data_a;
//     reg   [DLEN-1:0]      s1_data_b;
//     reg   [HLEN-1:0]      s1_addr_a;
//     reg   [HLEN-1:0]      s1_addr_b;
//     reg                   s1_en_a;
//     reg                   s1_en_b;
//     reg                   s1_we_a;
//     reg                   s1_we_b;
//     wire  [DLEN-1:0]      s1_q_a;
//     wire  [DLEN-1:0]      s1_q_b;

// 	reg zeta_en;
//     wire        zeta_addr_0;   //?��不是?��以改??? parameter
//     wire [22:0] zeta_do_0;

//     integer i;

//     // Instantiate the NTT module
//     NTT #(.BIT_LEN(BIT_LEN)) uut (
//         .clk(clk),
//         .reset(reset),
//         .mode(1'b0),
//         .i_valid(i_valid),
//         .NTT_in_u(s1_q_a),
//         .NTT_in_d(s1_q_b),
//         .out_ready(out_ready),
//         .NTT_out_u(NTT_out_u),
//         .NTT_out_d(NTT_out_d),
//         .NTT_addr_u(NTT_addr_u),
//         .NTT_addr_d(NTT_addr_d)
//     );

//     // 	input clk,
// 	// input reset,
// 	// input i_valid,
// 	// input [BIT_LEN-1:0] NTT_in_u,
// 	// input [BIT_LEN-1:0] NTT_in_d,
// 	// output [BIT_LEN-1:0] NTT_out_u,
// 	// output [BIT_LEN-1:0] NTT_out_d,
// 	// output [7:0]NTT_addr

// 	Dual_Port_Ram_Single_clk #(
// 		.DLEN(23),
//     	.HLEN(10),
// 		// .INIT_FILE("C:/Users/USER/Desktop/ML_DSA_syn/IMP/NTT/NTT2/NTT.srcs/sources_1/imports/NTT/s1_0.txt")
// 		// .INIT_FILE("C:/Users/USER/Desktop/ML_DSA_syn/IMP/NTT/NTT2/NTT.srcs/sources_1/imports/NTT/s1_Hat_0.txt")
// 		.INIT_FILE("../../../../NTT.srcs/sim_1/imports/NTT/s1_0.txt")
// 		// .INIT_FILE("C:/Users/fossu/Desktop/ML_DSA_syn/IMP/NTT/NTT2/NTT.srcs/sources_1/imports/NTT/s1_Hat_0.txt")
// 	)s1(
//         .clk_a(clk),
//         .clk_b(clk),
//         .data_a(s1_data_a),
//         .data_b(s1_data_b),
//         .addr_a(s1_addr_a),
//         .addr_b(s1_addr_b),
//         .en_a(s1_en_a),
//         .en_b(s1_en_b),
//         .we_a(s1_we_a),
//         .we_b(s1_we_b),
//         .q_a(s1_q_a),
//         .q_b(s1_q_b)
//     );

//     // Clock generation
//     initial begin
//         clk = 1;
//         forever #(CLK_PERIOD / 2) clk = ~clk;
//     end

//     // Task to apply reset
//     task apply_reset;
//         begin
//             reset = 0;
//             #(2 * CLK_PERIOD);
//             reset = 1;
//             #(10 * CLK_PERIOD);
//             reset = 0;
//         end
//     endtask

//     // Task to send input
//     task send_NTT_in;
//         begin
//             s1_en_a = 1;
//             s1_en_b = 1;
//             for( i = 0 ; i < 128 ; i = i + 1)begin
//                 i_valid = 1;
//                 s1_addr_a = i;
//                 s1_addr_b = i + 128;
//                 // s1_addr_a = i * 2;
//                 // s1_addr_b = i * 2 + 1;
//                 #(CLK_PERIOD);
//             end
//             i_valid = 0;
//             s1_en_a = 0;
//             s1_en_b = 0;
//         end
//     endtask

//     // Test sequence 
//     initial begin
//         // Initialize signals
//         i_valid = 0;
//         NTT_in_u = 0;
//         NTT_in_d = 0;

//         s1_data_a = 0;
//         s1_data_b = 0;
//         s1_addr_a = 0;
//         s1_addr_b = 0;
//         s1_we_a = 0;
//         s1_we_b = 0;
        
//         // Apply reset
//         apply_reset();

//         #(10 * CLK_PERIOD);
//         // #1;

//         // Send s1 data to NTT
//         send_NTT_in();


//         // // Finish simulation
//         // #50 $finish;
//     end
// endmodule


`timescale 1ns/1ps

module NTT_tb;

    parameter BIT_LEN = 23;
    parameter DLEN = 23;
	parameter HLEN = 10;
    parameter CLK_PERIOD = 20; // Clock cycle time in ns (e.g., 10ns for 100MHz)


    reg                 clk;
    reg                 reset;
    reg                 mode;
    reg                 i_valid;
    wire                i_ready;
    reg  [BIT_LEN-1:0]  NTT_in_u;
    reg  [BIT_LEN-1:0]  NTT_in_d;
    wire [BIT_LEN-1:0]  NTT_out_u;
    wire [BIT_LEN-1:0]  NTT_out_d;
    wire [7:0]          NTT_addr_u;
    wire [7:0]          NTT_addr_d;
    wire                o_valid;
    reg                 o_ready;
    wire                done;

    reg [BIT_LEN-1:0] s1 [0:255];
    reg [BIT_LEN-1:0] s1_hat [0:255];

    integer i;
    // Instantiate the DUT
    NTT #(
        .BIT_LEN(BIT_LEN)
    ) dut (
        .clk(clk),
        .reset(reset),
        .mode(mode),
        .i_valid(i_valid),
        .i_ready(i_ready),
        .NTT_in_u(NTT_in_u),
        .NTT_in_d(NTT_in_d),
        .NTT_out_u(NTT_out_u),
        .NTT_out_d(NTT_out_d),
        .NTT_addr_u(NTT_addr_u),
        .NTT_addr_d(NTT_addr_d),
        .o_valid(o_valid),
        .o_ready(o_ready),
        .done(done)
    );

    initial begin
        $readmemh("../../../../NTT.srcs/sim_1/imports/NTT/s1_0.txt", s1);
        // $readmemh("../../../../../NTT.srcs/sim_1/imports/NTT/s1_0.txt", s1);
    end

    initial begin
        $readmemh("../../../../NTT.srcs/sim_1/imports/NTT/s1_Hat_0.txt", s1_hat);
    end

    // Clock generation
    initial begin
        clk = 1;
        forever #(CLK_PERIOD / 2) clk = ~clk;
    end

    // // Task to apply reset
    // task apply_reset;
    //     begin
    //         reset = 0;
    //         #(2 * CLK_PERIOD);
    //         reset = 1;
    //         #(10 * CLK_PERIOD);
    //         #1;
    //         reset = 0;
    //     end
    // endtask
    
    // // Task to send input
    // task send_NTT_in;
    //     begin
    //         s1_en_a = 1;
    //         s1_en_b = 1;
    //         for( i = 0 ; i < 128 ; i = i + 1)begin
    //             if(i!=0)
    //                 i_valid = 1;
    //             s1_addr_a = i;
    //             s1_addr_b = i + 128;
    //             // s1_addr_a = i * 2;
    //             // s1_addr_b = i * 2 + 1;
    //             #(CLK_PERIOD);
    //         end
    //         i_valid = 1;
    //         #(CLK_PERIOD);
    //         i_valid = 0;
    //         s1_en_a = 0;
    //         s1_en_b = 0;
    //     end
    // endtask


    // Test pattern
    initial begin
        // Initialization
        reset = 1;
        mode = 1;
        i_valid = 0;
        NTT_in_u = 0;
        NTT_in_d = 0;
        o_ready = 1;

        // Release reset
        reset = 0;
        #(2 * CLK_PERIOD);
        reset = 1;
        #(10 * CLK_PERIOD);
        reset = 0;
        #(2 * CLK_PERIOD);
        // Apply input data
        if(mode == 0)
            for( i = 0 ; i < 128 ; i = i + 1)begin
                    i_valid = 1;
                    NTT_in_u = s1[i];
                    NTT_in_d = s1[i + 128];
                    #(CLK_PERIOD);
            end
        else
            for( i = 0 ; i < 128 ; i = i + 1)begin
                    i_valid = 1;
                    NTT_in_u = s1_hat[i<<1];
                    NTT_in_d = s1_hat[(i<<1)+1];
                    #(CLK_PERIOD);
            end

        i_valid = 0;
    end

endmodule

// module NTT#(
//     parameter BIT_LEN = 23
//     )(
// 	input                clk,
// 	input                reset,
//     input                mode,
// 	input                i_valid,
// 	output               i_ready,
// 	input  [BIT_LEN-1:0] NTT_in_u,
// 	input  [BIT_LEN-1:0] NTT_in_d,
// 	output [BIT_LEN-1:0] NTT_out_u,
// 	output [BIT_LEN-1:0] NTT_out_d,
//     output [7:0]         NTT_addr_u,
//     output [7:0]         NTT_addr_d,
//     output               o_valid,
//     input                o_ready,
//     output               done
//     );

//     localparam  NTT_mode  = 1'b0,
//                 INTT_mode = 1'b1;

//     localparam depth_1 = 64;
//     localparam depth_2 = 32;
//     localparam depth_3 = 16;
//     localparam depth_4 = 8;
//     localparam depth_5 = 4;
//     localparam depth_6 = 2;
//     localparam depth_7 = 1;

    
//     /*** stage 0 ***/
//     wire    BU_0_i_valid;
//     wire    [BIT_LEN - 1:0] BU_0_in_data_u;
//     wire    [BIT_LEN - 1:0] BU_0_in_data_d;
//     wire    BU_0_o_valid;
//     wire    [BIT_LEN - 1:0] BU_0_out_data_u;
//     wire    [BIT_LEN - 1:0] BU_0_out_data_d;

//     assign BU_0_i_valid   = i_valid;
//     assign BU_0_in_data_u = NTT_in_u;
//     assign BU_0_in_data_d = NTT_in_d;

//     BU BU_0(
//         .reset(reset),
//         .clk(clk),
//         .mode(mode),
//         .i_valid(BU_0_i_valid),
//         .a(BU_0_in_data_u),
//         .b(BU_0_in_data_d),
//         .zeta(23'h495e02),
//         .o_valid(BU_0_o_valid),
//         .out_a(BU_0_out_data_u),
//         .out_b(BU_0_out_data_d)
//     );

//     /*** stage 1 ***/
//     wire    RU_1_i_valid;
//     wire    [BIT_LEN - 1:0] RU_1_in_data_u;
//     wire    [BIT_LEN - 1:0] RU_1_in_data_d;
//     wire    RU_1_o_valid;
//     wire    [BIT_LEN - 1:0] RU_1_out_data_u;
//     wire    [BIT_LEN - 1:0] RU_1_out_data_d;

//     wire    [(64/(depth_1)) - 1:0]  MEM_zeta_1_addr;
//     wire    [BIT_LEN-1:0]   zeta_1;

//     wire    BU_1_i_valid;
//     wire    [BIT_LEN - 1:0] BU_1_in_data_u;
//     wire    [BIT_LEN - 1:0] BU_1_in_data_d;
//     wire    BU_1_o_valid;
//     wire    [BIT_LEN - 1:0] BU_1_out_data_u;
//     wire    [BIT_LEN - 1:0] BU_1_out_data_d;

//     assign RU_1_i_valid   = BU_0_o_valid;
//     assign RU_1_in_data_u = BU_0_out_data_u;
//     assign RU_1_in_data_d = BU_0_out_data_d;

//     assign BU_1_i_valid   = RU_1_o_valid;
//     assign BU_1_in_data_u = RU_1_out_data_u;
//     assign BU_1_in_data_d = RU_1_out_data_d;
    
//     RU #(
//         .BIT_LEN(BIT_LEN),
//         .depth(depth_1)
//     ) RU_1(
//         .clk(clk),
//         .reset(reset),
//         .i_valid(RU_1_i_valid),
//         .in_u(RU_1_in_data_u),
//         .in_d(RU_1_in_data_d),
//         .o_valid(RU_1_o_valid),
//         .zeta_trig(RU_1_zeta_trig),
//         .out_u(RU_1_out_data_u),
//         .out_d(RU_1_out_data_d)
//     );

//     CONTR#(
//         .BIT_LEN(BIT_LEN),
//         .depth(depth_1)
//     ) CONTR_1(
//         .clk(clk),
//         .reset(reset),
//         .mode(mode),
//         .i_valid(RU_1_o_valid),
//         .zeta_trig(RU_1_zeta_trig),
//         .zeta_addr(MEM_zeta_1_addr)
//     );


//     rom #(
//         .WIDTH(BIT_LEN),
//         .LENGTH(128/depth_1),
//         .INIT_FILE("../../../../NTT.srcs/sources_1/imports/NTT/MEM_zeta/MEM_zeta_1.txt")
//     ) MEM_zeta_1(
//         .clk(clk), 
//         .en(1'b1), 
//         .addr(MEM_zeta_1_addr), 
//         .do(zeta_1)
//     );


//     BU BU_1(
//         .reset(reset),
//         .clk(clk),
//         .mode(mode),
//         .i_valid(BU_1_i_valid),
//         .a(BU_1_in_data_u),
//         .b(BU_1_in_data_d),
//         .zeta(zeta_1),
//         .o_valid(BU_1_o_valid),
//         .out_a(BU_1_out_data_u),
//         .out_b(BU_1_out_data_d)
//     );

//     /*** stage 2 ***/
// endmodule


module NTT#(
    parameter BIT_LEN = 23
    )(
	input                clk,
	input                reset,
    input                mode,
	input                i_valid,
	output               i_ready,
	input  [BIT_LEN-1:0] NTT_in_u,
	input  [BIT_LEN-1:0] NTT_in_d,
	output [BIT_LEN-1:0] NTT_out_u,
	output [BIT_LEN-1:0] NTT_out_d,
    output [7:0]         NTT_addr_u,
    output [7:0]         NTT_addr_d,
    output               o_valid,
    input                o_ready,
    output               done
    );

    localparam  NTT_mode  = 1'b0,
                INTT_mode = 1'b1;

    localparam depth = 64;
    localparam depth_2 = 32;
    localparam depth_3 = 16;
    localparam depth_4 = 8;
    localparam depth_5 = 4;
    localparam depth_6 = 2;
    localparam depth_7 = 1;

    // --- 宣告 wire array ---
    wire [6:0] RU_i_valid;
    wire [BIT_LEN-1:0] RU_in_data_u [0:6];
    wire [BIT_LEN-1:0] RU_in_data_d [0:6];
    wire [6:0] RU_o_valid;
    wire [BIT_LEN-1:0] RU_out_data_u [0:6];
    wire [BIT_LEN-1:0] RU_out_data_d [0:6];
    wire [6:0] RU_zeta_trig;

    wire [(64/1)-1:0] MEM_zeta_addr [0:6]; // 每一層的zeta addr，位寬會依depth不同要細調
    wire [BIT_LEN-1:0] zeta [0:6];

    wire [6:0] BU_i_valid;
    wire [BIT_LEN-1:0] BU_in_data_u [0:6];
    wire [BIT_LEN-1:0] BU_in_data_d [0:6];
    wire [6:0] BU_o_valid;
    wire [BIT_LEN-1:0] BU_out_data_u [0:6];
    wire [BIT_LEN-1:0] BU_out_data_d [0:6];


    assign zeta[0] = 23'h495e02;

    assign BU_i_valid[0]   = i_valid;
    assign BU_in_data_u[0] = NTT_in_u;
    assign BU_in_data_d[0] = NTT_in_d;

    
    // // --- Generate RU ---
    // generate
    //     for (i = 0; i < 7; i = i + 1) begin : GEN_RU
    //         RU #(
    //             .BIT_LEN(BIT_LEN),
    //             .depth(depth>>i)
    //         ) RU_inst (
    //             .clk(clk),
    //             .reset(reset),
    //             .i_valid(RU_i_valid[i]),
    //             .in_u(RU_in_data_u[i]),
    //             .in_d(RU_in_data_d[i]),
    //             .o_valid(RU_o_valid[i]),
    //             .zeta_trig(RU_zeta_trig[i]),
    //             .out_u(RU_out_data_u[i]),
    //             .out_d(RU_out_data_d[i])
    //         );
    //     end
    // endgenerate


    // --- Wire Connect for BU input ---
    // generate
    //     for (i = 1; i < 8; i = i + 1) begin : CONNECT_BU_INPUT
    //         assign BU_i_valid[i]   = RU_o_valid[i];
    //         assign BU_in_data_u[i] = RU_out_data_u[i];
    //         assign BU_in_data_d[i] = RU_out_data_d[i];
    //     end
    // endgenerate

    // --- Generate BU ---
    genvar i;
    generate
        for (i = 0; i < 1; i = i + 1) begin : GEN_BU
            BU BU_inst (
                .reset(reset),
                .clk(clk),
                .mode(mode),
                .i_valid(BU_i_valid[i]),
                .a(NTT_in_u),
                .b(NTT_in_d),
                .zeta(zeta[i]),
                .o_valid(BU_o_valid[i]),
                .out_a(BU_out_data_u[i]),
                .out_b(BU_out_data_d[i])
            );
        end
    endgenerate
endmodule

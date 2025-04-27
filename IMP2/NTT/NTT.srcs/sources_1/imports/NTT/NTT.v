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

    localparam depth_1 = 64;
    localparam depth_2 = 32;
    localparam depth_3 = 16;
    localparam depth_4 = 8;
    localparam depth_5 = 4;
    localparam depth_6 = 2;
    localparam depth_7 = 1;

    assign NTT_out_u = BU_7_out_data_u;
    assign NTT_out_d = BU_7_out_data_d;
    assign o_valid = BU_7_o_valid;
    /*** stage 0 ***/
    wire                    BU_0_i_valid;
    wire    [BIT_LEN - 1:0] BU_0_in_data_u;
    wire    [BIT_LEN - 1:0] BU_0_in_data_d;
    wire                    BU_0_o_valid;
    wire    [BIT_LEN - 1:0] BU_0_out_data_u;
    wire    [BIT_LEN - 1:0] BU_0_out_data_d;

    assign BU_0_i_valid   = mode ? RU_1_o_valid    : i_valid;
    assign BU_0_in_data_u = mode ? RU_1_out_data_u : NTT_in_u;
    assign BU_0_in_data_d = mode ? RU_1_out_data_d : NTT_in_d;


    BU BU_0(
        .reset(reset),
        .clk(clk),
        .mode(mode),
        .i_valid(BU_0_i_valid),
        .a(BU_0_in_data_u),
        .b(BU_0_in_data_d),
        .zeta(23'h495e02),
        .o_valid(BU_0_o_valid),
        .out_a(BU_0_out_data_u),
        .out_b(BU_0_out_data_d)
    );

    /*** stage 1 ***/
    wire                    RU_1_i_valid;
    wire    [BIT_LEN - 1:0] RU_1_in_data_u;
    wire    [BIT_LEN - 1:0] RU_1_in_data_d;
    wire                    RU_1_o_valid;
    wire    [BIT_LEN - 1:0] RU_1_out_data_u;
    wire    [BIT_LEN - 1:0] RU_1_out_data_d;

    wire                    CONTR_1_i_valid;

    wire    [(64/(depth_1)) - 1:0]  MEM_zeta_1_addr;
    wire    [BIT_LEN-1:0]           zeta_1;

    wire                    BU_1_i_valid;
    wire    [BIT_LEN - 1:0] BU_1_in_data_u;
    wire    [BIT_LEN - 1:0] BU_1_in_data_d;
    wire                    BU_1_o_valid;
    wire    [BIT_LEN - 1:0] BU_1_out_data_u;
    wire    [BIT_LEN - 1:0] BU_1_out_data_d;

    assign RU_1_i_valid   = mode ? BU_1_o_valid     : BU_0_o_valid;
    assign RU_1_in_data_u = mode ? BU_1_out_data_u  : BU_0_out_data_u;
    assign RU_1_in_data_d = mode ? BU_1_out_data_d  : BU_0_out_data_d;

    assign CONTR_1_i_valid   = mode ? RU_2_o_valid : RU_1_o_valid;

    assign BU_1_i_valid   = mode ? RU_2_o_valid    : RU_1_o_valid;
    assign BU_1_in_data_u = mode ? RU_2_out_data_u : RU_1_out_data_u;
    assign BU_1_in_data_d = mode ? RU_2_out_data_d : RU_1_out_data_d;
    
    RU #(
        .BIT_LEN(BIT_LEN),
        .depth(depth_1)
    ) RU_1(
        .clk(clk),
        .reset(reset),
        .i_valid(RU_1_i_valid),
        .in_u(RU_1_in_data_u),
        .in_d(RU_1_in_data_d),
        .o_valid(RU_1_o_valid),
        .out_u(RU_1_out_data_u),
        .out_d(RU_1_out_data_d)
    );

    CONTR#(
        .BIT_LEN(BIT_LEN),
        .depth(depth_1)
    ) CONTR_1(
        .clk(clk),
        .reset(reset),
        .mode(mode),
        .i_valid(CONTR_1_i_valid),
        .zeta_addr(MEM_zeta_1_addr)
    );


    rom #(
        .WIDTH(BIT_LEN),
        .LENGTH(128/depth_1),
        .INIT_FILE("../../../../NTT.srcs/sources_1/imports/NTT/MEM_zeta/MEM_zeta_1.txt")
    ) MEM_zeta_1(
        .clk(clk), 
        .en(1'b1), 
        .addr(MEM_zeta_1_addr), 
        .do(zeta_1)
    );


    BU BU_1(
        .reset(reset),
        .clk(clk),
        .mode(mode),
        .i_valid(BU_1_i_valid),
        .a(BU_1_in_data_u),
        .b(BU_1_in_data_d),
        .zeta(zeta_1),
        .o_valid(BU_1_o_valid),
        .out_a(BU_1_out_data_u),
        .out_b(BU_1_out_data_d)
    );

    /*** stage 2 ***/
    wire                    RU_2_i_valid;
    wire    [BIT_LEN - 1:0] RU_2_in_data_u;
    wire    [BIT_LEN - 1:0] RU_2_in_data_d;
    wire                    RU_2_o_valid;
    wire    [BIT_LEN - 1:0] RU_2_out_data_u;
    wire    [BIT_LEN - 1:0] RU_2_out_data_d;

    wire                    CONTR_2_i_valid;

    wire    [(64/(depth_2)) - 1:0]  MEM_zeta_2_addr;
    wire    [BIT_LEN-1:0]           zeta_2;

    wire                    BU_2_i_valid;
    wire    [BIT_LEN - 1:0] BU_2_in_data_u;
    wire    [BIT_LEN - 1:0] BU_2_in_data_d;
    wire                    BU_2_o_valid;
    wire    [BIT_LEN - 1:0] BU_2_out_data_u;
    wire    [BIT_LEN - 1:0] BU_2_out_data_d;

    assign RU_2_i_valid   = mode ? BU_2_o_valid     : BU_1_o_valid;
    assign RU_2_in_data_u = mode ? BU_2_out_data_u  : BU_1_out_data_u;
    assign RU_2_in_data_d = mode ? BU_2_out_data_d  : BU_1_out_data_d;

    assign CONTR_2_i_valid   = mode ? RU_3_o_valid : RU_2_o_valid;

    assign BU_2_i_valid   = mode ? RU_3_o_valid    : RU_2_o_valid;
    assign BU_2_in_data_u = mode ? RU_3_out_data_u : RU_2_out_data_u;
    assign BU_2_in_data_d = mode ? RU_3_out_data_d : RU_2_out_data_d;

    RU #(
        .BIT_LEN(BIT_LEN),
        .depth(depth_2)
    ) RU_2(
        .clk(clk),
        .reset(reset),
        .i_valid(RU_2_i_valid),
        .in_u(RU_2_in_data_u),
        .in_d(RU_2_in_data_d),
        .o_valid(RU_2_o_valid),
        .out_u(RU_2_out_data_u),
        .out_d(RU_2_out_data_d)
    );

    CONTR#(
        .BIT_LEN(BIT_LEN),
        .depth(depth_2)
    ) CONTR_2(
        .clk(clk),
        .reset(reset),
        .mode(mode),
        .i_valid(CONTR_2_i_valid),
        .zeta_addr(MEM_zeta_2_addr)
    );


    rom #(
        .WIDTH(BIT_LEN),
        .LENGTH(128/depth_2),
        .INIT_FILE("../../../../NTT.srcs/sources_1/imports/NTT/MEM_zeta/MEM_zeta_2.txt")
    ) MEM_zeta_2(
        .clk(clk), 
        .en(1'b1), 
        .addr(MEM_zeta_2_addr), 
        .do(zeta_2)
    );


    BU BU_2(
        .reset(reset),
        .clk(clk),
        .mode(mode),
        .i_valid(BU_2_i_valid),
        .a(BU_2_in_data_u),
        .b(BU_2_in_data_d),
        .zeta(zeta_2),
        .o_valid(BU_2_o_valid),
        .out_a(BU_2_out_data_u),
        .out_b(BU_2_out_data_d)
    );

    /*** stage 3 ***/
    wire                    RU_3_i_valid;
    wire    [BIT_LEN - 1:0] RU_3_in_data_u;
    wire    [BIT_LEN - 1:0] RU_3_in_data_d;
    wire                    RU_3_o_valid;
    wire    [BIT_LEN - 1:0] RU_3_out_data_u;
    wire    [BIT_LEN - 1:0] RU_3_out_data_d;

    wire                    CONTR_3_i_valid;

    wire    [(64/(depth_3)) - 1:0]  MEM_zeta_3_addr;
    wire    [BIT_LEN-1:0]           zeta_3;

    wire                    BU_3_i_valid;
    wire    [BIT_LEN - 1:0] BU_3_in_data_u;
    wire    [BIT_LEN - 1:0] BU_3_in_data_d;
    wire                    BU_3_o_valid;
    wire    [BIT_LEN - 1:0] BU_3_out_data_u;
    wire    [BIT_LEN - 1:0] BU_3_out_data_d;

    assign RU_3_i_valid   = mode ? BU_3_o_valid     : BU_2_o_valid;
    assign RU_3_in_data_u = mode ? BU_3_out_data_u  : BU_2_out_data_u;
    assign RU_3_in_data_d = mode ? BU_3_out_data_d  : BU_2_out_data_d;

    assign CONTR_3_i_valid   = mode ? RU_4_o_valid : RU_3_o_valid;

    assign BU_3_i_valid   = mode ? RU_4_o_valid    : RU_3_o_valid;
    assign BU_3_in_data_u = mode ? RU_4_out_data_u : RU_3_out_data_u;
    assign BU_3_in_data_d = mode ? RU_4_out_data_d : RU_3_out_data_d;
    
    RU #(
        .BIT_LEN(BIT_LEN),
        .depth(depth_3)
    ) RU_3(
        .clk(clk),
        .reset(reset),
        .i_valid(RU_3_i_valid),
        .in_u(RU_3_in_data_u),
        .in_d(RU_3_in_data_d),
        .o_valid(RU_3_o_valid),
        .out_u(RU_3_out_data_u),
        .out_d(RU_3_out_data_d)
    );

    CONTR#(
        .BIT_LEN(BIT_LEN),
        .depth(depth_3)
    ) CONTR_3(
        .clk(clk),
        .reset(reset),
        .mode(mode),
        .i_valid(CONTR_3_i_valid),
        .zeta_addr(MEM_zeta_3_addr)
    );


    rom #(
        .WIDTH(BIT_LEN),
        .LENGTH(128/depth_3),
        .INIT_FILE("../../../../NTT.srcs/sources_1/imports/NTT/MEM_zeta/MEM_zeta_3.txt")
    ) MEM_zeta_3(
        .clk(clk), 
        .en(1'b1), 
        .addr(MEM_zeta_3_addr), 
        .do(zeta_3)
    );


    BU BU_3(
        .reset(reset),
        .clk(clk),
        .mode(mode),
        .i_valid(BU_3_i_valid),
        .a(BU_3_in_data_u),
        .b(BU_3_in_data_d),
        .zeta(zeta_3),
        .o_valid(BU_3_o_valid),
        .out_a(BU_3_out_data_u),
        .out_b(BU_3_out_data_d)
    );

    /*** stage 4 ***/
    wire                    RU_4_i_valid;
    wire    [BIT_LEN - 1:0] RU_4_in_data_u;
    wire    [BIT_LEN - 1:0] RU_4_in_data_d;
    wire                    RU_4_o_valid;
    wire    [BIT_LEN - 1:0] RU_4_out_data_u;
    wire    [BIT_LEN - 1:0] RU_4_out_data_d;

    wire                    CONTR_4_i_valid;

    wire    [(64/(depth_4)) - 1:0]  MEM_zeta_4_addr;
    wire    [BIT_LEN-1:0]           zeta_4;

    wire                    BU_4_i_valid;
    wire    [BIT_LEN - 1:0] BU_4_in_data_u;
    wire    [BIT_LEN - 1:0] BU_4_in_data_d;
    wire                    BU_4_o_valid;
    wire    [BIT_LEN - 1:0] BU_4_out_data_u;
    wire    [BIT_LEN - 1:0] BU_4_out_data_d;

    assign RU_4_i_valid   = mode ? BU_4_o_valid     : BU_3_o_valid;
    assign RU_4_in_data_u = mode ? BU_4_out_data_u  : BU_3_out_data_u;
    assign RU_4_in_data_d = mode ? BU_4_out_data_d  : BU_3_out_data_d;

    assign CONTR_4_i_valid   = mode ? RU_5_o_valid : RU_4_o_valid;

    assign BU_4_i_valid   = mode ? RU_5_o_valid    : RU_4_o_valid;
    assign BU_4_in_data_u = mode ? RU_5_out_data_u : RU_4_out_data_u;
    assign BU_4_in_data_d = mode ? RU_5_out_data_d : RU_4_out_data_d;
    
    RU #(
        .BIT_LEN(BIT_LEN),
        .depth(depth_4)
    ) RU_4(
        .clk(clk),
        .reset(reset),
        .i_valid(RU_4_i_valid),
        .in_u(RU_4_in_data_u),
        .in_d(RU_4_in_data_d),
        .o_valid(RU_4_o_valid),
        .out_u(RU_4_out_data_u),
        .out_d(RU_4_out_data_d)
    );

    CONTR#(
        .BIT_LEN(BIT_LEN),
        .depth(depth_4)
    ) CONTR_4(
        .clk(clk),
        .reset(reset),
        .mode(mode),
        .i_valid(CONTR_4_i_valid),
        .zeta_addr(MEM_zeta_4_addr)
    );


    rom #(
        .WIDTH(BIT_LEN),
        .LENGTH(128/depth_4),
        .INIT_FILE("../../../../NTT.srcs/sources_1/imports/NTT/MEM_zeta/MEM_zeta_4.txt")
    ) MEM_zeta_4(
        .clk(clk), 
        .en(1'b1), 
        .addr(MEM_zeta_4_addr), 
        .do(zeta_4)
    );


    BU BU_4(
        .reset(reset),
        .clk(clk),
        .mode(mode),
        .i_valid(BU_4_i_valid),
        .a(BU_4_in_data_u),
        .b(BU_4_in_data_d),
        .zeta(zeta_4),
        .o_valid(BU_4_o_valid),
        .out_a(BU_4_out_data_u),
        .out_b(BU_4_out_data_d)
    );

    /*** stage 5 ***/
    wire                    RU_5_i_valid;
    wire    [BIT_LEN - 1:0] RU_5_in_data_u;
    wire    [BIT_LEN - 1:0] RU_5_in_data_d;
    wire                    RU_5_o_valid;
    wire    [BIT_LEN - 1:0] RU_5_out_data_u;
    wire    [BIT_LEN - 1:0] RU_5_out_data_d;

    wire                    CONTR_5_i_valid;

    wire    [(64/(depth_5)) - 1:0]  MEM_zeta_5_addr;
    wire    [BIT_LEN-1:0]           zeta_5;

    wire                    BU_5_i_valid;
    wire    [BIT_LEN - 1:0] BU_5_in_data_u;
    wire    [BIT_LEN - 1:0] BU_5_in_data_d;
    wire                    BU_5_o_valid;
    wire    [BIT_LEN - 1:0] BU_5_out_data_u;
    wire    [BIT_LEN - 1:0] BU_5_out_data_d;

    assign RU_5_i_valid   = mode ? BU_5_o_valid     : BU_4_o_valid;
    assign RU_5_in_data_u = mode ? BU_5_out_data_u  : BU_4_out_data_u;
    assign RU_5_in_data_d = mode ? BU_5_out_data_d  : BU_4_out_data_d;

    assign CONTR_5_i_valid   = mode ? RU_6_o_valid : RU_5_o_valid;

    assign BU_5_i_valid   = mode ? RU_6_o_valid    : RU_5_o_valid;
    assign BU_5_in_data_u = mode ? RU_6_out_data_u : RU_5_out_data_u;
    assign BU_5_in_data_d = mode ? RU_6_out_data_d : RU_5_out_data_d;
    
    RU #(
        .BIT_LEN(BIT_LEN),
        .depth(depth_5)
    ) RU_5(
        .clk(clk),
        .reset(reset),
        .i_valid(RU_5_i_valid),
        .in_u(RU_5_in_data_u),
        .in_d(RU_5_in_data_d),
        .o_valid(RU_5_o_valid),
        .out_u(RU_5_out_data_u),
        .out_d(RU_5_out_data_d)
    );

    CONTR#(
        .BIT_LEN(BIT_LEN),
        .depth(depth_5)
    ) CONTR_5(
        .clk(clk),
        .reset(reset),
        .mode(mode),
        .i_valid(CONTR_5_i_valid),
        .zeta_addr(MEM_zeta_5_addr)
    );


    rom #(
        .WIDTH(BIT_LEN),
        .LENGTH(128/depth_5),
        .INIT_FILE("../../../../NTT.srcs/sources_1/imports/NTT/MEM_zeta/MEM_zeta_5.txt")
    ) MEM_zeta_5(
        .clk(clk), 
        .en(1'b1), 
        .addr(MEM_zeta_5_addr), 
        .do(zeta_5)
    );


    BU BU_5(
        .reset(reset),
        .clk(clk),
        .mode(mode),
        .i_valid(BU_5_i_valid),
        .a(BU_5_in_data_u),
        .b(BU_5_in_data_d),
        .zeta(zeta_5),
        .o_valid(BU_5_o_valid),
        .out_a(BU_5_out_data_u),
        .out_b(BU_5_out_data_d)
    );

    /*** stage 6 ***/
    wire                    RU_6_i_valid;
    wire    [BIT_LEN - 1:0] RU_6_in_data_u;
    wire    [BIT_LEN - 1:0] RU_6_in_data_d;
    wire                    RU_6_o_valid;
    wire    [BIT_LEN - 1:0] RU_6_out_data_u;
    wire    [BIT_LEN - 1:0] RU_6_out_data_d;

    wire                    CONTR_6_i_valid;
    wire    [(64/(depth_6)) - 1:0]  MEM_zeta_6_addr;
    wire    [BIT_LEN-1:0]           zeta_6;

    wire                    BU_6_i_valid;
    wire    [BIT_LEN - 1:0] BU_6_in_data_u;
    wire    [BIT_LEN - 1:0] BU_6_in_data_d;
    wire                    BU_6_o_valid;
    wire    [BIT_LEN - 1:0] BU_6_out_data_u;
    wire    [BIT_LEN - 1:0] BU_6_out_data_d;

    assign RU_6_i_valid   = mode ? BU_6_o_valid     : BU_5_o_valid;
    assign RU_6_in_data_u = mode ? BU_6_out_data_u  : BU_5_out_data_u;
    assign RU_6_in_data_d = mode ? BU_6_out_data_d  : BU_5_out_data_d;

    assign CONTR_6_i_valid   = mode ? RU_7_o_valid : RU_6_o_valid;

    assign BU_6_i_valid   = mode ? RU_7_o_valid    : RU_6_o_valid;
    assign BU_6_in_data_u = mode ? RU_7_out_data_u : RU_6_out_data_u;
    assign BU_6_in_data_d = mode ? RU_7_out_data_d : RU_6_out_data_d;
    
    RU #(
        .BIT_LEN(BIT_LEN),
        .depth(depth_6)
    ) RU_6(
        .clk(clk),
        .reset(reset),
        .i_valid(RU_6_i_valid),
        .in_u(RU_6_in_data_u),
        .in_d(RU_6_in_data_d),
        .o_valid(RU_6_o_valid),
        .out_u(RU_6_out_data_u),
        .out_d(RU_6_out_data_d)
    );

    CONTR#(
        .BIT_LEN(BIT_LEN),
        .depth(depth_6)
    ) CONTR_6(
        .clk(clk),
        .reset(reset),
        .mode(mode),
        .i_valid(CONTR_6_i_valid),
        .zeta_addr(MEM_zeta_6_addr)
    );


    rom #(
        .WIDTH(BIT_LEN),
        .LENGTH(128/depth_6),
        .INIT_FILE("../../../../NTT.srcs/sources_1/imports/NTT/MEM_zeta/MEM_zeta_6.txt")
    ) MEM_zeta_6(
        .clk(clk), 
        .en(1'b1), 
        .addr(MEM_zeta_6_addr), 
        .do(zeta_6)
    );


    BU BU_6(
        .reset(reset),
        .clk(clk),
        .mode(mode),
        .i_valid(BU_6_i_valid),
        .a(BU_6_in_data_u),
        .b(BU_6_in_data_d),
        .zeta(zeta_6),
        .o_valid(BU_6_o_valid),
        .out_a(BU_6_out_data_u),
        .out_b(BU_6_out_data_d)
    );

    /*** stage 7 ***/
    wire                    RU_7_i_valid;
    wire    [BIT_LEN - 1:0] RU_7_in_data_u;
    wire    [BIT_LEN - 1:0] RU_7_in_data_d;
    wire                    RU_7_o_valid;
    wire    [BIT_LEN - 1:0] RU_7_out_data_u;
    wire    [BIT_LEN - 1:0] RU_7_out_data_d;

    wire                    CONTR_7_i_valid;
    wire    [(64/(depth_7)) - 1:0]  MEM_zeta_7_addr;
    wire    [BIT_LEN-1:0]           zeta_7;

    wire                    BU_7_i_valid;
    wire    [BIT_LEN - 1:0] BU_7_in_data_u;
    wire    [BIT_LEN - 1:0] BU_7_in_data_d;
    wire                    BU_7_o_valid;
    wire    [BIT_LEN - 1:0] BU_7_out_data_u;
    wire    [BIT_LEN - 1:0] BU_7_out_data_d;

    assign RU_7_i_valid   = mode ? BU_7_o_valid     : BU_6_o_valid;
    assign RU_7_in_data_u = mode ? BU_7_out_data_u  : BU_6_out_data_u;
    assign RU_7_in_data_d = mode ? BU_7_out_data_d  : BU_6_out_data_d;

    assign CONTR_7_i_valid   = mode ? i_valid : RU_7_o_valid;

    assign BU_7_i_valid   = mode ? i_valid  : RU_7_o_valid;
    assign BU_7_in_data_u = mode ? NTT_in_u : RU_7_out_data_u;
    assign BU_7_in_data_d = mode ? NTT_in_d : RU_7_out_data_d;
    
    

    RU #(
        .BIT_LEN(BIT_LEN),
        .depth(depth_7)
    ) RU_7(
        .clk(clk),
        .reset(reset),
        .i_valid(RU_7_i_valid),
        .in_u(RU_7_in_data_u),
        .in_d(RU_7_in_data_d),
        .o_valid(RU_7_o_valid),
        .out_u(RU_7_out_data_u),
        .out_d(RU_7_out_data_d)
    );

    CONTR#(
        .BIT_LEN(BIT_LEN),
        .depth(depth_7)
    ) CONTR_7(
        .clk(clk),
        .reset(reset),
        .mode(mode),
        .i_valid(CONTR_7_i_valid),
        .zeta_addr(MEM_zeta_7_addr)
    );


    rom #(
        .WIDTH(BIT_LEN),
        .LENGTH(128/depth_7),
        .INIT_FILE("../../../../NTT.srcs/sources_1/imports/NTT/MEM_zeta/MEM_zeta_7.txt")
    ) MEM_zeta_7(
        .clk(clk), 
        .en(1'b1), 
        .addr(MEM_zeta_7_addr), 
        .do(zeta_7)
    );


    BU BU_7(
        .reset(reset),
        .clk(clk),
        .mode(mode),
        .i_valid(BU_7_i_valid),
        .a(BU_7_in_data_u),
        .b(BU_7_in_data_d),
        .zeta(zeta_7),
        .o_valid(BU_7_o_valid),
        .out_a(BU_7_out_data_u),
        .out_b(BU_7_out_data_d)
    );
    // /*** stage 2 ***/
    // wire                    RU_j_i_valid;
    // wire    [BIT_LEN - 1:0] RU_j_in_data_u;
    // wire    [BIT_LEN - 1:0] RU_j_in_data_d;
    // wire                    RU_j_o_valid;
    // wire    [BIT_LEN - 1:0] RU_j_out_data_u;
    // wire    [BIT_LEN - 1:0] RU_j_out_data_d;

    // wire    [(64/(depth_j)) - 1:0]  MEM_zeta_j_addr;
    // wire    [BIT_LEN-1:0]           zeta_j;

    // wire                    BU_j_i_valid;
    // wire    [BIT_LEN - 1:0] BU_j_in_data_u;
    // wire    [BIT_LEN - 1:0] BU_j_in_data_d;
    // wire                    BU_j_o_valid;
    // wire    [BIT_LEN - 1:0] BU_j_out_data_u;
    // wire    [BIT_LEN - 1:0] BU_j_out_data_d;

    // assign RU_j_i_valid   = BU_0_o_valid;//
    // assign RU_j_in_data_u = BU_0_out_data_u;//
    // assign RU_j_in_data_d = BU_0_out_data_d;//

    // assign BU_j_i_valid   = RU_j_o_valid;
    // assign BU_j_in_data_u = RU_j_out_data_u;
    // assign BU_j_in_data_d = RU_j_out_data_d;
    
    // RU #(
    //     .BIT_LEN(BIT_LEN),
    //     .depth(depth_j)
    // ) RU_j(
    //     .clk(clk),
    //     .reset(reset),
    //     .i_valid(RU_j_i_valid),
    //     .in_u(RU_j_in_data_u),
    //     .in_d(RU_j_in_data_d),
    //     .o_valid(RU_j_o_valid),
    //     //.zeta_trig(RU_j_zeta_trig),
    //     .out_u(RU_j_out_data_u),
    //     .out_d(RU_j_out_data_d)
    // );

    // CONTR#(
    //     .BIT_LEN(BIT_LEN),
    //     .depth(depth_j)
    // ) CONTR_j(
    //     .clk(clk),
    //     .reset(reset),
    //     .mode(mode),
    //     .i_valid(RU_j_o_valid),
    //     //.zeta_trig(RU_j_zeta_trig),
    //     .zeta_addr(MEM_zeta_j_addr)
    // );


    // rom #(
    //     .WIDTH(BIT_LEN),
    //     .LENGTH(128/depth_j),
    //     .INIT_FILE("../../../../NTT.srcs/sources_1/imports/NTT/MEM_zeta/MEM_zeta_j.txt")
    // ) MEM_zeta_j(
    //     .clk(clk), 
    //     .en(1'b1), 
    //     .addr(MEM_zeta_j_addr), 
    //     .do(zeta_j)
    // );


    // BU BU_j(
    //     .reset(reset),
    //     .clk(clk),
    //     .mode(mode),
    //     .i_valid(BU_j_i_valid),
    //     .a(BU_j_in_data_u),
    //     .b(BU_j_in_data_d),
    //     .zeta(zeta_j),
    //     .o_valid(BU_j_o_valid),
    //     .out_a(BU_j_out_data_u),
    //     .out_b(BU_j_out_data_d)
    // );
endmodule

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

//     localparam stage_NUM = 7;
//     localparam stage_1   = 0;

//     localparam HLEN = 8;

//     localparam depth = 64;
//     localparam depth_1 = 64;
//     localparam depth_2 = 32;
//     localparam depth_3 = 16;
//     localparam depth_4 = 8;
//     localparam depth_5 = 4;
//     localparam depth_6 = 2;
//     localparam depth_7 = 1;

//     // --- 宣告 wire array ---
//     wire [6:0] RU_i_valid;
//     wire [(BIT_LEN-1)*stage_NUM:0] RU_in_data_u;
//     wire [(BIT_LEN-1)*stage_NUM:0] RU_in_data_d;
//     wire [6:0] RU_o_valid;
//     wire [(BIT_LEN-1)*stage_NUM:0] RU_out_data_u;
//     wire [(BIT_LEN-1)*stage_NUM:0] RU_out_data_d;
//     wire [6:0] RU_zeta_trig;

//     wire [HLEN*stage_NUM-1:0] MEM_zeta_addr; // 每一層的zeta addr，位寬會依depth不同要細調
//     wire [(BIT_LEN-1)*(stage_NUM+1):0] zeta;

//     wire [6:0] BU_i_valid;
//     wire [(BIT_LEN-1)*stage_NUM:0] BU_in_data_u;
//     wire [(BIT_LEN-1)*stage_NUM:0] BU_in_data_d;
//     wire [6:0] BU_o_valid;
//     wire [(BIT_LEN-1)*stage_NUM:0] BU_out_data_u;
//     wire [(BIT_LEN-1)*stage_NUM:0] BU_out_data_d;


//     assign zeta[BIT_LEN*(stage_1 + 1) - 1:BIT_LEN*stage_1] = 23'h495e02;

//     assign BU_i_valid[0]   = i_valid;
//     assign BU_in_data_u[BIT_LEN*(stage_1 + 1) - 1:BIT_LEN*stage_1] = NTT_in_u;
//     assign BU_in_data_d[BIT_LEN*(stage_1 + 1) - 1:BIT_LEN*stage_1] = NTT_in_d;

//     genvar i;
//     // --- Generate RU ---
//     // --- Wire Connect for RU input ---
//     generate
//         for (i = 0; i < 7; i = i + 1) begin : CONNECT_RU_INPUT
//             assign RU_i_valid[i] = BU_o_valid[i] ? 1'b1 : 1'b0;
//             assign RU_in_data_u[BIT_LEN*(i + 1) - 1:BIT_LEN*i] = BU_out_data_u[BIT_LEN*(i + 1) - 1:BIT_LEN*i];
//             assign RU_in_data_d[BIT_LEN*(i + 1) - 1:BIT_LEN*i] = BU_out_data_d[BIT_LEN*(i + 1) - 1:BIT_LEN*i];
//         end
//     endgenerate

//     // genvar j;
//     // // --- Generate RU ---
//     // generate
//     //     for (j = 0; j < 7; j = j + 1) begin : GEN_RU
//     //         RU #(
//     //             .BIT_LEN(BIT_LEN)
//     //             // .depth(depth>>j)
//     //         ) RU_inst (
//     //             .clk(clk),
//     //             .reset(reset),
//     //             .i_valid(BU_o_valid[j]),
//     //             .in_u(RU_in_data_u[BIT_LEN*(j + 1) - 1:BIT_LEN*j] ),
//     //             .in_d(RU_in_data_d[BIT_LEN*(j + 1) - 1:BIT_LEN*j] ),
//     //             .o_valid(RU_o_valid[j]),
//     //             //.zeta_trig(RU_zeta_trig[j]),
//     //             .out_u(RU_out_data_u[BIT_LEN*(j + 1) - 1:BIT_LEN*j] ),
//     //             .out_d(RU_out_data_d[BIT_LEN*(j + 1) - 1:BIT_LEN*j] )
//     //         );
//     //     end
//     // endgenerate

//     // --- Generate CONTR ---
//     generate
//         for (i = 0; i < 8; i = i + 1) begin : GEN_CONTR
//             CONTR CONTR_inst(
//                 .clk(clk),
//                 .reset(reset),
//                 .mode(mode),
//                 .i_valid(RU_o_valid[i]),
//                 //.zeta_trig(RU_zeta_trig[i]),
//                 .zeta_addr(MEM_zeta_addr[HLEN*(i + 1) - 1:HLEN*i])
//             );
//         end
//     endgenerate

//     // --- Wire Connect for BU input ---
//     generate
//         for (i = 1; i < 8; i = i + 1) begin : CONNECT_BU_INPUT
//             assign BU_i_valid[i] = RU_o_valid[i-1];
//             assign BU_in_data_u[BIT_LEN*(i + 1) - 1:BIT_LEN*i] = RU_out_data_u[BIT_LEN*i - 1:BIT_LEN*(i - 1)];
//             assign BU_in_data_d[BIT_LEN*(i + 1) - 1:BIT_LEN*i] = RU_out_data_d[BIT_LEN*i - 1:BIT_LEN*(i - 1)];
//         end
//     endgenerate

//     // --- Generate BU ---
//     generate
//         for (i = 0; i < 8; i = i + 1) begin : GEN_BU
//             BU BU_inst (
//                 .reset(reset),
//                 .clk(clk),
//                 .mode(mode),
//                 .i_valid(BU_i_valid[i]),
//                 .a(BU_in_data_u[BIT_LEN*(i + 1) - 1:BIT_LEN*i]),
//                 .b(BU_in_data_d[BIT_LEN*(i + 1) - 1:BIT_LEN*i]),
//                 .zeta(zeta[BIT_LEN*(i + 1) - 1:BIT_LEN*i]),
//                 .o_valid(BU_o_valid[i]),
//                 .out_a(BU_out_data_u[BIT_LEN*(i + 1) - 1:BIT_LEN*i]),
//                 .out_b(BU_out_data_d[BIT_LEN*(i + 1) - 1:BIT_LEN*i])
//             );
//         end
//     endgenerate

//     RU #(
//         .BIT_LEN(BIT_LEN),
//         .depth(depth>>0)
//     ) RU_inst_0(
//         .clk(clk),
//         .reset(reset),
//         .i_valid(RU_i_valid[0]),
//         .in_u(RU_in_data_u[BIT_LEN*(0 + 1) - 1:BIT_LEN*0] ),
//         .in_d(RU_in_data_d[BIT_LEN*(0 + 1) - 1:BIT_LEN*0] ),
//         .o_valid(RU_o_valid[0]),
//         //.zeta_trig(RU_zeta_trig[0]),
//         .out_u(RU_out_data_u[BIT_LEN*(0 + 1) - 1:BIT_LEN*0] ),
//         .out_d(RU_out_data_d[BIT_LEN*(0 + 1) - 1:BIT_LEN*0] )
//     );

//     RU #(
//         .BIT_LEN(BIT_LEN),
//         .depth(depth>>1)
//     ) RU_inst_1 (
//         .clk(clk),
//         .reset(reset),
//         .i_valid(RU_i_valid[1]),
//         .in_u(RU_in_data_u[BIT_LEN*(1 + 1) - 1:BIT_LEN*1] ),
//         .in_d(RU_in_data_d[BIT_LEN*(1 + 1) - 1:BIT_LEN*1] ),
//         .o_valid(RU_o_valid[1]),
//         //.zeta_trig(RU_zeta_trig[1]),
//         .out_u(RU_out_data_u[BIT_LEN*(1 + 1) - 1:BIT_LEN*1] ),
//         .out_d(RU_out_data_d[BIT_LEN*(1 + 1) - 1:BIT_LEN*1] )
//     );

//     RU #(
//         .BIT_LEN(BIT_LEN),
//         .depth(depth>>2)
//     ) RU_inst_2 (
//         .clk(clk),
//         .reset(reset),
//         .i_valid(RU_i_valid[2]),
//         .in_u(RU_in_data_u[BIT_LEN*(2 + 1) - 1:BIT_LEN*2] ),
//         .in_d(RU_in_data_d[BIT_LEN*(2 + 1) - 1:BIT_LEN*2] ),
//         .o_valid(RU_o_valid[2]),
//         //.zeta_trig(RU_zeta_trig[2]),
//         .out_u(RU_out_data_u[BIT_LEN*(2 + 1) - 1:BIT_LEN*2] ),
//         .out_d(RU_out_data_d[BIT_LEN*(2 + 1) - 1:BIT_LEN*2] )
//     );

//     RU #(
//         .BIT_LEN(BIT_LEN),
//         .depth(depth>>3)
//     ) RU_inst_3 (
//         .clk(clk),
//         .reset(reset),
//         .i_valid(RU_i_valid[3]),
//         .in_u(RU_in_data_u[BIT_LEN*(3 + 1) - 1:BIT_LEN*3] ),
//         .in_d(RU_in_data_d[BIT_LEN*(3 + 1) - 1:BIT_LEN*3] ),
//         .o_valid(RU_o_valid[3]),
//         //.zeta_trig(RU_zeta_trig[3]),
//         .out_u(RU_out_data_u[BIT_LEN*(3 + 1) - 1:BIT_LEN*3] ),
//         .out_d(RU_out_data_d[BIT_LEN*(3 + 1) - 1:BIT_LEN*3] )
//     );

//     RU #(
//         .BIT_LEN(BIT_LEN),
//         .depth(depth>>4)
//     ) RU_inst_4 (
//         .clk(clk),
//         .reset(reset),
//         .i_valid(RU_i_valid[4]),
//         .in_u(RU_in_data_u[BIT_LEN*(4 + 1) - 1:BIT_LEN*4] ),
//         .in_d(RU_in_data_d[BIT_LEN*(4 + 1) - 1:BIT_LEN*4] ),
//         .o_valid(RU_o_valid[4]),
//         //.zeta_trig(RU_zeta_trig[4]),
//         .out_u(RU_out_data_u[BIT_LEN*(4 + 1) - 1:BIT_LEN*4] ),
//         .out_d(RU_out_data_d[BIT_LEN*(4 + 1) - 1:BIT_LEN*4] )
//     );

//     RU #(
//         .BIT_LEN(BIT_LEN),
//         .depth(depth>>5)
//     ) RU_inst_5 (
//         .clk(clk),
//         .reset(reset),
//         .i_valid(RU_i_valid[5]),
//         .in_u(RU_in_data_u[BIT_LEN*(5 + 1) - 1:BIT_LEN*5] ),
//         .in_d(RU_in_data_d[BIT_LEN*(5 + 1) - 1:BIT_LEN*5] ),
//         .o_valid(RU_o_valid[5]),
//         //.zeta_trig(RU_zeta_trig[5]),
//         .out_u(RU_out_data_u[BIT_LEN*(5 + 1) - 1:BIT_LEN*5] ),
//         .out_d(RU_out_data_d[BIT_LEN*(5 + 1) - 1:BIT_LEN*5] )
//     );

//     RU #(
//         .BIT_LEN(BIT_LEN),
//         .depth(depth>>6)
//     ) RU_inst_6 (
//         .clk(clk),
//         .reset(reset),
//         .i_valid(RU_i_valid[6]),
//         .in_u(RU_in_data_u[BIT_LEN*(6 + 1) - 1:BIT_LEN*6] ),
//         .in_d(RU_in_data_d[BIT_LEN*(6 + 1) - 1:BIT_LEN*6] ),
//         .o_valid(RU_o_valid[6]),
//         //.zeta_trig(RU_zeta_trig[6]),
//         .out_u(RU_out_data_u[BIT_LEN*(6 + 1) - 1:BIT_LEN*6] ),
//         .out_d(RU_out_data_d[BIT_LEN*(6 + 1) - 1:BIT_LEN*6] )
//     );

//     RU #(
//         .BIT_LEN(BIT_LEN),
//         .depth(depth>>7)
//     ) RU_inst_7 (
//         .clk(clk),
//         .reset(reset),
//         .i_valid(RU_i_valid[7]),
//         .in_u(RU_in_data_u[BIT_LEN*(7 + 1) - 1:BIT_LEN*7] ),
//         .in_d(RU_in_data_d[BIT_LEN*(7 + 1) - 1:BIT_LEN*7] ),
//         .o_valid(RU_o_valid[7]),
//         //.zeta_trig(RU_zeta_trig[7]),
//         .out_u(RU_out_data_u[BIT_LEN*(7 + 1) - 1:BIT_LEN*7] ),
//         .out_d(RU_out_data_d[BIT_LEN*(7 + 1) - 1:BIT_LEN*7] )
//     );


//     rom #(
//         .WIDTH(BIT_LEN),
//         .LENGTH(128/depth_1),
//         .INIT_FILE("../../../../NTT.srcs/sources_1/imports/NTT/MEM_zeta/MEM_zeta_1.txt")
//     ) MEM_zeta_1(
//         .clk(clk), 
//         .en(1'b1), 
//         .addr(MEM_zeta_addr[HLEN*(1)  - 1:HLEN*(1 - 1)]), 
//         .do(zeta[BIT_LEN*(1 + 1) - 1:BIT_LEN*1])
//     );

//     rom #(
//         .WIDTH(BIT_LEN),
//         .LENGTH(128/depth_2),
//         .INIT_FILE("../../../../NTT.srcs/sources_1/imports/NTT/MEM_zeta/MEM_zeta_2.txt")
//     ) MEM_zeta_2(
//         .clk(clk), 
//         .en(1'b1), 
//         .addr(MEM_zeta_addr[HLEN*(2) - 1:HLEN*(2 - 1)]), 
//         .do(zeta[BIT_LEN*(2 + 1) - 1:BIT_LEN*2])
//     );

//     rom #(
//         .WIDTH(BIT_LEN),
//         .LENGTH(128/depth_3),
//         .INIT_FILE("../../../../NTT.srcs/sources_1/imports/NTT/MEM_zeta/MEM_zeta_3.txt")
//     ) MEM_zeta_3(
//         .clk(clk), 
//         .en(1'b1), 
//         .addr(MEM_zeta_addr[HLEN*(3) - 1:HLEN*(3 - 1)]), 
//         .do(zeta[BIT_LEN*(3 + 1) - 1:BIT_LEN*3])
//     );

//     rom #(
//         .WIDTH(BIT_LEN),
//         .LENGTH(128/depth_4),
//         .INIT_FILE("../../../../NTT.srcs/sources_1/imports/NTT/MEM_zeta/MEM_zeta_4.txt")
//     ) MEM_zeta_4(
//         .clk(clk), 
//         .en(1'b1), 
//         .addr(MEM_zeta_addr[HLEN*(4) - 1:HLEN*(4 - 1)]), 
//         .do(zeta[BIT_LEN*(4 + 1) - 1:BIT_LEN*4])
//     );

//     rom #(
//         .WIDTH(BIT_LEN),
//         .LENGTH(128/depth_5),
//         .INIT_FILE("../../../../NTT.srcs/sources_1/imports/NTT/MEM_zeta/MEM_zeta_5.txt")
//     ) MEM_zeta_5(
//         .clk(clk), 
//         .en(1'b1), 
//         .addr(MEM_zeta_addr[HLEN*(5) - 1:HLEN*(5 - 1)]), 
//         .do(zeta[BIT_LEN*(5 + 1) - 1:BIT_LEN*5])
//     );

//     rom #(
//         .WIDTH(BIT_LEN),
//         .LENGTH(128/depth_6),
//         .INIT_FILE("../../../../NTT.srcs/sources_1/imports/NTT/MEM_zeta/MEM_zeta_6.txt")
//     ) MEM_zeta_6(
//         .clk(clk), 
//         .en(1'b1), 
//         .addr(MEM_zeta_addr[HLEN*(6) - 1:HLEN*(6 - 1)]), 
//         .do(zeta[BIT_LEN*(6 + 1) - 1:BIT_LEN*6])
//     );

//     rom #(
//         .WIDTH(BIT_LEN),
//         .LENGTH(128/depth_7),
//         .INIT_FILE("../../../../NTT.srcs/sources_1/imports/NTT/MEM_zeta/MEM_zeta_7.txt")
//     ) MEM_zeta_7(
//         .clk(clk), 
//         .en(1'b1), 
//         .addr(MEM_zeta_addr[HLEN*(7) - 1:HLEN*(7 - 1)]), 
//         .do(zeta[BIT_LEN*(7 + 1) - 1:BIT_LEN*7])
//     );
// endmodule

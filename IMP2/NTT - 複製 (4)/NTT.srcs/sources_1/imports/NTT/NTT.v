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
    output reg           done
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

    /*** stage 0 ***/
    wire                    BU_0_i_valid;
    wire    [BIT_LEN - 1:0] BU_0_in_data_u;
    wire    [BIT_LEN - 1:0] BU_0_in_data_d;
    wire                    BU_0_o_valid;
    wire    [BIT_LEN - 1:0] BU_0_out_data_u;
    wire    [BIT_LEN - 1:0] BU_0_out_data_d;

    /*** stage 1 ***/
    wire                    RU_1_i_valid;
    wire    [BIT_LEN - 1:0] RU_1_in_data_u;
    wire    [BIT_LEN - 1:0] RU_1_in_data_d;
    wire                    RU_1_o_valid;
    wire    [BIT_LEN - 1:0] RU_1_out_data_u;
    wire    [BIT_LEN - 1:0] RU_1_out_data_d;
    wire                            CONTR_1_i_valid;
    wire    [(64/(depth_1)) - 1:0]  MEM_zeta_1_addr;
    wire    [BIT_LEN-1:0]           zeta_1;
    wire                    BU_1_i_valid;
    wire    [BIT_LEN - 1:0] BU_1_in_data_u;
    wire    [BIT_LEN - 1:0] BU_1_in_data_d;
    wire                    BU_1_o_valid;
    wire    [BIT_LEN - 1:0] BU_1_out_data_u;
    wire    [BIT_LEN - 1:0] BU_1_out_data_d;

     /*** stage 2 ***/
    wire                    RU_2_i_valid;
    wire    [BIT_LEN - 1:0] RU_2_in_data_u;
    wire    [BIT_LEN - 1:0] RU_2_in_data_d;
    wire                    RU_2_o_valid;
    wire    [BIT_LEN - 1:0] RU_2_out_data_u;
    wire    [BIT_LEN - 1:0] RU_2_out_data_d;
    wire                            CONTR_2_i_valid;
    wire    [(64/(depth_2)) - 1:0]  MEM_zeta_2_addr;
    wire    [BIT_LEN-1:0]           zeta_2;
    wire                    BU_2_i_valid;
    wire    [BIT_LEN - 1:0] BU_2_in_data_u;
    wire    [BIT_LEN - 1:0] BU_2_in_data_d;
    wire                    BU_2_o_valid;
    wire    [BIT_LEN - 1:0] BU_2_out_data_u;
    wire    [BIT_LEN - 1:0] BU_2_out_data_d;

    /*** stage 3 ***/
    wire                    RU_3_i_valid;
    wire    [BIT_LEN - 1:0] RU_3_in_data_u;
    wire    [BIT_LEN - 1:0] RU_3_in_data_d;
    wire                    RU_3_o_valid;
    wire    [BIT_LEN - 1:0] RU_3_out_data_u;
    wire    [BIT_LEN - 1:0] RU_3_out_data_d;
    wire                            CONTR_3_i_valid;
    wire    [(64/(depth_3)) - 1:0]  MEM_zeta_3_addr;
    wire    [BIT_LEN-1:0]           zeta_3;
    wire                    BU_3_i_valid;
    wire    [BIT_LEN - 1:0] BU_3_in_data_u;
    wire    [BIT_LEN - 1:0] BU_3_in_data_d;
    wire                    BU_3_o_valid;
    wire    [BIT_LEN - 1:0] BU_3_out_data_u;
    wire    [BIT_LEN - 1:0] BU_3_out_data_d;

    /*** stage 4 ***/
    wire                    RU_4_i_valid;
    wire    [BIT_LEN - 1:0] RU_4_in_data_u;
    wire    [BIT_LEN - 1:0] RU_4_in_data_d;
    wire                    RU_4_o_valid;
    wire    [BIT_LEN - 1:0] RU_4_out_data_u;
    wire    [BIT_LEN - 1:0] RU_4_out_data_d;
    wire                            CONTR_4_i_valid;
    wire    [(64/(depth_4)) - 1:0]  MEM_zeta_4_addr;
    wire    [BIT_LEN-1:0]           zeta_4;
    wire                    BU_4_i_valid;
    wire    [BIT_LEN - 1:0] BU_4_in_data_u;
    wire    [BIT_LEN - 1:0] BU_4_in_data_d;
    wire                    BU_4_o_valid;
    wire    [BIT_LEN - 1:0] BU_4_out_data_u;
    wire    [BIT_LEN - 1:0] BU_4_out_data_d;

    /*** stage 5 ***/
    wire                    RU_5_i_valid;
    wire    [BIT_LEN - 1:0] RU_5_in_data_u;
    wire    [BIT_LEN - 1:0] RU_5_in_data_d;
    wire                    RU_5_o_valid;
    wire    [BIT_LEN - 1:0] RU_5_out_data_u;
    wire    [BIT_LEN - 1:0] RU_5_out_data_d;
    wire                            CONTR_5_i_valid;
    wire    [(64/(depth_5)) - 1:0]  MEM_zeta_5_addr;
    wire    [BIT_LEN-1:0]           zeta_5;
    wire                    BU_5_i_valid;
    wire    [BIT_LEN - 1:0] BU_5_in_data_u;
    wire    [BIT_LEN - 1:0] BU_5_in_data_d;
    wire                    BU_5_o_valid;
    wire    [BIT_LEN - 1:0] BU_5_out_data_u;
    wire    [BIT_LEN - 1:0] BU_5_out_data_d;

    /*** stage 6 ***/
    wire                    RU_6_i_valid;
    wire    [BIT_LEN - 1:0] RU_6_in_data_u;
    wire    [BIT_LEN - 1:0] RU_6_in_data_d;
    wire                    RU_6_o_valid;
    wire    [BIT_LEN - 1:0] RU_6_out_data_u;
    wire    [BIT_LEN - 1:0] RU_6_out_data_d;
    wire                            CONTR_6_i_valid;
    wire    [(64/(depth_6)) - 1:0]  MEM_zeta_6_addr;
    wire    [BIT_LEN-1:0]           zeta_6;
    wire                    BU_6_i_valid;
    wire    [BIT_LEN - 1:0] BU_6_in_data_u;
    wire    [BIT_LEN - 1:0] BU_6_in_data_d;
    wire                    BU_6_o_valid;
    wire    [BIT_LEN - 1:0] BU_6_out_data_u;
    wire    [BIT_LEN - 1:0] BU_6_out_data_d;

    /*** stage 7 ***/
    wire                    RU_7_i_valid;
    wire    [BIT_LEN - 1:0] RU_7_in_data_u;
    wire    [BIT_LEN - 1:0] RU_7_in_data_d;
    wire                    RU_7_o_valid;
    wire    [BIT_LEN - 1:0] RU_7_out_data_u;
    wire    [BIT_LEN - 1:0] RU_7_out_data_d;
    wire                            CONTR_7_i_valid;
    wire    [(64/(depth_7)) - 1:0]  MEM_zeta_7_addr;
    wire    [BIT_LEN-1:0]           zeta_7;
    wire                    BU_7_i_valid;
    wire    [BIT_LEN - 1:0] BU_7_in_data_u;
    wire    [BIT_LEN - 1:0] BU_7_in_data_d;
    wire                    BU_7_o_valid;
    wire    [BIT_LEN - 1:0] BU_7_out_data_u;
    wire    [BIT_LEN - 1:0] BU_7_out_data_d;

    /*** NTT ***/
    reg [7:0]   cnt_i;
    reg [7:0]   cnt_o;

    always @(posedge clk) begin
        if(reset)
            cnt_i <= 8'd0;
        else if(done)
            cnt_i <= 8'd0;
        else if(i_valid)
            cnt_i <= cnt_i + 1'b1;
    end

    always @(posedge clk) begin
        if(reset)
            cnt_o <= 8'd0;
        else if(done)
            cnt_o <= 8'd0;
        else if(o_valid)
            cnt_o <= cnt_o + 1'b1;
    end

    always @(posedge clk) begin
        if(reset)
            done <= 1'b0;
        else
            done <= cnt_o == 127 && o_valid ? 1'b1 : 1'b0;
    end


    assign i_ready   = cnt_i <= 128;
    assign o_valid   = mode ? BU_0_o_valid    : BU_7_o_valid;
    assign NTT_out_u = mode ? BU_0_out_data_u : BU_7_out_data_u;
    assign NTT_out_d = mode ? BU_0_out_data_d : BU_7_out_data_d;
    assign NTT_addr_u = mode ? cnt_o          : cnt_o << 1;
    assign NTT_addr_d = mode ? cnt_o + 8'd128 : (cnt_o << 1) + 1'b1;
    /*** stage 0 ***/
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
endmodule
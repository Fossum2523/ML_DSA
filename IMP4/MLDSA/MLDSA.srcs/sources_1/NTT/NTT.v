module NTT#(
    parameter BIT_LEN = 23
    )(
	input                clk,
	input                resetn,
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

    localparam  DELAY_CYCLES  = 2; 

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
    wire    [BIT_LEN - 1:0] BU_0_in_zeta;
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
    wire                                    CONTR_1_i_valid;
    wire    [$clog2(128/(depth_1)) - 1:0]   MEM_zeta_1_addr;
    reg     [BIT_LEN-1:0]                   zeta_1;
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
    wire                                    CONTR_2_i_valid;
    wire    [$clog2(128/(depth_2)) - 1:0]   MEM_zeta_2_addr;
    reg     [BIT_LEN-1:0]                   zeta_2;
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
    wire                                    CONTR_3_i_valid;
    wire    [$clog2(128/(depth_3)) - 1:0]   MEM_zeta_3_addr;
    reg     [BIT_LEN-1:0]                   zeta_3;
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
    wire                                    CONTR_4_i_valid;
    wire    [$clog2(128/(depth_4)) - 1:0]   MEM_zeta_4_addr;
    reg     [BIT_LEN-1:0]                   zeta_4;
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
    wire                                    CONTR_5_i_valid;
    wire    [$clog2(128/(depth_5)) - 1:0]   MEM_zeta_5_addr;
    reg     [BIT_LEN-1:0]                   zeta_5;
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
    wire                                    CONTR_6_i_valid;
    wire    [$clog2(128/(depth_6)) - 1:0]   MEM_zeta_6_addr;
    reg     [BIT_LEN-1:0]                   zeta_6;
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
    wire                                    CONTR_7_i_valid;
    wire    [$clog2(128/(depth_7)) - 1:0]   MEM_zeta_7_addr;
    reg     [BIT_LEN-1:0]                   zeta_7;
    wire                    BU_7_i_valid;
    wire    [BIT_LEN - 1:0] BU_7_in_data_u;
    wire    [BIT_LEN - 1:0] BU_7_in_data_d;
    wire                    BU_7_o_valid;
    wire    [BIT_LEN - 1:0] BU_7_out_data_u;
    wire    [BIT_LEN - 1:0] BU_7_out_data_d;

    /*** NTT ***/
    reg [7:0]   cnt_i;
    reg [7:0]   cnt_o;
    wire [BIT_LEN*2-1:0]  inv_rot_o_u;
    wire [BIT_LEN*2-1:0]  inv_rot_o_d;
    wire [BIT_LEN-1:0]    INTT_o_u;
    wire [BIT_LEN-1:0]    INTT_o_d;
    reg  [DELAY_CYCLES - 1:0 ]  valid_buf;

    always @(posedge clk or negedge resetn) begin
        if(!resetn)
            cnt_i <= 8'd0;
        else if(done)
            cnt_i <= 8'd0;
        else if(i_valid)
            cnt_i <= cnt_i + 1'b1;
    end

    always @(posedge clk or negedge resetn) begin
        if(!resetn)
            cnt_o <= 8'd0;
        else if(done)
            cnt_o <= 8'd0;
        else if(o_valid)
            cnt_o <= cnt_o + 1'b1;
    end

    always @(posedge clk or negedge resetn) begin
        if(!resetn)
            done <= 1'b0;
        else
            done <= cnt_o == 127 && o_valid ? 1'b1 : 1'b0;
    end

    assign i_ready   = cnt_i <= 128;
    assign o_valid   = mode ? valid_buf[DELAY_CYCLES-1] : BU_7_o_valid;

    assign inv_rot_o_u = BU_0_out_data_u * 23'd8347681;
    assign inv_rot_o_d = BU_0_out_data_d * 23'd8347681;

    Modular_Reduction MR1(clk,resetn,inv_rot_o_u, INTT_o_u);
    Modular_Reduction MR2(clk,resetn,inv_rot_o_d, INTT_o_d);

    always @(posedge clk or negedge resetn) begin
        if (!resetn)
            valid_buf <= {DELAY_CYCLES{1'b0}};
        else 
            valid_buf <= {valid_buf[DELAY_CYCLES-2:0],BU_0_o_valid};
    end  
    
    assign NTT_out_u = mode ? INTT_o_u : BU_7_out_data_u;
    assign NTT_out_d = mode ? INTT_o_d : BU_7_out_data_d;
    
    assign NTT_addr_u = mode ? cnt_o          : cnt_o << 1;
    assign NTT_addr_d = mode ? cnt_o + 8'd128 : (cnt_o << 1) + 1'b1;
    /*** stage 0 ***/
    assign BU_0_i_valid   = mode ? RU_1_o_valid    : i_valid;
    assign BU_0_in_zeta   = 23'h495e02;
    // assign BU_0_in_zeta   = mode ? 23'd8380417 - 23'h495e02 : 23'h495e02;
    assign BU_0_in_data_u = mode ? RU_1_out_data_u : NTT_in_u;
    assign BU_0_in_data_d = mode ? RU_1_out_data_d : NTT_in_d;


    BU BU_0(
        .resetn(resetn),
        .clk(clk),
        .mode(mode),
        .i_valid(BU_0_i_valid),
        .a(BU_0_in_data_u),
        .b(BU_0_in_data_d),
        .zeta(BU_0_in_zeta),
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
        .resetn(resetn),
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
        .resetn(resetn),
        .mode(mode),
        .i_valid(CONTR_1_i_valid),
        .zeta_addr(MEM_zeta_1_addr)
    );


    // rom #(
    //     .WIDTH(BIT_LEN),
    //     .LENGTH(128/depth_1),
    //     .INIT_FILE("../../../../NTT.srcs/sources_1/imports/NTT/MEM_zeta/MEM_zeta_1.txt")
    // ) MEM_zeta_1(
    //     .clk(clk), 
    //     .en(1'b1), 
    //     .addr(MEM_zeta_1_addr), 
    //     .do(zeta_1)
    // );


    BU BU_1(
        .resetn(resetn),
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
        .resetn(resetn),
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
        .resetn(resetn),
        .mode(mode),
        .i_valid(CONTR_2_i_valid),
        .zeta_addr(MEM_zeta_2_addr)
    );


    // rom #(
    //     .WIDTH(BIT_LEN),
    //     .LENGTH(128/depth_2),
    //     .INIT_FILE("../../../../NTT.srcs/sources_1/imports/NTT/MEM_zeta/MEM_zeta_2.txt")
    // ) MEM_zeta_2(
    //     .clk(clk), 
    //     .en(1'b1), 
    //     .addr(MEM_zeta_2_addr), 
    //     .do(zeta_2)
    // );


    BU BU_2(
        .resetn(resetn),
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
        .resetn(resetn),
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
        .resetn(resetn),
        .mode(mode),
        .i_valid(CONTR_3_i_valid),
        .zeta_addr(MEM_zeta_3_addr)
    );


    // rom #(
    //     .WIDTH(BIT_LEN),
    //     .LENGTH(128/depth_3),
    //     .INIT_FILE("../../../../NTT.srcs/sources_1/imports/NTT/MEM_zeta/MEM_zeta_3.txt")
    // ) MEM_zeta_3(
    //     .clk(clk), 
    //     .en(1'b1), 
    //     .addr(MEM_zeta_3_addr), 
    //     .do(zeta_3)
    // );


    BU BU_3(
        .resetn(resetn),
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
        .resetn(resetn),
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
        .resetn(resetn),
        .mode(mode),
        .i_valid(CONTR_4_i_valid),
        .zeta_addr(MEM_zeta_4_addr)
    );


    // rom #(
    //     .WIDTH(BIT_LEN),
    //     .LENGTH(128/depth_4),
    //     .INIT_FILE("../../../../NTT.srcs/sources_1/imports/NTT/MEM_zeta/MEM_zeta_4.txt")
    // ) MEM_zeta_4(
    //     .clk(clk), 
    //     .en(1'b1), 
    //     .addr(MEM_zeta_4_addr), 
    //     .do(zeta_4)
    // );


    BU BU_4(
        .resetn(resetn),
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
        .resetn(resetn),
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
        .resetn(resetn),
        .mode(mode),
        .i_valid(CONTR_5_i_valid),
        .zeta_addr(MEM_zeta_5_addr)
    );


    // rom #(
    //     .WIDTH(BIT_LEN),
    //     .LENGTH(128/depth_5),
    //     .INIT_FILE("../../../../NTT.srcs/sources_1/imports/NTT/MEM_zeta/MEM_zeta_5.txt")
    // ) MEM_zeta_5(
    //     .clk(clk), 
    //     .en(1'b1), 
    //     .addr(MEM_zeta_5_addr), 
    //     .do(zeta_5)
    // );


    BU BU_5(
        .resetn(resetn),
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
        .resetn(resetn),
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
        .resetn(resetn),
        .mode(mode),
        .i_valid(CONTR_6_i_valid),
        .zeta_addr(MEM_zeta_6_addr)
    );


    // rom #(
    //     .WIDTH(BIT_LEN),
    //     .LENGTH(128/depth_6),
    //     .INIT_FILE("../../../../NTT.srcs/sources_1/imports/NTT/MEM_zeta/MEM_zeta_6.txt")
    // ) MEM_zeta_6(
    //     .clk(clk), 
    //     .en(1'b1), 
    //     .addr(MEM_zeta_6_addr), 
    //     .do(zeta_6)
    // );


    BU BU_6(
        .resetn(resetn),
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
        .resetn(resetn),
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
        .resetn(resetn),
        .mode(mode),
        .i_valid(CONTR_7_i_valid),
        .zeta_addr(MEM_zeta_7_addr)
    );


    // rom #(
    //     .WIDTH(BIT_LEN),
    //     .LENGTH(128/depth_7),
    //     .INIT_FILE("../../../../NTT.srcs/sources_1/imports/NTT/MEM_zeta/MEM_zeta_7.txt")
    // ) MEM_zeta_7(
    //     .clk(clk), 
    //     .en(1'b1), 
    //     .addr(MEM_zeta_7_addr), 
    //     .do(zeta_7)
    // );


    BU BU_7(
        .resetn(resetn),
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

    always @(*) begin
        zeta_1 = 23'd0;
        case(MEM_zeta_1_addr)
            0: zeta_1 = 23'h397567;
            1: zeta_1 = 23'h396569;
        endcase
    end

    always @(*) begin
        zeta_2 = 23'd0;
        case(MEM_zeta_2_addr)
            0: zeta_2 = 23'h4F062B;
            1: zeta_2 = 23'h53DF73;
            2: zeta_2 = 23'h4FE033;
            3: zeta_2 = 23'h4F066B;
        endcase
    end

    always @(*) begin
        zeta_3 = 23'd0;
        case(MEM_zeta_3_addr)
            0: zeta_3 = 23'h76B1AE;
            1: zeta_3 = 23'h360DD5;
            2: zeta_3 = 23'h28EDB0;
            3: zeta_3 = 23'h207FE4;
            4: zeta_3 = 23'h397283;
            5: zeta_3 = 23'h70894A;
            6: zeta_3 = 23'h088192;
            7: zeta_3 = 23'h6D3DC8;
        endcase
    end

    always @(*) begin
        zeta_4 = 23'd0;
        case(MEM_zeta_4_addr)
            0: zeta_4 = 23'h4C7294;
            1: zeta_4 = 23'h41E0B4;
            2: zeta_4 = 23'h28A3D2;
            3: zeta_4 = 23'h66528A;
            4: zeta_4 = 23'h4A18A7;
            5: zeta_4 = 23'h794034;
            6: zeta_4 = 23'h0A52EE;
            7: zeta_4 = 23'h6B7D81;
            8: zeta_4 = 23'h4E9F1D;
            9: zeta_4 = 23'h1A2877;
            10: zeta_4 = 23'h2571DF;
            11: zeta_4 = 23'h1649EE;
            12: zeta_4 = 23'h7611BD;
            13: zeta_4 = 23'h492BB7;
            14: zeta_4 = 23'h2AF697;
            15: zeta_4 = 23'h22D8D5;
        endcase
    end

    always @(*) begin
        zeta_5 = 23'd0;
        case(MEM_zeta_5_addr)
            0: zeta_5 = 23'h36F72A;
            1: zeta_5 = 23'h30911E;
            2: zeta_5 = 23'h29D13F;
            3: zeta_5 = 23'h492673;
            4: zeta_5 = 23'h50685F;
            5: zeta_5 = 23'h2010A2;
            6: zeta_5 = 23'h3887F7;
            7: zeta_5 = 23'h11B2C3;
            8: zeta_5 = 23'h0603A4;
            9: zeta_5 = 23'h0E2BED;
            10: zeta_5 = 23'h10B72C;
            11: zeta_5 = 23'h4A5F35;
            12: zeta_5 = 23'h1F9D15;
            13: zeta_5 = 23'h428CD4;
            14: zeta_5 = 23'h3177F4;
            15: zeta_5 = 23'h20E612;
            16: zeta_5 = 23'h341C1D;
            17: zeta_5 = 23'h1AD873;
            18: zeta_5 = 23'h736681;
            19: zeta_5 = 23'h49553F;
            20: zeta_5 = 23'h3952F6;
            21: zeta_5 = 23'h62564A;
            22: zeta_5 = 23'h65AD05;
            23: zeta_5 = 23'h439A1C;
            24: zeta_5 = 23'h53AA5F;
            25: zeta_5 = 23'h30B622;
            26: zeta_5 = 23'h087F38;
            27: zeta_5 = 23'h3B0E6D;
            28: zeta_5 = 23'h2C83DA;
            29: zeta_5 = 23'h1C496E;
            30: zeta_5 = 23'h330E2B;
            31: zeta_5 = 23'h1C5B70;
        endcase
    end

    always @(*) begin
        zeta_6 = 23'd0;
        case(MEM_zeta_6_addr)
            0: zeta_6 = 23'h2EE3F1;
            1: zeta_6 = 23'h137EB9;
            2: zeta_6 = 23'h57A930;
            3: zeta_6 = 23'h3AC6EF;
            4: zeta_6 = 23'h3FD54C;
            5: zeta_6 = 23'h4EB2EA;
            6: zeta_6 = 23'h503EE1;
            7: zeta_6 = 23'h7BB175;
            8: zeta_6 = 23'h2648B4;
            9: zeta_6 = 23'h1EF256;
            10: zeta_6 = 23'h1D90A2;
            11: zeta_6 = 23'h45A6D4;
            12: zeta_6 = 23'h2AE59B;
            13: zeta_6 = 23'h52589C;
            14: zeta_6 = 23'h6EF1F5;
            15: zeta_6 = 23'h3F7288;
            16: zeta_6 = 23'h175102;
            17: zeta_6 = 23'h075D59;
            18: zeta_6 = 23'h1187BA;
            19: zeta_6 = 23'h52ACA9;
            20: zeta_6 = 23'h773E9E;
            21: zeta_6 = 23'h0296D8;
            22: zeta_6 = 23'h2592EC;
            23: zeta_6 = 23'h4CFF12;
            24: zeta_6 = 23'h404CE8;
            25: zeta_6 = 23'h4AA582;
            26: zeta_6 = 23'h1E54E6;
            27: zeta_6 = 23'h4F16C1;
            28: zeta_6 = 23'h1A7E79;
            29: zeta_6 = 23'h03978F;
            30: zeta_6 = 23'h4E4817;
            31: zeta_6 = 23'h31B859;
            32: zeta_6 = 23'h5884CC;
            33: zeta_6 = 23'h1B4827;
            34: zeta_6 = 23'h5B63D0;
            35: zeta_6 = 23'h5D787A;
            36: zeta_6 = 23'h35225E;
            37: zeta_6 = 23'h400C7E;
            38: zeta_6 = 23'h6C09D1;
            39: zeta_6 = 23'h5BD532;
            40: zeta_6 = 23'h6BC4D3;
            41: zeta_6 = 23'h258ECB;
            42: zeta_6 = 23'h2E534C;
            43: zeta_6 = 23'h097A6C;
            44: zeta_6 = 23'h3B8820;
            45: zeta_6 = 23'h6D285C;
            46: zeta_6 = 23'h2CA4F8;
            47: zeta_6 = 23'h337CAA;
            48: zeta_6 = 23'h14B2A0;
            49: zeta_6 = 23'h558536;
            50: zeta_6 = 23'h28F186;
            51: zeta_6 = 23'h55795D;
            52: zeta_6 = 23'h4AF670;
            53: zeta_6 = 23'h234A86;
            54: zeta_6 = 23'h75E826;
            55: zeta_6 = 23'h78DE66;
            56: zeta_6 = 23'h05528C;
            57: zeta_6 = 23'h7ADF59;
            58: zeta_6 = 23'h0F6E17;
            59: zeta_6 = 23'h5BF3DA;
            60: zeta_6 = 23'h459B7E;
            61: zeta_6 = 23'h628B34;
            62: zeta_6 = 23'h5DBECB;
            63: zeta_6 = 23'h1A9E7B;
        endcase
    end

    always @(*) begin
        zeta_7 = 23'd0;
        case(MEM_zeta_7_addr)
            0: zeta_7 = 23'h0006D9;
            1: zeta_7 = 23'h6257C5;
            2: zeta_7 = 23'h574B3C;
            3: zeta_7 = 23'h69A8EF;
            4: zeta_7 = 23'h289838;
            5: zeta_7 = 23'h64B5FE;
            6: zeta_7 = 23'h7EF8F5;
            7: zeta_7 = 23'h2A4E78;
            8: zeta_7 = 23'h120A23;
            9: zeta_7 = 23'h0154A8;
            10: zeta_7 = 23'h09B7FF;
            11: zeta_7 = 23'h435E87;
            12: zeta_7 = 23'h437FF8;
            13: zeta_7 = 23'h5CD5B4;
            14: zeta_7 = 23'h4DC04E;
            15: zeta_7 = 23'h4728AF;
            16: zeta_7 = 23'h7F735D;
            17: zeta_7 = 23'h0C8D0D;
            18: zeta_7 = 23'h0F66D5;
            19: zeta_7 = 23'h5A6D80;
            20: zeta_7 = 23'h61AB98;
            21: zeta_7 = 23'h185D96;
            22: zeta_7 = 23'h437F31;
            23: zeta_7 = 23'h468298;
            24: zeta_7 = 23'h662960;
            25: zeta_7 = 23'h4BD579;
            26: zeta_7 = 23'h28DE06;
            27: zeta_7 = 23'h465D8D;
            28: zeta_7 = 23'h49B0E3;
            29: zeta_7 = 23'h09B434;
            30: zeta_7 = 23'h7C0DB3;
            31: zeta_7 = 23'h5A68B0;
            32: zeta_7 = 23'h409BA9;
            33: zeta_7 = 23'h64D3D5;
            34: zeta_7 = 23'h21762A;
            35: zeta_7 = 23'h658591;
            36: zeta_7 = 23'h246E39;
            37: zeta_7 = 23'h48C39B;
            38: zeta_7 = 23'h7BC759;
            39: zeta_7 = 23'h4F5859;
            40: zeta_7 = 23'h392DB2;
            41: zeta_7 = 23'h230923;
            42: zeta_7 = 23'h12EB67;
            43: zeta_7 = 23'h454DF2;
            44: zeta_7 = 23'h30C31C;
            45: zeta_7 = 23'h285424;
            46: zeta_7 = 23'h13232E;
            47: zeta_7 = 23'h7FAF80;
            48: zeta_7 = 23'h2DBFCB;
            49: zeta_7 = 23'h022A0B;
            50: zeta_7 = 23'h7E832C;
            51: zeta_7 = 23'h26587A;
            52: zeta_7 = 23'h6B3375;
            53: zeta_7 = 23'h095B76;
            54: zeta_7 = 23'h6BE1CC;
            55: zeta_7 = 23'h5E061E;
            56: zeta_7 = 23'h78E00D;
            57: zeta_7 = 23'h628C37;
            58: zeta_7 = 23'h3DA604;
            59: zeta_7 = 23'h4AE53C;
            60: zeta_7 = 23'h1F1D68;
            61: zeta_7 = 23'h6330BB;
            62: zeta_7 = 23'h7361B8;
            63: zeta_7 = 23'h5EA06C;
            64: zeta_7 = 23'h671AC7;
            65: zeta_7 = 23'h201FC6;
            66: zeta_7 = 23'h5BA4FF;
            67: zeta_7 = 23'h60D772;
            68: zeta_7 = 23'h08F201;
            69: zeta_7 = 23'h6DE024;
            70: zeta_7 = 23'h080E6D;
            71: zeta_7 = 23'h56038E;
            72: zeta_7 = 23'h695688;
            73: zeta_7 = 23'h1E6D3E;
            74: zeta_7 = 23'h2603BD;
            75: zeta_7 = 23'h6A9DFA;
            76: zeta_7 = 23'h07C017;
            77: zeta_7 = 23'h6DBFD4;
            78: zeta_7 = 23'h74D0BD;
            79: zeta_7 = 23'h63E1E3;
            80: zeta_7 = 23'h519573;
            81: zeta_7 = 23'h7AB60D;
            82: zeta_7 = 23'h2867BA;
            83: zeta_7 = 23'h2DECD4;
            84: zeta_7 = 23'h58018C;
            85: zeta_7 = 23'h3F4CF5;
            86: zeta_7 = 23'h0B7009;
            87: zeta_7 = 23'h427E23;
            88: zeta_7 = 23'h3CBD37;
            89: zeta_7 = 23'h273333;
            90: zeta_7 = 23'h673957;
            91: zeta_7 = 23'h1A4B5D;
            92: zeta_7 = 23'h196926;
            93: zeta_7 = 23'h1EF206;
            94: zeta_7 = 23'h11C14E;
            95: zeta_7 = 23'h4C76C8;
            96: zeta_7 = 23'h3CF42F;
            97: zeta_7 = 23'h7FB19A;
            98: zeta_7 = 23'h6AF66C;
            99: zeta_7 = 23'h2E1669;
            100: zeta_7 = 23'h3352D6;
            101: zeta_7 = 23'h034760;
            102: zeta_7 = 23'h085260;
            103: zeta_7 = 23'h741E78;
            104: zeta_7 = 23'h2F6316;
            105: zeta_7 = 23'h6F0A11;
            106: zeta_7 = 23'h07C0F1;
            107: zeta_7 = 23'h776D0B;
            108: zeta_7 = 23'h0D1FF0;
            109: zeta_7 = 23'h345824;
            110: zeta_7 = 23'h0223D4;
            111: zeta_7 = 23'h68C559;
            112: zeta_7 = 23'h5E8885;
            113: zeta_7 = 23'h2FAA32;
            114: zeta_7 = 23'h23FC65;
            115: zeta_7 = 23'h5E6942;
            116: zeta_7 = 23'h51E0ED;
            117: zeta_7 = 23'h65ADB3;
            118: zeta_7 = 23'h2CA5E6;
            119: zeta_7 = 23'h79E1FE;
            120: zeta_7 = 23'h7B4064;
            121: zeta_7 = 23'h35E1DD;
            122: zeta_7 = 23'h433AAC;
            123: zeta_7 = 23'h464ADE;
            124: zeta_7 = 23'h1CFE14;
            125: zeta_7 = 23'h73F1CE;
            126: zeta_7 = 23'h10170E;
            127: zeta_7 = 23'h74B6D7;
        endcase
    end
    


endmodule

module NTT#(
    parameter BIT_LEN = 23
    )(
	input                clk,
	input                reset,
    input                mode,
	input                in_ready,
	input  [BIT_LEN-1:0] NTT_in_u,
	input  [BIT_LEN-1:0] NTT_in_d,
    output               out_ready,
	output [BIT_LEN-1:0] NTT_out_u,
	output [BIT_LEN-1:0] NTT_out_d,
	output [7:0]         NTT_addr_u,
    output               done,
	output [7:0]         NTT_addr_d
    );
	 

    localparam  IDLE         = 2'd0,
                DATA_TRIGGER = 2'd1,
                PROCESS      = 2'd2;

    localparam  NTT_mode  = 1'b0,
                INTT_mode = 1'b1;

    localparam depth_1 = 64;
    localparam depth_2 = 32;
    localparam depth_3 = 16;
    localparam depth_4 = 8;
    localparam depth_5 = 4;
    localparam depth_6 = 2;
    localparam depth_7 = 1;

    reg [1:0] curr_state;
    reg [1:0] next_state;
    reg [7:0] cnt;
    reg [7:0] cnt2;

    /*** BU input ***/
    wire [BIT_LEN*2-1:0]  inv_rot_o_u;
    wire [BIT_LEN*2-1:0]  inv_rot_o_d;
    wire [BIT_LEN-1:0]  INTT_o_u;
    wire [BIT_LEN-1:0]  INTT_o_d;
    wire [BIT_LEN-1:0]  in_u_0;
    wire [BIT_LEN-1:0]  in_d_0;
    wire [BIT_LEN-1:0]  in_u_1;
    wire [BIT_LEN-1:0]  in_d_1;
    wire [BIT_LEN-1:0]  in_u_2;
    wire [BIT_LEN-1:0]  in_d_2;
    wire [BIT_LEN-1:0]  in_u_3;
    wire [BIT_LEN-1:0]  in_d_3;
    wire [BIT_LEN-1:0]  in_u_4;
    wire [BIT_LEN-1:0]  in_d_4;
    wire [BIT_LEN-1:0]  in_u_5;
    wire [BIT_LEN-1:0]  in_d_5;
    wire [BIT_LEN-1:0]  in_u_6;
    wire [BIT_LEN-1:0]  in_d_6;
    wire [BIT_LEN-1:0]  in_u_7;
    wire [BIT_LEN-1:0]  in_d_7;

    /*** BU output ***/
    wire [BIT_LEN-1:0]  out_u_0;
    wire [BIT_LEN-1:0]  out_d_0;
    wire [BIT_LEN-1:0]  out_u_1;
    wire [BIT_LEN-1:0]  out_d_1;
    wire [BIT_LEN-1:0]  out_u_2;
    wire [BIT_LEN-1:0]  out_d_2;
    wire [BIT_LEN-1:0]  out_u_3;
    wire [BIT_LEN-1:0]  out_d_3;
    wire [BIT_LEN-1:0]  out_u_4;
    wire [BIT_LEN-1:0]  out_d_4;
    wire [BIT_LEN-1:0]  out_u_5;
    wire [BIT_LEN-1:0]  out_d_5;
    wire [BIT_LEN-1:0]  out_u_6;
    wire [BIT_LEN-1:0]  out_d_6;
    wire [BIT_LEN-1:0]  out_u_7;
    wire [BIT_LEN-1:0]  out_d_7;

    /*** RU input ***/
    wire [BIT_LEN-1:0]  MEM_u_in_1;
    wire [BIT_LEN-1:0]  MEM_d_in_1;
    wire [BIT_LEN-1:0]  MEM_u_in_2;
    wire [BIT_LEN-1:0]  MEM_d_in_2;
    wire [BIT_LEN-1:0]  MEM_u_in_3;
    wire [BIT_LEN-1:0]  MEM_d_in_3;
    wire [BIT_LEN-1:0]  MEM_u_in_4;
    wire [BIT_LEN-1:0]  MEM_d_in_4;
    wire [BIT_LEN-1:0]  MEM_u_in_5;
    wire [BIT_LEN-1:0]  MEM_d_in_5;
    wire [BIT_LEN-1:0]  MEM_u_in_6;
    wire [BIT_LEN-1:0]  MEM_d_in_6;
    wire [BIT_LEN-1:0]  MEM_u_in_7;
    wire [BIT_LEN-1:0]  MEM_d_in_7;

    /*** RU output ***/
    wire [BIT_LEN-1:0]  MEM_u_out_1;
    wire [BIT_LEN-1:0]  MEM_d_out_1;
    wire [BIT_LEN-1:0]  MEM_u_out_2;
    wire [BIT_LEN-1:0]  MEM_d_out_2;
    wire [BIT_LEN-1:0]  MEM_u_out_3;
    wire [BIT_LEN-1:0]  MEM_d_out_3;
    wire [BIT_LEN-1:0]  MEM_u_out_4;
    wire [BIT_LEN-1:0]  MEM_d_out_4;
    wire [BIT_LEN-1:0]  MEM_u_out_5;
    wire [BIT_LEN-1:0]  MEM_d_out_5;
    wire [BIT_LEN-1:0]  MEM_u_out_6;
    wire [BIT_LEN-1:0]  MEM_d_out_6;
    wire [BIT_LEN-1:0]  MEM_u_out_7;
    wire [BIT_LEN-1:0]  MEM_d_out_7;

    /*** zeta ***/
    wire [BIT_LEN-1:0]  zeta_1;
    wire [BIT_LEN-1:0]  zeta_2;
    wire [BIT_LEN-1:0]  zeta_3;
    wire [BIT_LEN-1:0]  zeta_4;
    wire [BIT_LEN-1:0]  zeta_5;
    wire [BIT_LEN-1:0]  zeta_6;
    wire [BIT_LEN-1:0]  zeta_7;

    wire en_1;
    wire en_2;
    wire en_3;
    wire en_4;
    wire en_5;
    wire en_6;
    wire en_7;

    wire switch_1;
    wire switch_2;
    wire switch_3;
    wire switch_4;
    wire switch_5;
    wire switch_6;
    wire switch_7;

    wire [(128/(depth_1*2)) - 1:0]  zeta_cnt_1;
    wire [(128/(depth_2*2)) - 1:0]  zeta_cnt_2;
    wire [(128/(depth_3*2)) - 1:0]  zeta_cnt_3;
    wire [(128/(depth_4*2)) - 1:0]  zeta_cnt_4;
    wire [(128/(depth_5*2)) - 1:0]  zeta_cnt_5;
    wire [(128/(depth_6*2)) - 1:0]  zeta_cnt_6;
    wire [(128/(depth_7*2)) - 1:0]  zeta_cnt_7;

    wire [$clog2(depth_1)-1:0]     MEM_cnt_1;
    wire [$clog2(depth_2)-1:0]     MEM_cnt_2;
    wire [$clog2(depth_3)-1:0]     MEM_cnt_3;
    wire [$clog2(depth_4)-1:0]     MEM_cnt_4;
    wire [$clog2(depth_5)-1:0]     MEM_cnt_5;
    wire [$clog2(depth_6)-1:0]     MEM_cnt_6;
    wire [$clog2(depth_7)-1:0]     MEM_cnt_7;

    wire [7:0] addr_base;
    wire [7:0] addr_leftshigt;
    wire [7:0] addr_adder_in_0;
    wire [7:0] addr_adder_in_1;
    wire [7:0] addr_adder;

    assign done = cnt == 255;
    assign NTT_en = curr_state == PROCESS;
    
    assign en_1 = mode ? (NTT_en && cnt >= 63 && cnt < 254)  ? 1'b1 : 1'b0 
                       : (NTT_en && cnt < 191)               ? 1'b1 : 1'b0;
    assign en_2 = mode ? (NTT_en && cnt >= 31 && cnt < 190)  ? 1'b1 : 1'b0
                       : (NTT_en && cnt >= 64 && cnt < 223)  ? 1'b1 : 1'b0;
    assign en_3 = mode ? (NTT_en && cnt >= 15 && cnt < 158)  ? 1'b1 : 1'b0
                       : (NTT_en && cnt >= 96 && cnt < 239)  ? 1'b1 : 1'b0;
    assign en_4 = mode ? (NTT_en && cnt >= 7 && cnt < 142)   ? 1'b1 : 1'b0
                       : (NTT_en && cnt >= 112 && cnt < 247) ? 1'b1 : 1'b0;
    assign en_5 = mode ? (NTT_en && cnt >= 3 && cnt < 134)   ? 1'b1 : 1'b0
                       : (NTT_en && cnt >= 120 && cnt < 251) ? 1'b1 : 1'b0;
    assign en_6 = mode ? (NTT_en && cnt >= 1 && cnt < 130)   ? 1'b1 : 1'b0
                       : (NTT_en && cnt >= 124 && cnt < 253) ? 1'b1 : 1'b0;
    assign en_7 = mode ? (NTT_en && cnt < 128)               ? 1'b1 : 1'b0
                       : (NTT_en && cnt >= 126 && cnt < 254) ? 1'b1 : 1'b0;
    
    /*** BU input assign***/
    // assign in_u_0 = cnt > 126 ? 0 : NTT_in_u;
    // assign in_d_0 = cnt > 126 ? 0 : NTT_in_d;
    assign in_u_0 = mode ? MEM_u_out_1 : NTT_in_u;
    assign in_d_0 = mode ? MEM_d_out_1 : NTT_in_d;
    assign in_u_1 = mode ? MEM_u_out_2 : MEM_u_out_1;
    assign in_d_1 = mode ? MEM_d_out_2 : MEM_d_out_1;
    assign in_u_2 = mode ? MEM_u_out_3 : MEM_u_out_2;
    assign in_d_2 = mode ? MEM_d_out_3 : MEM_d_out_2;
    assign in_u_3 = mode ? MEM_u_out_4 : MEM_u_out_3;
    assign in_d_3 = mode ? MEM_d_out_4 : MEM_d_out_3;
    assign in_u_4 = mode ? MEM_u_out_5 : MEM_u_out_4;
    assign in_d_4 = mode ? MEM_d_out_5 : MEM_d_out_4;
    assign in_u_5 = mode ? MEM_u_out_6 : MEM_u_out_5;
    assign in_d_5 = mode ? MEM_d_out_6 : MEM_d_out_5;
    assign in_u_6 = mode ? MEM_u_out_7 : MEM_u_out_6;
    assign in_d_6 = mode ? MEM_d_out_7 : MEM_d_out_6;
    assign in_u_7 = mode ? NTT_in_u : MEM_u_out_7;
    assign in_d_7 = mode ? NTT_in_d : MEM_d_out_7;

    
    /*** RU input assign***/
    assign MEM_u_in_1 = mode ? out_u_1 : out_u_0;
    assign MEM_d_in_1 = mode ? out_d_1 : out_d_0;
    assign MEM_u_in_2 = mode ? out_u_2 : out_u_1;
    assign MEM_d_in_2 = mode ? out_d_2 : out_d_1;
    assign MEM_u_in_3 = mode ? out_u_3 : out_u_2;
    assign MEM_d_in_3 = mode ? out_d_3 : out_d_2;
    assign MEM_u_in_4 = mode ? out_u_4 : out_u_3;
    assign MEM_d_in_4 = mode ? out_d_4 : out_d_3;
    assign MEM_u_in_5 = mode ? out_u_5 : out_u_4;
    assign MEM_d_in_5 = mode ? out_d_5 : out_d_4;
    assign MEM_u_in_6 = mode ? out_u_6 : out_u_5;
    assign MEM_d_in_6 = mode ? out_d_6 : out_d_5;
    assign MEM_u_in_7 = mode ? out_u_7 : out_u_6;
    assign MEM_d_in_7 = mode ? out_d_7 : out_d_6;

    assign inv_rot_o_u = out_u_0 * 23'd8347681;
    assign inv_rot_o_d = out_d_0 * 23'd8347681;

    Modular_Reduction f1(inv_rot_o_u, INTT_o_u);
    Modular_Reduction f2(inv_rot_o_d, INTT_o_d);

    assign NTT_out_u = mode ? INTT_o_u : out_u_7;
    assign NTT_out_d = mode ? INTT_o_d : out_d_7;

    assign out_ready = NTT_en && cnt >= 127 && cnt < 255;

    assign addr_base = cnt - 8'd127;
    assign addr_leftshigt = addr_base << 1;
    assign addr_adder_in_0 = mode ? cnt : addr_leftshigt;
    assign addr_adder_in_1 = 8'd1;
    assign addr_adder = addr_adder_in_0 + addr_adder_in_1;
 
    assign NTT_addr_u = mode ? addr_base : addr_leftshigt;
    assign NTT_addr_d = addr_adder;
    /*** stage 0 ***/
    BU BU_0(
        .mode(mode),
        .a(in_u_0),
        .b(in_d_0),
        .zeta(23'h495e02),
        .out_a(out_u_0),
        .out_b(out_d_0)
    );


    /*** stage 1 ***/
    CONTR#(
        .BIT_LEN(BIT_LEN),
        .depth(depth_1)
    ) CONTR_1(
        .clk(clk),
        .reset(reset),
        .mode(mode),
        .en(en_1),
        .switch(switch_1),
        .zeta_cnt(zeta_cnt_1),
        .MEM_cnt(MEM_cnt_1)
    );


    rom #(
        .WIDTH(BIT_LEN),
        .LENGTH(128/depth_1),
        .INIT_FILE("../../../../MLDSA.srcs/sources_1/NTT/MEM_zeta/MEM_zeta_1.txt")
    ) MEM_zeta_1(
        .clk(clk), 
        .en(1'b1), 
        .addr(zeta_cnt_1), 
        .do(zeta_1)
    );

    RU #(
        .BIT_LEN(BIT_LEN),
        .depth(depth_1)
    ) RU_1(
        .clk(clk),
        .reset(reset),
        .switch(switch_1),
        .MEM_cnt(MEM_cnt_1),
        .in_u(MEM_u_in_1),
        .in_d(MEM_d_in_1),
        .out_u(MEM_u_out_1),
        .out_d(MEM_d_out_1)
    );

    BU BU_1(
        .mode(mode),
        .a(in_u_1),
        .b(in_d_1),
        .zeta(zeta_1),
        .out_a(out_u_1),
        .out_b(out_d_1)
    );

    

    /*** stage 2 ***/
    CONTR#(
        .BIT_LEN(BIT_LEN),
        .depth(depth_2)
    ) CONTR_2(
        .clk(clk),
        .reset(reset),
        .mode(mode),
        .en(en_2),
        .switch(switch_2),
        .zeta_cnt(zeta_cnt_2),
        .MEM_cnt(MEM_cnt_2)
    );

    rom #(
        .WIDTH(BIT_LEN),
        .LENGTH(128/depth_2),
        .INIT_FILE("../../../../MLDSA.srcs/sources_1/NTT/MEM_zeta/MEM_zeta_2.txt")
    ) MEM_zeta_2(
        .clk(clk), 
        .en(1'b1), 
        .addr(zeta_cnt_2), 
        .do(zeta_2)
    );

    RU #(
        .BIT_LEN(BIT_LEN),
        .depth(depth_2)
    ) RU_2(
        .clk(clk),
        .reset(reset),
        .switch(switch_2),
        .MEM_cnt(MEM_cnt_2),
        .in_u(MEM_u_in_2),
        .in_d(MEM_d_in_2),
        .out_u(MEM_u_out_2),
        .out_d(MEM_d_out_2)
    );

    BU BU_2(
        .mode(mode),
        .a(in_u_2),
        .b(in_d_2),
        .zeta(zeta_2),
        .out_a(out_u_2),
        .out_b(out_d_2)
    );


    /*** stage 3 ***/
    CONTR#(
        .BIT_LEN(BIT_LEN),
        .depth(depth_3)
    ) CONTR_3(
        .clk(clk),
        .reset(reset),
        .mode(mode),
        .en(en_3),
        .switch(switch_3),
        .zeta_cnt(zeta_cnt_3),
        .MEM_cnt(MEM_cnt_3)
    );

    rom #(
        .WIDTH(BIT_LEN),
        .LENGTH(128/depth_3),
        .INIT_FILE("../../../../MLDSA.srcs/sources_1/NTT/MEM_zeta/MEM_zeta_3.txt")
    ) MEM_zeta_3(
        .clk(clk), 
        .en(1'b1), 
        .addr(zeta_cnt_3), 
        .do(zeta_3)
    );

    RU #(
        .BIT_LEN(BIT_LEN),
        .depth(depth_3)
    ) RU_3(
        .clk(clk),
        .reset(reset),
        .switch(switch_3),
        .MEM_cnt(MEM_cnt_3),
        .in_u(MEM_u_in_3),
        .in_d(MEM_d_in_3),
        .out_u(MEM_u_out_3),
        .out_d(MEM_d_out_3)
    );

    BU BU_3(
        .mode(mode),
        .a(in_u_3),
        .b(in_d_3),
        .zeta(zeta_3),
        .out_a(out_u_3),
        .out_b(out_d_3)
    );


    /*** stage 4 ***/
    CONTR#(
        .BIT_LEN(BIT_LEN),
        .depth(depth_4)
    ) CONTR_4(
        .clk(clk),
        .reset(reset),
        .mode(mode),
        .en(en_4),
        .switch(switch_4),
        .zeta_cnt(zeta_cnt_4),
        .MEM_cnt(MEM_cnt_4)
    );

    rom #(
        .WIDTH(BIT_LEN),
        .LENGTH(128/depth_4),
        .INIT_FILE("../../../../MLDSA.srcs/sources_1/NTT/MEM_zeta/MEM_zeta_4.txt")
    ) MEM_zeta_4(
        .clk(clk), 
        .en(1'b1), 
        .addr(zeta_cnt_4), 
        .do(zeta_4)
    );

    RU #(
        .BIT_LEN(BIT_LEN),
        .depth(depth_4)
    ) RU_4(
        .clk(clk),
        .reset(reset),
        .switch(switch_4),
        .MEM_cnt(MEM_cnt_4),
        .in_u(MEM_u_in_4),
        .in_d(MEM_d_in_4),
        .out_u(MEM_u_out_4),
        .out_d(MEM_d_out_4)
    );

    BU BU_4(
        .mode(mode),
        .a(in_u_4),
        .b(in_d_4),
        .zeta(zeta_4),
        .out_a(out_u_4),
        .out_b(out_d_4)
    );

    /*** stage 5 ***/
    CONTR#(
        .BIT_LEN(BIT_LEN),
        .depth(depth_5)
    ) CONTR_5(
        .clk(clk),
        .reset(reset),
        .mode(mode),
        .en(en_5),
        .switch(switch_5),
        .zeta_cnt(zeta_cnt_5),
        .MEM_cnt(MEM_cnt_5)
    );

    rom #(
        .WIDTH(BIT_LEN),
        .LENGTH(128/depth_5),
        .INIT_FILE("../../../../MLDSA.srcs/sources_1/NTT/MEM_zeta/MEM_zeta_5.txt")
    ) MEM_zeta_5(
        .clk(clk), 
        .en(1'b1), 
        .addr(zeta_cnt_5), 
        .do(zeta_5)
    );

    RU #(
        .BIT_LEN(BIT_LEN),
        .depth(depth_5)
    ) RU_5(
        .clk(clk),
        .reset(reset),
        .switch(switch_5),
        .MEM_cnt(MEM_cnt_5),
        .in_u(MEM_u_in_5),
        .in_d(MEM_d_in_5),
        .out_u(MEM_u_out_5),
        .out_d(MEM_d_out_5)
    );

    BU BU_5(
        .mode(mode),
        .a(in_u_5),
        .b(in_d_5),
        .zeta(zeta_5),
        .out_a(out_u_5),
        .out_b(out_d_5)
    );

    /*** stage 6 ***/
    CONTR#(
        .BIT_LEN(BIT_LEN),
        .depth(depth_6)
    ) CONTR_6(
        .clk(clk),
        .reset(reset),
        .mode(mode),
        .en(en_6),
        .switch(switch_6),
        .zeta_cnt(zeta_cnt_6),
        .MEM_cnt(MEM_cnt_6)
    );

    rom #(
        .WIDTH(BIT_LEN),
        .LENGTH(128/depth_6),
        .INIT_FILE("../../../../MLDSA.srcs/sources_1/NTT/MEM_zeta/MEM_zeta_6.txt")
    ) MEM_zeta_6(
        .clk(clk), 
        .en(1'b1), 
        .addr(zeta_cnt_6), 
        .do(zeta_6)
    );

    RU #(
        .BIT_LEN(BIT_LEN),
        .depth(depth_6)
    ) RU_6(
        .clk(clk),
        .reset(reset),
        .switch(switch_6),
        .MEM_cnt(MEM_cnt_6),
        .in_u(MEM_u_in_6),
        .in_d(MEM_d_in_6),
        .out_u(MEM_u_out_6),
        .out_d(MEM_d_out_6)
    );

    BU BU_6(
        .mode(mode),
        .a(in_u_6),
        .b(in_d_6),
        .zeta(zeta_6),
        .out_a(out_u_6),
        .out_b(out_d_6)
    );

    /*** stage 7 ***/
    CONTR#(
        .BIT_LEN(BIT_LEN),
        .depth(depth_7)
    ) CONTR_7(
        .clk(clk),
        .reset(reset),
        .mode(mode),
        .en(en_7),
        .switch(switch_7),
        .zeta_cnt(zeta_cnt_7),
        .MEM_cnt(MEM_cnt_7)
    );

    rom #(
        .WIDTH(BIT_LEN),
        .LENGTH(128/depth_7),
        .INIT_FILE("../../../../MLDSA.srcs/sources_1/NTT/MEM_zeta/MEM_zeta_7.txt")
    ) MEM_zeta_7(
        .clk(clk), 
        .en(1'b1), 
        .addr(zeta_cnt_7), 
        .do(zeta_7)
    );

    RU #(
        .BIT_LEN(BIT_LEN),
        .depth(depth_7)
    ) RU_7(
        .clk(clk),
        .reset(reset),
        .switch(switch_7),
        .MEM_cnt(MEM_cnt_7),
        .in_u(MEM_u_in_7),
        .in_d(MEM_d_in_7),
        .out_u(MEM_u_out_7),
        .out_d(MEM_d_out_7)
    );

    BU BU_7(
        .mode(mode),
        .a(in_u_7),
        .b(in_d_7),
        .zeta(zeta_7),
        .out_a(out_u_7),
        .out_b(out_d_7)
    );


    always @(posedge clk) begin
        if(reset)
            curr_state <= IDLE;
        else 
            curr_state <= next_state;
    end

    always @(*) begin
        case(curr_state)
            IDLE:begin
                if(in_ready) 
                    next_state = PROCESS;
                else 
                    next_state = IDLE;
            end
            PROCESS:begin
                if(done) 
                    next_state = IDLE;
                else 
                    next_state = PROCESS;
            end
            default: next_state = IDLE;
        endcase
    end

    always @(posedge clk) begin
        if(reset)
            cnt <= 8'd0;
        else if(done) 
            cnt <= 8'd0;
        else if(curr_state == PROCESS) 
            cnt <= cnt + 1'b1;
    end

endmodule

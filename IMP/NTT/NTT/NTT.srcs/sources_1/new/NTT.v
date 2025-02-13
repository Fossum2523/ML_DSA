module NTT#(
    parameter BIT_LEN = 23
    )(
	input clk,
	input reset,
	input in_ready,
	input [BIT_LEN-1:0] NTT_in_u,
	input [BIT_LEN-1:0] NTT_in_d,
	output [BIT_LEN-1:0] NTT_out_u,
	output [BIT_LEN-1:0] NTT_out_d,
	output [7:0]NTT_addr
    );
	 

    //zeta rom 
    reg zeta_en;
    wire        zeta_addr_0;   //是不是可以改成 parameter
    wire [22:0] zeta_do_0;
    wire        zeta_addr_1; 
    wire [22:0] zeta_do_1;
    wire [1:0]  zeta_addr_2; 
    wire [22:0] zeta_do_2;
    wire [2:0]  zeta_addr_3; 
    wire [22:0] zeta_do_3;
    wire [3:0]  zeta_addr_4; 
    wire [22:0] zeta_do_4;
    wire [4:0]  zeta_addr_5; 
    wire [22:0] zeta_do_5;
    wire [5:0]  zeta_addr_6; 
    wire [22:0] zeta_do_6;
    wire [6:0]  zeta_addr_7; 
    wire [22:0] zeta_do_7;


    localparam  IDLE    = 1'd0,
                PROCESS = 1'd1;


    reg curr_state;
    reg next_state;
    reg [7:0]cnt;

    wire NTT_en;
    wire done;

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
    
    assign done = cnt == 255;
    assign NTT_en = curr_state == PROCESS;

    BU BU0(
        .in0(NTT_in_u),
        .in1(NTT_in_d),
        .phi(23'h495e02),
        .out0(out_u_0),
        .out1(out_d_0)
    );

    MDCU #(
        .BIT_LEN(23),
        .depth(64),
        .INIT_FILE("C:/Users/USER/Desktop/ML_DSA_syn/IMP/NTT/NTT/NTT.srcs/sources_1/imports/MEM_zeta/MEM_zeta_1.txt")
    ) MDCU0(
        .clk(clk),
        .reset(reset),
        .en(NTT_en),
        .in_u(out_u_0),
        .in_d(out_d_0),
        .out_u(out_u_1),
        .out_d(out_d_1)
    );

    MDCU #(
        .BIT_LEN(23),
        .depth(32),
        .INIT_FILE("C:/Users/USER/Desktop/ML_DSA_syn/IMP/NTT/NTT/NTT.srcs/sources_1/imports/MEM_zeta/MEM_zeta_2.txt")
    ) MDCU1(
        .clk(clk),
        .reset(reset),
        .en(NTT_en),
        .in_u(out_u_1),
        .in_d(out_d_1),
        .out_u(out_u_2),
        .out_d(out_d_2)
    );

    MDCU #(
        .BIT_LEN(23),
        .depth(16),
        .INIT_FILE("C:/Users/USER/Desktop/ML_DSA_syn/IMP/NTT/NTT/NTT.srcs/sources_1/imports/MEM_zeta/MEM_zeta_3.txt")
    ) MDCU2(
        .clk(clk),
        .reset(reset),
        .en(NTT_en),
        .in_u(out_u_2),
        .in_d(out_d_2),
        .out_u(out_u_3),
        .out_d(out_d_3)
    );

    MDCU #(
        .BIT_LEN(23),
        .depth(8),
        .INIT_FILE("C:/Users/USER/Desktop/ML_DSA_syn/IMP/NTT/NTT/NTT.srcs/sources_1/imports/MEM_zeta/MEM_zeta_4.txt")
    ) MDCU3(
        .clk(clk),
        .reset(reset),
        .en(NTT_en),
        .in_u(out_u_3),
        .in_d(out_d_3),
        .out_u(out_u_4),
        .out_d(out_d_4)
    );

    MDCU #(
        .BIT_LEN(23),
        .depth(4),
        .INIT_FILE("C:/Users/USER/Desktop/ML_DSA_syn/IMP/NTT/NTT/NTT.srcs/sources_1/imports/MEM_zeta/MEM_zeta_5.txt")
    ) MDCU4(
        .clk(clk),
        .reset(reset),
        .en(NTT_en),
        .in_u(out_u_4),
        .in_d(out_d_4),
        .out_u(out_u_5),
        .out_d(out_d_5)
    );

    MDCU #(
        .BIT_LEN(23),
        .depth(2),
        .INIT_FILE("C:/Users/USER/Desktop/ML_DSA_syn/IMP/NTT/NTT/NTT.srcs/sources_1/imports/MEM_zeta/MEM_zeta_6.txt")
    ) MDCU5(
        .clk(clk),
        .reset(reset),
        .en(NTT_en),
        .in_u(out_u_5),
        .in_d(out_d_5),
        .out_u(out_u_6),
        .out_d(out_d_6)
    );

    MDCU #(
        .BIT_LEN(23),
        .depth(1),
        .INIT_FILE("C:/Users/USER/Desktop/ML_DSA_syn/IMP/NTT/NTT/NTT.srcs/sources_1/imports/MEM_zeta/MEM_zeta_7.txt")
    ) MDCU6(
        .clk(clk),
        .reset(reset),
        .en(NTT_en),
        .in_u(out_u_6),
        .in_d(out_d_6),
        .out_u(out_u_7),
        .out_d(out_d_7)
    );


    always @(posedge clk or negedge reset) begin
        if(!reset)
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

    always @(posedge clk or negedge reset) begin
        if(!reset)
            cnt <= 8'd0;
        else if(curr_state == PROCESS) 
            cnt <= cnt + 1'b1;
    end
endmodule

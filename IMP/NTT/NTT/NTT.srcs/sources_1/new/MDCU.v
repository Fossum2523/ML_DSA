module MDCU#(
    parameter BIT_LEN = 23,
    parameter depth = 64,
    parameter INIT_FILE = "../imports/MEM_zeta/MEM_zeta_1.txt"
    )(
    input   clk,
    input   reset,
    input   en,
    input   [BIT_LEN - 1:0] in_u,
    input   [BIT_LEN - 1:0] in_d,
    output  [BIT_LEN - 1:0] out_u,
    output  [BIT_LEN - 1:0] out_d
    );

    reg                              switch;
    reg     [$clog2(depth)-1:0]      MEM_cnt;
    wire                             MEM_clean;

    //BU
    wire    [BIT_LEN - 1:0]         a;   
    wire    [BIT_LEN - 1:0]         b;   
    wire    [BIT_LEN - 1:0]         zeta;   
    wire    [BIT_LEN - 1:0]         MEM_u_in;   
    wire    [BIT_LEN - 1:0]         MEM_d_in;   
    wire    [BIT_LEN - 1:0]         MEM_u_out;   
    wire    [BIT_LEN - 1:0]         MEM_d_out;   
    reg     [(128/(depth*2)) - 1:0] zeta_cnt;     

    BRAM #(
        .DLEN(23),
        .HLEN($clog2(depth))
    )MEM_u(
		.clk(clk),
        .wen(en),
        .waddr(MEM_cnt),
        .din(MEM_u_in),
        .raddr(MEM_cnt),
        .dout(MEM_u_out)
	);

    BRAM #(
        .DLEN(23),
        .HLEN($clog2(depth))
    )MEM_d(
		.clk(clk),
        .wen(en),
        .waddr(MEM_cnt),
        .din(MEM_d_in),
        .raddr(MEM_cnt),
        .dout(MEM_d_out)
	);

    rom #(
        .WIDTH(23),
        .LENGTH(128/depth),
        .INIT_FILE(INIT_FILE)
    ) MEM_zeta(
        .clk(clk), 
        .en(en), 
        .addr(zeta_cnt), 
        .do(zeta)
    );

    BU BU_(
        .in0(a),
        .in1(b),
        .phi(zeta),
        .out0(out_u),
        .out1(out_d)
    );

    assign MEM_clean = MEM_cnt == (depth-1);

    assign a         = MEM_u_out;
    assign b         = switch ? in_u : MEM_d_out;
    assign MEM_u_in  = switch ? MEM_d_out : in_u;
    assign MEM_d_in  = in_d;

    always @(posedge clk or negedge reset) begin
        if(!reset)
            zeta_cnt <= {{(6 - ($clog2(depth))){1'b0}},1'b1}; //devise
        else if(en)
            if(MEM_clean)
                zeta_cnt = zeta_cnt + 1'b1;
    end

    always @(posedge clk or negedge reset) begin
        if(!reset)
            MEM_cnt <= {($clog2(depth)){1'b0}};
        else if(en)
            if(MEM_clean)
                MEM_cnt <= {($clog2(depth)){1'b0}};
            else
                MEM_cnt <= MEM_cnt + 1'b1;
    end

    always @(posedge clk or negedge reset) begin
        if(!reset)
            switch <= 1'b0;
        else if(en)
            if(MEM_clean)
                switch = ~switch;
    end

endmodule
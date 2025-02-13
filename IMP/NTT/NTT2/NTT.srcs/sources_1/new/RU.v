module RU#(
    parameter BIT_LEN = 23,
    parameter depth = 64
    )(
    input                           clk,
    input                           reset,
    input                           switch,
    input   [$clog2(depth)-1:0]     MEM_cnt,
    input   [BIT_LEN - 1:0]         in_u,
    input   [BIT_LEN - 1:0]         in_d,
    output  [BIT_LEN - 1:0]         out_u,
    output  [BIT_LEN - 1:0]         out_d
    );

    wire    [BIT_LEN - 1:0]         MEM_u_in;   
    wire    [BIT_LEN - 1:0]         MEM_d_in;   
    wire    [BIT_LEN - 1:0]         MEM_u_out;   
    wire    [BIT_LEN - 1:0]         MEM_d_out;      

    BRAM #(
        .DLEN(23),
        .HLEN($clog2(depth))
    )MEM_u(
		.clk(clk),
        .wen(1'b1),
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
        .wen(1'b1),
        .waddr(MEM_cnt),
        .din(MEM_d_in),
        .raddr(MEM_cnt),
        .dout(MEM_d_out)
	); 

    assign out_u    = MEM_u_out;
    assign out_d    = switch ? in_u : MEM_d_out;
    assign MEM_u_in = switch ? MEM_d_out : in_u;
    assign MEM_d_in = in_d;

endmodule
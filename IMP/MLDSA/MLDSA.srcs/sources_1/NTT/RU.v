// module RU#(
//     parameter BIT_LEN = 23,
//     parameter depth = 64
//     )(
//     input                           clk,
//     input                           reset,
//     input                           switch,
//     input   [$clog2(depth)-1:0]     MEM_cnt,
//     input   [BIT_LEN - 1:0]         in_u,
//     input   [BIT_LEN - 1:0]         in_d,
//     output  [BIT_LEN - 1:0]         out_u,
//     output  [BIT_LEN - 1:0]         out_d
//     );

//     wire    [BIT_LEN - 1:0]         MEM_u_in;   
//     wire    [BIT_LEN - 1:0]         MEM_d_in;   
//     wire    [BIT_LEN - 1:0]         MEM_u_out;   
//     wire    [BIT_LEN - 1:0]         MEM_d_out;      

//     BRAM #(
//         .DLEN(23),
//         .HLEN($clog2(depth))
//     )MEM_u(
// 		.clk(clk),
//         .wen(1'b1),
//         .waddr(MEM_cnt),
//         .din(MEM_u_in),
//         .raddr(MEM_cnt),
//         .dout(MEM_u_out)
// 	);

//     BRAM #(
//         .DLEN(23),
//         .HLEN($clog2(depth))
//     )MEM_d(
// 		.clk(clk),
//         .wen(1'b1),
//         .waddr(MEM_cnt),
//         .din(MEM_d_in),
//         .raddr(MEM_cnt),
//         .dout(MEM_d_out)
// 	); 

//     assign out_u    = MEM_u_out;
//     assign out_d    = switch ? in_u : MEM_d_out;
//     assign MEM_u_in = switch ? MEM_d_out : in_u;
//     assign MEM_d_in = in_d;

// endmodule

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

    reg [BIT_LEN-1:0] shift_reg_u [depth-1:0];
    reg [BIT_LEN-1:0] shift_reg_d [depth-1:0];

    genvar i_u;
    generate
        for (i_u = 0; i_u < depth; i_u = i_u + 1) begin : shift_registers_u
            always @(posedge clk) begin
                if (reset)
                    shift_reg_u[i_u] <= 0;
                else if (i_u == 0)
                    shift_reg_u[i_u] <= switch ? shift_reg_d[depth-1] : in_u;
                else
                    shift_reg_u[i_u] <= shift_reg_u[i_u-1]; 
            end
        end
    endgenerate

    genvar i_d;
    generate
        for (i_d = 0; i_d < depth; i_d = i_d + 1) begin : shift_registers_d
            always @(posedge clk) begin
                if (reset)
                    shift_reg_d[i_d] <= 0;
                else if (i_d == 0)
                    shift_reg_d[i_d] <= in_d;
                else
                    shift_reg_d[i_d] <= shift_reg_d[i_d-1]; 
            end
        end
    endgenerate

    assign out_u    = shift_reg_u[depth-1];
    assign out_d    = switch ? in_u : shift_reg_d[depth-1];
    // assign MEM_u_in = switch ? MEM_d_out : in_u;
    // assign MEM_d_in = in_d;

endmodule

    // genvar i_u;
    // generate
    //     for (i_u = 0; i_u < depth; i_u = i_u + 1) begin : shift_registers_u
    //         always @(posedge clk or negedge reset) begin
    //             if (i_u == 0)
    //                 if (!reset)
    //                     shift_reg_u[i_u] <= 0;
    //                 else
    //                     shift_reg_u[i_u] <= switch ? shift_reg_d[depth-1] : in_u;
    //             else
    //                 if (!reset)
    //                     shift_reg_u[i_u] <= 0;
    //                 else
    //                     shift_reg_u[i_u] <= shift_reg_u[i_u-1]; 
    //         end
    //     end
    // endgenerate

    // genvar i_d;
    // generate
    //     for (i_d = 0; i_d < depth; i_d = i_d + 1) begin : shift_registers_d
    //         always @(posedge clk or negedge reset) begin
    //             if (i_d == 0)
    //                 if (!reset)
    //                     shift_reg_d[i_d] <= 0;
    //                 else
    //                     shift_reg_d[i_d] <= in_d; 
    //             else
    //                 if (!reset)
    //                     shift_reg_d[i_d] <= 0;
    //                 else
    //                     shift_reg_d[i_d] <= shift_reg_d[i_d-1]; 
    //         end
    //     end
    // endgenerate
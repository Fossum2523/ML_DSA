module BU
#(
    parameter BIT_LEN = 23,
    parameter depth = 64
)(
    input                            mode,
    input   [BIT_LEN - 1:0]          a,  //Individual input points, each 8 bits wide
    input   [BIT_LEN - 1:0]          b,
    input   [BIT_LEN - 1:0]          zeta,
    output  [BIT_LEN - 1:0]          out_a,  //Individual output points, each 8 bits wide
    output  [BIT_LEN - 1:0]          out_b
);
    localparam  NTT_mode  = 1'b0,
                INTT_mode = 1'b1;
    
    wire [BIT_LEN - 1:0]  add_in_0;
    wire [BIT_LEN - 1:0]  add_in_1;
    wire [BIT_LEN - 1:0]  add_out;
    wire [BIT_LEN - 1:0]  sub_in_0;
    wire [BIT_LEN - 1:0]  sub_in_1;
    wire [BIT_LEN - 1:0]  sub_out;
    wire [BIT_LEN - 1:0]  mul_in_0;
    wire [BIT_LEN - 1:0]  mul_in_1;
    wire [BIT_LEN - 1:0]  mul_out;
    wire [BIT_LEN - 1:0]  neg_zeta;

    assign add_in_0 = a;
    assign add_in_1 = mode ? b : mul_out;

    assign sub_in_0 = a;
    assign sub_in_1 = mode ? b : mul_out;

    assign mul_in_0 = mode ? sub_out : b;
    assign mul_in_1 = mode ? 23'd8380417 - zeta : zeta; // -1 應該要改成數 之後INTT接好後改

    assign out_a = add_out;
    assign out_b = mode ? mul_out : sub_out;

    mod_add ma(add_in_0, add_in_1, add_out);
    mod_sub ms(sub_in_0, sub_in_1, sub_out);
    mod_mul mm(mul_in_0, mul_in_1, mul_out);
endmodule
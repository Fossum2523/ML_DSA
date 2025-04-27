`timescale 1ns / 1ps

module BU
#(
    parameter BIT_LEN = 23,
    parameter depth = 64
)(
    input                            clk,
    input                            reset,
    input                            i_valid,
    input                            mode,
    input   [BIT_LEN - 1:0]          a,  //Individual input points, each 8 bits wide
    input   [BIT_LEN - 1:0]          b,
    input   [BIT_LEN - 1:0]          zeta,
    output                           o_valid,
    output  [BIT_LEN - 1:0]          out_a,  //Individual output points, each 8 bits wide
    output  [BIT_LEN - 1:0]          out_b
);
    localparam  NTT_mode  = 1'b0,
                INTT_mode = 1'b1;
    
    parameter DATA_WIDTH    = 23;      // 資料寬度，預設32位
    parameter DELAY_CYCLES  = 6;        // 延遲週期數，預設6個Cycle

    reg  [DELAY_CYCLES - 1:0 ]  valid_buf;
    wire [BIT_LEN - 1:0]  add_in_0;
    wire [BIT_LEN - 1:0]  add_in_1;
    wire [BIT_LEN - 1:0]  add_out;
    wire [BIT_LEN - 1:0]  sub_in_0;
    wire [BIT_LEN - 1:0]  sub_in_1;
    wire [BIT_LEN - 1:0]  sub_out;
    reg  [BIT_LEN - 1:0]  mul_in_0;
    reg  [BIT_LEN - 1:0]  mul_in_1;
    wire [BIT_LEN - 1:0]  mul_out;
    wire [BIT_LEN - 1:0]  neg_zeta;
    reg  [DATA_WIDTH-1:0] shift_reg_a [0:DELAY_CYCLES-1];
    reg  [DATA_WIDTH-1:0] shift_reg_b [0:DELAY_CYCLES-1];

    mod_add ma(add_in_0, add_in_1, add_out);
    mod_sub ms(sub_in_0, sub_in_1, sub_out);
    mod_mul mm(clk,reset,mul_in_0, mul_in_1, mul_out);

    assign add_in_0 = shift_reg_a[DELAY_CYCLES-1];
    assign add_in_1 = mode ? shift_reg_b[DELAY_CYCLES-1] : mul_out;

    assign sub_in_0 = mode ? a : shift_reg_a[DELAY_CYCLES-1];
    assign sub_in_1 = mode ? b : mul_out;

    assign out_a = add_out;
    assign out_b = mode ? mul_out : sub_out;

    assign o_valid = valid_buf[DELAY_CYCLES - 1];

    always @(posedge clk) begin
        if(reset)
            mul_in_0 <= 23'd0;
        else
            mul_in_0 <= mode ? 23'd8380417 - zeta : zeta; // -1 應該要改成數 之後INTT接好後改
    end   

    always @(posedge clk) begin
        if(reset)
            mul_in_1 <= 23'd0;
        else
            mul_in_1 <= mode ? sub_out : b;
    end   

    genvar i;
    generate
        for (i = 0; i < DELAY_CYCLES; i = i + 1) begin : DELAY_CHAIN_a
            always @(posedge clk) begin
                if (reset)
                    shift_reg_a[i] <= {DATA_WIDTH{1'b0}};
                else if (i == 0)
                    shift_reg_a[i] <= a;
                else
                    shift_reg_a[i] <= shift_reg_a[i-1];
            end
        end
    endgenerate

    genvar j;
    generate
        for (j = 0; j < DELAY_CYCLES; j = j + 1) begin : DELAY_CHAIN_b
            always @(posedge clk) begin
                if (reset)
                    shift_reg_b[j] <= {DATA_WIDTH{1'b0}};
                else if (j == 0)
                    shift_reg_b[j] <= b;
                else
                    shift_reg_b[j] <= shift_reg_b[j-1];
            end
        end
    endgenerate

    always @(posedge clk) begin
        if (reset)
            valid_buf <= {DELAY_CYCLES{1'b0}};
        else 
            valid_buf <= {valid_buf[DELAY_CYCLES-2:0],i_valid};
    end  
endmodule
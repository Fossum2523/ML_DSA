`timescale 1ns / 1ps

module BU
#(
    parameter BIT_LEN = 23,
    parameter depth = 64
)(
    input                            clk,
    input                            resetn,
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
    
    localparam DATA_WIDTH    = 23; 
    localparam DELAY_CYCLES  = 4;

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

    integer i;

    mod_add ma(add_in_0, add_in_1, add_out);
    mod_sub ms(sub_in_0, sub_in_1, sub_out);
    mod_mul mm(clk,resetn,mul_in_0, mul_in_1, mul_out);

    assign add_in_0 = shift_reg_a[DELAY_CYCLES-1];
    assign add_in_1 = mode ? shift_reg_b[DELAY_CYCLES-1] : mul_out;

    assign sub_in_0 = mode ? a : shift_reg_a[DELAY_CYCLES-1];
    assign sub_in_1 = mode ? b : mul_out;

    assign out_a = add_out;
    assign out_b = mode ? mul_out : sub_out;

    assign o_valid = valid_buf[DELAY_CYCLES - 1];

    assign neg_zeta = 23'd8380417 - zeta;
    
    always @(posedge clk or negedge resetn) begin
        if(!resetn)
            mul_in_0 <= 23'd0;
        else
            mul_in_0 <= mode ? neg_zeta: zeta;
    end   

    always @(posedge clk or negedge resetn) begin
        if(!resetn)
            mul_in_1 <= 23'd0;
        else
            mul_in_1 <= mode ? sub_out : b;
    end   

    always @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            for (i = 0; i < DELAY_CYCLES; i = i + 1) begin
                shift_reg_a[i] <= {DATA_WIDTH{1'b0}};
                shift_reg_b[i] <= {DATA_WIDTH{1'b0}};
            end
        end
        else begin
            shift_reg_a[0] <= a;
            shift_reg_b[0] <= b;
            for (i = 1; i < DELAY_CYCLES; i = i + 1) begin
                shift_reg_a[i] <= shift_reg_a[i-1];
                shift_reg_b[i] <= shift_reg_b[i-1];
            end
        end
    end

    always @(posedge clk or negedge resetn) begin
        if (!resetn)
            valid_buf <= {DELAY_CYCLES{1'b0}};
        else 
            valid_buf <= {valid_buf[DELAY_CYCLES-2:0],i_valid};
    end  
endmodule
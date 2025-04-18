module Decomposer_dual (
    input  wire [22:0] r_in_0,   // 第一筆輸入
    input  wire [22:0] r_in_1,   // 第二筆輸入
    output reg  [5:0]  r1_out_0, // 第一筆r1輸出
    output reg  signed [17:0] r0_out_0, // 第一筆r0輸出
    output reg  [5:0]  r1_out_1, // 第二筆r1輸出
    output reg  signed [17:0] r0_out_1  // 第二筆r0輸出
);

//--------------------------------
// Constant parameters
//--------------------------------
parameter Q_MINUS_1 = 8380416;
parameter GAMMA2    = 95232;
parameter ALPHA     = 190464;  // 2 * GAMMA2

//--------------------------------
// 第一通道處理
//--------------------------------
reg [5:0]  r1_floor_0;
reg signed [17:0] rem_norm_0;
reg [5:0]  r1_adj_0;
reg signed [17:0] r0_temp_0;
reg [22:0] r_minus_r0_0;

always @(*) begin
    // Step 1: 除以ALPHA
    r1_floor_0 = r_in_0 / ALPHA;
    rem_norm_0 = r_in_0 - r1_floor_0 * ALPHA;

    // Step 2: 平衡餘數
    if (rem_norm_0 > GAMMA2) begin
        r0_temp_0 = rem_norm_0 - ALPHA;
        r1_adj_0 = r1_floor_0 + 1;
    end else begin
        r0_temp_0 = rem_norm_0;
        r1_adj_0 = r1_floor_0;
    end

    // Step 3: 特例修正
    r_minus_r0_0 = r_in_0 - r0_temp_0;
    if (r_minus_r0_0 == Q_MINUS_1) begin
        r1_out_0 = 0;
        r0_out_0 = r0_temp_0 - 1;
    end else begin
        r1_out_0 = r1_adj_0;
        r0_out_0 = r0_temp_0;
    end
end

//--------------------------------
// 第二通道處理
//--------------------------------
reg [5:0]  r1_floor_1;
reg signed [17:0] rem_norm_1;
reg [5:0]  r1_adj_1;
reg signed [17:0] r0_temp_1;
reg [22:0] r_minus_r0_1;

always @(*) begin
    // Step 1: 除以ALPHA
    r1_floor_1 = r_in_1 / ALPHA;
    rem_norm_1 = r_in_1 - r1_floor_1 * ALPHA;

    // Step 2: 平衡餘數
    if (rem_norm_1 > GAMMA2) begin
        r0_temp_1 = rem_norm_1 - ALPHA;
        r1_adj_1 = r1_floor_1 + 1;
    end else begin
        r0_temp_1 = rem_norm_1;
        r1_adj_1 = r1_floor_1;
    end

    // Step 3: 特例修正
    r_minus_r0_1 = r_in_1 - r0_temp_1;
    if (r_minus_r0_1 == Q_MINUS_1) begin
        r1_out_1 = 0;
        r0_out_1 = r0_temp_1 - 1;
    end else begin
        r1_out_1 = r1_adj_1;
        r0_out_1 = r0_temp_1;
    end
end

endmodule

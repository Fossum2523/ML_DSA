`timescale 1ns/1ps

module Decomposer_dual_tb;

//--------------------------------
// 輸入/輸出定義
//--------------------------------
reg [22:0] r_in_0;
reg [22:0] r_in_1;
wire [5:0] r1_out_0;
wire signed [17:0] r0_out_0;
wire [5:0] r1_out_1;
wire signed [17:0] r0_out_1;

//--------------------------------
// DUT (雙通道 Decomposer) 實體化
//--------------------------------
Decomposer_dual uut (
    .r_in_0(r_in_0),
    .r_in_1(r_in_1),
    .r1_out_0(r1_out_0),
    .r0_out_0(r0_out_0),
    .r1_out_1(r1_out_1),
    .r0_out_1(r0_out_1)
);

//--------------------------------
// 測試流程
//--------------------------------
initial begin
    // 開始模擬
    $display("開始雙通道 Decomposer 測試！");
    $display("Time\t\t r_in_0\t\t| r1_out_0 | r0_out_0 || r_in_1\t\t| r1_out_1 | r0_out_1");

    // 測試資料
    test(23'd0,         23'd95232);     // 最小值+gamma2
    test(23'd95233,     23'd190464);    // gamma2超過一點+alpha
    test(23'd500000,    23'd750000);    // 中間兩筆隨便
    test(23'd8380416,   23'd8380415);   // 最大值+最大值-1

    $display("測試結束！");
    $finish;
end

//--------------------------------
// 自訂測試任務 (一次測兩筆 r_in)
//--------------------------------
task test(input [22:0] r_value0, input [22:0] r_value1);
begin
    r_in_0 = r_value0;
    r_in_1 = r_value1;
    #10; // 等10ns觀察輸出
    $display("%0t\t %0d\t| %0d\t| %0d || %0d\t| %0d\t| %0d", 
             $time, r_in_0, r1_out_0, r0_out_0, r_in_1, r1_out_1, r0_out_1);
end
endtask

endmodule

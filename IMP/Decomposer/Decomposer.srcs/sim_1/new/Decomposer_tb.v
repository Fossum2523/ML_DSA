`timescale 1ns/1ps

module Decomposer_dual_tb;

//--------------------------------
// ��J/��X�w�q
//--------------------------------
reg [22:0] r_in_0;
reg [22:0] r_in_1;
wire [5:0] r1_out_0;
wire signed [17:0] r0_out_0;
wire [5:0] r1_out_1;
wire signed [17:0] r0_out_1;

//--------------------------------
// DUT (���q�D Decomposer) �����
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
// ���լy�{
//--------------------------------
initial begin
    // �}�l����
    $display("�}�l���q�D Decomposer ���աI");
    $display("Time\t\t r_in_0\t\t| r1_out_0 | r0_out_0 || r_in_1\t\t| r1_out_1 | r0_out_1");

    // ���ո��
    test(23'd0,         23'd95232);     // �̤p��+gamma2
    test(23'd95233,     23'd190464);    // gamma2�W�L�@�I+alpha
    test(23'd500000,    23'd750000);    // �����ⵧ�H�K
    test(23'd8380416,   23'd8380415);   // �̤j��+�̤j��-1

    $display("���յ����I");
    $finish;
end

//--------------------------------
// �ۭq���ե��� (�@�����ⵧ r_in)
//--------------------------------
task test(input [22:0] r_value0, input [22:0] r_value1);
begin
    r_in_0 = r_value0;
    r_in_1 = r_value1;
    #10; // ��10ns�[���X
    $display("%0t\t %0d\t| %0d\t| %0d || %0d\t| %0d\t| %0d", 
             $time, r_in_0, r1_out_0, r0_out_0, r_in_1, r1_out_1, r0_out_1);
end
endtask

endmodule

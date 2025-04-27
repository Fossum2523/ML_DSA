// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Sun Apr 27 02:36:18 2025
// Host        : DESKTOP-5RUADSS running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               C:/Users/fossu/Desktop/ML_DSA_Syn_new/IMP2/BU/BU.sim/sim_1/synth/timing/xsim/tb_BU_time_synth.v
// Design      : BU
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7k70tfbv676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* BIT_LEN = "23" *) (* DATA_WIDTH = "23" *) (* DELAY_CYCLES = "6" *) 
(* INTT_mode = "1'b1" *) (* NTT_mode = "1'b0" *) (* depth = "64" *) 
(* NotValidForBitStream *)
module BU
   (clk,
    reset,
    i_valid,
    mode,
    a,
    b,
    zeta,
    o_valid,
    out_a,
    out_b);
  input clk;
  input reset;
  input i_valid;
  input mode;
  input [22:0]a;
  input [22:0]b;
  input [22:0]zeta;
  output o_valid;
  output [22:0]out_a;
  output [22:0]out_b;

  wire \DELAY_CHAIN_a[3].shift_reg_a_reg[3][0]_srl4___valid_buf_reg_r_2_n_0 ;
  wire \DELAY_CHAIN_a[3].shift_reg_a_reg[3][10]_srl4___valid_buf_reg_r_2_n_0 ;
  wire \DELAY_CHAIN_a[3].shift_reg_a_reg[3][11]_srl4___valid_buf_reg_r_2_n_0 ;
  wire \DELAY_CHAIN_a[3].shift_reg_a_reg[3][12]_srl4___valid_buf_reg_r_2_n_0 ;
  wire \DELAY_CHAIN_a[3].shift_reg_a_reg[3][13]_srl4___valid_buf_reg_r_2_n_0 ;
  wire \DELAY_CHAIN_a[3].shift_reg_a_reg[3][14]_srl4___valid_buf_reg_r_2_n_0 ;
  wire \DELAY_CHAIN_a[3].shift_reg_a_reg[3][15]_srl4___valid_buf_reg_r_2_n_0 ;
  wire \DELAY_CHAIN_a[3].shift_reg_a_reg[3][16]_srl4___valid_buf_reg_r_2_n_0 ;
  wire \DELAY_CHAIN_a[3].shift_reg_a_reg[3][17]_srl4___valid_buf_reg_r_2_n_0 ;
  wire \DELAY_CHAIN_a[3].shift_reg_a_reg[3][18]_srl4___valid_buf_reg_r_2_n_0 ;
  wire \DELAY_CHAIN_a[3].shift_reg_a_reg[3][19]_srl4___valid_buf_reg_r_2_n_0 ;
  wire \DELAY_CHAIN_a[3].shift_reg_a_reg[3][1]_srl4___valid_buf_reg_r_2_n_0 ;
  wire \DELAY_CHAIN_a[3].shift_reg_a_reg[3][20]_srl4___valid_buf_reg_r_2_n_0 ;
  wire \DELAY_CHAIN_a[3].shift_reg_a_reg[3][21]_srl4___valid_buf_reg_r_2_n_0 ;
  wire \DELAY_CHAIN_a[3].shift_reg_a_reg[3][22]_srl4___valid_buf_reg_r_2_n_0 ;
  wire \DELAY_CHAIN_a[3].shift_reg_a_reg[3][2]_srl4___valid_buf_reg_r_2_n_0 ;
  wire \DELAY_CHAIN_a[3].shift_reg_a_reg[3][3]_srl4___valid_buf_reg_r_2_n_0 ;
  wire \DELAY_CHAIN_a[3].shift_reg_a_reg[3][4]_srl4___valid_buf_reg_r_2_n_0 ;
  wire \DELAY_CHAIN_a[3].shift_reg_a_reg[3][5]_srl4___valid_buf_reg_r_2_n_0 ;
  wire \DELAY_CHAIN_a[3].shift_reg_a_reg[3][6]_srl4___valid_buf_reg_r_2_n_0 ;
  wire \DELAY_CHAIN_a[3].shift_reg_a_reg[3][7]_srl4___valid_buf_reg_r_2_n_0 ;
  wire \DELAY_CHAIN_a[3].shift_reg_a_reg[3][8]_srl4___valid_buf_reg_r_2_n_0 ;
  wire \DELAY_CHAIN_a[3].shift_reg_a_reg[3][9]_srl4___valid_buf_reg_r_2_n_0 ;
  wire \DELAY_CHAIN_a[4].shift_reg_a_reg[4][0]_valid_buf_reg_r_3_n_0 ;
  wire \DELAY_CHAIN_a[4].shift_reg_a_reg[4][10]_valid_buf_reg_r_3_n_0 ;
  wire \DELAY_CHAIN_a[4].shift_reg_a_reg[4][11]_valid_buf_reg_r_3_n_0 ;
  wire \DELAY_CHAIN_a[4].shift_reg_a_reg[4][12]_valid_buf_reg_r_3_n_0 ;
  wire \DELAY_CHAIN_a[4].shift_reg_a_reg[4][13]_valid_buf_reg_r_3_n_0 ;
  wire \DELAY_CHAIN_a[4].shift_reg_a_reg[4][14]_valid_buf_reg_r_3_n_0 ;
  wire \DELAY_CHAIN_a[4].shift_reg_a_reg[4][15]_valid_buf_reg_r_3_n_0 ;
  wire \DELAY_CHAIN_a[4].shift_reg_a_reg[4][16]_valid_buf_reg_r_3_n_0 ;
  wire \DELAY_CHAIN_a[4].shift_reg_a_reg[4][17]_valid_buf_reg_r_3_n_0 ;
  wire \DELAY_CHAIN_a[4].shift_reg_a_reg[4][18]_valid_buf_reg_r_3_n_0 ;
  wire \DELAY_CHAIN_a[4].shift_reg_a_reg[4][19]_valid_buf_reg_r_3_n_0 ;
  wire \DELAY_CHAIN_a[4].shift_reg_a_reg[4][1]_valid_buf_reg_r_3_n_0 ;
  wire \DELAY_CHAIN_a[4].shift_reg_a_reg[4][20]_valid_buf_reg_r_3_n_0 ;
  wire \DELAY_CHAIN_a[4].shift_reg_a_reg[4][21]_valid_buf_reg_r_3_n_0 ;
  wire \DELAY_CHAIN_a[4].shift_reg_a_reg[4][22]_valid_buf_reg_r_3_n_0 ;
  wire \DELAY_CHAIN_a[4].shift_reg_a_reg[4][2]_valid_buf_reg_r_3_n_0 ;
  wire \DELAY_CHAIN_a[4].shift_reg_a_reg[4][3]_valid_buf_reg_r_3_n_0 ;
  wire \DELAY_CHAIN_a[4].shift_reg_a_reg[4][4]_valid_buf_reg_r_3_n_0 ;
  wire \DELAY_CHAIN_a[4].shift_reg_a_reg[4][5]_valid_buf_reg_r_3_n_0 ;
  wire \DELAY_CHAIN_a[4].shift_reg_a_reg[4][6]_valid_buf_reg_r_3_n_0 ;
  wire \DELAY_CHAIN_a[4].shift_reg_a_reg[4][7]_valid_buf_reg_r_3_n_0 ;
  wire \DELAY_CHAIN_a[4].shift_reg_a_reg[4][8]_valid_buf_reg_r_3_n_0 ;
  wire \DELAY_CHAIN_a[4].shift_reg_a_reg[4][9]_valid_buf_reg_r_3_n_0 ;
  wire [22:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5] ;
  wire DELAY_CHAIN_a_gate__0_n_0;
  wire DELAY_CHAIN_a_gate__10_n_0;
  wire DELAY_CHAIN_a_gate__11_n_0;
  wire DELAY_CHAIN_a_gate__12_n_0;
  wire DELAY_CHAIN_a_gate__13_n_0;
  wire DELAY_CHAIN_a_gate__14_n_0;
  wire DELAY_CHAIN_a_gate__15_n_0;
  wire DELAY_CHAIN_a_gate__16_n_0;
  wire DELAY_CHAIN_a_gate__17_n_0;
  wire DELAY_CHAIN_a_gate__18_n_0;
  wire DELAY_CHAIN_a_gate__19_n_0;
  wire DELAY_CHAIN_a_gate__1_n_0;
  wire DELAY_CHAIN_a_gate__20_n_0;
  wire DELAY_CHAIN_a_gate__21_n_0;
  wire DELAY_CHAIN_a_gate__2_n_0;
  wire DELAY_CHAIN_a_gate__3_n_0;
  wire DELAY_CHAIN_a_gate__4_n_0;
  wire DELAY_CHAIN_a_gate__5_n_0;
  wire DELAY_CHAIN_a_gate__6_n_0;
  wire DELAY_CHAIN_a_gate__7_n_0;
  wire DELAY_CHAIN_a_gate__8_n_0;
  wire DELAY_CHAIN_a_gate__9_n_0;
  wire DELAY_CHAIN_a_gate_n_0;
  wire \DELAY_CHAIN_b[3].shift_reg_b_reg[3][0]_srl4___valid_buf_reg_r_2_n_0 ;
  wire \DELAY_CHAIN_b[3].shift_reg_b_reg[3][10]_srl4___valid_buf_reg_r_2_n_0 ;
  wire \DELAY_CHAIN_b[3].shift_reg_b_reg[3][11]_srl4___valid_buf_reg_r_2_n_0 ;
  wire \DELAY_CHAIN_b[3].shift_reg_b_reg[3][12]_srl4___valid_buf_reg_r_2_n_0 ;
  wire \DELAY_CHAIN_b[3].shift_reg_b_reg[3][13]_srl4___valid_buf_reg_r_2_n_0 ;
  wire \DELAY_CHAIN_b[3].shift_reg_b_reg[3][14]_srl4___valid_buf_reg_r_2_n_0 ;
  wire \DELAY_CHAIN_b[3].shift_reg_b_reg[3][15]_srl4___valid_buf_reg_r_2_n_0 ;
  wire \DELAY_CHAIN_b[3].shift_reg_b_reg[3][16]_srl4___valid_buf_reg_r_2_n_0 ;
  wire \DELAY_CHAIN_b[3].shift_reg_b_reg[3][17]_srl4___valid_buf_reg_r_2_n_0 ;
  wire \DELAY_CHAIN_b[3].shift_reg_b_reg[3][18]_srl4___valid_buf_reg_r_2_n_0 ;
  wire \DELAY_CHAIN_b[3].shift_reg_b_reg[3][19]_srl4___valid_buf_reg_r_2_n_0 ;
  wire \DELAY_CHAIN_b[3].shift_reg_b_reg[3][1]_srl4___valid_buf_reg_r_2_n_0 ;
  wire \DELAY_CHAIN_b[3].shift_reg_b_reg[3][20]_srl4___valid_buf_reg_r_2_n_0 ;
  wire \DELAY_CHAIN_b[3].shift_reg_b_reg[3][21]_srl4___valid_buf_reg_r_2_n_0 ;
  wire \DELAY_CHAIN_b[3].shift_reg_b_reg[3][22]_srl4___valid_buf_reg_r_2_n_0 ;
  wire \DELAY_CHAIN_b[3].shift_reg_b_reg[3][2]_srl4___valid_buf_reg_r_2_n_0 ;
  wire \DELAY_CHAIN_b[3].shift_reg_b_reg[3][3]_srl4___valid_buf_reg_r_2_n_0 ;
  wire \DELAY_CHAIN_b[3].shift_reg_b_reg[3][4]_srl4___valid_buf_reg_r_2_n_0 ;
  wire \DELAY_CHAIN_b[3].shift_reg_b_reg[3][5]_srl4___valid_buf_reg_r_2_n_0 ;
  wire \DELAY_CHAIN_b[3].shift_reg_b_reg[3][6]_srl4___valid_buf_reg_r_2_n_0 ;
  wire \DELAY_CHAIN_b[3].shift_reg_b_reg[3][7]_srl4___valid_buf_reg_r_2_n_0 ;
  wire \DELAY_CHAIN_b[3].shift_reg_b_reg[3][8]_srl4___valid_buf_reg_r_2_n_0 ;
  wire \DELAY_CHAIN_b[3].shift_reg_b_reg[3][9]_srl4___valid_buf_reg_r_2_n_0 ;
  wire \DELAY_CHAIN_b[4].shift_reg_b_reg[4][0]_valid_buf_reg_r_3_n_0 ;
  wire \DELAY_CHAIN_b[4].shift_reg_b_reg[4][10]_valid_buf_reg_r_3_n_0 ;
  wire \DELAY_CHAIN_b[4].shift_reg_b_reg[4][11]_valid_buf_reg_r_3_n_0 ;
  wire \DELAY_CHAIN_b[4].shift_reg_b_reg[4][12]_valid_buf_reg_r_3_n_0 ;
  wire \DELAY_CHAIN_b[4].shift_reg_b_reg[4][13]_valid_buf_reg_r_3_n_0 ;
  wire \DELAY_CHAIN_b[4].shift_reg_b_reg[4][14]_valid_buf_reg_r_3_n_0 ;
  wire \DELAY_CHAIN_b[4].shift_reg_b_reg[4][15]_valid_buf_reg_r_3_n_0 ;
  wire \DELAY_CHAIN_b[4].shift_reg_b_reg[4][16]_valid_buf_reg_r_3_n_0 ;
  wire \DELAY_CHAIN_b[4].shift_reg_b_reg[4][17]_valid_buf_reg_r_3_n_0 ;
  wire \DELAY_CHAIN_b[4].shift_reg_b_reg[4][18]_valid_buf_reg_r_3_n_0 ;
  wire \DELAY_CHAIN_b[4].shift_reg_b_reg[4][19]_valid_buf_reg_r_3_n_0 ;
  wire \DELAY_CHAIN_b[4].shift_reg_b_reg[4][1]_valid_buf_reg_r_3_n_0 ;
  wire \DELAY_CHAIN_b[4].shift_reg_b_reg[4][20]_valid_buf_reg_r_3_n_0 ;
  wire \DELAY_CHAIN_b[4].shift_reg_b_reg[4][21]_valid_buf_reg_r_3_n_0 ;
  wire \DELAY_CHAIN_b[4].shift_reg_b_reg[4][22]_valid_buf_reg_r_3_n_0 ;
  wire \DELAY_CHAIN_b[4].shift_reg_b_reg[4][2]_valid_buf_reg_r_3_n_0 ;
  wire \DELAY_CHAIN_b[4].shift_reg_b_reg[4][3]_valid_buf_reg_r_3_n_0 ;
  wire \DELAY_CHAIN_b[4].shift_reg_b_reg[4][4]_valid_buf_reg_r_3_n_0 ;
  wire \DELAY_CHAIN_b[4].shift_reg_b_reg[4][5]_valid_buf_reg_r_3_n_0 ;
  wire \DELAY_CHAIN_b[4].shift_reg_b_reg[4][6]_valid_buf_reg_r_3_n_0 ;
  wire \DELAY_CHAIN_b[4].shift_reg_b_reg[4][7]_valid_buf_reg_r_3_n_0 ;
  wire \DELAY_CHAIN_b[4].shift_reg_b_reg[4][8]_valid_buf_reg_r_3_n_0 ;
  wire \DELAY_CHAIN_b[4].shift_reg_b_reg[4][9]_valid_buf_reg_r_3_n_0 ;
  wire [22:0]\DELAY_CHAIN_b[5].shift_reg_b_reg[5] ;
  wire DELAY_CHAIN_b_gate__0_n_0;
  wire DELAY_CHAIN_b_gate__10_n_0;
  wire DELAY_CHAIN_b_gate__11_n_0;
  wire DELAY_CHAIN_b_gate__12_n_0;
  wire DELAY_CHAIN_b_gate__13_n_0;
  wire DELAY_CHAIN_b_gate__14_n_0;
  wire DELAY_CHAIN_b_gate__15_n_0;
  wire DELAY_CHAIN_b_gate__16_n_0;
  wire DELAY_CHAIN_b_gate__17_n_0;
  wire DELAY_CHAIN_b_gate__18_n_0;
  wire DELAY_CHAIN_b_gate__19_n_0;
  wire DELAY_CHAIN_b_gate__1_n_0;
  wire DELAY_CHAIN_b_gate__20_n_0;
  wire DELAY_CHAIN_b_gate__21_n_0;
  wire DELAY_CHAIN_b_gate__2_n_0;
  wire DELAY_CHAIN_b_gate__3_n_0;
  wire DELAY_CHAIN_b_gate__4_n_0;
  wire DELAY_CHAIN_b_gate__5_n_0;
  wire DELAY_CHAIN_b_gate__6_n_0;
  wire DELAY_CHAIN_b_gate__7_n_0;
  wire DELAY_CHAIN_b_gate__8_n_0;
  wire DELAY_CHAIN_b_gate__9_n_0;
  wire DELAY_CHAIN_b_gate_n_0;
  wire [22:0]a;
  wire [22:0]a_IBUF;
  wire [23:1]a_plus_b_minus_q;
  wire [22:0]b;
  wire [22:0]b_IBUF;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire i_valid;
  wire i_valid_IBUF;
  wire ma_n_23;
  wire ma_n_24;
  wire ma_n_25;
  wire ma_n_26;
  wire ma_n_27;
  wire ma_n_28;
  wire ma_n_29;
  wire ma_n_30;
  wire ma_n_31;
  wire ma_n_32;
  wire ma_n_33;
  wire ma_n_34;
  wire ma_n_35;
  wire ma_n_36;
  wire ma_n_37;
  wire ma_n_38;
  wire ma_n_39;
  wire ma_n_40;
  wire ma_n_41;
  wire ma_n_42;
  wire ma_n_43;
  wire ma_n_44;
  wire ma_n_45;
  wire mm_n_0;
  wire mm_n_1;
  wire mm_n_10;
  wire mm_n_145;
  wire mm_n_146;
  wire mm_n_147;
  wire mm_n_148;
  wire mm_n_149;
  wire mm_n_150;
  wire mm_n_151;
  wire mm_n_152;
  wire mm_n_153;
  wire mm_n_154;
  wire mm_n_155;
  wire mm_n_156;
  wire mm_n_157;
  wire mm_n_158;
  wire mm_n_159;
  wire mm_n_160;
  wire mm_n_161;
  wire mm_n_162;
  wire mm_n_163;
  wire mm_n_164;
  wire mm_n_165;
  wire mm_n_166;
  wire mm_n_167;
  wire mm_n_168;
  wire mm_n_169;
  wire mm_n_170;
  wire mm_n_171;
  wire mm_n_172;
  wire mm_n_2;
  wire mm_n_3;
  wire mm_n_34;
  wire mm_n_35;
  wire mm_n_36;
  wire mm_n_37;
  wire mm_n_38;
  wire mm_n_39;
  wire mm_n_4;
  wire mm_n_40;
  wire mm_n_41;
  wire mm_n_42;
  wire mm_n_43;
  wire mm_n_44;
  wire mm_n_45;
  wire mm_n_46;
  wire mm_n_47;
  wire mm_n_48;
  wire mm_n_49;
  wire mm_n_5;
  wire mm_n_50;
  wire mm_n_51;
  wire mm_n_52;
  wire mm_n_53;
  wire mm_n_54;
  wire mm_n_55;
  wire mm_n_56;
  wire mm_n_57;
  wire mm_n_58;
  wire mm_n_59;
  wire mm_n_6;
  wire mm_n_60;
  wire mm_n_61;
  wire mm_n_62;
  wire mm_n_63;
  wire mm_n_64;
  wire mm_n_65;
  wire mm_n_66;
  wire mm_n_67;
  wire mm_n_68;
  wire mm_n_69;
  wire mm_n_7;
  wire mm_n_70;
  wire mm_n_71;
  wire mm_n_72;
  wire mm_n_73;
  wire mm_n_74;
  wire mm_n_75;
  wire mm_n_76;
  wire mm_n_77;
  wire mm_n_78;
  wire mm_n_79;
  wire mm_n_8;
  wire mm_n_80;
  wire mm_n_81;
  wire mm_n_82;
  wire mm_n_83;
  wire mm_n_84;
  wire mm_n_85;
  wire mm_n_86;
  wire mm_n_87;
  wire mm_n_88;
  wire mm_n_89;
  wire mm_n_9;
  wire mm_n_90;
  wire mm_n_91;
  wire mm_n_92;
  wire mm_n_93;
  wire mm_n_94;
  wire mm_n_95;
  wire mm_n_96;
  wire mm_n_97;
  wire mm_n_98;
  wire mode;
  wire mode_IBUF;
  wire ms_n_24;
  wire ms_n_25;
  wire ms_n_26;
  wire ms_n_27;
  wire ms_n_28;
  wire ms_n_29;
  wire ms_n_30;
  wire ms_n_31;
  wire ms_n_32;
  wire ms_n_33;
  wire ms_n_34;
  wire ms_n_35;
  wire ms_n_36;
  wire ms_n_37;
  wire ms_n_38;
  wire ms_n_39;
  wire ms_n_40;
  wire ms_n_41;
  wire ms_n_42;
  wire ms_n_43;
  wire ms_n_44;
  wire ms_n_45;
  wire ms_n_46;
  wire ms_n_47;
  wire o_valid;
  wire o_valid_OBUF;
  wire [22:0]out;
  wire out1;
  wire [22:0]out_a;
  wire [22:0]out_a_OBUF;
  wire [22:0]out_b;
  wire [22:0]out_b_OBUF;
  wire reset;
  wire reset_IBUF;
  wire [22:0]sub_out;
  wire \valid_buf_reg[3]_srl4___valid_buf_reg_r_2_n_0 ;
  wire \valid_buf_reg[4]_valid_buf_reg_r_3_n_0 ;
  wire valid_buf_reg_gate_n_0;
  wire valid_buf_reg_r_0_n_0;
  wire valid_buf_reg_r_1_n_0;
  wire valid_buf_reg_r_2_n_0;
  wire valid_buf_reg_r_3_n_0;
  wire valid_buf_reg_r_n_0;
  wire [22:0]zeta;
  wire [22:0]zeta_IBUF;

initial begin
 $sdf_annotate("tb_BU_time_synth.sdf",,,,"tool_control");
end
  (* srl_bus_name = "\\DELAY_CHAIN_a[3].shift_reg_a_reg[3] " *) 
  (* srl_name = "\\DELAY_CHAIN_a[3].shift_reg_a_reg[3][0]_srl4___valid_buf_reg_r_2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \DELAY_CHAIN_a[3].shift_reg_a_reg[3][0]_srl4___valid_buf_reg_r_2 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D(a_IBUF[0]),
        .Q(\DELAY_CHAIN_a[3].shift_reg_a_reg[3][0]_srl4___valid_buf_reg_r_2_n_0 ));
  (* srl_bus_name = "\\DELAY_CHAIN_a[3].shift_reg_a_reg[3] " *) 
  (* srl_name = "\\DELAY_CHAIN_a[3].shift_reg_a_reg[3][10]_srl4___valid_buf_reg_r_2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \DELAY_CHAIN_a[3].shift_reg_a_reg[3][10]_srl4___valid_buf_reg_r_2 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D(a_IBUF[10]),
        .Q(\DELAY_CHAIN_a[3].shift_reg_a_reg[3][10]_srl4___valid_buf_reg_r_2_n_0 ));
  (* srl_bus_name = "\\DELAY_CHAIN_a[3].shift_reg_a_reg[3] " *) 
  (* srl_name = "\\DELAY_CHAIN_a[3].shift_reg_a_reg[3][11]_srl4___valid_buf_reg_r_2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \DELAY_CHAIN_a[3].shift_reg_a_reg[3][11]_srl4___valid_buf_reg_r_2 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D(a_IBUF[11]),
        .Q(\DELAY_CHAIN_a[3].shift_reg_a_reg[3][11]_srl4___valid_buf_reg_r_2_n_0 ));
  (* srl_bus_name = "\\DELAY_CHAIN_a[3].shift_reg_a_reg[3] " *) 
  (* srl_name = "\\DELAY_CHAIN_a[3].shift_reg_a_reg[3][12]_srl4___valid_buf_reg_r_2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \DELAY_CHAIN_a[3].shift_reg_a_reg[3][12]_srl4___valid_buf_reg_r_2 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D(a_IBUF[12]),
        .Q(\DELAY_CHAIN_a[3].shift_reg_a_reg[3][12]_srl4___valid_buf_reg_r_2_n_0 ));
  (* srl_bus_name = "\\DELAY_CHAIN_a[3].shift_reg_a_reg[3] " *) 
  (* srl_name = "\\DELAY_CHAIN_a[3].shift_reg_a_reg[3][13]_srl4___valid_buf_reg_r_2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \DELAY_CHAIN_a[3].shift_reg_a_reg[3][13]_srl4___valid_buf_reg_r_2 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D(a_IBUF[13]),
        .Q(\DELAY_CHAIN_a[3].shift_reg_a_reg[3][13]_srl4___valid_buf_reg_r_2_n_0 ));
  (* srl_bus_name = "\\DELAY_CHAIN_a[3].shift_reg_a_reg[3] " *) 
  (* srl_name = "\\DELAY_CHAIN_a[3].shift_reg_a_reg[3][14]_srl4___valid_buf_reg_r_2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \DELAY_CHAIN_a[3].shift_reg_a_reg[3][14]_srl4___valid_buf_reg_r_2 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D(a_IBUF[14]),
        .Q(\DELAY_CHAIN_a[3].shift_reg_a_reg[3][14]_srl4___valid_buf_reg_r_2_n_0 ));
  (* srl_bus_name = "\\DELAY_CHAIN_a[3].shift_reg_a_reg[3] " *) 
  (* srl_name = "\\DELAY_CHAIN_a[3].shift_reg_a_reg[3][15]_srl4___valid_buf_reg_r_2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \DELAY_CHAIN_a[3].shift_reg_a_reg[3][15]_srl4___valid_buf_reg_r_2 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D(a_IBUF[15]),
        .Q(\DELAY_CHAIN_a[3].shift_reg_a_reg[3][15]_srl4___valid_buf_reg_r_2_n_0 ));
  (* srl_bus_name = "\\DELAY_CHAIN_a[3].shift_reg_a_reg[3] " *) 
  (* srl_name = "\\DELAY_CHAIN_a[3].shift_reg_a_reg[3][16]_srl4___valid_buf_reg_r_2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \DELAY_CHAIN_a[3].shift_reg_a_reg[3][16]_srl4___valid_buf_reg_r_2 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D(a_IBUF[16]),
        .Q(\DELAY_CHAIN_a[3].shift_reg_a_reg[3][16]_srl4___valid_buf_reg_r_2_n_0 ));
  (* srl_bus_name = "\\DELAY_CHAIN_a[3].shift_reg_a_reg[3] " *) 
  (* srl_name = "\\DELAY_CHAIN_a[3].shift_reg_a_reg[3][17]_srl4___valid_buf_reg_r_2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \DELAY_CHAIN_a[3].shift_reg_a_reg[3][17]_srl4___valid_buf_reg_r_2 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D(a_IBUF[17]),
        .Q(\DELAY_CHAIN_a[3].shift_reg_a_reg[3][17]_srl4___valid_buf_reg_r_2_n_0 ));
  (* srl_bus_name = "\\DELAY_CHAIN_a[3].shift_reg_a_reg[3] " *) 
  (* srl_name = "\\DELAY_CHAIN_a[3].shift_reg_a_reg[3][18]_srl4___valid_buf_reg_r_2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \DELAY_CHAIN_a[3].shift_reg_a_reg[3][18]_srl4___valid_buf_reg_r_2 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D(a_IBUF[18]),
        .Q(\DELAY_CHAIN_a[3].shift_reg_a_reg[3][18]_srl4___valid_buf_reg_r_2_n_0 ));
  (* srl_bus_name = "\\DELAY_CHAIN_a[3].shift_reg_a_reg[3] " *) 
  (* srl_name = "\\DELAY_CHAIN_a[3].shift_reg_a_reg[3][19]_srl4___valid_buf_reg_r_2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \DELAY_CHAIN_a[3].shift_reg_a_reg[3][19]_srl4___valid_buf_reg_r_2 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D(a_IBUF[19]),
        .Q(\DELAY_CHAIN_a[3].shift_reg_a_reg[3][19]_srl4___valid_buf_reg_r_2_n_0 ));
  (* srl_bus_name = "\\DELAY_CHAIN_a[3].shift_reg_a_reg[3] " *) 
  (* srl_name = "\\DELAY_CHAIN_a[3].shift_reg_a_reg[3][1]_srl4___valid_buf_reg_r_2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \DELAY_CHAIN_a[3].shift_reg_a_reg[3][1]_srl4___valid_buf_reg_r_2 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D(a_IBUF[1]),
        .Q(\DELAY_CHAIN_a[3].shift_reg_a_reg[3][1]_srl4___valid_buf_reg_r_2_n_0 ));
  (* srl_bus_name = "\\DELAY_CHAIN_a[3].shift_reg_a_reg[3] " *) 
  (* srl_name = "\\DELAY_CHAIN_a[3].shift_reg_a_reg[3][20]_srl4___valid_buf_reg_r_2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \DELAY_CHAIN_a[3].shift_reg_a_reg[3][20]_srl4___valid_buf_reg_r_2 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D(a_IBUF[20]),
        .Q(\DELAY_CHAIN_a[3].shift_reg_a_reg[3][20]_srl4___valid_buf_reg_r_2_n_0 ));
  (* srl_bus_name = "\\DELAY_CHAIN_a[3].shift_reg_a_reg[3] " *) 
  (* srl_name = "\\DELAY_CHAIN_a[3].shift_reg_a_reg[3][21]_srl4___valid_buf_reg_r_2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \DELAY_CHAIN_a[3].shift_reg_a_reg[3][21]_srl4___valid_buf_reg_r_2 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D(a_IBUF[21]),
        .Q(\DELAY_CHAIN_a[3].shift_reg_a_reg[3][21]_srl4___valid_buf_reg_r_2_n_0 ));
  (* srl_bus_name = "\\DELAY_CHAIN_a[3].shift_reg_a_reg[3] " *) 
  (* srl_name = "\\DELAY_CHAIN_a[3].shift_reg_a_reg[3][22]_srl4___valid_buf_reg_r_2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \DELAY_CHAIN_a[3].shift_reg_a_reg[3][22]_srl4___valid_buf_reg_r_2 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D(a_IBUF[22]),
        .Q(\DELAY_CHAIN_a[3].shift_reg_a_reg[3][22]_srl4___valid_buf_reg_r_2_n_0 ));
  (* srl_bus_name = "\\DELAY_CHAIN_a[3].shift_reg_a_reg[3] " *) 
  (* srl_name = "\\DELAY_CHAIN_a[3].shift_reg_a_reg[3][2]_srl4___valid_buf_reg_r_2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \DELAY_CHAIN_a[3].shift_reg_a_reg[3][2]_srl4___valid_buf_reg_r_2 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D(a_IBUF[2]),
        .Q(\DELAY_CHAIN_a[3].shift_reg_a_reg[3][2]_srl4___valid_buf_reg_r_2_n_0 ));
  (* srl_bus_name = "\\DELAY_CHAIN_a[3].shift_reg_a_reg[3] " *) 
  (* srl_name = "\\DELAY_CHAIN_a[3].shift_reg_a_reg[3][3]_srl4___valid_buf_reg_r_2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \DELAY_CHAIN_a[3].shift_reg_a_reg[3][3]_srl4___valid_buf_reg_r_2 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D(a_IBUF[3]),
        .Q(\DELAY_CHAIN_a[3].shift_reg_a_reg[3][3]_srl4___valid_buf_reg_r_2_n_0 ));
  (* srl_bus_name = "\\DELAY_CHAIN_a[3].shift_reg_a_reg[3] " *) 
  (* srl_name = "\\DELAY_CHAIN_a[3].shift_reg_a_reg[3][4]_srl4___valid_buf_reg_r_2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \DELAY_CHAIN_a[3].shift_reg_a_reg[3][4]_srl4___valid_buf_reg_r_2 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D(a_IBUF[4]),
        .Q(\DELAY_CHAIN_a[3].shift_reg_a_reg[3][4]_srl4___valid_buf_reg_r_2_n_0 ));
  (* srl_bus_name = "\\DELAY_CHAIN_a[3].shift_reg_a_reg[3] " *) 
  (* srl_name = "\\DELAY_CHAIN_a[3].shift_reg_a_reg[3][5]_srl4___valid_buf_reg_r_2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \DELAY_CHAIN_a[3].shift_reg_a_reg[3][5]_srl4___valid_buf_reg_r_2 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D(a_IBUF[5]),
        .Q(\DELAY_CHAIN_a[3].shift_reg_a_reg[3][5]_srl4___valid_buf_reg_r_2_n_0 ));
  (* srl_bus_name = "\\DELAY_CHAIN_a[3].shift_reg_a_reg[3] " *) 
  (* srl_name = "\\DELAY_CHAIN_a[3].shift_reg_a_reg[3][6]_srl4___valid_buf_reg_r_2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \DELAY_CHAIN_a[3].shift_reg_a_reg[3][6]_srl4___valid_buf_reg_r_2 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D(a_IBUF[6]),
        .Q(\DELAY_CHAIN_a[3].shift_reg_a_reg[3][6]_srl4___valid_buf_reg_r_2_n_0 ));
  (* srl_bus_name = "\\DELAY_CHAIN_a[3].shift_reg_a_reg[3] " *) 
  (* srl_name = "\\DELAY_CHAIN_a[3].shift_reg_a_reg[3][7]_srl4___valid_buf_reg_r_2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \DELAY_CHAIN_a[3].shift_reg_a_reg[3][7]_srl4___valid_buf_reg_r_2 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D(a_IBUF[7]),
        .Q(\DELAY_CHAIN_a[3].shift_reg_a_reg[3][7]_srl4___valid_buf_reg_r_2_n_0 ));
  (* srl_bus_name = "\\DELAY_CHAIN_a[3].shift_reg_a_reg[3] " *) 
  (* srl_name = "\\DELAY_CHAIN_a[3].shift_reg_a_reg[3][8]_srl4___valid_buf_reg_r_2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \DELAY_CHAIN_a[3].shift_reg_a_reg[3][8]_srl4___valid_buf_reg_r_2 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D(a_IBUF[8]),
        .Q(\DELAY_CHAIN_a[3].shift_reg_a_reg[3][8]_srl4___valid_buf_reg_r_2_n_0 ));
  (* srl_bus_name = "\\DELAY_CHAIN_a[3].shift_reg_a_reg[3] " *) 
  (* srl_name = "\\DELAY_CHAIN_a[3].shift_reg_a_reg[3][9]_srl4___valid_buf_reg_r_2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \DELAY_CHAIN_a[3].shift_reg_a_reg[3][9]_srl4___valid_buf_reg_r_2 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D(a_IBUF[9]),
        .Q(\DELAY_CHAIN_a[3].shift_reg_a_reg[3][9]_srl4___valid_buf_reg_r_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_a[4].shift_reg_a_reg[4][0]_valid_buf_reg_r_3 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\DELAY_CHAIN_a[3].shift_reg_a_reg[3][0]_srl4___valid_buf_reg_r_2_n_0 ),
        .Q(\DELAY_CHAIN_a[4].shift_reg_a_reg[4][0]_valid_buf_reg_r_3_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_a[4].shift_reg_a_reg[4][10]_valid_buf_reg_r_3 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\DELAY_CHAIN_a[3].shift_reg_a_reg[3][10]_srl4___valid_buf_reg_r_2_n_0 ),
        .Q(\DELAY_CHAIN_a[4].shift_reg_a_reg[4][10]_valid_buf_reg_r_3_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_a[4].shift_reg_a_reg[4][11]_valid_buf_reg_r_3 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\DELAY_CHAIN_a[3].shift_reg_a_reg[3][11]_srl4___valid_buf_reg_r_2_n_0 ),
        .Q(\DELAY_CHAIN_a[4].shift_reg_a_reg[4][11]_valid_buf_reg_r_3_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_a[4].shift_reg_a_reg[4][12]_valid_buf_reg_r_3 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\DELAY_CHAIN_a[3].shift_reg_a_reg[3][12]_srl4___valid_buf_reg_r_2_n_0 ),
        .Q(\DELAY_CHAIN_a[4].shift_reg_a_reg[4][12]_valid_buf_reg_r_3_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_a[4].shift_reg_a_reg[4][13]_valid_buf_reg_r_3 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\DELAY_CHAIN_a[3].shift_reg_a_reg[3][13]_srl4___valid_buf_reg_r_2_n_0 ),
        .Q(\DELAY_CHAIN_a[4].shift_reg_a_reg[4][13]_valid_buf_reg_r_3_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_a[4].shift_reg_a_reg[4][14]_valid_buf_reg_r_3 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\DELAY_CHAIN_a[3].shift_reg_a_reg[3][14]_srl4___valid_buf_reg_r_2_n_0 ),
        .Q(\DELAY_CHAIN_a[4].shift_reg_a_reg[4][14]_valid_buf_reg_r_3_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_a[4].shift_reg_a_reg[4][15]_valid_buf_reg_r_3 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\DELAY_CHAIN_a[3].shift_reg_a_reg[3][15]_srl4___valid_buf_reg_r_2_n_0 ),
        .Q(\DELAY_CHAIN_a[4].shift_reg_a_reg[4][15]_valid_buf_reg_r_3_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_a[4].shift_reg_a_reg[4][16]_valid_buf_reg_r_3 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\DELAY_CHAIN_a[3].shift_reg_a_reg[3][16]_srl4___valid_buf_reg_r_2_n_0 ),
        .Q(\DELAY_CHAIN_a[4].shift_reg_a_reg[4][16]_valid_buf_reg_r_3_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_a[4].shift_reg_a_reg[4][17]_valid_buf_reg_r_3 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\DELAY_CHAIN_a[3].shift_reg_a_reg[3][17]_srl4___valid_buf_reg_r_2_n_0 ),
        .Q(\DELAY_CHAIN_a[4].shift_reg_a_reg[4][17]_valid_buf_reg_r_3_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_a[4].shift_reg_a_reg[4][18]_valid_buf_reg_r_3 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\DELAY_CHAIN_a[3].shift_reg_a_reg[3][18]_srl4___valid_buf_reg_r_2_n_0 ),
        .Q(\DELAY_CHAIN_a[4].shift_reg_a_reg[4][18]_valid_buf_reg_r_3_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_a[4].shift_reg_a_reg[4][19]_valid_buf_reg_r_3 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\DELAY_CHAIN_a[3].shift_reg_a_reg[3][19]_srl4___valid_buf_reg_r_2_n_0 ),
        .Q(\DELAY_CHAIN_a[4].shift_reg_a_reg[4][19]_valid_buf_reg_r_3_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_a[4].shift_reg_a_reg[4][1]_valid_buf_reg_r_3 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\DELAY_CHAIN_a[3].shift_reg_a_reg[3][1]_srl4___valid_buf_reg_r_2_n_0 ),
        .Q(\DELAY_CHAIN_a[4].shift_reg_a_reg[4][1]_valid_buf_reg_r_3_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_a[4].shift_reg_a_reg[4][20]_valid_buf_reg_r_3 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\DELAY_CHAIN_a[3].shift_reg_a_reg[3][20]_srl4___valid_buf_reg_r_2_n_0 ),
        .Q(\DELAY_CHAIN_a[4].shift_reg_a_reg[4][20]_valid_buf_reg_r_3_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_a[4].shift_reg_a_reg[4][21]_valid_buf_reg_r_3 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\DELAY_CHAIN_a[3].shift_reg_a_reg[3][21]_srl4___valid_buf_reg_r_2_n_0 ),
        .Q(\DELAY_CHAIN_a[4].shift_reg_a_reg[4][21]_valid_buf_reg_r_3_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_a[4].shift_reg_a_reg[4][22]_valid_buf_reg_r_3 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\DELAY_CHAIN_a[3].shift_reg_a_reg[3][22]_srl4___valid_buf_reg_r_2_n_0 ),
        .Q(\DELAY_CHAIN_a[4].shift_reg_a_reg[4][22]_valid_buf_reg_r_3_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_a[4].shift_reg_a_reg[4][2]_valid_buf_reg_r_3 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\DELAY_CHAIN_a[3].shift_reg_a_reg[3][2]_srl4___valid_buf_reg_r_2_n_0 ),
        .Q(\DELAY_CHAIN_a[4].shift_reg_a_reg[4][2]_valid_buf_reg_r_3_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_a[4].shift_reg_a_reg[4][3]_valid_buf_reg_r_3 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\DELAY_CHAIN_a[3].shift_reg_a_reg[3][3]_srl4___valid_buf_reg_r_2_n_0 ),
        .Q(\DELAY_CHAIN_a[4].shift_reg_a_reg[4][3]_valid_buf_reg_r_3_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_a[4].shift_reg_a_reg[4][4]_valid_buf_reg_r_3 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\DELAY_CHAIN_a[3].shift_reg_a_reg[3][4]_srl4___valid_buf_reg_r_2_n_0 ),
        .Q(\DELAY_CHAIN_a[4].shift_reg_a_reg[4][4]_valid_buf_reg_r_3_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_a[4].shift_reg_a_reg[4][5]_valid_buf_reg_r_3 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\DELAY_CHAIN_a[3].shift_reg_a_reg[3][5]_srl4___valid_buf_reg_r_2_n_0 ),
        .Q(\DELAY_CHAIN_a[4].shift_reg_a_reg[4][5]_valid_buf_reg_r_3_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_a[4].shift_reg_a_reg[4][6]_valid_buf_reg_r_3 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\DELAY_CHAIN_a[3].shift_reg_a_reg[3][6]_srl4___valid_buf_reg_r_2_n_0 ),
        .Q(\DELAY_CHAIN_a[4].shift_reg_a_reg[4][6]_valid_buf_reg_r_3_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_a[4].shift_reg_a_reg[4][7]_valid_buf_reg_r_3 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\DELAY_CHAIN_a[3].shift_reg_a_reg[3][7]_srl4___valid_buf_reg_r_2_n_0 ),
        .Q(\DELAY_CHAIN_a[4].shift_reg_a_reg[4][7]_valid_buf_reg_r_3_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_a[4].shift_reg_a_reg[4][8]_valid_buf_reg_r_3 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\DELAY_CHAIN_a[3].shift_reg_a_reg[3][8]_srl4___valid_buf_reg_r_2_n_0 ),
        .Q(\DELAY_CHAIN_a[4].shift_reg_a_reg[4][8]_valid_buf_reg_r_3_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_a[4].shift_reg_a_reg[4][9]_valid_buf_reg_r_3 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\DELAY_CHAIN_a[3].shift_reg_a_reg[3][9]_srl4___valid_buf_reg_r_2_n_0 ),
        .Q(\DELAY_CHAIN_a[4].shift_reg_a_reg[4][9]_valid_buf_reg_r_3_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(DELAY_CHAIN_a_gate__21_n_0),
        .Q(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [0]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][10] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(DELAY_CHAIN_a_gate__11_n_0),
        .Q(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [10]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][11] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(DELAY_CHAIN_a_gate__10_n_0),
        .Q(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [11]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][12] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(DELAY_CHAIN_a_gate__9_n_0),
        .Q(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [12]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][13] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(DELAY_CHAIN_a_gate__8_n_0),
        .Q(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [13]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][14] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(DELAY_CHAIN_a_gate__7_n_0),
        .Q(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [14]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][15] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(DELAY_CHAIN_a_gate__6_n_0),
        .Q(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [15]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][16] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(DELAY_CHAIN_a_gate__5_n_0),
        .Q(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [16]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][17] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(DELAY_CHAIN_a_gate__4_n_0),
        .Q(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [17]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][18] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(DELAY_CHAIN_a_gate__3_n_0),
        .Q(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [18]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][19] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(DELAY_CHAIN_a_gate__2_n_0),
        .Q(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [19]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(DELAY_CHAIN_a_gate__20_n_0),
        .Q(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [1]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][20] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(DELAY_CHAIN_a_gate__1_n_0),
        .Q(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [20]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][21] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(DELAY_CHAIN_a_gate__0_n_0),
        .Q(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [21]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][22] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(DELAY_CHAIN_a_gate_n_0),
        .Q(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [22]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(DELAY_CHAIN_a_gate__19_n_0),
        .Q(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [2]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(DELAY_CHAIN_a_gate__18_n_0),
        .Q(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [3]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(DELAY_CHAIN_a_gate__17_n_0),
        .Q(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [4]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(DELAY_CHAIN_a_gate__16_n_0),
        .Q(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [5]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(DELAY_CHAIN_a_gate__15_n_0),
        .Q(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [6]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(DELAY_CHAIN_a_gate__14_n_0),
        .Q(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [7]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][8] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(DELAY_CHAIN_a_gate__13_n_0),
        .Q(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [8]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][9] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(DELAY_CHAIN_a_gate__12_n_0),
        .Q(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [9]),
        .R(reset_IBUF));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT2 #(
    .INIT(4'h8)) 
    DELAY_CHAIN_a_gate
       (.I0(\DELAY_CHAIN_a[4].shift_reg_a_reg[4][22]_valid_buf_reg_r_3_n_0 ),
        .I1(valid_buf_reg_r_3_n_0),
        .O(DELAY_CHAIN_a_gate_n_0));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT2 #(
    .INIT(4'h8)) 
    DELAY_CHAIN_a_gate__0
       (.I0(\DELAY_CHAIN_a[4].shift_reg_a_reg[4][21]_valid_buf_reg_r_3_n_0 ),
        .I1(valid_buf_reg_r_3_n_0),
        .O(DELAY_CHAIN_a_gate__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT2 #(
    .INIT(4'h8)) 
    DELAY_CHAIN_a_gate__1
       (.I0(\DELAY_CHAIN_a[4].shift_reg_a_reg[4][20]_valid_buf_reg_r_3_n_0 ),
        .I1(valid_buf_reg_r_3_n_0),
        .O(DELAY_CHAIN_a_gate__1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT2 #(
    .INIT(4'h8)) 
    DELAY_CHAIN_a_gate__10
       (.I0(\DELAY_CHAIN_a[4].shift_reg_a_reg[4][11]_valid_buf_reg_r_3_n_0 ),
        .I1(valid_buf_reg_r_3_n_0),
        .O(DELAY_CHAIN_a_gate__10_n_0));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT2 #(
    .INIT(4'h8)) 
    DELAY_CHAIN_a_gate__11
       (.I0(\DELAY_CHAIN_a[4].shift_reg_a_reg[4][10]_valid_buf_reg_r_3_n_0 ),
        .I1(valid_buf_reg_r_3_n_0),
        .O(DELAY_CHAIN_a_gate__11_n_0));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT2 #(
    .INIT(4'h8)) 
    DELAY_CHAIN_a_gate__12
       (.I0(\DELAY_CHAIN_a[4].shift_reg_a_reg[4][9]_valid_buf_reg_r_3_n_0 ),
        .I1(valid_buf_reg_r_3_n_0),
        .O(DELAY_CHAIN_a_gate__12_n_0));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT2 #(
    .INIT(4'h8)) 
    DELAY_CHAIN_a_gate__13
       (.I0(\DELAY_CHAIN_a[4].shift_reg_a_reg[4][8]_valid_buf_reg_r_3_n_0 ),
        .I1(valid_buf_reg_r_3_n_0),
        .O(DELAY_CHAIN_a_gate__13_n_0));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT2 #(
    .INIT(4'h8)) 
    DELAY_CHAIN_a_gate__14
       (.I0(\DELAY_CHAIN_a[4].shift_reg_a_reg[4][7]_valid_buf_reg_r_3_n_0 ),
        .I1(valid_buf_reg_r_3_n_0),
        .O(DELAY_CHAIN_a_gate__14_n_0));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT2 #(
    .INIT(4'h8)) 
    DELAY_CHAIN_a_gate__15
       (.I0(\DELAY_CHAIN_a[4].shift_reg_a_reg[4][6]_valid_buf_reg_r_3_n_0 ),
        .I1(valid_buf_reg_r_3_n_0),
        .O(DELAY_CHAIN_a_gate__15_n_0));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT2 #(
    .INIT(4'h8)) 
    DELAY_CHAIN_a_gate__16
       (.I0(\DELAY_CHAIN_a[4].shift_reg_a_reg[4][5]_valid_buf_reg_r_3_n_0 ),
        .I1(valid_buf_reg_r_3_n_0),
        .O(DELAY_CHAIN_a_gate__16_n_0));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT2 #(
    .INIT(4'h8)) 
    DELAY_CHAIN_a_gate__17
       (.I0(\DELAY_CHAIN_a[4].shift_reg_a_reg[4][4]_valid_buf_reg_r_3_n_0 ),
        .I1(valid_buf_reg_r_3_n_0),
        .O(DELAY_CHAIN_a_gate__17_n_0));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT2 #(
    .INIT(4'h8)) 
    DELAY_CHAIN_a_gate__18
       (.I0(\DELAY_CHAIN_a[4].shift_reg_a_reg[4][3]_valid_buf_reg_r_3_n_0 ),
        .I1(valid_buf_reg_r_3_n_0),
        .O(DELAY_CHAIN_a_gate__18_n_0));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT2 #(
    .INIT(4'h8)) 
    DELAY_CHAIN_a_gate__19
       (.I0(\DELAY_CHAIN_a[4].shift_reg_a_reg[4][2]_valid_buf_reg_r_3_n_0 ),
        .I1(valid_buf_reg_r_3_n_0),
        .O(DELAY_CHAIN_a_gate__19_n_0));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT2 #(
    .INIT(4'h8)) 
    DELAY_CHAIN_a_gate__2
       (.I0(\DELAY_CHAIN_a[4].shift_reg_a_reg[4][19]_valid_buf_reg_r_3_n_0 ),
        .I1(valid_buf_reg_r_3_n_0),
        .O(DELAY_CHAIN_a_gate__2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT2 #(
    .INIT(4'h8)) 
    DELAY_CHAIN_a_gate__20
       (.I0(\DELAY_CHAIN_a[4].shift_reg_a_reg[4][1]_valid_buf_reg_r_3_n_0 ),
        .I1(valid_buf_reg_r_3_n_0),
        .O(DELAY_CHAIN_a_gate__20_n_0));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT2 #(
    .INIT(4'h8)) 
    DELAY_CHAIN_a_gate__21
       (.I0(\DELAY_CHAIN_a[4].shift_reg_a_reg[4][0]_valid_buf_reg_r_3_n_0 ),
        .I1(valid_buf_reg_r_3_n_0),
        .O(DELAY_CHAIN_a_gate__21_n_0));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT2 #(
    .INIT(4'h8)) 
    DELAY_CHAIN_a_gate__3
       (.I0(\DELAY_CHAIN_a[4].shift_reg_a_reg[4][18]_valid_buf_reg_r_3_n_0 ),
        .I1(valid_buf_reg_r_3_n_0),
        .O(DELAY_CHAIN_a_gate__3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT2 #(
    .INIT(4'h8)) 
    DELAY_CHAIN_a_gate__4
       (.I0(\DELAY_CHAIN_a[4].shift_reg_a_reg[4][17]_valid_buf_reg_r_3_n_0 ),
        .I1(valid_buf_reg_r_3_n_0),
        .O(DELAY_CHAIN_a_gate__4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT2 #(
    .INIT(4'h8)) 
    DELAY_CHAIN_a_gate__5
       (.I0(\DELAY_CHAIN_a[4].shift_reg_a_reg[4][16]_valid_buf_reg_r_3_n_0 ),
        .I1(valid_buf_reg_r_3_n_0),
        .O(DELAY_CHAIN_a_gate__5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT2 #(
    .INIT(4'h8)) 
    DELAY_CHAIN_a_gate__6
       (.I0(\DELAY_CHAIN_a[4].shift_reg_a_reg[4][15]_valid_buf_reg_r_3_n_0 ),
        .I1(valid_buf_reg_r_3_n_0),
        .O(DELAY_CHAIN_a_gate__6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT2 #(
    .INIT(4'h8)) 
    DELAY_CHAIN_a_gate__7
       (.I0(\DELAY_CHAIN_a[4].shift_reg_a_reg[4][14]_valid_buf_reg_r_3_n_0 ),
        .I1(valid_buf_reg_r_3_n_0),
        .O(DELAY_CHAIN_a_gate__7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT2 #(
    .INIT(4'h8)) 
    DELAY_CHAIN_a_gate__8
       (.I0(\DELAY_CHAIN_a[4].shift_reg_a_reg[4][13]_valid_buf_reg_r_3_n_0 ),
        .I1(valid_buf_reg_r_3_n_0),
        .O(DELAY_CHAIN_a_gate__8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT2 #(
    .INIT(4'h8)) 
    DELAY_CHAIN_a_gate__9
       (.I0(\DELAY_CHAIN_a[4].shift_reg_a_reg[4][12]_valid_buf_reg_r_3_n_0 ),
        .I1(valid_buf_reg_r_3_n_0),
        .O(DELAY_CHAIN_a_gate__9_n_0));
  (* srl_bus_name = "\\DELAY_CHAIN_b[3].shift_reg_b_reg[3] " *) 
  (* srl_name = "\\DELAY_CHAIN_b[3].shift_reg_b_reg[3][0]_srl4___valid_buf_reg_r_2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \DELAY_CHAIN_b[3].shift_reg_b_reg[3][0]_srl4___valid_buf_reg_r_2 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D(b_IBUF[0]),
        .Q(\DELAY_CHAIN_b[3].shift_reg_b_reg[3][0]_srl4___valid_buf_reg_r_2_n_0 ));
  (* srl_bus_name = "\\DELAY_CHAIN_b[3].shift_reg_b_reg[3] " *) 
  (* srl_name = "\\DELAY_CHAIN_b[3].shift_reg_b_reg[3][10]_srl4___valid_buf_reg_r_2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \DELAY_CHAIN_b[3].shift_reg_b_reg[3][10]_srl4___valid_buf_reg_r_2 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D(b_IBUF[10]),
        .Q(\DELAY_CHAIN_b[3].shift_reg_b_reg[3][10]_srl4___valid_buf_reg_r_2_n_0 ));
  (* srl_bus_name = "\\DELAY_CHAIN_b[3].shift_reg_b_reg[3] " *) 
  (* srl_name = "\\DELAY_CHAIN_b[3].shift_reg_b_reg[3][11]_srl4___valid_buf_reg_r_2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \DELAY_CHAIN_b[3].shift_reg_b_reg[3][11]_srl4___valid_buf_reg_r_2 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D(b_IBUF[11]),
        .Q(\DELAY_CHAIN_b[3].shift_reg_b_reg[3][11]_srl4___valid_buf_reg_r_2_n_0 ));
  (* srl_bus_name = "\\DELAY_CHAIN_b[3].shift_reg_b_reg[3] " *) 
  (* srl_name = "\\DELAY_CHAIN_b[3].shift_reg_b_reg[3][12]_srl4___valid_buf_reg_r_2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \DELAY_CHAIN_b[3].shift_reg_b_reg[3][12]_srl4___valid_buf_reg_r_2 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D(b_IBUF[12]),
        .Q(\DELAY_CHAIN_b[3].shift_reg_b_reg[3][12]_srl4___valid_buf_reg_r_2_n_0 ));
  (* srl_bus_name = "\\DELAY_CHAIN_b[3].shift_reg_b_reg[3] " *) 
  (* srl_name = "\\DELAY_CHAIN_b[3].shift_reg_b_reg[3][13]_srl4___valid_buf_reg_r_2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \DELAY_CHAIN_b[3].shift_reg_b_reg[3][13]_srl4___valid_buf_reg_r_2 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D(b_IBUF[13]),
        .Q(\DELAY_CHAIN_b[3].shift_reg_b_reg[3][13]_srl4___valid_buf_reg_r_2_n_0 ));
  (* srl_bus_name = "\\DELAY_CHAIN_b[3].shift_reg_b_reg[3] " *) 
  (* srl_name = "\\DELAY_CHAIN_b[3].shift_reg_b_reg[3][14]_srl4___valid_buf_reg_r_2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \DELAY_CHAIN_b[3].shift_reg_b_reg[3][14]_srl4___valid_buf_reg_r_2 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D(b_IBUF[14]),
        .Q(\DELAY_CHAIN_b[3].shift_reg_b_reg[3][14]_srl4___valid_buf_reg_r_2_n_0 ));
  (* srl_bus_name = "\\DELAY_CHAIN_b[3].shift_reg_b_reg[3] " *) 
  (* srl_name = "\\DELAY_CHAIN_b[3].shift_reg_b_reg[3][15]_srl4___valid_buf_reg_r_2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \DELAY_CHAIN_b[3].shift_reg_b_reg[3][15]_srl4___valid_buf_reg_r_2 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D(b_IBUF[15]),
        .Q(\DELAY_CHAIN_b[3].shift_reg_b_reg[3][15]_srl4___valid_buf_reg_r_2_n_0 ));
  (* srl_bus_name = "\\DELAY_CHAIN_b[3].shift_reg_b_reg[3] " *) 
  (* srl_name = "\\DELAY_CHAIN_b[3].shift_reg_b_reg[3][16]_srl4___valid_buf_reg_r_2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \DELAY_CHAIN_b[3].shift_reg_b_reg[3][16]_srl4___valid_buf_reg_r_2 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D(b_IBUF[16]),
        .Q(\DELAY_CHAIN_b[3].shift_reg_b_reg[3][16]_srl4___valid_buf_reg_r_2_n_0 ));
  (* srl_bus_name = "\\DELAY_CHAIN_b[3].shift_reg_b_reg[3] " *) 
  (* srl_name = "\\DELAY_CHAIN_b[3].shift_reg_b_reg[3][17]_srl4___valid_buf_reg_r_2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \DELAY_CHAIN_b[3].shift_reg_b_reg[3][17]_srl4___valid_buf_reg_r_2 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D(b_IBUF[17]),
        .Q(\DELAY_CHAIN_b[3].shift_reg_b_reg[3][17]_srl4___valid_buf_reg_r_2_n_0 ));
  (* srl_bus_name = "\\DELAY_CHAIN_b[3].shift_reg_b_reg[3] " *) 
  (* srl_name = "\\DELAY_CHAIN_b[3].shift_reg_b_reg[3][18]_srl4___valid_buf_reg_r_2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \DELAY_CHAIN_b[3].shift_reg_b_reg[3][18]_srl4___valid_buf_reg_r_2 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D(b_IBUF[18]),
        .Q(\DELAY_CHAIN_b[3].shift_reg_b_reg[3][18]_srl4___valid_buf_reg_r_2_n_0 ));
  (* srl_bus_name = "\\DELAY_CHAIN_b[3].shift_reg_b_reg[3] " *) 
  (* srl_name = "\\DELAY_CHAIN_b[3].shift_reg_b_reg[3][19]_srl4___valid_buf_reg_r_2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \DELAY_CHAIN_b[3].shift_reg_b_reg[3][19]_srl4___valid_buf_reg_r_2 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D(b_IBUF[19]),
        .Q(\DELAY_CHAIN_b[3].shift_reg_b_reg[3][19]_srl4___valid_buf_reg_r_2_n_0 ));
  (* srl_bus_name = "\\DELAY_CHAIN_b[3].shift_reg_b_reg[3] " *) 
  (* srl_name = "\\DELAY_CHAIN_b[3].shift_reg_b_reg[3][1]_srl4___valid_buf_reg_r_2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \DELAY_CHAIN_b[3].shift_reg_b_reg[3][1]_srl4___valid_buf_reg_r_2 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D(b_IBUF[1]),
        .Q(\DELAY_CHAIN_b[3].shift_reg_b_reg[3][1]_srl4___valid_buf_reg_r_2_n_0 ));
  (* srl_bus_name = "\\DELAY_CHAIN_b[3].shift_reg_b_reg[3] " *) 
  (* srl_name = "\\DELAY_CHAIN_b[3].shift_reg_b_reg[3][20]_srl4___valid_buf_reg_r_2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \DELAY_CHAIN_b[3].shift_reg_b_reg[3][20]_srl4___valid_buf_reg_r_2 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D(b_IBUF[20]),
        .Q(\DELAY_CHAIN_b[3].shift_reg_b_reg[3][20]_srl4___valid_buf_reg_r_2_n_0 ));
  (* srl_bus_name = "\\DELAY_CHAIN_b[3].shift_reg_b_reg[3] " *) 
  (* srl_name = "\\DELAY_CHAIN_b[3].shift_reg_b_reg[3][21]_srl4___valid_buf_reg_r_2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \DELAY_CHAIN_b[3].shift_reg_b_reg[3][21]_srl4___valid_buf_reg_r_2 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D(b_IBUF[21]),
        .Q(\DELAY_CHAIN_b[3].shift_reg_b_reg[3][21]_srl4___valid_buf_reg_r_2_n_0 ));
  (* srl_bus_name = "\\DELAY_CHAIN_b[3].shift_reg_b_reg[3] " *) 
  (* srl_name = "\\DELAY_CHAIN_b[3].shift_reg_b_reg[3][22]_srl4___valid_buf_reg_r_2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \DELAY_CHAIN_b[3].shift_reg_b_reg[3][22]_srl4___valid_buf_reg_r_2 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D(b_IBUF[22]),
        .Q(\DELAY_CHAIN_b[3].shift_reg_b_reg[3][22]_srl4___valid_buf_reg_r_2_n_0 ));
  (* srl_bus_name = "\\DELAY_CHAIN_b[3].shift_reg_b_reg[3] " *) 
  (* srl_name = "\\DELAY_CHAIN_b[3].shift_reg_b_reg[3][2]_srl4___valid_buf_reg_r_2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \DELAY_CHAIN_b[3].shift_reg_b_reg[3][2]_srl4___valid_buf_reg_r_2 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D(b_IBUF[2]),
        .Q(\DELAY_CHAIN_b[3].shift_reg_b_reg[3][2]_srl4___valid_buf_reg_r_2_n_0 ));
  (* srl_bus_name = "\\DELAY_CHAIN_b[3].shift_reg_b_reg[3] " *) 
  (* srl_name = "\\DELAY_CHAIN_b[3].shift_reg_b_reg[3][3]_srl4___valid_buf_reg_r_2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \DELAY_CHAIN_b[3].shift_reg_b_reg[3][3]_srl4___valid_buf_reg_r_2 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D(b_IBUF[3]),
        .Q(\DELAY_CHAIN_b[3].shift_reg_b_reg[3][3]_srl4___valid_buf_reg_r_2_n_0 ));
  (* srl_bus_name = "\\DELAY_CHAIN_b[3].shift_reg_b_reg[3] " *) 
  (* srl_name = "\\DELAY_CHAIN_b[3].shift_reg_b_reg[3][4]_srl4___valid_buf_reg_r_2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \DELAY_CHAIN_b[3].shift_reg_b_reg[3][4]_srl4___valid_buf_reg_r_2 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D(b_IBUF[4]),
        .Q(\DELAY_CHAIN_b[3].shift_reg_b_reg[3][4]_srl4___valid_buf_reg_r_2_n_0 ));
  (* srl_bus_name = "\\DELAY_CHAIN_b[3].shift_reg_b_reg[3] " *) 
  (* srl_name = "\\DELAY_CHAIN_b[3].shift_reg_b_reg[3][5]_srl4___valid_buf_reg_r_2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \DELAY_CHAIN_b[3].shift_reg_b_reg[3][5]_srl4___valid_buf_reg_r_2 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D(b_IBUF[5]),
        .Q(\DELAY_CHAIN_b[3].shift_reg_b_reg[3][5]_srl4___valid_buf_reg_r_2_n_0 ));
  (* srl_bus_name = "\\DELAY_CHAIN_b[3].shift_reg_b_reg[3] " *) 
  (* srl_name = "\\DELAY_CHAIN_b[3].shift_reg_b_reg[3][6]_srl4___valid_buf_reg_r_2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \DELAY_CHAIN_b[3].shift_reg_b_reg[3][6]_srl4___valid_buf_reg_r_2 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D(b_IBUF[6]),
        .Q(\DELAY_CHAIN_b[3].shift_reg_b_reg[3][6]_srl4___valid_buf_reg_r_2_n_0 ));
  (* srl_bus_name = "\\DELAY_CHAIN_b[3].shift_reg_b_reg[3] " *) 
  (* srl_name = "\\DELAY_CHAIN_b[3].shift_reg_b_reg[3][7]_srl4___valid_buf_reg_r_2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \DELAY_CHAIN_b[3].shift_reg_b_reg[3][7]_srl4___valid_buf_reg_r_2 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D(b_IBUF[7]),
        .Q(\DELAY_CHAIN_b[3].shift_reg_b_reg[3][7]_srl4___valid_buf_reg_r_2_n_0 ));
  (* srl_bus_name = "\\DELAY_CHAIN_b[3].shift_reg_b_reg[3] " *) 
  (* srl_name = "\\DELAY_CHAIN_b[3].shift_reg_b_reg[3][8]_srl4___valid_buf_reg_r_2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \DELAY_CHAIN_b[3].shift_reg_b_reg[3][8]_srl4___valid_buf_reg_r_2 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D(b_IBUF[8]),
        .Q(\DELAY_CHAIN_b[3].shift_reg_b_reg[3][8]_srl4___valid_buf_reg_r_2_n_0 ));
  (* srl_bus_name = "\\DELAY_CHAIN_b[3].shift_reg_b_reg[3] " *) 
  (* srl_name = "\\DELAY_CHAIN_b[3].shift_reg_b_reg[3][9]_srl4___valid_buf_reg_r_2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \DELAY_CHAIN_b[3].shift_reg_b_reg[3][9]_srl4___valid_buf_reg_r_2 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D(b_IBUF[9]),
        .Q(\DELAY_CHAIN_b[3].shift_reg_b_reg[3][9]_srl4___valid_buf_reg_r_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_b[4].shift_reg_b_reg[4][0]_valid_buf_reg_r_3 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\DELAY_CHAIN_b[3].shift_reg_b_reg[3][0]_srl4___valid_buf_reg_r_2_n_0 ),
        .Q(\DELAY_CHAIN_b[4].shift_reg_b_reg[4][0]_valid_buf_reg_r_3_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_b[4].shift_reg_b_reg[4][10]_valid_buf_reg_r_3 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\DELAY_CHAIN_b[3].shift_reg_b_reg[3][10]_srl4___valid_buf_reg_r_2_n_0 ),
        .Q(\DELAY_CHAIN_b[4].shift_reg_b_reg[4][10]_valid_buf_reg_r_3_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_b[4].shift_reg_b_reg[4][11]_valid_buf_reg_r_3 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\DELAY_CHAIN_b[3].shift_reg_b_reg[3][11]_srl4___valid_buf_reg_r_2_n_0 ),
        .Q(\DELAY_CHAIN_b[4].shift_reg_b_reg[4][11]_valid_buf_reg_r_3_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_b[4].shift_reg_b_reg[4][12]_valid_buf_reg_r_3 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\DELAY_CHAIN_b[3].shift_reg_b_reg[3][12]_srl4___valid_buf_reg_r_2_n_0 ),
        .Q(\DELAY_CHAIN_b[4].shift_reg_b_reg[4][12]_valid_buf_reg_r_3_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_b[4].shift_reg_b_reg[4][13]_valid_buf_reg_r_3 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\DELAY_CHAIN_b[3].shift_reg_b_reg[3][13]_srl4___valid_buf_reg_r_2_n_0 ),
        .Q(\DELAY_CHAIN_b[4].shift_reg_b_reg[4][13]_valid_buf_reg_r_3_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_b[4].shift_reg_b_reg[4][14]_valid_buf_reg_r_3 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\DELAY_CHAIN_b[3].shift_reg_b_reg[3][14]_srl4___valid_buf_reg_r_2_n_0 ),
        .Q(\DELAY_CHAIN_b[4].shift_reg_b_reg[4][14]_valid_buf_reg_r_3_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_b[4].shift_reg_b_reg[4][15]_valid_buf_reg_r_3 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\DELAY_CHAIN_b[3].shift_reg_b_reg[3][15]_srl4___valid_buf_reg_r_2_n_0 ),
        .Q(\DELAY_CHAIN_b[4].shift_reg_b_reg[4][15]_valid_buf_reg_r_3_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_b[4].shift_reg_b_reg[4][16]_valid_buf_reg_r_3 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\DELAY_CHAIN_b[3].shift_reg_b_reg[3][16]_srl4___valid_buf_reg_r_2_n_0 ),
        .Q(\DELAY_CHAIN_b[4].shift_reg_b_reg[4][16]_valid_buf_reg_r_3_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_b[4].shift_reg_b_reg[4][17]_valid_buf_reg_r_3 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\DELAY_CHAIN_b[3].shift_reg_b_reg[3][17]_srl4___valid_buf_reg_r_2_n_0 ),
        .Q(\DELAY_CHAIN_b[4].shift_reg_b_reg[4][17]_valid_buf_reg_r_3_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_b[4].shift_reg_b_reg[4][18]_valid_buf_reg_r_3 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\DELAY_CHAIN_b[3].shift_reg_b_reg[3][18]_srl4___valid_buf_reg_r_2_n_0 ),
        .Q(\DELAY_CHAIN_b[4].shift_reg_b_reg[4][18]_valid_buf_reg_r_3_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_b[4].shift_reg_b_reg[4][19]_valid_buf_reg_r_3 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\DELAY_CHAIN_b[3].shift_reg_b_reg[3][19]_srl4___valid_buf_reg_r_2_n_0 ),
        .Q(\DELAY_CHAIN_b[4].shift_reg_b_reg[4][19]_valid_buf_reg_r_3_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_b[4].shift_reg_b_reg[4][1]_valid_buf_reg_r_3 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\DELAY_CHAIN_b[3].shift_reg_b_reg[3][1]_srl4___valid_buf_reg_r_2_n_0 ),
        .Q(\DELAY_CHAIN_b[4].shift_reg_b_reg[4][1]_valid_buf_reg_r_3_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_b[4].shift_reg_b_reg[4][20]_valid_buf_reg_r_3 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\DELAY_CHAIN_b[3].shift_reg_b_reg[3][20]_srl4___valid_buf_reg_r_2_n_0 ),
        .Q(\DELAY_CHAIN_b[4].shift_reg_b_reg[4][20]_valid_buf_reg_r_3_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_b[4].shift_reg_b_reg[4][21]_valid_buf_reg_r_3 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\DELAY_CHAIN_b[3].shift_reg_b_reg[3][21]_srl4___valid_buf_reg_r_2_n_0 ),
        .Q(\DELAY_CHAIN_b[4].shift_reg_b_reg[4][21]_valid_buf_reg_r_3_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_b[4].shift_reg_b_reg[4][22]_valid_buf_reg_r_3 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\DELAY_CHAIN_b[3].shift_reg_b_reg[3][22]_srl4___valid_buf_reg_r_2_n_0 ),
        .Q(\DELAY_CHAIN_b[4].shift_reg_b_reg[4][22]_valid_buf_reg_r_3_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_b[4].shift_reg_b_reg[4][2]_valid_buf_reg_r_3 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\DELAY_CHAIN_b[3].shift_reg_b_reg[3][2]_srl4___valid_buf_reg_r_2_n_0 ),
        .Q(\DELAY_CHAIN_b[4].shift_reg_b_reg[4][2]_valid_buf_reg_r_3_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_b[4].shift_reg_b_reg[4][3]_valid_buf_reg_r_3 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\DELAY_CHAIN_b[3].shift_reg_b_reg[3][3]_srl4___valid_buf_reg_r_2_n_0 ),
        .Q(\DELAY_CHAIN_b[4].shift_reg_b_reg[4][3]_valid_buf_reg_r_3_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_b[4].shift_reg_b_reg[4][4]_valid_buf_reg_r_3 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\DELAY_CHAIN_b[3].shift_reg_b_reg[3][4]_srl4___valid_buf_reg_r_2_n_0 ),
        .Q(\DELAY_CHAIN_b[4].shift_reg_b_reg[4][4]_valid_buf_reg_r_3_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_b[4].shift_reg_b_reg[4][5]_valid_buf_reg_r_3 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\DELAY_CHAIN_b[3].shift_reg_b_reg[3][5]_srl4___valid_buf_reg_r_2_n_0 ),
        .Q(\DELAY_CHAIN_b[4].shift_reg_b_reg[4][5]_valid_buf_reg_r_3_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_b[4].shift_reg_b_reg[4][6]_valid_buf_reg_r_3 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\DELAY_CHAIN_b[3].shift_reg_b_reg[3][6]_srl4___valid_buf_reg_r_2_n_0 ),
        .Q(\DELAY_CHAIN_b[4].shift_reg_b_reg[4][6]_valid_buf_reg_r_3_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_b[4].shift_reg_b_reg[4][7]_valid_buf_reg_r_3 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\DELAY_CHAIN_b[3].shift_reg_b_reg[3][7]_srl4___valid_buf_reg_r_2_n_0 ),
        .Q(\DELAY_CHAIN_b[4].shift_reg_b_reg[4][7]_valid_buf_reg_r_3_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_b[4].shift_reg_b_reg[4][8]_valid_buf_reg_r_3 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\DELAY_CHAIN_b[3].shift_reg_b_reg[3][8]_srl4___valid_buf_reg_r_2_n_0 ),
        .Q(\DELAY_CHAIN_b[4].shift_reg_b_reg[4][8]_valid_buf_reg_r_3_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_b[4].shift_reg_b_reg[4][9]_valid_buf_reg_r_3 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\DELAY_CHAIN_b[3].shift_reg_b_reg[3][9]_srl4___valid_buf_reg_r_2_n_0 ),
        .Q(\DELAY_CHAIN_b[4].shift_reg_b_reg[4][9]_valid_buf_reg_r_3_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_b[5].shift_reg_b_reg[5][0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(DELAY_CHAIN_b_gate__21_n_0),
        .Q(\DELAY_CHAIN_b[5].shift_reg_b_reg[5] [0]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_b[5].shift_reg_b_reg[5][10] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(DELAY_CHAIN_b_gate__11_n_0),
        .Q(\DELAY_CHAIN_b[5].shift_reg_b_reg[5] [10]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_b[5].shift_reg_b_reg[5][11] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(DELAY_CHAIN_b_gate__10_n_0),
        .Q(\DELAY_CHAIN_b[5].shift_reg_b_reg[5] [11]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_b[5].shift_reg_b_reg[5][12] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(DELAY_CHAIN_b_gate__9_n_0),
        .Q(\DELAY_CHAIN_b[5].shift_reg_b_reg[5] [12]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_b[5].shift_reg_b_reg[5][13] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(DELAY_CHAIN_b_gate__8_n_0),
        .Q(\DELAY_CHAIN_b[5].shift_reg_b_reg[5] [13]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_b[5].shift_reg_b_reg[5][14] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(DELAY_CHAIN_b_gate__7_n_0),
        .Q(\DELAY_CHAIN_b[5].shift_reg_b_reg[5] [14]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_b[5].shift_reg_b_reg[5][15] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(DELAY_CHAIN_b_gate__6_n_0),
        .Q(\DELAY_CHAIN_b[5].shift_reg_b_reg[5] [15]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_b[5].shift_reg_b_reg[5][16] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(DELAY_CHAIN_b_gate__5_n_0),
        .Q(\DELAY_CHAIN_b[5].shift_reg_b_reg[5] [16]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_b[5].shift_reg_b_reg[5][17] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(DELAY_CHAIN_b_gate__4_n_0),
        .Q(\DELAY_CHAIN_b[5].shift_reg_b_reg[5] [17]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_b[5].shift_reg_b_reg[5][18] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(DELAY_CHAIN_b_gate__3_n_0),
        .Q(\DELAY_CHAIN_b[5].shift_reg_b_reg[5] [18]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_b[5].shift_reg_b_reg[5][19] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(DELAY_CHAIN_b_gate__2_n_0),
        .Q(\DELAY_CHAIN_b[5].shift_reg_b_reg[5] [19]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_b[5].shift_reg_b_reg[5][1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(DELAY_CHAIN_b_gate__20_n_0),
        .Q(\DELAY_CHAIN_b[5].shift_reg_b_reg[5] [1]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_b[5].shift_reg_b_reg[5][20] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(DELAY_CHAIN_b_gate__1_n_0),
        .Q(\DELAY_CHAIN_b[5].shift_reg_b_reg[5] [20]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_b[5].shift_reg_b_reg[5][21] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(DELAY_CHAIN_b_gate__0_n_0),
        .Q(\DELAY_CHAIN_b[5].shift_reg_b_reg[5] [21]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_b[5].shift_reg_b_reg[5][22] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(DELAY_CHAIN_b_gate_n_0),
        .Q(\DELAY_CHAIN_b[5].shift_reg_b_reg[5] [22]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_b[5].shift_reg_b_reg[5][2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(DELAY_CHAIN_b_gate__19_n_0),
        .Q(\DELAY_CHAIN_b[5].shift_reg_b_reg[5] [2]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_b[5].shift_reg_b_reg[5][3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(DELAY_CHAIN_b_gate__18_n_0),
        .Q(\DELAY_CHAIN_b[5].shift_reg_b_reg[5] [3]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_b[5].shift_reg_b_reg[5][4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(DELAY_CHAIN_b_gate__17_n_0),
        .Q(\DELAY_CHAIN_b[5].shift_reg_b_reg[5] [4]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_b[5].shift_reg_b_reg[5][5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(DELAY_CHAIN_b_gate__16_n_0),
        .Q(\DELAY_CHAIN_b[5].shift_reg_b_reg[5] [5]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_b[5].shift_reg_b_reg[5][6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(DELAY_CHAIN_b_gate__15_n_0),
        .Q(\DELAY_CHAIN_b[5].shift_reg_b_reg[5] [6]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_b[5].shift_reg_b_reg[5][7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(DELAY_CHAIN_b_gate__14_n_0),
        .Q(\DELAY_CHAIN_b[5].shift_reg_b_reg[5] [7]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_b[5].shift_reg_b_reg[5][8] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(DELAY_CHAIN_b_gate__13_n_0),
        .Q(\DELAY_CHAIN_b[5].shift_reg_b_reg[5] [8]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \DELAY_CHAIN_b[5].shift_reg_b_reg[5][9] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(DELAY_CHAIN_b_gate__12_n_0),
        .Q(\DELAY_CHAIN_b[5].shift_reg_b_reg[5] [9]),
        .R(reset_IBUF));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT2 #(
    .INIT(4'h8)) 
    DELAY_CHAIN_b_gate
       (.I0(\DELAY_CHAIN_b[4].shift_reg_b_reg[4][22]_valid_buf_reg_r_3_n_0 ),
        .I1(valid_buf_reg_r_3_n_0),
        .O(DELAY_CHAIN_b_gate_n_0));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT2 #(
    .INIT(4'h8)) 
    DELAY_CHAIN_b_gate__0
       (.I0(\DELAY_CHAIN_b[4].shift_reg_b_reg[4][21]_valid_buf_reg_r_3_n_0 ),
        .I1(valid_buf_reg_r_3_n_0),
        .O(DELAY_CHAIN_b_gate__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT2 #(
    .INIT(4'h8)) 
    DELAY_CHAIN_b_gate__1
       (.I0(\DELAY_CHAIN_b[4].shift_reg_b_reg[4][20]_valid_buf_reg_r_3_n_0 ),
        .I1(valid_buf_reg_r_3_n_0),
        .O(DELAY_CHAIN_b_gate__1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT2 #(
    .INIT(4'h8)) 
    DELAY_CHAIN_b_gate__10
       (.I0(\DELAY_CHAIN_b[4].shift_reg_b_reg[4][11]_valid_buf_reg_r_3_n_0 ),
        .I1(valid_buf_reg_r_3_n_0),
        .O(DELAY_CHAIN_b_gate__10_n_0));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT2 #(
    .INIT(4'h8)) 
    DELAY_CHAIN_b_gate__11
       (.I0(\DELAY_CHAIN_b[4].shift_reg_b_reg[4][10]_valid_buf_reg_r_3_n_0 ),
        .I1(valid_buf_reg_r_3_n_0),
        .O(DELAY_CHAIN_b_gate__11_n_0));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT2 #(
    .INIT(4'h8)) 
    DELAY_CHAIN_b_gate__12
       (.I0(\DELAY_CHAIN_b[4].shift_reg_b_reg[4][9]_valid_buf_reg_r_3_n_0 ),
        .I1(valid_buf_reg_r_3_n_0),
        .O(DELAY_CHAIN_b_gate__12_n_0));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT2 #(
    .INIT(4'h8)) 
    DELAY_CHAIN_b_gate__13
       (.I0(\DELAY_CHAIN_b[4].shift_reg_b_reg[4][8]_valid_buf_reg_r_3_n_0 ),
        .I1(valid_buf_reg_r_3_n_0),
        .O(DELAY_CHAIN_b_gate__13_n_0));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT2 #(
    .INIT(4'h8)) 
    DELAY_CHAIN_b_gate__14
       (.I0(\DELAY_CHAIN_b[4].shift_reg_b_reg[4][7]_valid_buf_reg_r_3_n_0 ),
        .I1(valid_buf_reg_r_3_n_0),
        .O(DELAY_CHAIN_b_gate__14_n_0));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT2 #(
    .INIT(4'h8)) 
    DELAY_CHAIN_b_gate__15
       (.I0(\DELAY_CHAIN_b[4].shift_reg_b_reg[4][6]_valid_buf_reg_r_3_n_0 ),
        .I1(valid_buf_reg_r_3_n_0),
        .O(DELAY_CHAIN_b_gate__15_n_0));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT2 #(
    .INIT(4'h8)) 
    DELAY_CHAIN_b_gate__16
       (.I0(\DELAY_CHAIN_b[4].shift_reg_b_reg[4][5]_valid_buf_reg_r_3_n_0 ),
        .I1(valid_buf_reg_r_3_n_0),
        .O(DELAY_CHAIN_b_gate__16_n_0));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT2 #(
    .INIT(4'h8)) 
    DELAY_CHAIN_b_gate__17
       (.I0(\DELAY_CHAIN_b[4].shift_reg_b_reg[4][4]_valid_buf_reg_r_3_n_0 ),
        .I1(valid_buf_reg_r_3_n_0),
        .O(DELAY_CHAIN_b_gate__17_n_0));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT2 #(
    .INIT(4'h8)) 
    DELAY_CHAIN_b_gate__18
       (.I0(\DELAY_CHAIN_b[4].shift_reg_b_reg[4][3]_valid_buf_reg_r_3_n_0 ),
        .I1(valid_buf_reg_r_3_n_0),
        .O(DELAY_CHAIN_b_gate__18_n_0));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT2 #(
    .INIT(4'h8)) 
    DELAY_CHAIN_b_gate__19
       (.I0(\DELAY_CHAIN_b[4].shift_reg_b_reg[4][2]_valid_buf_reg_r_3_n_0 ),
        .I1(valid_buf_reg_r_3_n_0),
        .O(DELAY_CHAIN_b_gate__19_n_0));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT2 #(
    .INIT(4'h8)) 
    DELAY_CHAIN_b_gate__2
       (.I0(\DELAY_CHAIN_b[4].shift_reg_b_reg[4][19]_valid_buf_reg_r_3_n_0 ),
        .I1(valid_buf_reg_r_3_n_0),
        .O(DELAY_CHAIN_b_gate__2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT2 #(
    .INIT(4'h8)) 
    DELAY_CHAIN_b_gate__20
       (.I0(\DELAY_CHAIN_b[4].shift_reg_b_reg[4][1]_valid_buf_reg_r_3_n_0 ),
        .I1(valid_buf_reg_r_3_n_0),
        .O(DELAY_CHAIN_b_gate__20_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    DELAY_CHAIN_b_gate__21
       (.I0(\DELAY_CHAIN_b[4].shift_reg_b_reg[4][0]_valid_buf_reg_r_3_n_0 ),
        .I1(valid_buf_reg_r_3_n_0),
        .O(DELAY_CHAIN_b_gate__21_n_0));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT2 #(
    .INIT(4'h8)) 
    DELAY_CHAIN_b_gate__3
       (.I0(\DELAY_CHAIN_b[4].shift_reg_b_reg[4][18]_valid_buf_reg_r_3_n_0 ),
        .I1(valid_buf_reg_r_3_n_0),
        .O(DELAY_CHAIN_b_gate__3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT2 #(
    .INIT(4'h8)) 
    DELAY_CHAIN_b_gate__4
       (.I0(\DELAY_CHAIN_b[4].shift_reg_b_reg[4][17]_valid_buf_reg_r_3_n_0 ),
        .I1(valid_buf_reg_r_3_n_0),
        .O(DELAY_CHAIN_b_gate__4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT2 #(
    .INIT(4'h8)) 
    DELAY_CHAIN_b_gate__5
       (.I0(\DELAY_CHAIN_b[4].shift_reg_b_reg[4][16]_valid_buf_reg_r_3_n_0 ),
        .I1(valid_buf_reg_r_3_n_0),
        .O(DELAY_CHAIN_b_gate__5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT2 #(
    .INIT(4'h8)) 
    DELAY_CHAIN_b_gate__6
       (.I0(\DELAY_CHAIN_b[4].shift_reg_b_reg[4][15]_valid_buf_reg_r_3_n_0 ),
        .I1(valid_buf_reg_r_3_n_0),
        .O(DELAY_CHAIN_b_gate__6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT2 #(
    .INIT(4'h8)) 
    DELAY_CHAIN_b_gate__7
       (.I0(\DELAY_CHAIN_b[4].shift_reg_b_reg[4][14]_valid_buf_reg_r_3_n_0 ),
        .I1(valid_buf_reg_r_3_n_0),
        .O(DELAY_CHAIN_b_gate__7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT2 #(
    .INIT(4'h8)) 
    DELAY_CHAIN_b_gate__8
       (.I0(\DELAY_CHAIN_b[4].shift_reg_b_reg[4][13]_valid_buf_reg_r_3_n_0 ),
        .I1(valid_buf_reg_r_3_n_0),
        .O(DELAY_CHAIN_b_gate__8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT2 #(
    .INIT(4'h8)) 
    DELAY_CHAIN_b_gate__9
       (.I0(\DELAY_CHAIN_b[4].shift_reg_b_reg[4][12]_valid_buf_reg_r_3_n_0 ),
        .I1(valid_buf_reg_r_3_n_0),
        .O(DELAY_CHAIN_b_gate__9_n_0));
  IBUF \a_IBUF[0]_inst 
       (.I(a[0]),
        .O(a_IBUF[0]));
  IBUF \a_IBUF[10]_inst 
       (.I(a[10]),
        .O(a_IBUF[10]));
  IBUF \a_IBUF[11]_inst 
       (.I(a[11]),
        .O(a_IBUF[11]));
  IBUF \a_IBUF[12]_inst 
       (.I(a[12]),
        .O(a_IBUF[12]));
  IBUF \a_IBUF[13]_inst 
       (.I(a[13]),
        .O(a_IBUF[13]));
  IBUF \a_IBUF[14]_inst 
       (.I(a[14]),
        .O(a_IBUF[14]));
  IBUF \a_IBUF[15]_inst 
       (.I(a[15]),
        .O(a_IBUF[15]));
  IBUF \a_IBUF[16]_inst 
       (.I(a[16]),
        .O(a_IBUF[16]));
  IBUF \a_IBUF[17]_inst 
       (.I(a[17]),
        .O(a_IBUF[17]));
  IBUF \a_IBUF[18]_inst 
       (.I(a[18]),
        .O(a_IBUF[18]));
  IBUF \a_IBUF[19]_inst 
       (.I(a[19]),
        .O(a_IBUF[19]));
  IBUF \a_IBUF[1]_inst 
       (.I(a[1]),
        .O(a_IBUF[1]));
  IBUF \a_IBUF[20]_inst 
       (.I(a[20]),
        .O(a_IBUF[20]));
  IBUF \a_IBUF[21]_inst 
       (.I(a[21]),
        .O(a_IBUF[21]));
  IBUF \a_IBUF[22]_inst 
       (.I(a[22]),
        .O(a_IBUF[22]));
  IBUF \a_IBUF[2]_inst 
       (.I(a[2]),
        .O(a_IBUF[2]));
  IBUF \a_IBUF[3]_inst 
       (.I(a[3]),
        .O(a_IBUF[3]));
  IBUF \a_IBUF[4]_inst 
       (.I(a[4]),
        .O(a_IBUF[4]));
  IBUF \a_IBUF[5]_inst 
       (.I(a[5]),
        .O(a_IBUF[5]));
  IBUF \a_IBUF[6]_inst 
       (.I(a[6]),
        .O(a_IBUF[6]));
  IBUF \a_IBUF[7]_inst 
       (.I(a[7]),
        .O(a_IBUF[7]));
  IBUF \a_IBUF[8]_inst 
       (.I(a[8]),
        .O(a_IBUF[8]));
  IBUF \a_IBUF[9]_inst 
       (.I(a[9]),
        .O(a_IBUF[9]));
  IBUF \b_IBUF[0]_inst 
       (.I(b[0]),
        .O(b_IBUF[0]));
  IBUF \b_IBUF[10]_inst 
       (.I(b[10]),
        .O(b_IBUF[10]));
  IBUF \b_IBUF[11]_inst 
       (.I(b[11]),
        .O(b_IBUF[11]));
  IBUF \b_IBUF[12]_inst 
       (.I(b[12]),
        .O(b_IBUF[12]));
  IBUF \b_IBUF[13]_inst 
       (.I(b[13]),
        .O(b_IBUF[13]));
  IBUF \b_IBUF[14]_inst 
       (.I(b[14]),
        .O(b_IBUF[14]));
  IBUF \b_IBUF[15]_inst 
       (.I(b[15]),
        .O(b_IBUF[15]));
  IBUF \b_IBUF[16]_inst 
       (.I(b[16]),
        .O(b_IBUF[16]));
  IBUF \b_IBUF[17]_inst 
       (.I(b[17]),
        .O(b_IBUF[17]));
  IBUF \b_IBUF[18]_inst 
       (.I(b[18]),
        .O(b_IBUF[18]));
  IBUF \b_IBUF[19]_inst 
       (.I(b[19]),
        .O(b_IBUF[19]));
  IBUF \b_IBUF[1]_inst 
       (.I(b[1]),
        .O(b_IBUF[1]));
  IBUF \b_IBUF[20]_inst 
       (.I(b[20]),
        .O(b_IBUF[20]));
  IBUF \b_IBUF[21]_inst 
       (.I(b[21]),
        .O(b_IBUF[21]));
  IBUF \b_IBUF[22]_inst 
       (.I(b[22]),
        .O(b_IBUF[22]));
  IBUF \b_IBUF[2]_inst 
       (.I(b[2]),
        .O(b_IBUF[2]));
  IBUF \b_IBUF[3]_inst 
       (.I(b[3]),
        .O(b_IBUF[3]));
  IBUF \b_IBUF[4]_inst 
       (.I(b[4]),
        .O(b_IBUF[4]));
  IBUF \b_IBUF[5]_inst 
       (.I(b[5]),
        .O(b_IBUF[5]));
  IBUF \b_IBUF[6]_inst 
       (.I(b[6]),
        .O(b_IBUF[6]));
  IBUF \b_IBUF[7]_inst 
       (.I(b[7]),
        .O(b_IBUF[7]));
  IBUF \b_IBUF[8]_inst 
       (.I(b[8]),
        .O(b_IBUF[8]));
  IBUF \b_IBUF[9]_inst 
       (.I(b[9]),
        .O(b_IBUF[9]));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  IBUF i_valid_IBUF_inst
       (.I(i_valid),
        .O(i_valid_IBUF));
  mod_add ma
       (.\DELAY_CHAIN_a[5].shift_reg_a_reg[5] (\DELAY_CHAIN_a[5].shift_reg_a_reg[5] ),
        .\DELAY_CHAIN_a[5].shift_reg_a_reg[5][11] ({ma_n_31,ma_n_32,ma_n_33,ma_n_34}),
        .\DELAY_CHAIN_a[5].shift_reg_a_reg[5][15] ({ma_n_35,ma_n_36,ma_n_37,ma_n_38}),
        .\DELAY_CHAIN_a[5].shift_reg_a_reg[5][19] ({ma_n_39,ma_n_40,ma_n_41,ma_n_42}),
        .\DELAY_CHAIN_a[5].shift_reg_a_reg[5][22] ({ma_n_43,ma_n_44,ma_n_45}),
        .\DELAY_CHAIN_a[5].shift_reg_a_reg[5][3] ({ma_n_23,ma_n_24,ma_n_25,ma_n_26}),
        .\DELAY_CHAIN_a[5].shift_reg_a_reg[5][7] ({ma_n_27,ma_n_28,ma_n_29,ma_n_30}),
        .\DELAY_CHAIN_b[5].shift_reg_b_reg[5] (\DELAY_CHAIN_b[5].shift_reg_b_reg[5] ),
        .O({mm_n_95,mm_n_96,mm_n_97,mm_n_98}),
        .Q(out),
        .S({mm_n_91,mm_n_92,mm_n_93,mm_n_94}),
        .a_plus_b_minus_q(a_plus_b_minus_q),
        .mode_IBUF(mode_IBUF),
        .\out_a_OBUF[13]_inst_i_1 ({mm_n_75,mm_n_76,mm_n_77,mm_n_78}),
        .\out_a_OBUF[17]_inst_i_1 ({mm_n_149,mm_n_150,mm_n_151,mm_n_152}),
        .\out_a_OBUF[21]_inst_i_1 ({mm_n_145,mm_n_146,mm_n_147,mm_n_148}),
        .\out_a_OBUF[5]_inst_i_1 ({mm_n_87,mm_n_88,mm_n_89,mm_n_90}),
        .\out_a_OBUF[5]_inst_i_1_0 ({mm_n_83,mm_n_84,mm_n_85,mm_n_86}),
        .\out_a_OBUF[9]_inst_i_1 ({mm_n_79,mm_n_80,mm_n_81,mm_n_82}),
        .\out_a_OBUF[9]_inst_i_1_0 ({mm_n_71,mm_n_72,mm_n_73,mm_n_74}));
  mod_mul mm
       (.A({ms_n_25,ms_n_26,ms_n_27,ms_n_28,ms_n_29,ms_n_30,ms_n_31,ms_n_32,ms_n_33,ms_n_34,ms_n_35,ms_n_36,ms_n_37,ms_n_38,ms_n_39,ms_n_40,ms_n_41,ms_n_42,ms_n_43,ms_n_44}),
        .CO(out1),
        .\DELAY_CHAIN_a[5].shift_reg_a_reg[5] (\DELAY_CHAIN_a[5].shift_reg_a_reg[5] ),
        .\DELAY_CHAIN_a[5].shift_reg_a_reg[5][10] ({mm_n_46,mm_n_47,mm_n_48,mm_n_49}),
        .\DELAY_CHAIN_a[5].shift_reg_a_reg[5][11] ({mm_n_79,mm_n_80,mm_n_81,mm_n_82}),
        .\DELAY_CHAIN_a[5].shift_reg_a_reg[5][11]_0 ({mm_n_83,mm_n_84,mm_n_85,mm_n_86}),
        .\DELAY_CHAIN_a[5].shift_reg_a_reg[5][11]_1 ({mm_n_165,mm_n_166,mm_n_167,mm_n_168}),
        .\DELAY_CHAIN_a[5].shift_reg_a_reg[5][15] ({mm_n_71,mm_n_72,mm_n_73,mm_n_74}),
        .\DELAY_CHAIN_a[5].shift_reg_a_reg[5][15]_0 ({mm_n_75,mm_n_76,mm_n_77,mm_n_78}),
        .\DELAY_CHAIN_a[5].shift_reg_a_reg[5][19] ({mm_n_149,mm_n_150,mm_n_151,mm_n_152}),
        .\DELAY_CHAIN_a[5].shift_reg_a_reg[5][22] ({mm_n_54,mm_n_55,mm_n_56,mm_n_57}),
        .\DELAY_CHAIN_a[5].shift_reg_a_reg[5][22]_0 ({mm_n_145,mm_n_146,mm_n_147,mm_n_148}),
        .\DELAY_CHAIN_a[5].shift_reg_a_reg[5][2] ({mm_n_8,mm_n_9,mm_n_10}),
        .\DELAY_CHAIN_a[5].shift_reg_a_reg[5][3] ({mm_n_153,mm_n_154,mm_n_155,mm_n_156}),
        .\DELAY_CHAIN_a[5].shift_reg_a_reg[5][6] ({mm_n_34,mm_n_35,mm_n_36,mm_n_37}),
        .\DELAY_CHAIN_a[5].shift_reg_a_reg[5][7] ({mm_n_87,mm_n_88,mm_n_89,mm_n_90}),
        .\DELAY_CHAIN_a[5].shift_reg_a_reg[5][7]_0 ({mm_n_91,mm_n_92,mm_n_93,mm_n_94}),
        .\DELAY_CHAIN_a[5].shift_reg_a_reg[5][7]_1 ({mm_n_161,mm_n_162,mm_n_163,mm_n_164}),
        .DI({mm_n_4,mm_n_5,mm_n_6,mm_n_7}),
        .O({mm_n_95,mm_n_96,mm_n_97,mm_n_98}),
        .Q(out),
        .S({mm_n_0,mm_n_1,mm_n_2,mm_n_3}),
        .\_inferred__1/i___1_carry (ms_n_45),
        .\_inferred__1/i___1_carry_0 (ms_n_24),
        .\_inferred__1/i___1_carry__3 (ms_n_46),
        .\_inferred__1/i___1_carry__3_0 (ms_n_47),
        .\a[15] ({mm_n_38,mm_n_39,mm_n_40,mm_n_41}),
        .\a[15]_0 ({mm_n_42,mm_n_43,mm_n_44,mm_n_45}),
        .\a[17] ({mm_n_62,mm_n_63,mm_n_64,mm_n_65}),
        .\a[19] ({mm_n_66,mm_n_67}),
        .a_IBUF(a_IBUF),
        .a_plus_b_minus_q(a_plus_b_minus_q),
        .a_plus_b_minus_q_carry({ma_n_23,ma_n_24,ma_n_25,ma_n_26}),
        .a_plus_b_minus_q_carry_0({ma_n_27,ma_n_28,ma_n_29,ma_n_30}),
        .a_plus_b_minus_q_carry__0({ma_n_31,ma_n_32,ma_n_33,ma_n_34}),
        .a_plus_b_minus_q_carry__1({ma_n_35,ma_n_36,ma_n_37,ma_n_38}),
        .a_plus_b_minus_q_carry__2({ma_n_39,ma_n_40,ma_n_41,ma_n_42}),
        .a_plus_b_minus_q_carry__3({ma_n_43,ma_n_44,ma_n_45}),
        .b_IBUF(b_IBUF),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .i___1_carry__2_i_12({mm_n_157,mm_n_158,mm_n_159,mm_n_160}),
        .mode({mm_n_68,mm_n_69,mm_n_70}),
        .mode_IBUF(mode_IBUF),
        .out1_carry__1({mm_n_58,mm_n_59,mm_n_60,mm_n_61}),
        .out_a_OBUF(out_a_OBUF),
        .out_b_OBUF(out_b_OBUF),
        .\out_reg[19] ({mm_n_169,mm_n_170,mm_n_171,mm_n_172}),
        .\out_reg[22] ({mm_n_50,mm_n_51,mm_n_52,mm_n_53}),
        .reset_IBUF(reset_IBUF),
        .sub_out(sub_out),
        .zeta_IBUF(zeta_IBUF));
  IBUF mode_IBUF_inst
       (.I(mode),
        .O(mode_IBUF));
  mod_sub ms
       (.A({ms_n_25,ms_n_26,ms_n_27,ms_n_28,ms_n_29,ms_n_30,ms_n_31,ms_n_32,ms_n_33,ms_n_34,ms_n_35,ms_n_36,ms_n_37,ms_n_38,ms_n_39,ms_n_40,ms_n_41,ms_n_42,ms_n_43,ms_n_44}),
        .CO(out1),
        .DI({mm_n_4,mm_n_5,mm_n_6,mm_n_7}),
        .S({mm_n_0,mm_n_1,mm_n_2,mm_n_3}),
        .\a[0] (ms_n_45),
        .\a[16] (ms_n_46),
        .\a[18] (ms_n_47),
        .\a[2] (ms_n_24),
        .a_IBUF({a_IBUF[18],a_IBUF[16],a_IBUF[2],a_IBUF[0]}),
        .a_mul_b0({mm_n_8,mm_n_9,mm_n_10}),
        .a_mul_b0_0({mm_n_153,mm_n_154,mm_n_155,mm_n_156}),
        .a_mul_b0_1({mm_n_34,mm_n_35,mm_n_36,mm_n_37}),
        .a_mul_b0_10({mm_n_68,mm_n_69,mm_n_70}),
        .a_mul_b0_2({mm_n_161,mm_n_162,mm_n_163,mm_n_164}),
        .a_mul_b0_3({mm_n_46,mm_n_47,mm_n_48,mm_n_49}),
        .a_mul_b0_4({mm_n_165,mm_n_166,mm_n_167,mm_n_168}),
        .a_mul_b0_5({mm_n_58,mm_n_59,mm_n_60,mm_n_61}),
        .a_mul_b0_6({mm_n_157,mm_n_158,mm_n_159,mm_n_160}),
        .a_mul_b0_7({mm_n_62,mm_n_63,mm_n_64,mm_n_65}),
        .a_mul_b0_8({mm_n_169,mm_n_170,mm_n_171,mm_n_172}),
        .a_mul_b0_9({mm_n_66,mm_n_67}),
        .b_IBUF(b_IBUF[19:0]),
        .i___1_carry_i_7({mm_n_54,mm_n_55,mm_n_56,mm_n_57}),
        .i___1_carry_i_7_0({mm_n_50,mm_n_51,mm_n_52,mm_n_53}),
        .mode_IBUF(mode_IBUF),
        .out1_carry__1_0({mm_n_42,mm_n_43,mm_n_44,mm_n_45}),
        .out1_carry__1_1({mm_n_38,mm_n_39,mm_n_40,mm_n_41}),
        .sub_out(sub_out));
  OBUF o_valid_OBUF_inst
       (.I(o_valid_OBUF),
        .O(o_valid));
  OBUF \out_a_OBUF[0]_inst 
       (.I(out_a_OBUF[0]),
        .O(out_a[0]));
  OBUF \out_a_OBUF[10]_inst 
       (.I(out_a_OBUF[10]),
        .O(out_a[10]));
  OBUF \out_a_OBUF[11]_inst 
       (.I(out_a_OBUF[11]),
        .O(out_a[11]));
  OBUF \out_a_OBUF[12]_inst 
       (.I(out_a_OBUF[12]),
        .O(out_a[12]));
  OBUF \out_a_OBUF[13]_inst 
       (.I(out_a_OBUF[13]),
        .O(out_a[13]));
  OBUF \out_a_OBUF[14]_inst 
       (.I(out_a_OBUF[14]),
        .O(out_a[14]));
  OBUF \out_a_OBUF[15]_inst 
       (.I(out_a_OBUF[15]),
        .O(out_a[15]));
  OBUF \out_a_OBUF[16]_inst 
       (.I(out_a_OBUF[16]),
        .O(out_a[16]));
  OBUF \out_a_OBUF[17]_inst 
       (.I(out_a_OBUF[17]),
        .O(out_a[17]));
  OBUF \out_a_OBUF[18]_inst 
       (.I(out_a_OBUF[18]),
        .O(out_a[18]));
  OBUF \out_a_OBUF[19]_inst 
       (.I(out_a_OBUF[19]),
        .O(out_a[19]));
  OBUF \out_a_OBUF[1]_inst 
       (.I(out_a_OBUF[1]),
        .O(out_a[1]));
  OBUF \out_a_OBUF[20]_inst 
       (.I(out_a_OBUF[20]),
        .O(out_a[20]));
  OBUF \out_a_OBUF[21]_inst 
       (.I(out_a_OBUF[21]),
        .O(out_a[21]));
  OBUF \out_a_OBUF[22]_inst 
       (.I(out_a_OBUF[22]),
        .O(out_a[22]));
  OBUF \out_a_OBUF[2]_inst 
       (.I(out_a_OBUF[2]),
        .O(out_a[2]));
  OBUF \out_a_OBUF[3]_inst 
       (.I(out_a_OBUF[3]),
        .O(out_a[3]));
  OBUF \out_a_OBUF[4]_inst 
       (.I(out_a_OBUF[4]),
        .O(out_a[4]));
  OBUF \out_a_OBUF[5]_inst 
       (.I(out_a_OBUF[5]),
        .O(out_a[5]));
  OBUF \out_a_OBUF[6]_inst 
       (.I(out_a_OBUF[6]),
        .O(out_a[6]));
  OBUF \out_a_OBUF[7]_inst 
       (.I(out_a_OBUF[7]),
        .O(out_a[7]));
  OBUF \out_a_OBUF[8]_inst 
       (.I(out_a_OBUF[8]),
        .O(out_a[8]));
  OBUF \out_a_OBUF[9]_inst 
       (.I(out_a_OBUF[9]),
        .O(out_a[9]));
  OBUF \out_b_OBUF[0]_inst 
       (.I(out_b_OBUF[0]),
        .O(out_b[0]));
  OBUF \out_b_OBUF[10]_inst 
       (.I(out_b_OBUF[10]),
        .O(out_b[10]));
  OBUF \out_b_OBUF[11]_inst 
       (.I(out_b_OBUF[11]),
        .O(out_b[11]));
  OBUF \out_b_OBUF[12]_inst 
       (.I(out_b_OBUF[12]),
        .O(out_b[12]));
  OBUF \out_b_OBUF[13]_inst 
       (.I(out_b_OBUF[13]),
        .O(out_b[13]));
  OBUF \out_b_OBUF[14]_inst 
       (.I(out_b_OBUF[14]),
        .O(out_b[14]));
  OBUF \out_b_OBUF[15]_inst 
       (.I(out_b_OBUF[15]),
        .O(out_b[15]));
  OBUF \out_b_OBUF[16]_inst 
       (.I(out_b_OBUF[16]),
        .O(out_b[16]));
  OBUF \out_b_OBUF[17]_inst 
       (.I(out_b_OBUF[17]),
        .O(out_b[17]));
  OBUF \out_b_OBUF[18]_inst 
       (.I(out_b_OBUF[18]),
        .O(out_b[18]));
  OBUF \out_b_OBUF[19]_inst 
       (.I(out_b_OBUF[19]),
        .O(out_b[19]));
  OBUF \out_b_OBUF[1]_inst 
       (.I(out_b_OBUF[1]),
        .O(out_b[1]));
  OBUF \out_b_OBUF[20]_inst 
       (.I(out_b_OBUF[20]),
        .O(out_b[20]));
  OBUF \out_b_OBUF[21]_inst 
       (.I(out_b_OBUF[21]),
        .O(out_b[21]));
  OBUF \out_b_OBUF[22]_inst 
       (.I(out_b_OBUF[22]),
        .O(out_b[22]));
  OBUF \out_b_OBUF[2]_inst 
       (.I(out_b_OBUF[2]),
        .O(out_b[2]));
  OBUF \out_b_OBUF[3]_inst 
       (.I(out_b_OBUF[3]),
        .O(out_b[3]));
  OBUF \out_b_OBUF[4]_inst 
       (.I(out_b_OBUF[4]),
        .O(out_b[4]));
  OBUF \out_b_OBUF[5]_inst 
       (.I(out_b_OBUF[5]),
        .O(out_b[5]));
  OBUF \out_b_OBUF[6]_inst 
       (.I(out_b_OBUF[6]),
        .O(out_b[6]));
  OBUF \out_b_OBUF[7]_inst 
       (.I(out_b_OBUF[7]),
        .O(out_b[7]));
  OBUF \out_b_OBUF[8]_inst 
       (.I(out_b_OBUF[8]),
        .O(out_b[8]));
  OBUF \out_b_OBUF[9]_inst 
       (.I(out_b_OBUF[9]),
        .O(out_b[9]));
  IBUF reset_IBUF_inst
       (.I(reset),
        .O(reset_IBUF));
  (* srl_bus_name = "\\valid_buf_reg " *) 
  (* srl_name = "\\valid_buf_reg[3]_srl4___valid_buf_reg_r_2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \valid_buf_reg[3]_srl4___valid_buf_reg_r_2 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D(i_valid_IBUF),
        .Q(\valid_buf_reg[3]_srl4___valid_buf_reg_r_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \valid_buf_reg[4]_valid_buf_reg_r_3 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\valid_buf_reg[3]_srl4___valid_buf_reg_r_2_n_0 ),
        .Q(\valid_buf_reg[4]_valid_buf_reg_r_3_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \valid_buf_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(valid_buf_reg_gate_n_0),
        .Q(o_valid_OBUF),
        .R(reset_IBUF));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT2 #(
    .INIT(4'h8)) 
    valid_buf_reg_gate
       (.I0(\valid_buf_reg[4]_valid_buf_reg_r_3_n_0 ),
        .I1(valid_buf_reg_r_3_n_0),
        .O(valid_buf_reg_gate_n_0));
  FDRE #(
    .INIT(1'b0)) 
    valid_buf_reg_r
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(1'b1),
        .Q(valid_buf_reg_r_n_0),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    valid_buf_reg_r_0
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(valid_buf_reg_r_n_0),
        .Q(valid_buf_reg_r_0_n_0),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    valid_buf_reg_r_1
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(valid_buf_reg_r_0_n_0),
        .Q(valid_buf_reg_r_1_n_0),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    valid_buf_reg_r_2
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(valid_buf_reg_r_1_n_0),
        .Q(valid_buf_reg_r_2_n_0),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    valid_buf_reg_r_3
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(valid_buf_reg_r_2_n_0),
        .Q(valid_buf_reg_r_3_n_0),
        .R(reset_IBUF));
  IBUF \zeta_IBUF[0]_inst 
       (.I(zeta[0]),
        .O(zeta_IBUF[0]));
  IBUF \zeta_IBUF[10]_inst 
       (.I(zeta[10]),
        .O(zeta_IBUF[10]));
  IBUF \zeta_IBUF[11]_inst 
       (.I(zeta[11]),
        .O(zeta_IBUF[11]));
  IBUF \zeta_IBUF[12]_inst 
       (.I(zeta[12]),
        .O(zeta_IBUF[12]));
  IBUF \zeta_IBUF[13]_inst 
       (.I(zeta[13]),
        .O(zeta_IBUF[13]));
  IBUF \zeta_IBUF[14]_inst 
       (.I(zeta[14]),
        .O(zeta_IBUF[14]));
  IBUF \zeta_IBUF[15]_inst 
       (.I(zeta[15]),
        .O(zeta_IBUF[15]));
  IBUF \zeta_IBUF[16]_inst 
       (.I(zeta[16]),
        .O(zeta_IBUF[16]));
  IBUF \zeta_IBUF[17]_inst 
       (.I(zeta[17]),
        .O(zeta_IBUF[17]));
  IBUF \zeta_IBUF[18]_inst 
       (.I(zeta[18]),
        .O(zeta_IBUF[18]));
  IBUF \zeta_IBUF[19]_inst 
       (.I(zeta[19]),
        .O(zeta_IBUF[19]));
  IBUF \zeta_IBUF[1]_inst 
       (.I(zeta[1]),
        .O(zeta_IBUF[1]));
  IBUF \zeta_IBUF[20]_inst 
       (.I(zeta[20]),
        .O(zeta_IBUF[20]));
  IBUF \zeta_IBUF[21]_inst 
       (.I(zeta[21]),
        .O(zeta_IBUF[21]));
  IBUF \zeta_IBUF[22]_inst 
       (.I(zeta[22]),
        .O(zeta_IBUF[22]));
  IBUF \zeta_IBUF[2]_inst 
       (.I(zeta[2]),
        .O(zeta_IBUF[2]));
  IBUF \zeta_IBUF[3]_inst 
       (.I(zeta[3]),
        .O(zeta_IBUF[3]));
  IBUF \zeta_IBUF[4]_inst 
       (.I(zeta[4]),
        .O(zeta_IBUF[4]));
  IBUF \zeta_IBUF[5]_inst 
       (.I(zeta[5]),
        .O(zeta_IBUF[5]));
  IBUF \zeta_IBUF[6]_inst 
       (.I(zeta[6]),
        .O(zeta_IBUF[6]));
  IBUF \zeta_IBUF[7]_inst 
       (.I(zeta[7]),
        .O(zeta_IBUF[7]));
  IBUF \zeta_IBUF[8]_inst 
       (.I(zeta[8]),
        .O(zeta_IBUF[8]));
  IBUF \zeta_IBUF[9]_inst 
       (.I(zeta[9]),
        .O(zeta_IBUF[9]));
endmodule

module Modular_Reduction
   (S,
    DI,
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][2] ,
    Q,
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][6] ,
    \a[15] ,
    \a[15]_0 ,
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][10] ,
    \out_reg[22]_0 ,
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][22] ,
    out1_carry__1,
    \a[17] ,
    \a[19] ,
    mode,
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][15] ,
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][15]_0 ,
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][11] ,
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][11]_0 ,
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][7] ,
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][7]_0 ,
    O,
    A,
    out_b_OBUF,
    out_a_OBUF,
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][22]_0 ,
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][19] ,
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][3] ,
    i___1_carry__2_i_12_0,
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][7]_1 ,
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][11]_1 ,
    \out_reg[19]_0 ,
    reset_IBUF,
    clk_IBUF_BUFG,
    b_IBUF,
    a_IBUF,
    mode_IBUF,
    CO,
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5] ,
    \_inferred__1/i___1_carry__4 ,
    sub_out,
    a_plus_b_minus_q,
    a_plus_b_minus_q_carry,
    a_plus_b_minus_q_carry_0,
    a_plus_b_minus_q_carry__0,
    a_plus_b_minus_q_carry__1,
    a_plus_b_minus_q_carry__2,
    a_plus_b_minus_q_carry__3,
    \_inferred__1/i___1_carry ,
    \_inferred__1/i___1_carry_0 ,
    \_inferred__1/i___1_carry__3 ,
    \_inferred__1/i___1_carry__3_0 ,
    \_inferred__1/i___1_carry__4_0 ,
    P,
    \x_temp_reg[16]_0 );
  output [3:0]S;
  output [3:0]DI;
  output [2:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][2] ;
  output [22:0]Q;
  output [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][6] ;
  output [3:0]\a[15] ;
  output [3:0]\a[15]_0 ;
  output [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][10] ;
  output [3:0]\out_reg[22]_0 ;
  output [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][22] ;
  output [3:0]out1_carry__1;
  output [3:0]\a[17] ;
  output [1:0]\a[19] ;
  output [2:0]mode;
  output [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][15] ;
  output [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][15]_0 ;
  output [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][11] ;
  output [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][11]_0 ;
  output [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][7] ;
  output [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][7]_0 ;
  output [3:0]O;
  output [2:0]A;
  output [22:0]out_b_OBUF;
  output [22:0]out_a_OBUF;
  output [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][22]_0 ;
  output [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][19] ;
  output [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][3] ;
  output [3:0]i___1_carry__2_i_12_0;
  output [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][7]_1 ;
  output [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][11]_1 ;
  output [3:0]\out_reg[19]_0 ;
  input reset_IBUF;
  input clk_IBUF_BUFG;
  input [22:0]b_IBUF;
  input [22:0]a_IBUF;
  input mode_IBUF;
  input [0:0]CO;
  input [22:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5] ;
  input \_inferred__1/i___1_carry__4 ;
  input [22:0]sub_out;
  input [22:0]a_plus_b_minus_q;
  input [3:0]a_plus_b_minus_q_carry;
  input [3:0]a_plus_b_minus_q_carry_0;
  input [3:0]a_plus_b_minus_q_carry__0;
  input [3:0]a_plus_b_minus_q_carry__1;
  input [3:0]a_plus_b_minus_q_carry__2;
  input [2:0]a_plus_b_minus_q_carry__3;
  input \_inferred__1/i___1_carry ;
  input \_inferred__1/i___1_carry_0 ;
  input \_inferred__1/i___1_carry__3 ;
  input \_inferred__1/i___1_carry__3_0 ;
  input \_inferred__1/i___1_carry__4_0 ;
  input [28:0]P;
  input [16:0]\x_temp_reg[16]_0 ;

  wire [2:0]A;
  wire [0:0]CO;
  wire [22:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5] ;
  wire [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][10] ;
  wire [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][11] ;
  wire [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][11]_0 ;
  wire [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][11]_1 ;
  wire [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][15] ;
  wire [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][15]_0 ;
  wire [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][19] ;
  wire [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][22] ;
  wire [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][22]_0 ;
  wire [2:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][2] ;
  wire [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][3] ;
  wire [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][6] ;
  wire [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][7] ;
  wire [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][7]_0 ;
  wire [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][7]_1 ;
  wire [3:0]DI;
  wire [3:0]O;
  wire [28:0]P;
  wire [22:0]Q;
  wire [3:0]S;
  wire \_inferred__1/i___1_carry ;
  wire \_inferred__1/i___1_carry_0 ;
  wire \_inferred__1/i___1_carry__3 ;
  wire \_inferred__1/i___1_carry__3_0 ;
  wire \_inferred__1/i___1_carry__4 ;
  wire \_inferred__1/i___1_carry__4_0 ;
  wire [3:0]\a[15] ;
  wire [3:0]\a[15]_0 ;
  wire [3:0]\a[17] ;
  wire [1:0]\a[19] ;
  wire [22:0]a_IBUF;
  wire [22:0]a_plus_b_minus_q;
  wire [3:0]a_plus_b_minus_q_carry;
  wire [3:0]a_plus_b_minus_q_carry_0;
  wire [3:0]a_plus_b_minus_q_carry__0;
  wire a_plus_b_minus_q_carry__0_i_1_n_0;
  wire a_plus_b_minus_q_carry__0_i_1_n_1;
  wire a_plus_b_minus_q_carry__0_i_1_n_2;
  wire a_plus_b_minus_q_carry__0_i_1_n_3;
  wire [3:0]a_plus_b_minus_q_carry__1;
  wire a_plus_b_minus_q_carry__1_i_1_n_0;
  wire a_plus_b_minus_q_carry__1_i_1_n_1;
  wire a_plus_b_minus_q_carry__1_i_1_n_2;
  wire a_plus_b_minus_q_carry__1_i_1_n_3;
  wire [3:0]a_plus_b_minus_q_carry__2;
  wire a_plus_b_minus_q_carry__2_i_1_n_0;
  wire a_plus_b_minus_q_carry__2_i_1_n_1;
  wire a_plus_b_minus_q_carry__2_i_1_n_2;
  wire a_plus_b_minus_q_carry__2_i_1_n_3;
  wire [2:0]a_plus_b_minus_q_carry__3;
  wire a_plus_b_minus_q_carry__3_i_1_n_1;
  wire a_plus_b_minus_q_carry__3_i_1_n_2;
  wire a_plus_b_minus_q_carry__3_i_1_n_3;
  wire a_plus_b_minus_q_carry_i_1_n_0;
  wire a_plus_b_minus_q_carry_i_1_n_1;
  wire a_plus_b_minus_q_carry_i_1_n_2;
  wire a_plus_b_minus_q_carry_i_1_n_3;
  wire a_plus_b_minus_q_carry_i_2_n_0;
  wire a_plus_b_minus_q_carry_i_2_n_1;
  wire a_plus_b_minus_q_carry_i_2_n_2;
  wire a_plus_b_minus_q_carry_i_2_n_3;
  wire adder_0_n_0;
  wire adder_0_temp;
  wire [34:0]adder_1;
  wire adder_1__2_carry__0_i_1_n_0;
  wire adder_1__2_carry__0_i_2_n_0;
  wire adder_1__2_carry__0_i_3_n_0;
  wire adder_1__2_carry__0_i_4_n_0;
  wire adder_1__2_carry__0_i_5_n_0;
  wire adder_1__2_carry__0_i_6_n_0;
  wire adder_1__2_carry__0_i_7_n_0;
  wire adder_1__2_carry__0_i_8_n_0;
  wire adder_1__2_carry__0_n_0;
  wire adder_1__2_carry__0_n_1;
  wire adder_1__2_carry__0_n_2;
  wire adder_1__2_carry__0_n_3;
  wire adder_1__2_carry__1_i_1_n_0;
  wire adder_1__2_carry__1_i_2_n_0;
  wire adder_1__2_carry__1_i_3_n_0;
  wire adder_1__2_carry__1_n_3;
  wire adder_1__2_carry_i_1_n_0;
  wire adder_1__2_carry_i_2_n_0;
  wire adder_1__2_carry_i_3_n_0;
  wire adder_1__2_carry_i_4_n_0;
  wire adder_1__2_carry_i_5_n_0;
  wire adder_1__2_carry_i_6_n_0;
  wire adder_1__2_carry_i_7_n_0;
  wire adder_1__2_carry_n_0;
  wire adder_1__2_carry_n_1;
  wire adder_1__2_carry_n_2;
  wire adder_1__2_carry_n_3;
  wire adder_1__30_carry__0_i_1_n_0;
  wire adder_1__30_carry__0_i_2_n_0;
  wire adder_1__30_carry__0_i_3_n_0;
  wire adder_1__30_carry__0_i_4_n_0;
  wire adder_1__30_carry__0_i_5_n_0;
  wire adder_1__30_carry__0_i_6_n_0;
  wire adder_1__30_carry__0_i_7_n_0;
  wire adder_1__30_carry__0_i_8_n_0;
  wire adder_1__30_carry__0_n_0;
  wire adder_1__30_carry__0_n_1;
  wire adder_1__30_carry__0_n_2;
  wire adder_1__30_carry__0_n_3;
  wire adder_1__30_carry__1_i_1_n_0;
  wire adder_1__30_carry__1_i_2_n_0;
  wire adder_1__30_carry__1_i_3_n_0;
  wire adder_1__30_carry__1_i_4_n_0;
  wire adder_1__30_carry__1_i_5_n_0;
  wire adder_1__30_carry__1_i_6_n_0;
  wire adder_1__30_carry__1_i_7_n_0;
  wire adder_1__30_carry__1_i_8_n_0;
  wire adder_1__30_carry__1_n_0;
  wire adder_1__30_carry__1_n_1;
  wire adder_1__30_carry__1_n_2;
  wire adder_1__30_carry__1_n_3;
  wire adder_1__30_carry__2_i_1_n_0;
  wire adder_1__30_carry__2_i_2_n_0;
  wire adder_1__30_carry__2_i_3_n_0;
  wire adder_1__30_carry__2_n_0;
  wire adder_1__30_carry__2_n_1;
  wire adder_1__30_carry__2_n_2;
  wire adder_1__30_carry__2_n_3;
  wire adder_1__30_carry__3_n_0;
  wire adder_1__30_carry__3_n_1;
  wire adder_1__30_carry__3_n_2;
  wire adder_1__30_carry__3_n_3;
  wire adder_1__30_carry__4_n_2;
  wire adder_1__30_carry__4_n_3;
  wire adder_1__30_carry_i_1_n_0;
  wire adder_1__30_carry_i_2_n_0;
  wire adder_1__30_carry_i_3_n_0;
  wire adder_1__30_carry_i_4_n_0;
  wire adder_1__30_carry_i_5_n_0;
  wire adder_1__30_carry_i_6_n_0;
  wire adder_1__30_carry_i_7_n_0;
  wire adder_1__30_carry_n_0;
  wire adder_1__30_carry_n_1;
  wire adder_1__30_carry_n_2;
  wire adder_1__30_carry_n_3;
  wire [34:0]adder_1_temp;
  wire [25:0]adder_2;
  wire adder_2__0_carry__0_i_1_n_0;
  wire adder_2__0_carry__0_i_2_n_0;
  wire adder_2__0_carry__0_i_3_n_0;
  wire adder_2__0_carry__0_i_4_n_0;
  wire adder_2__0_carry__0_i_5_n_0;
  wire adder_2__0_carry__0_i_6_n_0;
  wire adder_2__0_carry__0_i_7_n_0;
  wire adder_2__0_carry__0_i_8_n_0;
  wire adder_2__0_carry__0_n_0;
  wire adder_2__0_carry__0_n_1;
  wire adder_2__0_carry__0_n_2;
  wire adder_2__0_carry__0_n_3;
  wire adder_2__0_carry__1_i_1_n_0;
  wire adder_2__0_carry__1_i_2_n_0;
  wire adder_2__0_carry__1_i_3_n_0;
  wire adder_2__0_carry__1_i_4_n_0;
  wire adder_2__0_carry__1_i_5_n_0;
  wire adder_2__0_carry__1_i_6_n_0;
  wire adder_2__0_carry__1_i_7_n_0;
  wire adder_2__0_carry__1_i_8_n_0;
  wire adder_2__0_carry__1_n_0;
  wire adder_2__0_carry__1_n_1;
  wire adder_2__0_carry__1_n_2;
  wire adder_2__0_carry__1_n_3;
  wire adder_2__0_carry__2_i_1_n_0;
  wire adder_2__0_carry__2_i_2_n_0;
  wire adder_2__0_carry__2_i_3_n_0;
  wire adder_2__0_carry__2_i_4_n_0;
  wire adder_2__0_carry__2_i_5_n_0;
  wire adder_2__0_carry__2_i_6_n_0;
  wire adder_2__0_carry__2_i_7_n_0;
  wire adder_2__0_carry__2_i_8_n_0;
  wire adder_2__0_carry__2_n_0;
  wire adder_2__0_carry__2_n_1;
  wire adder_2__0_carry__2_n_2;
  wire adder_2__0_carry__2_n_3;
  wire adder_2__0_carry__3_i_1_n_0;
  wire adder_2__0_carry__3_i_2_n_0;
  wire adder_2__0_carry__3_i_3_n_0;
  wire adder_2__0_carry__3_i_4_n_0;
  wire adder_2__0_carry__3_i_5_n_0;
  wire adder_2__0_carry__3_i_6_n_0;
  wire adder_2__0_carry__3_i_7_n_0;
  wire adder_2__0_carry__3_i_8_n_0;
  wire adder_2__0_carry__3_n_0;
  wire adder_2__0_carry__3_n_1;
  wire adder_2__0_carry__3_n_2;
  wire adder_2__0_carry__3_n_3;
  wire adder_2__0_carry__4_i_1_n_0;
  wire adder_2__0_carry__4_i_2_n_0;
  wire adder_2__0_carry__4_i_3_n_0;
  wire adder_2__0_carry__4_i_4_n_0;
  wire adder_2__0_carry__4_i_5_n_0;
  wire adder_2__0_carry__4_i_6_n_0;
  wire adder_2__0_carry__4_i_7_n_0;
  wire adder_2__0_carry__4_n_0;
  wire adder_2__0_carry__4_n_1;
  wire adder_2__0_carry__4_n_2;
  wire adder_2__0_carry__4_n_3;
  wire adder_2__0_carry__5_i_1_n_0;
  wire adder_2__0_carry__5_n_3;
  wire adder_2__0_carry_i_1_n_0;
  wire adder_2__0_carry_i_2_n_0;
  wire adder_2__0_carry_i_3_n_0;
  wire adder_2__0_carry_i_4_n_0;
  wire adder_2__0_carry_i_5_n_0;
  wire adder_2__0_carry_i_6_n_0;
  wire adder_2__0_carry_i_7_n_0;
  wire adder_2__0_carry_n_0;
  wire adder_2__0_carry_n_1;
  wire adder_2__0_carry_n_2;
  wire adder_2__0_carry_n_3;
  wire [25:0]adder_2_temp;
  wire [26:13]adder_3;
  wire \adder_3_temp[16]_i_2_n_0 ;
  wire \adder_3_temp[16]_i_3_n_0 ;
  wire \adder_3_temp[16]_i_4_n_0 ;
  wire \adder_3_temp[16]_i_5_n_0 ;
  wire \adder_3_temp[16]_i_6_n_0 ;
  wire \adder_3_temp[16]_i_7_n_0 ;
  wire \adder_3_temp[16]_i_8_n_0 ;
  wire \adder_3_temp[20]_i_2_n_0 ;
  wire \adder_3_temp[20]_i_3_n_0 ;
  wire \adder_3_temp[20]_i_4_n_0 ;
  wire \adder_3_temp[20]_i_5_n_0 ;
  wire \adder_3_temp[20]_i_6_n_0 ;
  wire \adder_3_temp[20]_i_7_n_0 ;
  wire \adder_3_temp[20]_i_8_n_0 ;
  wire \adder_3_temp[20]_i_9_n_0 ;
  wire \adder_3_temp[24]_i_2_n_0 ;
  wire \adder_3_temp[24]_i_3_n_0 ;
  wire \adder_3_temp[24]_i_4_n_0 ;
  wire \adder_3_temp[24]_i_5_n_0 ;
  wire \adder_3_temp[24]_i_6_n_0 ;
  wire \adder_3_temp_reg[16]_i_1_n_0 ;
  wire \adder_3_temp_reg[16]_i_1_n_1 ;
  wire \adder_3_temp_reg[16]_i_1_n_2 ;
  wire \adder_3_temp_reg[16]_i_1_n_3 ;
  wire \adder_3_temp_reg[20]_i_1_n_0 ;
  wire \adder_3_temp_reg[20]_i_1_n_1 ;
  wire \adder_3_temp_reg[20]_i_1_n_2 ;
  wire \adder_3_temp_reg[20]_i_1_n_3 ;
  wire \adder_3_temp_reg[24]_i_1_n_0 ;
  wire \adder_3_temp_reg[24]_i_1_n_1 ;
  wire \adder_3_temp_reg[24]_i_1_n_2 ;
  wire \adder_3_temp_reg[24]_i_1_n_3 ;
  wire \adder_3_temp_reg[26]_i_1_n_3 ;
  wire \adder_3_temp_reg_n_0_[0] ;
  wire \adder_3_temp_reg_n_0_[10] ;
  wire \adder_3_temp_reg_n_0_[11] ;
  wire \adder_3_temp_reg_n_0_[12] ;
  wire \adder_3_temp_reg_n_0_[13] ;
  wire \adder_3_temp_reg_n_0_[14] ;
  wire \adder_3_temp_reg_n_0_[15] ;
  wire \adder_3_temp_reg_n_0_[16] ;
  wire \adder_3_temp_reg_n_0_[17] ;
  wire \adder_3_temp_reg_n_0_[18] ;
  wire \adder_3_temp_reg_n_0_[19] ;
  wire \adder_3_temp_reg_n_0_[1] ;
  wire \adder_3_temp_reg_n_0_[20] ;
  wire \adder_3_temp_reg_n_0_[21] ;
  wire \adder_3_temp_reg_n_0_[22] ;
  wire \adder_3_temp_reg_n_0_[23] ;
  wire \adder_3_temp_reg_n_0_[24] ;
  wire \adder_3_temp_reg_n_0_[25] ;
  wire \adder_3_temp_reg_n_0_[26] ;
  wire \adder_3_temp_reg_n_0_[2] ;
  wire \adder_3_temp_reg_n_0_[3] ;
  wire \adder_3_temp_reg_n_0_[4] ;
  wire \adder_3_temp_reg_n_0_[5] ;
  wire \adder_3_temp_reg_n_0_[6] ;
  wire \adder_3_temp_reg_n_0_[7] ;
  wire \adder_3_temp_reg_n_0_[8] ;
  wire \adder_3_temp_reg_n_0_[9] ;
  wire [23:1]adder_4__66;
  wire adder_4_carry__0_i_1_n_0;
  wire adder_4_carry__0_i_2_n_0;
  wire adder_4_carry__0_i_3_n_0;
  wire adder_4_carry__0_i_4_n_0;
  wire adder_4_carry__0_n_0;
  wire adder_4_carry__0_n_1;
  wire adder_4_carry__0_n_2;
  wire adder_4_carry__0_n_3;
  wire adder_4_carry__1_i_1_n_0;
  wire adder_4_carry__1_i_2_n_0;
  wire adder_4_carry__1_i_3_n_0;
  wire adder_4_carry__1_i_4_n_0;
  wire adder_4_carry__1_n_0;
  wire adder_4_carry__1_n_1;
  wire adder_4_carry__1_n_2;
  wire adder_4_carry__1_n_3;
  wire adder_4_carry__2_i_1_n_0;
  wire adder_4_carry__2_i_2_n_0;
  wire adder_4_carry__2_i_3_n_0;
  wire adder_4_carry__2_i_4_n_0;
  wire adder_4_carry__2_i_5_n_0;
  wire adder_4_carry__2_n_0;
  wire adder_4_carry__2_n_1;
  wire adder_4_carry__2_n_2;
  wire adder_4_carry__2_n_3;
  wire adder_4_carry__3_i_1_n_0;
  wire adder_4_carry__3_i_2_n_0;
  wire adder_4_carry__3_i_3_n_0;
  wire adder_4_carry__3_i_4_n_0;
  wire adder_4_carry__3_n_0;
  wire adder_4_carry__3_n_1;
  wire adder_4_carry__3_n_2;
  wire adder_4_carry__3_n_3;
  wire adder_4_carry__4_i_1_n_0;
  wire adder_4_carry__4_i_2_n_0;
  wire adder_4_carry__4_i_3_n_0;
  wire adder_4_carry__4_n_2;
  wire adder_4_carry__4_n_3;
  wire adder_4_carry_i_10_n_0;
  wire adder_4_carry_i_11_n_0;
  wire adder_4_carry_i_2_n_0;
  wire adder_4_carry_i_3_n_0;
  wire adder_4_carry_i_4_n_0;
  wire adder_4_carry_i_5_n_0;
  wire adder_4_carry_i_6_n_0;
  wire adder_4_carry_i_7_n_0;
  wire adder_4_carry_i_8_n_0;
  wire adder_4_carry_i_9_n_0;
  wire adder_4_carry_n_0;
  wire adder_4_carry_n_1;
  wire adder_4_carry_n_2;
  wire adder_4_carry_n_3;
  wire [22:0]b_IBUF;
  wire clk_IBUF_BUFG;
  wire i___1_carry__2_i_10_n_0;
  wire i___1_carry__2_i_11_n_0;
  wire [3:0]i___1_carry__2_i_12_0;
  wire i___1_carry__2_i_12_n_0;
  wire i___1_carry__2_i_13_n_0;
  wire i___1_carry__2_i_14_n_0;
  wire i___1_carry__2_i_15_n_0;
  wire i___1_carry__2_i_16_n_0;
  wire i___1_carry__2_i_9_n_0;
  wire i___1_carry__3_i_10_n_0;
  wire i___1_carry__3_i_11_n_0;
  wire i___1_carry__3_i_12_n_0;
  wire i___1_carry__3_i_13_n_0;
  wire i___1_carry__3_i_15_n_0;
  wire i___1_carry__3_i_16_n_0;
  wire i___1_carry__3_i_18_n_0;
  wire i___1_carry__3_i_19_n_0;
  wire i___1_carry__3_i_20_n_0;
  wire i___1_carry__3_i_9_n_0;
  wire i___1_carry__4_i_10_n_0;
  wire i___1_carry__4_i_12_n_0;
  wire i___1_carry__4_i_13_n_0;
  wire i___1_carry__4_i_6_n_0;
  wire i___1_carry__4_i_7_n_0;
  wire i___1_carry__4_i_9_n_0;
  wire i___1_carry_i_10_n_0;
  wire i___1_carry_i_12_n_0;
  wire i___1_carry_i_14_n_0;
  wire i___1_carry_i_15_n_0;
  wire i___1_carry_i_16_n_0;
  wire i___1_carry_i_17_n_0;
  wire i___1_carry_i_8_n_0;
  wire i___1_carry_i_9_n_0;
  wire [2:0]mode;
  wire mode_IBUF;
  wire out1_carry__0_i_10_n_0;
  wire out1_carry__0_i_11_n_0;
  wire out1_carry__0_i_12_n_0;
  wire out1_carry__0_i_13_n_0;
  wire out1_carry__0_i_14_n_0;
  wire out1_carry__0_i_15_n_0;
  wire out1_carry__0_i_16_n_0;
  wire out1_carry__0_i_9_n_0;
  wire [3:0]out1_carry__1;
  wire out1_carry__1_i_10_n_0;
  wire out1_carry__1_i_11_n_0;
  wire out1_carry__1_i_12_n_0;
  wire out1_carry__1_i_13_n_0;
  wire out1_carry__1_i_14_n_0;
  wire out1_carry__1_i_9_n_0;
  wire out1_carry_i_10_n_0;
  wire out1_carry_i_11_n_0;
  wire out1_carry_i_12_n_0;
  wire out1_carry_i_13_n_0;
  wire out1_carry_i_14_n_0;
  wire out1_carry_i_15_n_0;
  wire out1_carry_i_16_n_0;
  wire out1_carry_i_9_n_0;
  wire \out[0]_i_1_n_0 ;
  wire \out[10]_i_1_n_0 ;
  wire \out[11]_i_1_n_0 ;
  wire \out[12]_i_1_n_0 ;
  wire \out[13]_i_1_n_0 ;
  wire \out[14]_i_1_n_0 ;
  wire \out[15]_i_1_n_0 ;
  wire \out[16]_i_1_n_0 ;
  wire \out[17]_i_1_n_0 ;
  wire \out[18]_i_1_n_0 ;
  wire \out[19]_i_1_n_0 ;
  wire \out[1]_i_1_n_0 ;
  wire \out[20]_i_1_n_0 ;
  wire \out[21]_i_1_n_0 ;
  wire \out[22]_i_1_n_0 ;
  wire \out[2]_i_1_n_0 ;
  wire \out[3]_i_1_n_0 ;
  wire \out[4]_i_1_n_0 ;
  wire \out[5]_i_1_n_0 ;
  wire \out[6]_i_1_n_0 ;
  wire \out[7]_i_1_n_0 ;
  wire \out[8]_i_1_n_0 ;
  wire \out[9]_i_1_n_0 ;
  wire [22:0]out_a_OBUF;
  wire [22:0]out_b_OBUF;
  wire [3:0]\out_reg[19]_0 ;
  wire [3:0]\out_reg[22]_0 ;
  wire reset_IBUF;
  wire sel;
  wire [22:0]sub_out;
  wire [22:13]temp_0;
  wire [14:13]temp_1;
  wire [22:0]x_temp;
  wire [16:0]\x_temp_reg[16]_0 ;
  wire [3:3]NLW_a_plus_b_minus_q_carry__3_i_1_CO_UNCONNECTED;
  wire [3:1]NLW_adder_1__2_carry__1_CO_UNCONNECTED;
  wire [3:2]NLW_adder_1__2_carry__1_O_UNCONNECTED;
  wire [2:2]NLW_adder_1__30_carry__4_CO_UNCONNECTED;
  wire [3:3]NLW_adder_1__30_carry__4_O_UNCONNECTED;
  wire [3:1]NLW_adder_2__0_carry__5_CO_UNCONNECTED;
  wire [3:2]NLW_adder_2__0_carry__5_O_UNCONNECTED;
  wire [3:1]\NLW_adder_3_temp_reg[26]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_adder_3_temp_reg[26]_i_1_O_UNCONNECTED ;
  wire [3:2]NLW_adder_4_carry__4_CO_UNCONNECTED;
  wire [3:3]NLW_adder_4_carry__4_O_UNCONNECTED;

  LUT3 #(
    .INIT(8'hB8)) 
    a_mul_b0_i_6
       (.I0(sub_out[22]),
        .I1(mode_IBUF),
        .I2(b_IBUF[22]),
        .O(A[2]));
  LUT3 #(
    .INIT(8'hB8)) 
    a_mul_b0_i_7
       (.I0(sub_out[21]),
        .I1(mode_IBUF),
        .I2(b_IBUF[21]),
        .O(A[1]));
  LUT3 #(
    .INIT(8'hB8)) 
    a_mul_b0_i_8
       (.I0(sub_out[20]),
        .I1(mode_IBUF),
        .I2(b_IBUF[20]),
        .O(A[0]));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 a_plus_b_minus_q_carry__0_i_1
       (.CI(a_plus_b_minus_q_carry_i_2_n_0),
        .CO({a_plus_b_minus_q_carry__0_i_1_n_0,a_plus_b_minus_q_carry__0_i_1_n_1,a_plus_b_minus_q_carry__0_i_1_n_2,a_plus_b_minus_q_carry__0_i_1_n_3}),
        .CYINIT(1'b0),
        .DI(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [11:8]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][11] ),
        .S(a_plus_b_minus_q_carry__0));
  LUT1 #(
    .INIT(2'h1)) 
    a_plus_b_minus_q_carry__0_i_2
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][11] [0]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][11]_0 [3]));
  LUT1 #(
    .INIT(2'h1)) 
    a_plus_b_minus_q_carry__0_i_3
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][7] [3]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][11]_0 [2]));
  LUT1 #(
    .INIT(2'h1)) 
    a_plus_b_minus_q_carry__0_i_4
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][7] [2]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][11]_0 [1]));
  LUT1 #(
    .INIT(2'h1)) 
    a_plus_b_minus_q_carry__0_i_5
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][7] [1]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][11]_0 [0]));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 a_plus_b_minus_q_carry__1_i_1
       (.CI(a_plus_b_minus_q_carry__0_i_1_n_0),
        .CO({a_plus_b_minus_q_carry__1_i_1_n_0,a_plus_b_minus_q_carry__1_i_1_n_1,a_plus_b_minus_q_carry__1_i_1_n_2,a_plus_b_minus_q_carry__1_i_1_n_3}),
        .CYINIT(1'b0),
        .DI(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [15:12]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][15]_0 ),
        .S(a_plus_b_minus_q_carry__1));
  LUT1 #(
    .INIT(2'h1)) 
    a_plus_b_minus_q_carry__1_i_2
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][15]_0 [0]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][15] [3]));
  LUT1 #(
    .INIT(2'h1)) 
    a_plus_b_minus_q_carry__1_i_3
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][11] [3]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][15] [2]));
  LUT1 #(
    .INIT(2'h1)) 
    a_plus_b_minus_q_carry__1_i_4
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][11] [2]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][15] [1]));
  LUT1 #(
    .INIT(2'h1)) 
    a_plus_b_minus_q_carry__1_i_5
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][11] [1]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][15] [0]));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 a_plus_b_minus_q_carry__2_i_1
       (.CI(a_plus_b_minus_q_carry__1_i_1_n_0),
        .CO({a_plus_b_minus_q_carry__2_i_1_n_0,a_plus_b_minus_q_carry__2_i_1_n_1,a_plus_b_minus_q_carry__2_i_1_n_2,a_plus_b_minus_q_carry__2_i_1_n_3}),
        .CYINIT(1'b0),
        .DI(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [19:16]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][19] ),
        .S(a_plus_b_minus_q_carry__2));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 a_plus_b_minus_q_carry__3_i_1
       (.CI(a_plus_b_minus_q_carry__2_i_1_n_0),
        .CO({NLW_a_plus_b_minus_q_carry__3_i_1_CO_UNCONNECTED[3],a_plus_b_minus_q_carry__3_i_1_n_1,a_plus_b_minus_q_carry__3_i_1_n_2,a_plus_b_minus_q_carry__3_i_1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [22:20]}),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][22]_0 ),
        .S({1'b1,a_plus_b_minus_q_carry__3}));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 a_plus_b_minus_q_carry_i_1
       (.CI(1'b0),
        .CO({a_plus_b_minus_q_carry_i_1_n_0,a_plus_b_minus_q_carry_i_1_n_1,a_plus_b_minus_q_carry_i_1_n_2,a_plus_b_minus_q_carry_i_1_n_3}),
        .CYINIT(1'b0),
        .DI(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [3:0]),
        .O(O),
        .S(a_plus_b_minus_q_carry));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 a_plus_b_minus_q_carry_i_2
       (.CI(a_plus_b_minus_q_carry_i_1_n_0),
        .CO({a_plus_b_minus_q_carry_i_2_n_0,a_plus_b_minus_q_carry_i_2_n_1,a_plus_b_minus_q_carry_i_2_n_2,a_plus_b_minus_q_carry_i_2_n_3}),
        .CYINIT(1'b0),
        .DI(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [7:4]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][7] ),
        .S(a_plus_b_minus_q_carry_0));
  LUT1 #(
    .INIT(2'h1)) 
    a_plus_b_minus_q_carry_i_3
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][7] [0]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][7]_0 [3]));
  LUT1 #(
    .INIT(2'h1)) 
    a_plus_b_minus_q_carry_i_4
       (.I0(O[3]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][7]_0 [2]));
  LUT1 #(
    .INIT(2'h1)) 
    a_plus_b_minus_q_carry_i_5
       (.I0(O[2]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][7]_0 [1]));
  LUT1 #(
    .INIT(2'h1)) 
    a_plus_b_minus_q_carry_i_6
       (.I0(O[1]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][7]_0 [0]));
  LUT3 #(
    .INIT(8'h96)) 
    adder_0
       (.I0(P[6]),
        .I1(P[16]),
        .I2(P[26]),
        .O(adder_0_n_0));
  FDRE #(
    .INIT(1'b0)) 
    adder_0_temp_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_0_n_0),
        .Q(adder_0_temp),
        .R(reset_IBUF));
  CARRY4 adder_1__2_carry
       (.CI(1'b0),
        .CO({adder_1__2_carry_n_0,adder_1__2_carry_n_1,adder_1__2_carry_n_2,adder_1__2_carry_n_3}),
        .CYINIT(1'b0),
        .DI({adder_1__2_carry_i_1_n_0,adder_1__2_carry_i_2_n_0,adder_1__2_carry_i_3_n_0,P[27]}),
        .O(adder_1[3:0]),
        .S({adder_1__2_carry_i_4_n_0,adder_1__2_carry_i_5_n_0,adder_1__2_carry_i_6_n_0,adder_1__2_carry_i_7_n_0}));
  CARRY4 adder_1__2_carry__0
       (.CI(adder_1__2_carry_n_0),
        .CO({adder_1__2_carry__0_n_0,adder_1__2_carry__0_n_1,adder_1__2_carry__0_n_2,adder_1__2_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({adder_1__2_carry__0_i_1_n_0,adder_1__2_carry__0_i_2_n_0,adder_1__2_carry__0_i_3_n_0,adder_1__2_carry__0_i_4_n_0}),
        .O(adder_1[7:4]),
        .S({adder_1__2_carry__0_i_5_n_0,adder_1__2_carry__0_i_6_n_0,adder_1__2_carry__0_i_7_n_0,adder_1__2_carry__0_i_8_n_0}));
  LUT2 #(
    .INIT(4'h8)) 
    adder_1__2_carry__0_i_1
       (.I0(P[23]),
        .I1(P[13]),
        .O(adder_1__2_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    adder_1__2_carry__0_i_2
       (.I0(P[22]),
        .I1(P[12]),
        .O(adder_1__2_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    adder_1__2_carry__0_i_3
       (.I0(P[21]),
        .I1(P[11]),
        .O(adder_1__2_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    adder_1__2_carry__0_i_4
       (.I0(P[20]),
        .I1(P[10]),
        .O(adder_1__2_carry__0_i_4_n_0));
  LUT4 #(
    .INIT(16'h8778)) 
    adder_1__2_carry__0_i_5
       (.I0(P[13]),
        .I1(P[23]),
        .I2(P[24]),
        .I3(P[14]),
        .O(adder_1__2_carry__0_i_5_n_0));
  LUT4 #(
    .INIT(16'h8778)) 
    adder_1__2_carry__0_i_6
       (.I0(P[12]),
        .I1(P[22]),
        .I2(P[23]),
        .I3(P[13]),
        .O(adder_1__2_carry__0_i_6_n_0));
  LUT4 #(
    .INIT(16'h8778)) 
    adder_1__2_carry__0_i_7
       (.I0(P[11]),
        .I1(P[21]),
        .I2(P[22]),
        .I3(P[12]),
        .O(adder_1__2_carry__0_i_7_n_0));
  LUT4 #(
    .INIT(16'h8778)) 
    adder_1__2_carry__0_i_8
       (.I0(P[10]),
        .I1(P[20]),
        .I2(P[21]),
        .I3(P[11]),
        .O(adder_1__2_carry__0_i_8_n_0));
  CARRY4 adder_1__2_carry__1
       (.CI(adder_1__2_carry__0_n_0),
        .CO({NLW_adder_1__2_carry__1_CO_UNCONNECTED[3],adder_1[10],NLW_adder_1__2_carry__1_CO_UNCONNECTED[1],adder_1__2_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,adder_1__2_carry__1_i_1_n_0}),
        .O({NLW_adder_1__2_carry__1_O_UNCONNECTED[3:2],adder_1[9:8]}),
        .S({1'b0,1'b1,adder_1__2_carry__1_i_2_n_0,adder_1__2_carry__1_i_3_n_0}));
  LUT2 #(
    .INIT(4'h8)) 
    adder_1__2_carry__1_i_1
       (.I0(P[24]),
        .I1(P[14]),
        .O(adder_1__2_carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    adder_1__2_carry__1_i_2
       (.I0(P[25]),
        .I1(P[15]),
        .O(adder_1__2_carry__1_i_2_n_0));
  LUT4 #(
    .INIT(16'h8778)) 
    adder_1__2_carry__1_i_3
       (.I0(P[14]),
        .I1(P[24]),
        .I2(P[25]),
        .I3(P[15]),
        .O(adder_1__2_carry__1_i_3_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    adder_1__2_carry_i_1
       (.I0(P[19]),
        .I1(P[9]),
        .O(adder_1__2_carry_i_1_n_0));
  LUT3 #(
    .INIT(8'hE8)) 
    adder_1__2_carry_i_2
       (.I0(P[18]),
        .I1(P[8]),
        .I2(P[28]),
        .O(adder_1__2_carry_i_2_n_0));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    adder_1__2_carry_i_3
       (.I0(P[17]),
        .I1(P[7]),
        .I2(P[6]),
        .I3(P[26]),
        .I4(P[16]),
        .O(adder_1__2_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h8778)) 
    adder_1__2_carry_i_4
       (.I0(P[9]),
        .I1(P[19]),
        .I2(P[20]),
        .I3(P[10]),
        .O(adder_1__2_carry_i_4_n_0));
  LUT5 #(
    .INIT(32'hE81717E8)) 
    adder_1__2_carry_i_5
       (.I0(P[28]),
        .I1(P[8]),
        .I2(P[18]),
        .I3(P[19]),
        .I4(P[9]),
        .O(adder_1__2_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h6996)) 
    adder_1__2_carry_i_6
       (.I0(adder_1__2_carry_i_3_n_0),
        .I1(P[8]),
        .I2(P[18]),
        .I3(P[28]),
        .O(adder_1__2_carry_i_6_n_0));
  LUT6 #(
    .INIT(64'h6669699999969666)) 
    adder_1__2_carry_i_7
       (.I0(P[7]),
        .I1(P[17]),
        .I2(P[16]),
        .I3(P[26]),
        .I4(P[6]),
        .I5(P[27]),
        .O(adder_1__2_carry_i_7_n_0));
  CARRY4 adder_1__30_carry
       (.CI(1'b0),
        .CO({adder_1__30_carry_n_0,adder_1__30_carry_n_1,adder_1__30_carry_n_2,adder_1__30_carry_n_3}),
        .CYINIT(1'b0),
        .DI({adder_1__30_carry_i_1_n_0,adder_1__30_carry_i_2_n_0,adder_1__30_carry_i_3_n_0,P[26]}),
        .O(adder_1[14:11]),
        .S({adder_1__30_carry_i_4_n_0,adder_1__30_carry_i_5_n_0,adder_1__30_carry_i_6_n_0,adder_1__30_carry_i_7_n_0}));
  CARRY4 adder_1__30_carry__0
       (.CI(adder_1__30_carry_n_0),
        .CO({adder_1__30_carry__0_n_0,adder_1__30_carry__0_n_1,adder_1__30_carry__0_n_2,adder_1__30_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({adder_1__30_carry__0_i_1_n_0,adder_1__30_carry__0_i_2_n_0,adder_1__30_carry__0_i_3_n_0,adder_1__30_carry__0_i_4_n_0}),
        .O(adder_1[18:15]),
        .S({adder_1__30_carry__0_i_5_n_0,adder_1__30_carry__0_i_6_n_0,adder_1__30_carry__0_i_7_n_0,adder_1__30_carry__0_i_8_n_0}));
  LUT2 #(
    .INIT(4'h8)) 
    adder_1__30_carry__0_i_1
       (.I0(P[22]),
        .I1(P[12]),
        .O(adder_1__30_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    adder_1__30_carry__0_i_2
       (.I0(P[21]),
        .I1(P[11]),
        .O(adder_1__30_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    adder_1__30_carry__0_i_3
       (.I0(P[20]),
        .I1(P[10]),
        .O(adder_1__30_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    adder_1__30_carry__0_i_4
       (.I0(P[19]),
        .I1(P[9]),
        .O(adder_1__30_carry__0_i_4_n_0));
  LUT4 #(
    .INIT(16'h8778)) 
    adder_1__30_carry__0_i_5
       (.I0(P[12]),
        .I1(P[22]),
        .I2(P[23]),
        .I3(P[13]),
        .O(adder_1__30_carry__0_i_5_n_0));
  LUT4 #(
    .INIT(16'h8778)) 
    adder_1__30_carry__0_i_6
       (.I0(P[11]),
        .I1(P[21]),
        .I2(P[22]),
        .I3(P[12]),
        .O(adder_1__30_carry__0_i_6_n_0));
  LUT4 #(
    .INIT(16'h8778)) 
    adder_1__30_carry__0_i_7
       (.I0(P[10]),
        .I1(P[20]),
        .I2(P[21]),
        .I3(P[11]),
        .O(adder_1__30_carry__0_i_7_n_0));
  LUT4 #(
    .INIT(16'h8778)) 
    adder_1__30_carry__0_i_8
       (.I0(P[9]),
        .I1(P[19]),
        .I2(P[20]),
        .I3(P[10]),
        .O(adder_1__30_carry__0_i_8_n_0));
  CARRY4 adder_1__30_carry__1
       (.CI(adder_1__30_carry__0_n_0),
        .CO({adder_1__30_carry__1_n_0,adder_1__30_carry__1_n_1,adder_1__30_carry__1_n_2,adder_1__30_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({adder_1__30_carry__1_i_1_n_0,adder_1__30_carry__1_i_2_n_0,adder_1__30_carry__1_i_3_n_0,adder_1__30_carry__1_i_4_n_0}),
        .O(adder_1[22:19]),
        .S({adder_1__30_carry__1_i_5_n_0,adder_1__30_carry__1_i_6_n_0,adder_1__30_carry__1_i_7_n_0,adder_1__30_carry__1_i_8_n_0}));
  LUT2 #(
    .INIT(4'h8)) 
    adder_1__30_carry__1_i_1
       (.I0(P[26]),
        .I1(P[16]),
        .O(adder_1__30_carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    adder_1__30_carry__1_i_2
       (.I0(P[25]),
        .I1(P[15]),
        .O(adder_1__30_carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    adder_1__30_carry__1_i_3
       (.I0(P[24]),
        .I1(P[14]),
        .O(adder_1__30_carry__1_i_3_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    adder_1__30_carry__1_i_4
       (.I0(P[23]),
        .I1(P[13]),
        .O(adder_1__30_carry__1_i_4_n_0));
  LUT4 #(
    .INIT(16'h8778)) 
    adder_1__30_carry__1_i_5
       (.I0(P[26]),
        .I1(P[16]),
        .I2(P[27]),
        .I3(P[17]),
        .O(adder_1__30_carry__1_i_5_n_0));
  LUT4 #(
    .INIT(16'h8778)) 
    adder_1__30_carry__1_i_6
       (.I0(P[15]),
        .I1(P[25]),
        .I2(P[26]),
        .I3(P[16]),
        .O(adder_1__30_carry__1_i_6_n_0));
  LUT4 #(
    .INIT(16'h8778)) 
    adder_1__30_carry__1_i_7
       (.I0(P[14]),
        .I1(P[24]),
        .I2(P[25]),
        .I3(P[15]),
        .O(adder_1__30_carry__1_i_7_n_0));
  LUT4 #(
    .INIT(16'h8778)) 
    adder_1__30_carry__1_i_8
       (.I0(P[13]),
        .I1(P[23]),
        .I2(P[24]),
        .I3(P[14]),
        .O(adder_1__30_carry__1_i_8_n_0));
  CARRY4 adder_1__30_carry__2
       (.CI(adder_1__30_carry__1_n_0),
        .CO({adder_1__30_carry__2_n_0,adder_1__30_carry__2_n_1,adder_1__30_carry__2_n_2,adder_1__30_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,P[19],adder_1__30_carry__2_i_1_n_0}),
        .O(adder_1[26:23]),
        .S({P[21:20],adder_1__30_carry__2_i_2_n_0,adder_1__30_carry__2_i_3_n_0}));
  LUT2 #(
    .INIT(4'h8)) 
    adder_1__30_carry__2_i_1
       (.I0(P[27]),
        .I1(P[17]),
        .O(adder_1__30_carry__2_i_1_n_0));
  LUT3 #(
    .INIT(8'h78)) 
    adder_1__30_carry__2_i_2
       (.I0(P[28]),
        .I1(P[18]),
        .I2(P[19]),
        .O(adder_1__30_carry__2_i_2_n_0));
  LUT4 #(
    .INIT(16'h8778)) 
    adder_1__30_carry__2_i_3
       (.I0(P[17]),
        .I1(P[27]),
        .I2(P[28]),
        .I3(P[18]),
        .O(adder_1__30_carry__2_i_3_n_0));
  CARRY4 adder_1__30_carry__3
       (.CI(adder_1__30_carry__2_n_0),
        .CO({adder_1__30_carry__3_n_0,adder_1__30_carry__3_n_1,adder_1__30_carry__3_n_2,adder_1__30_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(adder_1[30:27]),
        .S(P[25:22]));
  CARRY4 adder_1__30_carry__4
       (.CI(adder_1__30_carry__3_n_0),
        .CO({adder_1[34],NLW_adder_1__30_carry__4_CO_UNCONNECTED[2],adder_1__30_carry__4_n_2,adder_1__30_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_adder_1__30_carry__4_O_UNCONNECTED[3],adder_1[33:31]}),
        .S({1'b1,P[28:26]}));
  LUT3 #(
    .INIT(8'hE8)) 
    adder_1__30_carry_i_1
       (.I0(P[18]),
        .I1(P[8]),
        .I2(P[28]),
        .O(adder_1__30_carry_i_1_n_0));
  (* HLUTNM = "lutpair1" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    adder_1__30_carry_i_2
       (.I0(P[27]),
        .I1(P[17]),
        .I2(P[7]),
        .O(adder_1__30_carry_i_2_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    adder_1__30_carry_i_3
       (.I0(P[27]),
        .I1(P[17]),
        .I2(P[7]),
        .O(adder_1__30_carry_i_3_n_0));
  LUT5 #(
    .INIT(32'hE81717E8)) 
    adder_1__30_carry_i_4
       (.I0(P[28]),
        .I1(P[8]),
        .I2(P[18]),
        .I3(P[19]),
        .I4(P[9]),
        .O(adder_1__30_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h6996)) 
    adder_1__30_carry_i_5
       (.I0(adder_1__30_carry_i_2_n_0),
        .I1(P[8]),
        .I2(P[18]),
        .I3(P[28]),
        .O(adder_1__30_carry_i_5_n_0));
  (* HLUTNM = "lutpair1" *) 
  LUT5 #(
    .INIT(32'h69969696)) 
    adder_1__30_carry_i_6
       (.I0(P[27]),
        .I1(P[17]),
        .I2(P[7]),
        .I3(P[6]),
        .I4(P[16]),
        .O(adder_1__30_carry_i_6_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    adder_1__30_carry_i_7
       (.I0(P[16]),
        .I1(P[6]),
        .I2(P[26]),
        .O(adder_1__30_carry_i_7_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \adder_1_temp_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_1[0]),
        .Q(adder_1_temp[0]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_1_temp_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_1[10]),
        .Q(adder_1_temp[10]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_1_temp_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_1[11]),
        .Q(adder_1_temp[11]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_1_temp_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_1[12]),
        .Q(adder_1_temp[12]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_1_temp_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_1[13]),
        .Q(adder_1_temp[13]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_1_temp_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_1[14]),
        .Q(adder_1_temp[14]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_1_temp_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_1[15]),
        .Q(adder_1_temp[15]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_1_temp_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_1[16]),
        .Q(adder_1_temp[16]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_1_temp_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_1[17]),
        .Q(adder_1_temp[17]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_1_temp_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_1[18]),
        .Q(adder_1_temp[18]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_1_temp_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_1[19]),
        .Q(adder_1_temp[19]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_1_temp_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_1[1]),
        .Q(adder_1_temp[1]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_1_temp_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_1[20]),
        .Q(adder_1_temp[20]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_1_temp_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_1[21]),
        .Q(adder_1_temp[21]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_1_temp_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_1[22]),
        .Q(adder_1_temp[22]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_1_temp_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_1[23]),
        .Q(adder_1_temp[23]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_1_temp_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_1[24]),
        .Q(adder_1_temp[24]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_1_temp_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_1[25]),
        .Q(adder_1_temp[25]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_1_temp_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_1[26]),
        .Q(adder_1_temp[26]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_1_temp_reg[27] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_1[27]),
        .Q(adder_1_temp[27]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_1_temp_reg[28] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_1[28]),
        .Q(adder_1_temp[28]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_1_temp_reg[29] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_1[29]),
        .Q(adder_1_temp[29]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_1_temp_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_1[2]),
        .Q(adder_1_temp[2]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_1_temp_reg[30] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_1[30]),
        .Q(adder_1_temp[30]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_1_temp_reg[31] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_1[31]),
        .Q(adder_1_temp[31]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_1_temp_reg[32] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_1[32]),
        .Q(adder_1_temp[32]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_1_temp_reg[33] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_1[33]),
        .Q(adder_1_temp[33]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_1_temp_reg[34] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_1[34]),
        .Q(adder_1_temp[34]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_1_temp_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_1[3]),
        .Q(adder_1_temp[3]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_1_temp_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_1[4]),
        .Q(adder_1_temp[4]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_1_temp_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_1[5]),
        .Q(adder_1_temp[5]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_1_temp_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_1[6]),
        .Q(adder_1_temp[6]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_1_temp_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_1[7]),
        .Q(adder_1_temp[7]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_1_temp_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_1[8]),
        .Q(adder_1_temp[8]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_1_temp_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_1[9]),
        .Q(adder_1_temp[9]),
        .R(reset_IBUF));
  CARRY4 adder_2__0_carry
       (.CI(1'b0),
        .CO({adder_2__0_carry_n_0,adder_2__0_carry_n_1,adder_2__0_carry_n_2,adder_2__0_carry_n_3}),
        .CYINIT(1'b1),
        .DI({adder_2__0_carry_i_1_n_0,adder_2__0_carry_i_2_n_0,adder_2__0_carry_i_3_n_0,1'b1}),
        .O(adder_2[3:0]),
        .S({adder_2__0_carry_i_4_n_0,adder_2__0_carry_i_5_n_0,adder_2__0_carry_i_6_n_0,adder_2__0_carry_i_7_n_0}));
  CARRY4 adder_2__0_carry__0
       (.CI(adder_2__0_carry_n_0),
        .CO({adder_2__0_carry__0_n_0,adder_2__0_carry__0_n_1,adder_2__0_carry__0_n_2,adder_2__0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({adder_2__0_carry__0_i_1_n_0,adder_2__0_carry__0_i_2_n_0,adder_2__0_carry__0_i_3_n_0,adder_2__0_carry__0_i_4_n_0}),
        .O(adder_2[7:4]),
        .S({adder_2__0_carry__0_i_5_n_0,adder_2__0_carry__0_i_6_n_0,adder_2__0_carry__0_i_7_n_0,adder_2__0_carry__0_i_8_n_0}));
  LUT2 #(
    .INIT(4'hB)) 
    adder_2__0_carry__0_i_1
       (.I0(x_temp[6]),
        .I1(adder_1_temp[17]),
        .O(adder_2__0_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    adder_2__0_carry__0_i_2
       (.I0(x_temp[5]),
        .I1(adder_1_temp[16]),
        .O(adder_2__0_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    adder_2__0_carry__0_i_3
       (.I0(x_temp[4]),
        .I1(adder_1_temp[15]),
        .O(adder_2__0_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    adder_2__0_carry__0_i_4
       (.I0(x_temp[3]),
        .I1(adder_1_temp[14]),
        .O(adder_2__0_carry__0_i_4_n_0));
  LUT4 #(
    .INIT(16'hD22D)) 
    adder_2__0_carry__0_i_5
       (.I0(adder_1_temp[17]),
        .I1(x_temp[6]),
        .I2(adder_1_temp[18]),
        .I3(x_temp[7]),
        .O(adder_2__0_carry__0_i_5_n_0));
  LUT4 #(
    .INIT(16'hD22D)) 
    adder_2__0_carry__0_i_6
       (.I0(adder_1_temp[16]),
        .I1(x_temp[5]),
        .I2(adder_1_temp[17]),
        .I3(x_temp[6]),
        .O(adder_2__0_carry__0_i_6_n_0));
  LUT4 #(
    .INIT(16'hD22D)) 
    adder_2__0_carry__0_i_7
       (.I0(adder_1_temp[15]),
        .I1(x_temp[4]),
        .I2(adder_1_temp[16]),
        .I3(x_temp[5]),
        .O(adder_2__0_carry__0_i_7_n_0));
  LUT4 #(
    .INIT(16'hD22D)) 
    adder_2__0_carry__0_i_8
       (.I0(adder_1_temp[14]),
        .I1(x_temp[3]),
        .I2(adder_1_temp[15]),
        .I3(x_temp[4]),
        .O(adder_2__0_carry__0_i_8_n_0));
  CARRY4 adder_2__0_carry__1
       (.CI(adder_2__0_carry__0_n_0),
        .CO({adder_2__0_carry__1_n_0,adder_2__0_carry__1_n_1,adder_2__0_carry__1_n_2,adder_2__0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({adder_2__0_carry__1_i_1_n_0,adder_2__0_carry__1_i_2_n_0,adder_2__0_carry__1_i_3_n_0,adder_2__0_carry__1_i_4_n_0}),
        .O(adder_2[11:8]),
        .S({adder_2__0_carry__1_i_5_n_0,adder_2__0_carry__1_i_6_n_0,adder_2__0_carry__1_i_7_n_0,adder_2__0_carry__1_i_8_n_0}));
  LUT2 #(
    .INIT(4'hB)) 
    adder_2__0_carry__1_i_1
       (.I0(x_temp[10]),
        .I1(adder_1_temp[21]),
        .O(adder_2__0_carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    adder_2__0_carry__1_i_2
       (.I0(x_temp[9]),
        .I1(adder_1_temp[20]),
        .O(adder_2__0_carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    adder_2__0_carry__1_i_3
       (.I0(x_temp[8]),
        .I1(adder_1_temp[19]),
        .O(adder_2__0_carry__1_i_3_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    adder_2__0_carry__1_i_4
       (.I0(x_temp[7]),
        .I1(adder_1_temp[18]),
        .O(adder_2__0_carry__1_i_4_n_0));
  LUT4 #(
    .INIT(16'hD22D)) 
    adder_2__0_carry__1_i_5
       (.I0(adder_1_temp[21]),
        .I1(x_temp[10]),
        .I2(adder_1_temp[22]),
        .I3(x_temp[11]),
        .O(adder_2__0_carry__1_i_5_n_0));
  LUT4 #(
    .INIT(16'hD22D)) 
    adder_2__0_carry__1_i_6
       (.I0(adder_1_temp[20]),
        .I1(x_temp[9]),
        .I2(adder_1_temp[21]),
        .I3(x_temp[10]),
        .O(adder_2__0_carry__1_i_6_n_0));
  LUT4 #(
    .INIT(16'hD22D)) 
    adder_2__0_carry__1_i_7
       (.I0(adder_1_temp[19]),
        .I1(x_temp[8]),
        .I2(adder_1_temp[20]),
        .I3(x_temp[9]),
        .O(adder_2__0_carry__1_i_7_n_0));
  LUT4 #(
    .INIT(16'hD22D)) 
    adder_2__0_carry__1_i_8
       (.I0(adder_1_temp[18]),
        .I1(x_temp[7]),
        .I2(adder_1_temp[19]),
        .I3(x_temp[8]),
        .O(adder_2__0_carry__1_i_8_n_0));
  CARRY4 adder_2__0_carry__2
       (.CI(adder_2__0_carry__1_n_0),
        .CO({adder_2__0_carry__2_n_0,adder_2__0_carry__2_n_1,adder_2__0_carry__2_n_2,adder_2__0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({adder_2__0_carry__2_i_1_n_0,adder_2__0_carry__2_i_2_n_0,adder_2__0_carry__2_i_3_n_0,adder_2__0_carry__2_i_4_n_0}),
        .O(adder_2[15:12]),
        .S({adder_2__0_carry__2_i_5_n_0,adder_2__0_carry__2_i_6_n_0,adder_2__0_carry__2_i_7_n_0,adder_2__0_carry__2_i_8_n_0}));
  LUT2 #(
    .INIT(4'hB)) 
    adder_2__0_carry__2_i_1
       (.I0(x_temp[14]),
        .I1(adder_1_temp[25]),
        .O(adder_2__0_carry__2_i_1_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    adder_2__0_carry__2_i_2
       (.I0(x_temp[13]),
        .I1(adder_1_temp[24]),
        .O(adder_2__0_carry__2_i_2_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    adder_2__0_carry__2_i_3
       (.I0(x_temp[12]),
        .I1(adder_1_temp[23]),
        .O(adder_2__0_carry__2_i_3_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    adder_2__0_carry__2_i_4
       (.I0(x_temp[11]),
        .I1(adder_1_temp[22]),
        .O(adder_2__0_carry__2_i_4_n_0));
  LUT4 #(
    .INIT(16'hD22D)) 
    adder_2__0_carry__2_i_5
       (.I0(adder_1_temp[25]),
        .I1(x_temp[14]),
        .I2(adder_1_temp[26]),
        .I3(x_temp[15]),
        .O(adder_2__0_carry__2_i_5_n_0));
  LUT4 #(
    .INIT(16'hD22D)) 
    adder_2__0_carry__2_i_6
       (.I0(adder_1_temp[24]),
        .I1(x_temp[13]),
        .I2(adder_1_temp[25]),
        .I3(x_temp[14]),
        .O(adder_2__0_carry__2_i_6_n_0));
  LUT4 #(
    .INIT(16'hD22D)) 
    adder_2__0_carry__2_i_7
       (.I0(adder_1_temp[23]),
        .I1(x_temp[12]),
        .I2(adder_1_temp[24]),
        .I3(x_temp[13]),
        .O(adder_2__0_carry__2_i_7_n_0));
  LUT4 #(
    .INIT(16'hD22D)) 
    adder_2__0_carry__2_i_8
       (.I0(adder_1_temp[22]),
        .I1(x_temp[11]),
        .I2(adder_1_temp[23]),
        .I3(x_temp[12]),
        .O(adder_2__0_carry__2_i_8_n_0));
  CARRY4 adder_2__0_carry__3
       (.CI(adder_2__0_carry__2_n_0),
        .CO({adder_2__0_carry__3_n_0,adder_2__0_carry__3_n_1,adder_2__0_carry__3_n_2,adder_2__0_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({adder_2__0_carry__3_i_1_n_0,adder_2__0_carry__3_i_2_n_0,adder_2__0_carry__3_i_3_n_0,adder_2__0_carry__3_i_4_n_0}),
        .O(adder_2[19:16]),
        .S({adder_2__0_carry__3_i_5_n_0,adder_2__0_carry__3_i_6_n_0,adder_2__0_carry__3_i_7_n_0,adder_2__0_carry__3_i_8_n_0}));
  LUT2 #(
    .INIT(4'hB)) 
    adder_2__0_carry__3_i_1
       (.I0(x_temp[18]),
        .I1(adder_1_temp[29]),
        .O(adder_2__0_carry__3_i_1_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    adder_2__0_carry__3_i_2
       (.I0(x_temp[17]),
        .I1(adder_1_temp[28]),
        .O(adder_2__0_carry__3_i_2_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    adder_2__0_carry__3_i_3
       (.I0(x_temp[16]),
        .I1(adder_1_temp[27]),
        .O(adder_2__0_carry__3_i_3_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    adder_2__0_carry__3_i_4
       (.I0(x_temp[15]),
        .I1(adder_1_temp[26]),
        .O(adder_2__0_carry__3_i_4_n_0));
  LUT4 #(
    .INIT(16'hD22D)) 
    adder_2__0_carry__3_i_5
       (.I0(adder_1_temp[29]),
        .I1(x_temp[18]),
        .I2(adder_1_temp[30]),
        .I3(x_temp[19]),
        .O(adder_2__0_carry__3_i_5_n_0));
  LUT4 #(
    .INIT(16'hD22D)) 
    adder_2__0_carry__3_i_6
       (.I0(adder_1_temp[28]),
        .I1(x_temp[17]),
        .I2(adder_1_temp[29]),
        .I3(x_temp[18]),
        .O(adder_2__0_carry__3_i_6_n_0));
  LUT4 #(
    .INIT(16'hD22D)) 
    adder_2__0_carry__3_i_7
       (.I0(adder_1_temp[27]),
        .I1(x_temp[16]),
        .I2(adder_1_temp[28]),
        .I3(x_temp[17]),
        .O(adder_2__0_carry__3_i_7_n_0));
  LUT4 #(
    .INIT(16'hD22D)) 
    adder_2__0_carry__3_i_8
       (.I0(adder_1_temp[26]),
        .I1(x_temp[15]),
        .I2(adder_1_temp[27]),
        .I3(x_temp[16]),
        .O(adder_2__0_carry__3_i_8_n_0));
  CARRY4 adder_2__0_carry__4
       (.CI(adder_2__0_carry__3_n_0),
        .CO({adder_2__0_carry__4_n_0,adder_2__0_carry__4_n_1,adder_2__0_carry__4_n_2,adder_2__0_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI({adder_1_temp[34],adder_2__0_carry__4_i_1_n_0,adder_2__0_carry__4_i_2_n_0,adder_2__0_carry__4_i_3_n_0}),
        .O(adder_2[23:20]),
        .S({adder_2__0_carry__4_i_4_n_0,adder_2__0_carry__4_i_5_n_0,adder_2__0_carry__4_i_6_n_0,adder_2__0_carry__4_i_7_n_0}));
  LUT2 #(
    .INIT(4'hB)) 
    adder_2__0_carry__4_i_1
       (.I0(x_temp[21]),
        .I1(adder_1_temp[32]),
        .O(adder_2__0_carry__4_i_1_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    adder_2__0_carry__4_i_2
       (.I0(x_temp[20]),
        .I1(adder_1_temp[31]),
        .O(adder_2__0_carry__4_i_2_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    adder_2__0_carry__4_i_3
       (.I0(x_temp[19]),
        .I1(adder_1_temp[30]),
        .O(adder_2__0_carry__4_i_3_n_0));
  LUT3 #(
    .INIT(8'h2D)) 
    adder_2__0_carry__4_i_4
       (.I0(adder_1_temp[33]),
        .I1(x_temp[22]),
        .I2(adder_1_temp[34]),
        .O(adder_2__0_carry__4_i_4_n_0));
  LUT4 #(
    .INIT(16'hD22D)) 
    adder_2__0_carry__4_i_5
       (.I0(adder_1_temp[32]),
        .I1(x_temp[21]),
        .I2(adder_1_temp[33]),
        .I3(x_temp[22]),
        .O(adder_2__0_carry__4_i_5_n_0));
  LUT4 #(
    .INIT(16'hD22D)) 
    adder_2__0_carry__4_i_6
       (.I0(adder_1_temp[31]),
        .I1(x_temp[20]),
        .I2(adder_1_temp[32]),
        .I3(x_temp[21]),
        .O(adder_2__0_carry__4_i_6_n_0));
  LUT4 #(
    .INIT(16'hD22D)) 
    adder_2__0_carry__4_i_7
       (.I0(adder_1_temp[30]),
        .I1(x_temp[19]),
        .I2(adder_1_temp[31]),
        .I3(x_temp[20]),
        .O(adder_2__0_carry__4_i_7_n_0));
  CARRY4 adder_2__0_carry__5
       (.CI(adder_2__0_carry__4_n_0),
        .CO({NLW_adder_2__0_carry__5_CO_UNCONNECTED[3:1],adder_2__0_carry__5_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_adder_2__0_carry__5_O_UNCONNECTED[3:2],adder_2[25:24]}),
        .S({1'b0,1'b0,1'b1,adder_2__0_carry__5_i_1_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    adder_2__0_carry__5_i_1
       (.I0(adder_1_temp[34]),
        .O(adder_2__0_carry__5_i_1_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    adder_2__0_carry_i_1
       (.I0(x_temp[2]),
        .I1(adder_1_temp[13]),
        .O(adder_2__0_carry_i_1_n_0));
  LUT3 #(
    .INIT(8'h71)) 
    adder_2__0_carry_i_2
       (.I0(adder_1_temp[12]),
        .I1(adder_1_temp[10]),
        .I2(x_temp[1]),
        .O(adder_2__0_carry_i_2_n_0));
  (* HLUTNM = "lutpair2" *) 
  LUT3 #(
    .INIT(8'h71)) 
    adder_2__0_carry_i_3
       (.I0(adder_1_temp[11]),
        .I1(adder_1_temp[9]),
        .I2(x_temp[0]),
        .O(adder_2__0_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'hD22D)) 
    adder_2__0_carry_i_4
       (.I0(adder_1_temp[13]),
        .I1(x_temp[2]),
        .I2(adder_1_temp[14]),
        .I3(x_temp[3]),
        .O(adder_2__0_carry_i_4_n_0));
  LUT5 #(
    .INIT(32'h2BD4D42B)) 
    adder_2__0_carry_i_5
       (.I0(x_temp[1]),
        .I1(adder_1_temp[10]),
        .I2(adder_1_temp[12]),
        .I3(adder_1_temp[13]),
        .I4(x_temp[2]),
        .O(adder_2__0_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h6996)) 
    adder_2__0_carry_i_6
       (.I0(adder_2__0_carry_i_3_n_0),
        .I1(adder_1_temp[10]),
        .I2(adder_1_temp[12]),
        .I3(x_temp[1]),
        .O(adder_2__0_carry_i_6_n_0));
  (* HLUTNM = "lutpair2" *) 
  LUT3 #(
    .INIT(8'h69)) 
    adder_2__0_carry_i_7
       (.I0(adder_1_temp[11]),
        .I1(adder_1_temp[9]),
        .I2(x_temp[0]),
        .O(adder_2__0_carry_i_7_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \adder_2_temp_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_2[0]),
        .Q(adder_2_temp[0]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_2_temp_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_2[10]),
        .Q(adder_2_temp[10]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_2_temp_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_2[11]),
        .Q(adder_2_temp[11]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_2_temp_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_2[12]),
        .Q(adder_2_temp[12]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_2_temp_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_2[13]),
        .Q(adder_2_temp[13]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_2_temp_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_2[14]),
        .Q(adder_2_temp[14]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_2_temp_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_2[15]),
        .Q(adder_2_temp[15]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_2_temp_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_2[16]),
        .Q(adder_2_temp[16]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_2_temp_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_2[17]),
        .Q(adder_2_temp[17]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_2_temp_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_2[18]),
        .Q(adder_2_temp[18]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_2_temp_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_2[19]),
        .Q(adder_2_temp[19]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_2_temp_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_2[1]),
        .Q(adder_2_temp[1]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_2_temp_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_2[20]),
        .Q(adder_2_temp[20]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_2_temp_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_2[21]),
        .Q(adder_2_temp[21]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_2_temp_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_2[22]),
        .Q(adder_2_temp[22]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_2_temp_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_2[23]),
        .Q(adder_2_temp[23]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_2_temp_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_2[24]),
        .Q(adder_2_temp[24]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_2_temp_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_2[25]),
        .Q(adder_2_temp[25]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_2_temp_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_2[2]),
        .Q(adder_2_temp[2]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_2_temp_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_2[3]),
        .Q(adder_2_temp[3]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_2_temp_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_2[4]),
        .Q(adder_2_temp[4]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_2_temp_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_2[5]),
        .Q(adder_2_temp[5]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_2_temp_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_2[6]),
        .Q(adder_2_temp[6]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_2_temp_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_2[7]),
        .Q(adder_2_temp[7]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_2_temp_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_2[8]),
        .Q(adder_2_temp[8]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_2_temp_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_2[9]),
        .Q(adder_2_temp[9]),
        .R(reset_IBUF));
  LUT2 #(
    .INIT(4'h8)) 
    \adder_3_temp[16]_i_2 
       (.I0(temp_0[15]),
        .I1(adder_2_temp[15]),
        .O(\adder_3_temp[16]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hE8)) 
    \adder_3_temp[16]_i_3 
       (.I0(temp_0[14]),
        .I1(temp_1[14]),
        .I2(adder_2_temp[14]),
        .O(\adder_3_temp[16]_i_3_n_0 ));
  (* HLUTNM = "lutpair0" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    \adder_3_temp[16]_i_4 
       (.I0(temp_0[13]),
        .I1(temp_1[13]),
        .I2(adder_2_temp[13]),
        .O(\adder_3_temp[16]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h8778)) 
    \adder_3_temp[16]_i_5 
       (.I0(adder_2_temp[15]),
        .I1(temp_0[15]),
        .I2(temp_0[16]),
        .I3(adder_2_temp[16]),
        .O(\adder_3_temp[16]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hE81717E8)) 
    \adder_3_temp[16]_i_6 
       (.I0(adder_2_temp[14]),
        .I1(temp_1[14]),
        .I2(temp_0[14]),
        .I3(temp_0[15]),
        .I4(adder_2_temp[15]),
        .O(\adder_3_temp[16]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h6996)) 
    \adder_3_temp[16]_i_7 
       (.I0(\adder_3_temp[16]_i_4_n_0 ),
        .I1(temp_1[14]),
        .I2(temp_0[14]),
        .I3(adder_2_temp[14]),
        .O(\adder_3_temp[16]_i_7_n_0 ));
  (* HLUTNM = "lutpair0" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \adder_3_temp[16]_i_8 
       (.I0(temp_0[13]),
        .I1(temp_1[13]),
        .I2(adder_2_temp[13]),
        .O(\adder_3_temp[16]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \adder_3_temp[20]_i_2 
       (.I0(temp_0[19]),
        .I1(adder_2_temp[19]),
        .O(\adder_3_temp[20]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \adder_3_temp[20]_i_3 
       (.I0(temp_0[18]),
        .I1(adder_2_temp[18]),
        .O(\adder_3_temp[20]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \adder_3_temp[20]_i_4 
       (.I0(temp_0[17]),
        .I1(adder_2_temp[17]),
        .O(\adder_3_temp[20]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \adder_3_temp[20]_i_5 
       (.I0(temp_0[16]),
        .I1(adder_2_temp[16]),
        .O(\adder_3_temp[20]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h8778)) 
    \adder_3_temp[20]_i_6 
       (.I0(adder_2_temp[19]),
        .I1(temp_0[19]),
        .I2(temp_0[20]),
        .I3(adder_2_temp[20]),
        .O(\adder_3_temp[20]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h8778)) 
    \adder_3_temp[20]_i_7 
       (.I0(adder_2_temp[18]),
        .I1(temp_0[18]),
        .I2(temp_0[19]),
        .I3(adder_2_temp[19]),
        .O(\adder_3_temp[20]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h8778)) 
    \adder_3_temp[20]_i_8 
       (.I0(adder_2_temp[17]),
        .I1(temp_0[17]),
        .I2(temp_0[18]),
        .I3(adder_2_temp[18]),
        .O(\adder_3_temp[20]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h8778)) 
    \adder_3_temp[20]_i_9 
       (.I0(adder_2_temp[16]),
        .I1(temp_0[16]),
        .I2(temp_0[17]),
        .I3(adder_2_temp[17]),
        .O(\adder_3_temp[20]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \adder_3_temp[24]_i_2 
       (.I0(temp_0[21]),
        .I1(adder_2_temp[21]),
        .O(\adder_3_temp[24]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \adder_3_temp[24]_i_3 
       (.I0(temp_0[20]),
        .I1(adder_2_temp[20]),
        .O(\adder_3_temp[24]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h78)) 
    \adder_3_temp[24]_i_4 
       (.I0(adder_2_temp[22]),
        .I1(temp_0[22]),
        .I2(adder_2_temp[23]),
        .O(\adder_3_temp[24]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h8778)) 
    \adder_3_temp[24]_i_5 
       (.I0(adder_2_temp[21]),
        .I1(temp_0[21]),
        .I2(temp_0[22]),
        .I3(adder_2_temp[22]),
        .O(\adder_3_temp[24]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h8778)) 
    \adder_3_temp[24]_i_6 
       (.I0(adder_2_temp[20]),
        .I1(temp_0[20]),
        .I2(temp_0[21]),
        .I3(adder_2_temp[21]),
        .O(\adder_3_temp[24]_i_6_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \adder_3_temp_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_2_temp[0]),
        .Q(\adder_3_temp_reg_n_0_[0] ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_3_temp_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_2_temp[10]),
        .Q(\adder_3_temp_reg_n_0_[10] ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_3_temp_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_2_temp[11]),
        .Q(\adder_3_temp_reg_n_0_[11] ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_3_temp_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_2_temp[12]),
        .Q(\adder_3_temp_reg_n_0_[12] ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_3_temp_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_3[13]),
        .Q(\adder_3_temp_reg_n_0_[13] ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_3_temp_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_3[14]),
        .Q(\adder_3_temp_reg_n_0_[14] ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_3_temp_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_3[15]),
        .Q(\adder_3_temp_reg_n_0_[15] ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_3_temp_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_3[16]),
        .Q(\adder_3_temp_reg_n_0_[16] ),
        .R(reset_IBUF));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \adder_3_temp_reg[16]_i_1 
       (.CI(1'b0),
        .CO({\adder_3_temp_reg[16]_i_1_n_0 ,\adder_3_temp_reg[16]_i_1_n_1 ,\adder_3_temp_reg[16]_i_1_n_2 ,\adder_3_temp_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({\adder_3_temp[16]_i_2_n_0 ,\adder_3_temp[16]_i_3_n_0 ,\adder_3_temp[16]_i_4_n_0 ,1'b0}),
        .O(adder_3[16:13]),
        .S({\adder_3_temp[16]_i_5_n_0 ,\adder_3_temp[16]_i_6_n_0 ,\adder_3_temp[16]_i_7_n_0 ,\adder_3_temp[16]_i_8_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \adder_3_temp_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_3[17]),
        .Q(\adder_3_temp_reg_n_0_[17] ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_3_temp_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_3[18]),
        .Q(\adder_3_temp_reg_n_0_[18] ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_3_temp_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_3[19]),
        .Q(\adder_3_temp_reg_n_0_[19] ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_3_temp_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_2_temp[1]),
        .Q(\adder_3_temp_reg_n_0_[1] ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_3_temp_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_3[20]),
        .Q(\adder_3_temp_reg_n_0_[20] ),
        .R(reset_IBUF));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \adder_3_temp_reg[20]_i_1 
       (.CI(\adder_3_temp_reg[16]_i_1_n_0 ),
        .CO({\adder_3_temp_reg[20]_i_1_n_0 ,\adder_3_temp_reg[20]_i_1_n_1 ,\adder_3_temp_reg[20]_i_1_n_2 ,\adder_3_temp_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({\adder_3_temp[20]_i_2_n_0 ,\adder_3_temp[20]_i_3_n_0 ,\adder_3_temp[20]_i_4_n_0 ,\adder_3_temp[20]_i_5_n_0 }),
        .O(adder_3[20:17]),
        .S({\adder_3_temp[20]_i_6_n_0 ,\adder_3_temp[20]_i_7_n_0 ,\adder_3_temp[20]_i_8_n_0 ,\adder_3_temp[20]_i_9_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \adder_3_temp_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_3[21]),
        .Q(\adder_3_temp_reg_n_0_[21] ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_3_temp_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_3[22]),
        .Q(\adder_3_temp_reg_n_0_[22] ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_3_temp_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_3[23]),
        .Q(\adder_3_temp_reg_n_0_[23] ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_3_temp_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_3[24]),
        .Q(\adder_3_temp_reg_n_0_[24] ),
        .R(reset_IBUF));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \adder_3_temp_reg[24]_i_1 
       (.CI(\adder_3_temp_reg[20]_i_1_n_0 ),
        .CO({\adder_3_temp_reg[24]_i_1_n_0 ,\adder_3_temp_reg[24]_i_1_n_1 ,\adder_3_temp_reg[24]_i_1_n_2 ,\adder_3_temp_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,adder_2_temp[23],\adder_3_temp[24]_i_2_n_0 ,\adder_3_temp[24]_i_3_n_0 }),
        .O(adder_3[24:21]),
        .S({adder_2_temp[24],\adder_3_temp[24]_i_4_n_0 ,\adder_3_temp[24]_i_5_n_0 ,\adder_3_temp[24]_i_6_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \adder_3_temp_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_3[25]),
        .Q(\adder_3_temp_reg_n_0_[25] ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_3_temp_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_3[26]),
        .Q(\adder_3_temp_reg_n_0_[26] ),
        .R(reset_IBUF));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \adder_3_temp_reg[26]_i_1 
       (.CI(\adder_3_temp_reg[24]_i_1_n_0 ),
        .CO({\NLW_adder_3_temp_reg[26]_i_1_CO_UNCONNECTED [3:1],\adder_3_temp_reg[26]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_adder_3_temp_reg[26]_i_1_O_UNCONNECTED [3:2],adder_3[26:25]}),
        .S({1'b0,1'b0,adder_2_temp[25],adder_2_temp[25]}));
  FDRE #(
    .INIT(1'b0)) 
    \adder_3_temp_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_2_temp[2]),
        .Q(\adder_3_temp_reg_n_0_[2] ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_3_temp_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_2_temp[3]),
        .Q(\adder_3_temp_reg_n_0_[3] ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_3_temp_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_2_temp[4]),
        .Q(\adder_3_temp_reg_n_0_[4] ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_3_temp_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_2_temp[5]),
        .Q(\adder_3_temp_reg_n_0_[5] ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_3_temp_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_2_temp[6]),
        .Q(\adder_3_temp_reg_n_0_[6] ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_3_temp_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_2_temp[7]),
        .Q(\adder_3_temp_reg_n_0_[7] ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_3_temp_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_2_temp[8]),
        .Q(\adder_3_temp_reg_n_0_[8] ),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \adder_3_temp_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_2_temp[9]),
        .Q(\adder_3_temp_reg_n_0_[9] ),
        .R(reset_IBUF));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 adder_4_carry
       (.CI(1'b0),
        .CO({adder_4_carry_n_0,adder_4_carry_n_1,adder_4_carry_n_2,adder_4_carry_n_3}),
        .CYINIT(\adder_3_temp_reg_n_0_[0] ),
        .DI({\adder_3_temp_reg_n_0_[3] ,\adder_3_temp_reg_n_0_[2] ,sel,\adder_3_temp_reg_n_0_[1] }),
        .O(adder_4__66[4:1]),
        .S({adder_4_carry_i_2_n_0,adder_4_carry_i_3_n_0,adder_4_carry_i_4_n_0,adder_4_carry_i_5_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 adder_4_carry__0
       (.CI(adder_4_carry_n_0),
        .CO({adder_4_carry__0_n_0,adder_4_carry__0_n_1,adder_4_carry__0_n_2,adder_4_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({\adder_3_temp_reg_n_0_[7] ,\adder_3_temp_reg_n_0_[6] ,\adder_3_temp_reg_n_0_[5] ,\adder_3_temp_reg_n_0_[4] }),
        .O(adder_4__66[8:5]),
        .S({adder_4_carry__0_i_1_n_0,adder_4_carry__0_i_2_n_0,adder_4_carry__0_i_3_n_0,adder_4_carry__0_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    adder_4_carry__0_i_1
       (.I0(\adder_3_temp_reg_n_0_[7] ),
        .I1(\adder_3_temp_reg_n_0_[8] ),
        .O(adder_4_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    adder_4_carry__0_i_2
       (.I0(\adder_3_temp_reg_n_0_[6] ),
        .I1(\adder_3_temp_reg_n_0_[7] ),
        .O(adder_4_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    adder_4_carry__0_i_3
       (.I0(\adder_3_temp_reg_n_0_[5] ),
        .I1(\adder_3_temp_reg_n_0_[6] ),
        .O(adder_4_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    adder_4_carry__0_i_4
       (.I0(\adder_3_temp_reg_n_0_[4] ),
        .I1(\adder_3_temp_reg_n_0_[5] ),
        .O(adder_4_carry__0_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 adder_4_carry__1
       (.CI(adder_4_carry__0_n_0),
        .CO({adder_4_carry__1_n_0,adder_4_carry__1_n_1,adder_4_carry__1_n_2,adder_4_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({\adder_3_temp_reg_n_0_[11] ,\adder_3_temp_reg_n_0_[10] ,\adder_3_temp_reg_n_0_[9] ,\adder_3_temp_reg_n_0_[8] }),
        .O(adder_4__66[12:9]),
        .S({adder_4_carry__1_i_1_n_0,adder_4_carry__1_i_2_n_0,adder_4_carry__1_i_3_n_0,adder_4_carry__1_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    adder_4_carry__1_i_1
       (.I0(\adder_3_temp_reg_n_0_[11] ),
        .I1(\adder_3_temp_reg_n_0_[12] ),
        .O(adder_4_carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    adder_4_carry__1_i_2
       (.I0(\adder_3_temp_reg_n_0_[10] ),
        .I1(\adder_3_temp_reg_n_0_[11] ),
        .O(adder_4_carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    adder_4_carry__1_i_3
       (.I0(\adder_3_temp_reg_n_0_[9] ),
        .I1(\adder_3_temp_reg_n_0_[10] ),
        .O(adder_4_carry__1_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    adder_4_carry__1_i_4
       (.I0(\adder_3_temp_reg_n_0_[8] ),
        .I1(\adder_3_temp_reg_n_0_[9] ),
        .O(adder_4_carry__1_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 adder_4_carry__2
       (.CI(adder_4_carry__1_n_0),
        .CO({adder_4_carry__2_n_0,adder_4_carry__2_n_1,adder_4_carry__2_n_2,adder_4_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({\adder_3_temp_reg_n_0_[15] ,\adder_3_temp_reg_n_0_[14] ,adder_4_carry__2_i_1_n_0,\adder_3_temp_reg_n_0_[13] }),
        .O(adder_4__66[16:13]),
        .S({adder_4_carry__2_i_2_n_0,adder_4_carry__2_i_3_n_0,adder_4_carry__2_i_4_n_0,adder_4_carry__2_i_5_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    adder_4_carry__2_i_1
       (.I0(sel),
        .O(adder_4_carry__2_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    adder_4_carry__2_i_2
       (.I0(\adder_3_temp_reg_n_0_[15] ),
        .I1(\adder_3_temp_reg_n_0_[16] ),
        .O(adder_4_carry__2_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    adder_4_carry__2_i_3
       (.I0(\adder_3_temp_reg_n_0_[14] ),
        .I1(\adder_3_temp_reg_n_0_[15] ),
        .O(adder_4_carry__2_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    adder_4_carry__2_i_4
       (.I0(sel),
        .I1(\adder_3_temp_reg_n_0_[14] ),
        .O(adder_4_carry__2_i_4_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    adder_4_carry__2_i_5
       (.I0(\adder_3_temp_reg_n_0_[13] ),
        .I1(\adder_3_temp_reg_n_0_[12] ),
        .O(adder_4_carry__2_i_5_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 adder_4_carry__3
       (.CI(adder_4_carry__2_n_0),
        .CO({adder_4_carry__3_n_0,adder_4_carry__3_n_1,adder_4_carry__3_n_2,adder_4_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({\adder_3_temp_reg_n_0_[19] ,\adder_3_temp_reg_n_0_[18] ,\adder_3_temp_reg_n_0_[17] ,\adder_3_temp_reg_n_0_[16] }),
        .O(adder_4__66[20:17]),
        .S({adder_4_carry__3_i_1_n_0,adder_4_carry__3_i_2_n_0,adder_4_carry__3_i_3_n_0,adder_4_carry__3_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    adder_4_carry__3_i_1
       (.I0(\adder_3_temp_reg_n_0_[19] ),
        .I1(\adder_3_temp_reg_n_0_[20] ),
        .O(adder_4_carry__3_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    adder_4_carry__3_i_2
       (.I0(\adder_3_temp_reg_n_0_[18] ),
        .I1(\adder_3_temp_reg_n_0_[19] ),
        .O(adder_4_carry__3_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    adder_4_carry__3_i_3
       (.I0(\adder_3_temp_reg_n_0_[17] ),
        .I1(\adder_3_temp_reg_n_0_[18] ),
        .O(adder_4_carry__3_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    adder_4_carry__3_i_4
       (.I0(\adder_3_temp_reg_n_0_[16] ),
        .I1(\adder_3_temp_reg_n_0_[17] ),
        .O(adder_4_carry__3_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 adder_4_carry__4
       (.CI(adder_4_carry__3_n_0),
        .CO({NLW_adder_4_carry__4_CO_UNCONNECTED[3:2],adder_4_carry__4_n_2,adder_4_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,\adder_3_temp_reg_n_0_[21] ,\adder_3_temp_reg_n_0_[20] }),
        .O({NLW_adder_4_carry__4_O_UNCONNECTED[3],adder_4__66[23:21]}),
        .S({1'b0,adder_4_carry__4_i_1_n_0,adder_4_carry__4_i_2_n_0,adder_4_carry__4_i_3_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    adder_4_carry__4_i_1
       (.I0(\adder_3_temp_reg_n_0_[22] ),
        .I1(\adder_3_temp_reg_n_0_[23] ),
        .O(adder_4_carry__4_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    adder_4_carry__4_i_2
       (.I0(\adder_3_temp_reg_n_0_[21] ),
        .I1(\adder_3_temp_reg_n_0_[22] ),
        .O(adder_4_carry__4_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    adder_4_carry__4_i_3
       (.I0(\adder_3_temp_reg_n_0_[20] ),
        .I1(\adder_3_temp_reg_n_0_[21] ),
        .O(adder_4_carry__4_i_3_n_0));
  LUT6 #(
    .INIT(64'hFFFEAAAAAAAAAAAA)) 
    adder_4_carry_i_1
       (.I0(adder_4_carry_i_6_n_0),
        .I1(adder_4_carry_i_7_n_0),
        .I2(adder_4_carry_i_8_n_0),
        .I3(adder_4_carry_i_9_n_0),
        .I4(adder_4_carry_i_10_n_0),
        .I5(adder_4_carry_i_11_n_0),
        .O(sel));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    adder_4_carry_i_10
       (.I0(\adder_3_temp_reg_n_0_[18] ),
        .I1(\adder_3_temp_reg_n_0_[19] ),
        .I2(\adder_3_temp_reg_n_0_[20] ),
        .I3(\adder_3_temp_reg_n_0_[21] ),
        .I4(\adder_3_temp_reg_n_0_[23] ),
        .I5(\adder_3_temp_reg_n_0_[22] ),
        .O(adder_4_carry_i_10_n_0));
  LUT4 #(
    .INIT(16'h8000)) 
    adder_4_carry_i_11
       (.I0(\adder_3_temp_reg_n_0_[15] ),
        .I1(\adder_3_temp_reg_n_0_[14] ),
        .I2(\adder_3_temp_reg_n_0_[17] ),
        .I3(\adder_3_temp_reg_n_0_[16] ),
        .O(adder_4_carry_i_11_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    adder_4_carry_i_2
       (.I0(\adder_3_temp_reg_n_0_[3] ),
        .I1(\adder_3_temp_reg_n_0_[4] ),
        .O(adder_4_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    adder_4_carry_i_3
       (.I0(\adder_3_temp_reg_n_0_[2] ),
        .I1(\adder_3_temp_reg_n_0_[3] ),
        .O(adder_4_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    adder_4_carry_i_4
       (.I0(sel),
        .I1(\adder_3_temp_reg_n_0_[2] ),
        .O(adder_4_carry_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    adder_4_carry_i_5
       (.I0(sel),
        .I1(\adder_3_temp_reg_n_0_[1] ),
        .O(adder_4_carry_i_5_n_0));
  LUT3 #(
    .INIT(8'hFE)) 
    adder_4_carry_i_6
       (.I0(\adder_3_temp_reg_n_0_[25] ),
        .I1(\adder_3_temp_reg_n_0_[24] ),
        .I2(\adder_3_temp_reg_n_0_[26] ),
        .O(adder_4_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    adder_4_carry_i_7
       (.I0(\adder_3_temp_reg_n_0_[2] ),
        .I1(\adder_3_temp_reg_n_0_[8] ),
        .I2(\adder_3_temp_reg_n_0_[6] ),
        .I3(\adder_3_temp_reg_n_0_[5] ),
        .O(adder_4_carry_i_7_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    adder_4_carry_i_8
       (.I0(\adder_3_temp_reg_n_0_[9] ),
        .I1(\adder_3_temp_reg_n_0_[12] ),
        .I2(\adder_3_temp_reg_n_0_[7] ),
        .I3(\adder_3_temp_reg_n_0_[10] ),
        .O(adder_4_carry_i_8_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    adder_4_carry_i_9
       (.I0(\adder_3_temp_reg_n_0_[13] ),
        .I1(\adder_3_temp_reg_n_0_[3] ),
        .I2(\adder_3_temp_reg_n_0_[4] ),
        .I3(\adder_3_temp_reg_n_0_[11] ),
        .I4(\adder_3_temp_reg_n_0_[1] ),
        .O(adder_4_carry_i_9_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \concatenate_temp_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_0_temp),
        .Q(temp_0[13]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \concatenate_temp_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_1_temp[9]),
        .Q(temp_1[13]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \concatenate_temp_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_1_temp[10]),
        .Q(temp_1[14]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \concatenate_temp_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_1_temp[0]),
        .Q(temp_0[14]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \concatenate_temp_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_1_temp[1]),
        .Q(temp_0[15]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \concatenate_temp_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_1_temp[2]),
        .Q(temp_0[16]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \concatenate_temp_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_1_temp[3]),
        .Q(temp_0[17]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \concatenate_temp_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_1_temp[4]),
        .Q(temp_0[18]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \concatenate_temp_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_1_temp[5]),
        .Q(temp_0[19]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \concatenate_temp_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_1_temp[6]),
        .Q(temp_0[20]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \concatenate_temp_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_1_temp[7]),
        .Q(temp_0[21]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \concatenate_temp_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(adder_1_temp[8]),
        .Q(temp_0[22]),
        .R(reset_IBUF));
  LUT5 #(
    .INIT(32'h20202F20)) 
    i___1_carry__0_i_1
       (.I0(a_IBUF[6]),
        .I1(b_IBUF[6]),
        .I2(mode_IBUF),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [6]),
        .I4(Q[6]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][6] [3]));
  LUT5 #(
    .INIT(32'h20202F20)) 
    i___1_carry__0_i_2
       (.I0(a_IBUF[5]),
        .I1(b_IBUF[5]),
        .I2(mode_IBUF),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [5]),
        .I4(Q[5]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][6] [2]));
  LUT5 #(
    .INIT(32'h20202F20)) 
    i___1_carry__0_i_3
       (.I0(a_IBUF[4]),
        .I1(b_IBUF[4]),
        .I2(mode_IBUF),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [4]),
        .I4(Q[4]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][6] [1]));
  LUT5 #(
    .INIT(32'h20202F20)) 
    i___1_carry__0_i_4
       (.I0(a_IBUF[3]),
        .I1(b_IBUF[3]),
        .I2(mode_IBUF),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [3]),
        .I4(Q[3]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][6] [0]));
  LUT6 #(
    .INIT(64'h5569AA69AA695569)) 
    i___1_carry__0_i_5
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][6] [3]),
        .I1(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [7]),
        .I2(Q[7]),
        .I3(mode_IBUF),
        .I4(b_IBUF[7]),
        .I5(a_IBUF[7]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][7]_1 [3]));
  LUT6 #(
    .INIT(64'h5569AA69AA695569)) 
    i___1_carry__0_i_6
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][6] [2]),
        .I1(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [6]),
        .I2(Q[6]),
        .I3(mode_IBUF),
        .I4(b_IBUF[6]),
        .I5(a_IBUF[6]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][7]_1 [2]));
  LUT6 #(
    .INIT(64'h5569AA69AA695569)) 
    i___1_carry__0_i_7
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][6] [1]),
        .I1(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [5]),
        .I2(Q[5]),
        .I3(mode_IBUF),
        .I4(a_IBUF[5]),
        .I5(b_IBUF[5]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][7]_1 [1]));
  LUT6 #(
    .INIT(64'h5569AA69AA695569)) 
    i___1_carry__0_i_8
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][6] [0]),
        .I1(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [4]),
        .I2(Q[4]),
        .I3(mode_IBUF),
        .I4(b_IBUF[4]),
        .I5(a_IBUF[4]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][7]_1 [0]));
  LUT5 #(
    .INIT(32'h20202F20)) 
    i___1_carry__1_i_1
       (.I0(a_IBUF[10]),
        .I1(b_IBUF[10]),
        .I2(mode_IBUF),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [10]),
        .I4(Q[10]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][10] [3]));
  LUT5 #(
    .INIT(32'h20202F20)) 
    i___1_carry__1_i_2
       (.I0(a_IBUF[9]),
        .I1(b_IBUF[9]),
        .I2(mode_IBUF),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [9]),
        .I4(Q[9]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][10] [2]));
  LUT5 #(
    .INIT(32'h20202F20)) 
    i___1_carry__1_i_3
       (.I0(a_IBUF[8]),
        .I1(b_IBUF[8]),
        .I2(mode_IBUF),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [8]),
        .I4(Q[8]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][10] [1]));
  LUT5 #(
    .INIT(32'h20202F20)) 
    i___1_carry__1_i_4
       (.I0(a_IBUF[7]),
        .I1(b_IBUF[7]),
        .I2(mode_IBUF),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [7]),
        .I4(Q[7]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][10] [0]));
  LUT6 #(
    .INIT(64'h5569AA69AA695569)) 
    i___1_carry__1_i_5
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][10] [3]),
        .I1(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [11]),
        .I2(Q[11]),
        .I3(mode_IBUF),
        .I4(b_IBUF[11]),
        .I5(a_IBUF[11]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][11]_1 [3]));
  LUT6 #(
    .INIT(64'h5569AA69AA695569)) 
    i___1_carry__1_i_6
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][10] [2]),
        .I1(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [10]),
        .I2(Q[10]),
        .I3(mode_IBUF),
        .I4(b_IBUF[10]),
        .I5(a_IBUF[10]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][11]_1 [2]));
  LUT6 #(
    .INIT(64'h5569AA69AA695569)) 
    i___1_carry__1_i_7
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][10] [1]),
        .I1(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [9]),
        .I2(Q[9]),
        .I3(mode_IBUF),
        .I4(b_IBUF[9]),
        .I5(a_IBUF[9]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][11]_1 [1]));
  LUT6 #(
    .INIT(64'h5569AA69AA695569)) 
    i___1_carry__1_i_8
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][10] [0]),
        .I1(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [8]),
        .I2(Q[8]),
        .I3(mode_IBUF),
        .I4(b_IBUF[8]),
        .I5(a_IBUF[8]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][11]_1 [0]));
  LUT2 #(
    .INIT(4'h8)) 
    i___1_carry__2_i_1
       (.I0(i___1_carry__2_i_9_n_0),
        .I1(CO),
        .O(out1_carry__1[3]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h2)) 
    i___1_carry__2_i_10
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [12]),
        .I1(Q[12]),
        .O(i___1_carry__2_i_10_n_0));
  LUT5 #(
    .INIT(32'h606F6F60)) 
    i___1_carry__2_i_11
       (.I0(a_IBUF[14]),
        .I1(b_IBUF[14]),
        .I2(mode_IBUF),
        .I3(Q[14]),
        .I4(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [14]),
        .O(i___1_carry__2_i_11_n_0));
  LUT6 #(
    .INIT(64'h9969FFFF99690000)) 
    i___1_carry__2_i_12
       (.I0(a_IBUF[15]),
        .I1(b_IBUF[15]),
        .I2(b_IBUF[14]),
        .I3(a_IBUF[14]),
        .I4(mode_IBUF),
        .I5(i___1_carry__2_i_16_n_0),
        .O(i___1_carry__2_i_12_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h20202F20)) 
    i___1_carry__2_i_13
       (.I0(a_IBUF[12]),
        .I1(b_IBUF[12]),
        .I2(mode_IBUF),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [12]),
        .I4(Q[12]),
        .O(i___1_carry__2_i_13_n_0));
  LUT5 #(
    .INIT(32'hBFB0BFBF)) 
    i___1_carry__2_i_14
       (.I0(a_IBUF[13]),
        .I1(b_IBUF[13]),
        .I2(mode_IBUF),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [13]),
        .I4(Q[13]),
        .O(i___1_carry__2_i_14_n_0));
  LUT4 #(
    .INIT(16'h1400)) 
    i___1_carry__2_i_15
       (.I0(Q[12]),
        .I1(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [14]),
        .I2(Q[14]),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [12]),
        .O(i___1_carry__2_i_15_n_0));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h9969)) 
    i___1_carry__2_i_16
       (.I0(Q[15]),
        .I1(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [15]),
        .I2(Q[14]),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [14]),
        .O(i___1_carry__2_i_16_n_0));
  LUT6 #(
    .INIT(64'hF755F7FF08AA0800)) 
    i___1_carry__2_i_2
       (.I0(CO),
        .I1(a_IBUF[12]),
        .I2(b_IBUF[12]),
        .I3(mode_IBUF),
        .I4(i___1_carry__2_i_10_n_0),
        .I5(i___1_carry__2_i_11_n_0),
        .O(out1_carry__1[2]));
  LUT5 #(
    .INIT(32'h606F6F60)) 
    i___1_carry__2_i_3
       (.I0(a_IBUF[13]),
        .I1(b_IBUF[13]),
        .I2(mode_IBUF),
        .I3(Q[13]),
        .I4(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [13]),
        .O(out1_carry__1[1]));
  LUT5 #(
    .INIT(32'h20202F20)) 
    i___1_carry__2_i_4
       (.I0(a_IBUF[11]),
        .I1(b_IBUF[11]),
        .I2(mode_IBUF),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [11]),
        .I4(Q[11]),
        .O(out1_carry__1[0]));
  LUT3 #(
    .INIT(8'h78)) 
    i___1_carry__2_i_5
       (.I0(CO),
        .I1(i___1_carry__2_i_9_n_0),
        .I2(i___1_carry__2_i_12_n_0),
        .O(i___1_carry__2_i_12_0[3]));
  LUT4 #(
    .INIT(16'h956A)) 
    i___1_carry__2_i_6
       (.I0(i___1_carry__2_i_11_n_0),
        .I1(i___1_carry__2_i_13_n_0),
        .I2(CO),
        .I3(i___1_carry__2_i_14_n_0),
        .O(i___1_carry__2_i_12_0[2]));
  LUT6 #(
    .INIT(64'h59A95959A656A6A6)) 
    i___1_carry__2_i_7
       (.I0(out1_carry__1[1]),
        .I1(i___1_carry__2_i_10_n_0),
        .I2(mode_IBUF),
        .I3(b_IBUF[12]),
        .I4(a_IBUF[12]),
        .I5(CO),
        .O(i___1_carry__2_i_12_0[1]));
  LUT6 #(
    .INIT(64'h5569AA69AA695569)) 
    i___1_carry__2_i_8
       (.I0(out1_carry__1[0]),
        .I1(Q[12]),
        .I2(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [12]),
        .I3(mode_IBUF),
        .I4(a_IBUF[12]),
        .I5(b_IBUF[12]),
        .O(i___1_carry__2_i_12_0[0]));
  LUT6 #(
    .INIT(64'h0028FFFF00280000)) 
    i___1_carry__2_i_9
       (.I0(a_IBUF[12]),
        .I1(b_IBUF[14]),
        .I2(a_IBUF[14]),
        .I3(b_IBUF[12]),
        .I4(mode_IBUF),
        .I5(i___1_carry__2_i_15_n_0),
        .O(i___1_carry__2_i_9_n_0));
  LUT6 #(
    .INIT(64'h283CFFFF283C0000)) 
    i___1_carry__3_i_1
       (.I0(a_IBUF[17]),
        .I1(b_IBUF[18]),
        .I2(a_IBUF[18]),
        .I3(b_IBUF[17]),
        .I4(mode_IBUF),
        .I5(i___1_carry__3_i_9_n_0),
        .O(\a[17] [3]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h51A2)) 
    i___1_carry__3_i_10
       (.I0(Q[17]),
        .I1(Q[16]),
        .I2(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [16]),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [17]),
        .O(i___1_carry__3_i_10_n_0));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h0BB0)) 
    i___1_carry__3_i_11
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [15]),
        .I1(Q[15]),
        .I2(Q[16]),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [16]),
        .O(i___1_carry__3_i_11_n_0));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h51A2)) 
    i___1_carry__3_i_12
       (.I0(Q[15]),
        .I1(Q[14]),
        .I2(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [14]),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [15]),
        .O(i___1_carry__3_i_12_n_0));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'h9969)) 
    i___1_carry__3_i_13
       (.I0(Q[19]),
        .I1(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [19]),
        .I2(Q[18]),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [18]),
        .O(i___1_carry__3_i_13_n_0));
  LUT6 #(
    .INIT(64'hB44BFFFFB44B0000)) 
    i___1_carry__3_i_15
       (.I0(a_IBUF[17]),
        .I1(b_IBUF[17]),
        .I2(a_IBUF[18]),
        .I3(b_IBUF[18]),
        .I4(mode_IBUF),
        .I5(i___1_carry__3_i_19_n_0),
        .O(i___1_carry__3_i_15_n_0));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h9969)) 
    i___1_carry__3_i_16
       (.I0(Q[17]),
        .I1(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [17]),
        .I2(Q[16]),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [16]),
        .O(i___1_carry__3_i_16_n_0));
  LUT6 #(
    .INIT(64'hB44BFFFFB44B0000)) 
    i___1_carry__3_i_18
       (.I0(a_IBUF[15]),
        .I1(b_IBUF[15]),
        .I2(a_IBUF[16]),
        .I3(b_IBUF[16]),
        .I4(mode_IBUF),
        .I5(i___1_carry__3_i_20_n_0),
        .O(i___1_carry__3_i_18_n_0));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'hB44B)) 
    i___1_carry__3_i_19
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [17]),
        .I1(Q[17]),
        .I2(Q[18]),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [18]),
        .O(i___1_carry__3_i_19_n_0));
  LUT6 #(
    .INIT(64'h51A2FFFF51A20000)) 
    i___1_carry__3_i_2
       (.I0(a_IBUF[17]),
        .I1(b_IBUF[16]),
        .I2(a_IBUF[16]),
        .I3(b_IBUF[17]),
        .I4(mode_IBUF),
        .I5(i___1_carry__3_i_10_n_0),
        .O(\a[17] [2]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'hB44B)) 
    i___1_carry__3_i_20
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [15]),
        .I1(Q[15]),
        .I2(Q[16]),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [16]),
        .O(i___1_carry__3_i_20_n_0));
  LUT6 #(
    .INIT(64'h283CFFFF283C0000)) 
    i___1_carry__3_i_3
       (.I0(a_IBUF[15]),
        .I1(b_IBUF[16]),
        .I2(a_IBUF[16]),
        .I3(b_IBUF[15]),
        .I4(mode_IBUF),
        .I5(i___1_carry__3_i_11_n_0),
        .O(\a[17] [1]));
  LUT6 #(
    .INIT(64'h51A2FFFF51A20000)) 
    i___1_carry__3_i_4
       (.I0(a_IBUF[15]),
        .I1(b_IBUF[14]),
        .I2(a_IBUF[14]),
        .I3(b_IBUF[15]),
        .I4(mode_IBUF),
        .I5(i___1_carry__3_i_12_n_0),
        .O(\a[17] [0]));
  LUT6 #(
    .INIT(64'h56A6A656A65656A6)) 
    i___1_carry__3_i_5
       (.I0(\a[17] [3]),
        .I1(i___1_carry__3_i_13_n_0),
        .I2(mode_IBUF),
        .I3(\_inferred__1/i___1_carry__3_0 ),
        .I4(b_IBUF[19]),
        .I5(a_IBUF[19]),
        .O(\out_reg[19]_0 [3]));
  LUT2 #(
    .INIT(4'h6)) 
    i___1_carry__3_i_6
       (.I0(\a[17] [2]),
        .I1(i___1_carry__3_i_15_n_0),
        .O(\out_reg[19]_0 [2]));
  LUT6 #(
    .INIT(64'h56A6A656A65656A6)) 
    i___1_carry__3_i_7
       (.I0(\a[17] [1]),
        .I1(i___1_carry__3_i_16_n_0),
        .I2(mode_IBUF),
        .I3(\_inferred__1/i___1_carry__3 ),
        .I4(b_IBUF[17]),
        .I5(a_IBUF[17]),
        .O(\out_reg[19]_0 [1]));
  LUT2 #(
    .INIT(4'h6)) 
    i___1_carry__3_i_8
       (.I0(\a[17] [0]),
        .I1(i___1_carry__3_i_18_n_0),
        .O(\out_reg[19]_0 [0]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h0BB0)) 
    i___1_carry__3_i_9
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [17]),
        .I1(Q[17]),
        .I2(Q[18]),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [18]),
        .O(i___1_carry__3_i_9_n_0));
  LUT6 #(
    .INIT(64'h283CFFFF283C0000)) 
    i___1_carry__4_i_1
       (.I0(a_IBUF[19]),
        .I1(b_IBUF[20]),
        .I2(a_IBUF[20]),
        .I3(b_IBUF[19]),
        .I4(mode_IBUF),
        .I5(i___1_carry__4_i_6_n_0),
        .O(\a[19] [1]));
  LUT4 #(
    .INIT(16'h9969)) 
    i___1_carry__4_i_10
       (.I0(Q[21]),
        .I1(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [21]),
        .I2(Q[20]),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [20]),
        .O(i___1_carry__4_i_10_n_0));
  LUT6 #(
    .INIT(64'hB44BFFFFB44B0000)) 
    i___1_carry__4_i_12
       (.I0(a_IBUF[19]),
        .I1(b_IBUF[19]),
        .I2(a_IBUF[20]),
        .I3(b_IBUF[20]),
        .I4(mode_IBUF),
        .I5(i___1_carry__4_i_13_n_0),
        .O(i___1_carry__4_i_12_n_0));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'hB44B)) 
    i___1_carry__4_i_13
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [19]),
        .I1(Q[19]),
        .I2(Q[20]),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [20]),
        .O(i___1_carry__4_i_13_n_0));
  LUT6 #(
    .INIT(64'h51A2FFFF51A20000)) 
    i___1_carry__4_i_2
       (.I0(a_IBUF[19]),
        .I1(b_IBUF[18]),
        .I2(a_IBUF[18]),
        .I3(b_IBUF[19]),
        .I4(mode_IBUF),
        .I5(i___1_carry__4_i_7_n_0),
        .O(\a[19] [0]));
  LUT3 #(
    .INIT(8'hB8)) 
    i___1_carry__4_i_3
       (.I0(\_inferred__1/i___1_carry__4 ),
        .I1(mode_IBUF),
        .I2(i___1_carry__4_i_9_n_0),
        .O(mode[2]));
  LUT6 #(
    .INIT(64'h56A6A656A65656A6)) 
    i___1_carry__4_i_4
       (.I0(\a[19] [1]),
        .I1(i___1_carry__4_i_10_n_0),
        .I2(mode_IBUF),
        .I3(\_inferred__1/i___1_carry__4_0 ),
        .I4(b_IBUF[21]),
        .I5(a_IBUF[21]),
        .O(mode[1]));
  LUT2 #(
    .INIT(4'h6)) 
    i___1_carry__4_i_5
       (.I0(\a[19] [0]),
        .I1(i___1_carry__4_i_12_n_0),
        .O(mode[0]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h0BB0)) 
    i___1_carry__4_i_6
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [19]),
        .I1(Q[19]),
        .I2(Q[20]),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [20]),
        .O(i___1_carry__4_i_6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'h51A2)) 
    i___1_carry__4_i_7
       (.I0(Q[19]),
        .I1(Q[18]),
        .I2(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [18]),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [19]),
        .O(i___1_carry__4_i_7_n_0));
  LUT6 #(
    .INIT(64'h9699969699699999)) 
    i___1_carry__4_i_9
       (.I0(Q[22]),
        .I1(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [22]),
        .I2(Q[21]),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [20]),
        .I4(Q[20]),
        .I5(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [21]),
        .O(i___1_carry__4_i_9_n_0));
  LUT5 #(
    .INIT(32'h20202F20)) 
    i___1_carry_i_1
       (.I0(a_IBUF[2]),
        .I1(b_IBUF[2]),
        .I2(mode_IBUF),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [2]),
        .I4(Q[2]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][2] [2]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT2 #(
    .INIT(4'h9)) 
    i___1_carry_i_10
       (.I0(Q[2]),
        .I1(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [2]),
        .O(i___1_carry_i_10_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h2)) 
    i___1_carry_i_12
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [0]),
        .I1(Q[0]),
        .O(i___1_carry_i_12_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hBFB0BFBF)) 
    i___1_carry_i_14
       (.I0(a_IBUF[0]),
        .I1(b_IBUF[0]),
        .I2(mode_IBUF),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [0]),
        .I4(Q[0]),
        .O(i___1_carry_i_14_n_0));
  MUXF7 i___1_carry_i_15
       (.I0(i___1_carry_i_16_n_0),
        .I1(i___1_carry_i_17_n_0),
        .O(i___1_carry_i_15_n_0),
        .S(CO));
  LUT5 #(
    .INIT(32'h606F6F60)) 
    i___1_carry_i_16
       (.I0(b_IBUF[1]),
        .I1(a_IBUF[1]),
        .I2(mode_IBUF),
        .I3(Q[1]),
        .I4(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [1]),
        .O(i___1_carry_i_16_n_0));
  LUT5 #(
    .INIT(32'h9F90909F)) 
    i___1_carry_i_17
       (.I0(b_IBUF[1]),
        .I1(a_IBUF[1]),
        .I2(mode_IBUF),
        .I3(Q[1]),
        .I4(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [1]),
        .O(i___1_carry_i_17_n_0));
  LUT6 #(
    .INIT(64'h4D554D004DFF4D55)) 
    i___1_carry_i_2
       (.I0(CO),
        .I1(a_IBUF[1]),
        .I2(b_IBUF[1]),
        .I3(mode_IBUF),
        .I4(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [1]),
        .I5(Q[1]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][2] [1]));
  LUT6 #(
    .INIT(64'h8EAA8E008EFF8EAA)) 
    i___1_carry_i_3
       (.I0(CO),
        .I1(a_IBUF[0]),
        .I2(b_IBUF[0]),
        .I3(mode_IBUF),
        .I4(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [0]),
        .I5(Q[0]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][2] [0]));
  LUT6 #(
    .INIT(64'h5569AA69AA695569)) 
    i___1_carry_i_4
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][2] [2]),
        .I1(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [3]),
        .I2(Q[3]),
        .I3(mode_IBUF),
        .I4(a_IBUF[3]),
        .I5(b_IBUF[3]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][3] [3]));
  LUT6 #(
    .INIT(64'h1D1D1DE2E2E21DE2)) 
    i___1_carry_i_5
       (.I0(i___1_carry_i_8_n_0),
        .I1(CO),
        .I2(i___1_carry_i_9_n_0),
        .I3(i___1_carry_i_10_n_0),
        .I4(mode_IBUF),
        .I5(\_inferred__1/i___1_carry_0 ),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][3] [2]));
  LUT6 #(
    .INIT(64'h001DFF1DFFE200E2)) 
    i___1_carry_i_6
       (.I0(i___1_carry_i_12_n_0),
        .I1(mode_IBUF),
        .I2(\_inferred__1/i___1_carry ),
        .I3(CO),
        .I4(i___1_carry_i_14_n_0),
        .I5(i___1_carry_i_15_n_0),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][3] [1]));
  LUT6 #(
    .INIT(64'h5569AA69AA695569)) 
    i___1_carry_i_7
       (.I0(CO),
        .I1(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [0]),
        .I2(Q[0]),
        .I3(mode_IBUF),
        .I4(b_IBUF[0]),
        .I5(a_IBUF[0]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][3] [0]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hBFB0BFBF)) 
    i___1_carry_i_8
       (.I0(a_IBUF[1]),
        .I1(b_IBUF[1]),
        .I2(mode_IBUF),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [1]),
        .I4(Q[1]),
        .O(i___1_carry_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h20202F20)) 
    i___1_carry_i_9
       (.I0(a_IBUF[1]),
        .I1(b_IBUF[1]),
        .I2(mode_IBUF),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [1]),
        .I4(Q[1]),
        .O(i___1_carry_i_9_n_0));
  LUT6 #(
    .INIT(64'h20BAFFFF20BA0000)) 
    out1_carry__0_i_1
       (.I0(a_IBUF[15]),
        .I1(b_IBUF[14]),
        .I2(a_IBUF[14]),
        .I3(b_IBUF[15]),
        .I4(mode_IBUF),
        .I5(out1_carry__0_i_9_n_0),
        .O(\a[15]_0 [3]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h7510)) 
    out1_carry__0_i_10
       (.I0(Q[13]),
        .I1(Q[12]),
        .I2(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [12]),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [13]),
        .O(out1_carry__0_i_10_n_0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h7510)) 
    out1_carry__0_i_11
       (.I0(Q[11]),
        .I1(Q[10]),
        .I2(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [10]),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [11]),
        .O(out1_carry__0_i_11_n_0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h7510)) 
    out1_carry__0_i_12
       (.I0(Q[9]),
        .I1(Q[8]),
        .I2(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [8]),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [9]),
        .O(out1_carry__0_i_12_n_0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h8241)) 
    out1_carry__0_i_13
       (.I0(Q[15]),
        .I1(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [14]),
        .I2(Q[14]),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [15]),
        .O(out1_carry__0_i_13_n_0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h8241)) 
    out1_carry__0_i_14
       (.I0(Q[13]),
        .I1(Q[12]),
        .I2(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [12]),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [13]),
        .O(out1_carry__0_i_14_n_0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h8241)) 
    out1_carry__0_i_15
       (.I0(Q[11]),
        .I1(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [10]),
        .I2(Q[10]),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [11]),
        .O(out1_carry__0_i_15_n_0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h8241)) 
    out1_carry__0_i_16
       (.I0(Q[9]),
        .I1(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [8]),
        .I2(Q[8]),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [9]),
        .O(out1_carry__0_i_16_n_0));
  LUT6 #(
    .INIT(64'h20BAFFFF20BA0000)) 
    out1_carry__0_i_2
       (.I0(a_IBUF[13]),
        .I1(b_IBUF[12]),
        .I2(a_IBUF[12]),
        .I3(b_IBUF[13]),
        .I4(mode_IBUF),
        .I5(out1_carry__0_i_10_n_0),
        .O(\a[15]_0 [2]));
  LUT6 #(
    .INIT(64'h20BAFFFF20BA0000)) 
    out1_carry__0_i_3
       (.I0(a_IBUF[11]),
        .I1(b_IBUF[10]),
        .I2(a_IBUF[10]),
        .I3(b_IBUF[11]),
        .I4(mode_IBUF),
        .I5(out1_carry__0_i_11_n_0),
        .O(\a[15]_0 [1]));
  LUT6 #(
    .INIT(64'h20BAFFFF20BA0000)) 
    out1_carry__0_i_4
       (.I0(a_IBUF[9]),
        .I1(b_IBUF[8]),
        .I2(a_IBUF[8]),
        .I3(b_IBUF[9]),
        .I4(mode_IBUF),
        .I5(out1_carry__0_i_12_n_0),
        .O(\a[15]_0 [0]));
  LUT6 #(
    .INIT(64'h8241FFFF82410000)) 
    out1_carry__0_i_5
       (.I0(a_IBUF[15]),
        .I1(b_IBUF[14]),
        .I2(a_IBUF[14]),
        .I3(b_IBUF[15]),
        .I4(mode_IBUF),
        .I5(out1_carry__0_i_13_n_0),
        .O(\a[15] [3]));
  LUT6 #(
    .INIT(64'h8241FFFF82410000)) 
    out1_carry__0_i_6
       (.I0(a_IBUF[13]),
        .I1(a_IBUF[12]),
        .I2(b_IBUF[12]),
        .I3(b_IBUF[13]),
        .I4(mode_IBUF),
        .I5(out1_carry__0_i_14_n_0),
        .O(\a[15] [2]));
  LUT6 #(
    .INIT(64'h8241FFFF82410000)) 
    out1_carry__0_i_7
       (.I0(a_IBUF[11]),
        .I1(b_IBUF[10]),
        .I2(a_IBUF[10]),
        .I3(b_IBUF[11]),
        .I4(mode_IBUF),
        .I5(out1_carry__0_i_15_n_0),
        .O(\a[15] [1]));
  LUT6 #(
    .INIT(64'h8241FFFF82410000)) 
    out1_carry__0_i_8
       (.I0(a_IBUF[9]),
        .I1(b_IBUF[8]),
        .I2(a_IBUF[8]),
        .I3(b_IBUF[9]),
        .I4(mode_IBUF),
        .I5(out1_carry__0_i_16_n_0),
        .O(\a[15] [0]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h7510)) 
    out1_carry__0_i_9
       (.I0(Q[15]),
        .I1(Q[14]),
        .I2(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [14]),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [15]),
        .O(out1_carry__0_i_9_n_0));
  LUT5 #(
    .INIT(32'h20202F20)) 
    out1_carry__1_i_1
       (.I0(a_IBUF[22]),
        .I1(b_IBUF[22]),
        .I2(mode_IBUF),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [22]),
        .I4(Q[22]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][22] [3]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h7510)) 
    out1_carry__1_i_10
       (.I0(Q[19]),
        .I1(Q[18]),
        .I2(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [18]),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [19]),
        .O(out1_carry__1_i_10_n_0));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h7510)) 
    out1_carry__1_i_11
       (.I0(Q[17]),
        .I1(Q[16]),
        .I2(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [16]),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [17]),
        .O(out1_carry__1_i_11_n_0));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h8241)) 
    out1_carry__1_i_12
       (.I0(Q[21]),
        .I1(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [20]),
        .I2(Q[20]),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [21]),
        .O(out1_carry__1_i_12_n_0));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h8241)) 
    out1_carry__1_i_13
       (.I0(Q[19]),
        .I1(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [18]),
        .I2(Q[18]),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [19]),
        .O(out1_carry__1_i_13_n_0));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h8241)) 
    out1_carry__1_i_14
       (.I0(Q[17]),
        .I1(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [16]),
        .I2(Q[16]),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [17]),
        .O(out1_carry__1_i_14_n_0));
  LUT6 #(
    .INIT(64'h20BAFFFF20BA0000)) 
    out1_carry__1_i_2
       (.I0(a_IBUF[21]),
        .I1(b_IBUF[20]),
        .I2(a_IBUF[20]),
        .I3(b_IBUF[21]),
        .I4(mode_IBUF),
        .I5(out1_carry__1_i_9_n_0),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][22] [2]));
  LUT6 #(
    .INIT(64'h20BAFFFF20BA0000)) 
    out1_carry__1_i_3
       (.I0(a_IBUF[19]),
        .I1(b_IBUF[18]),
        .I2(a_IBUF[18]),
        .I3(b_IBUF[19]),
        .I4(mode_IBUF),
        .I5(out1_carry__1_i_10_n_0),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][22] [1]));
  LUT6 #(
    .INIT(64'h20BAFFFF20BA0000)) 
    out1_carry__1_i_4
       (.I0(a_IBUF[17]),
        .I1(b_IBUF[16]),
        .I2(a_IBUF[16]),
        .I3(b_IBUF[17]),
        .I4(mode_IBUF),
        .I5(out1_carry__1_i_11_n_0),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][22] [0]));
  LUT5 #(
    .INIT(32'hCCA533A5)) 
    out1_carry__1_i_5
       (.I0(Q[22]),
        .I1(b_IBUF[22]),
        .I2(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [22]),
        .I3(mode_IBUF),
        .I4(a_IBUF[22]),
        .O(\out_reg[22]_0 [3]));
  LUT6 #(
    .INIT(64'h8241FFFF82410000)) 
    out1_carry__1_i_6
       (.I0(a_IBUF[21]),
        .I1(b_IBUF[20]),
        .I2(a_IBUF[20]),
        .I3(b_IBUF[21]),
        .I4(mode_IBUF),
        .I5(out1_carry__1_i_12_n_0),
        .O(\out_reg[22]_0 [2]));
  LUT6 #(
    .INIT(64'h8241FFFF82410000)) 
    out1_carry__1_i_7
       (.I0(a_IBUF[19]),
        .I1(b_IBUF[18]),
        .I2(a_IBUF[18]),
        .I3(b_IBUF[19]),
        .I4(mode_IBUF),
        .I5(out1_carry__1_i_13_n_0),
        .O(\out_reg[22]_0 [1]));
  LUT6 #(
    .INIT(64'h8241FFFF82410000)) 
    out1_carry__1_i_8
       (.I0(a_IBUF[17]),
        .I1(b_IBUF[16]),
        .I2(a_IBUF[16]),
        .I3(b_IBUF[17]),
        .I4(mode_IBUF),
        .I5(out1_carry__1_i_14_n_0),
        .O(\out_reg[22]_0 [0]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h7510)) 
    out1_carry__1_i_9
       (.I0(Q[21]),
        .I1(Q[20]),
        .I2(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [20]),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [21]),
        .O(out1_carry__1_i_9_n_0));
  LUT6 #(
    .INIT(64'h20BAFFFF20BA0000)) 
    out1_carry_i_1
       (.I0(a_IBUF[7]),
        .I1(b_IBUF[6]),
        .I2(a_IBUF[6]),
        .I3(b_IBUF[7]),
        .I4(mode_IBUF),
        .I5(out1_carry_i_9_n_0),
        .O(DI[3]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h7510)) 
    out1_carry_i_10
       (.I0(Q[5]),
        .I1(Q[4]),
        .I2(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [4]),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [5]),
        .O(out1_carry_i_10_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h7510)) 
    out1_carry_i_11
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [2]),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [3]),
        .O(out1_carry_i_11_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h7510)) 
    out1_carry_i_12
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [0]),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [1]),
        .O(out1_carry_i_12_n_0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h8241)) 
    out1_carry_i_13
       (.I0(Q[7]),
        .I1(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [6]),
        .I2(Q[6]),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [7]),
        .O(out1_carry_i_13_n_0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h8241)) 
    out1_carry_i_14
       (.I0(Q[5]),
        .I1(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [4]),
        .I2(Q[4]),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [5]),
        .O(out1_carry_i_14_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h8241)) 
    out1_carry_i_15
       (.I0(Q[3]),
        .I1(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [2]),
        .I2(Q[2]),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [3]),
        .O(out1_carry_i_15_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h8241)) 
    out1_carry_i_16
       (.I0(Q[1]),
        .I1(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [0]),
        .I2(Q[0]),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [1]),
        .O(out1_carry_i_16_n_0));
  LUT6 #(
    .INIT(64'h7510FFFF75100000)) 
    out1_carry_i_2
       (.I0(b_IBUF[5]),
        .I1(b_IBUF[4]),
        .I2(a_IBUF[4]),
        .I3(a_IBUF[5]),
        .I4(mode_IBUF),
        .I5(out1_carry_i_10_n_0),
        .O(DI[2]));
  LUT6 #(
    .INIT(64'h7510FFFF75100000)) 
    out1_carry_i_3
       (.I0(b_IBUF[3]),
        .I1(b_IBUF[2]),
        .I2(a_IBUF[2]),
        .I3(a_IBUF[3]),
        .I4(mode_IBUF),
        .I5(out1_carry_i_11_n_0),
        .O(DI[1]));
  LUT6 #(
    .INIT(64'h7510FFFF75100000)) 
    out1_carry_i_4
       (.I0(b_IBUF[1]),
        .I1(b_IBUF[0]),
        .I2(a_IBUF[0]),
        .I3(a_IBUF[1]),
        .I4(mode_IBUF),
        .I5(out1_carry_i_12_n_0),
        .O(DI[0]));
  LUT6 #(
    .INIT(64'h8241FFFF82410000)) 
    out1_carry_i_5
       (.I0(a_IBUF[7]),
        .I1(b_IBUF[6]),
        .I2(a_IBUF[6]),
        .I3(b_IBUF[7]),
        .I4(mode_IBUF),
        .I5(out1_carry_i_13_n_0),
        .O(S[3]));
  LUT6 #(
    .INIT(64'h8241FFFF82410000)) 
    out1_carry_i_6
       (.I0(b_IBUF[5]),
        .I1(b_IBUF[4]),
        .I2(a_IBUF[4]),
        .I3(a_IBUF[5]),
        .I4(mode_IBUF),
        .I5(out1_carry_i_14_n_0),
        .O(S[2]));
  LUT6 #(
    .INIT(64'h8241FFFF82410000)) 
    out1_carry_i_7
       (.I0(b_IBUF[3]),
        .I1(b_IBUF[2]),
        .I2(a_IBUF[2]),
        .I3(a_IBUF[3]),
        .I4(mode_IBUF),
        .I5(out1_carry_i_15_n_0),
        .O(S[1]));
  LUT6 #(
    .INIT(64'h8241FFFF82410000)) 
    out1_carry_i_8
       (.I0(b_IBUF[1]),
        .I1(b_IBUF[0]),
        .I2(a_IBUF[0]),
        .I3(a_IBUF[1]),
        .I4(mode_IBUF),
        .I5(out1_carry_i_16_n_0),
        .O(S[0]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h7510)) 
    out1_carry_i_9
       (.I0(Q[7]),
        .I1(Q[6]),
        .I2(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [6]),
        .I3(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [7]),
        .O(out1_carry_i_9_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    \out[0]_i_1 
       (.I0(adder_4__66[23]),
        .I1(\adder_3_temp_reg_n_0_[0] ),
        .O(\out[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out[10]_i_1 
       (.I0(\adder_3_temp_reg_n_0_[10] ),
        .I1(adder_4__66[23]),
        .I2(adder_4__66[10]),
        .O(\out[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out[11]_i_1 
       (.I0(\adder_3_temp_reg_n_0_[11] ),
        .I1(adder_4__66[23]),
        .I2(adder_4__66[11]),
        .O(\out[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out[12]_i_1 
       (.I0(\adder_3_temp_reg_n_0_[12] ),
        .I1(adder_4__66[23]),
        .I2(adder_4__66[12]),
        .O(\out[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out[13]_i_1 
       (.I0(\adder_3_temp_reg_n_0_[13] ),
        .I1(adder_4__66[23]),
        .I2(adder_4__66[13]),
        .O(\out[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out[14]_i_1 
       (.I0(\adder_3_temp_reg_n_0_[14] ),
        .I1(adder_4__66[23]),
        .I2(adder_4__66[14]),
        .O(\out[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out[15]_i_1 
       (.I0(\adder_3_temp_reg_n_0_[15] ),
        .I1(adder_4__66[23]),
        .I2(adder_4__66[15]),
        .O(\out[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out[16]_i_1 
       (.I0(\adder_3_temp_reg_n_0_[16] ),
        .I1(adder_4__66[23]),
        .I2(adder_4__66[16]),
        .O(\out[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out[17]_i_1 
       (.I0(\adder_3_temp_reg_n_0_[17] ),
        .I1(adder_4__66[23]),
        .I2(adder_4__66[17]),
        .O(\out[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out[18]_i_1 
       (.I0(\adder_3_temp_reg_n_0_[18] ),
        .I1(adder_4__66[23]),
        .I2(adder_4__66[18]),
        .O(\out[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out[19]_i_1 
       (.I0(\adder_3_temp_reg_n_0_[19] ),
        .I1(adder_4__66[23]),
        .I2(adder_4__66[19]),
        .O(\out[19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out[1]_i_1 
       (.I0(\adder_3_temp_reg_n_0_[1] ),
        .I1(adder_4__66[23]),
        .I2(adder_4__66[1]),
        .O(\out[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out[20]_i_1 
       (.I0(\adder_3_temp_reg_n_0_[20] ),
        .I1(adder_4__66[23]),
        .I2(adder_4__66[20]),
        .O(\out[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out[21]_i_1 
       (.I0(\adder_3_temp_reg_n_0_[21] ),
        .I1(adder_4__66[23]),
        .I2(adder_4__66[21]),
        .O(\out[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out[22]_i_1 
       (.I0(\adder_3_temp_reg_n_0_[22] ),
        .I1(adder_4__66[23]),
        .I2(adder_4__66[22]),
        .O(\out[22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out[2]_i_1 
       (.I0(\adder_3_temp_reg_n_0_[2] ),
        .I1(adder_4__66[23]),
        .I2(adder_4__66[2]),
        .O(\out[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out[3]_i_1 
       (.I0(\adder_3_temp_reg_n_0_[3] ),
        .I1(adder_4__66[23]),
        .I2(adder_4__66[3]),
        .O(\out[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out[4]_i_1 
       (.I0(\adder_3_temp_reg_n_0_[4] ),
        .I1(adder_4__66[23]),
        .I2(adder_4__66[4]),
        .O(\out[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out[5]_i_1 
       (.I0(\adder_3_temp_reg_n_0_[5] ),
        .I1(adder_4__66[23]),
        .I2(adder_4__66[5]),
        .O(\out[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out[6]_i_1 
       (.I0(\adder_3_temp_reg_n_0_[6] ),
        .I1(adder_4__66[23]),
        .I2(adder_4__66[6]),
        .O(\out[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out[7]_i_1 
       (.I0(\adder_3_temp_reg_n_0_[7] ),
        .I1(adder_4__66[23]),
        .I2(adder_4__66[7]),
        .O(\out[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out[8]_i_1 
       (.I0(\adder_3_temp_reg_n_0_[8] ),
        .I1(adder_4__66[23]),
        .I2(adder_4__66[8]),
        .O(\out[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out[9]_i_1 
       (.I0(\adder_3_temp_reg_n_0_[9] ),
        .I1(adder_4__66[23]),
        .I2(adder_4__66[9]),
        .O(\out[9]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \out_a_OBUF[0]_inst_i_1 
       (.I0(a_plus_b_minus_q[22]),
        .I1(O[0]),
        .O(out_a_OBUF[0]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_a_OBUF[10]_inst_i_1 
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][11] [2]),
        .I1(a_plus_b_minus_q[22]),
        .I2(a_plus_b_minus_q[9]),
        .O(out_a_OBUF[10]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_a_OBUF[11]_inst_i_1 
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][11] [3]),
        .I1(a_plus_b_minus_q[22]),
        .I2(a_plus_b_minus_q[10]),
        .O(out_a_OBUF[11]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_a_OBUF[12]_inst_i_1 
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][15]_0 [0]),
        .I1(a_plus_b_minus_q[22]),
        .I2(a_plus_b_minus_q[11]),
        .O(out_a_OBUF[12]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_a_OBUF[13]_inst_i_1 
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][15]_0 [1]),
        .I1(a_plus_b_minus_q[22]),
        .I2(a_plus_b_minus_q[12]),
        .O(out_a_OBUF[13]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_a_OBUF[14]_inst_i_1 
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][15]_0 [2]),
        .I1(a_plus_b_minus_q[22]),
        .I2(a_plus_b_minus_q[13]),
        .O(out_a_OBUF[14]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_a_OBUF[15]_inst_i_1 
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][15]_0 [3]),
        .I1(a_plus_b_minus_q[22]),
        .I2(a_plus_b_minus_q[14]),
        .O(out_a_OBUF[15]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_a_OBUF[16]_inst_i_1 
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][19] [0]),
        .I1(a_plus_b_minus_q[22]),
        .I2(a_plus_b_minus_q[15]),
        .O(out_a_OBUF[16]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_a_OBUF[17]_inst_i_1 
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][19] [1]),
        .I1(a_plus_b_minus_q[22]),
        .I2(a_plus_b_minus_q[16]),
        .O(out_a_OBUF[17]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_a_OBUF[18]_inst_i_1 
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][19] [2]),
        .I1(a_plus_b_minus_q[22]),
        .I2(a_plus_b_minus_q[17]),
        .O(out_a_OBUF[18]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_a_OBUF[19]_inst_i_1 
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][19] [3]),
        .I1(a_plus_b_minus_q[22]),
        .I2(a_plus_b_minus_q[18]),
        .O(out_a_OBUF[19]));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_a_OBUF[1]_inst_i_1 
       (.I0(O[1]),
        .I1(a_plus_b_minus_q[22]),
        .I2(a_plus_b_minus_q[0]),
        .O(out_a_OBUF[1]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_a_OBUF[20]_inst_i_1 
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][22]_0 [0]),
        .I1(a_plus_b_minus_q[22]),
        .I2(a_plus_b_minus_q[19]),
        .O(out_a_OBUF[20]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_a_OBUF[21]_inst_i_1 
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][22]_0 [1]),
        .I1(a_plus_b_minus_q[22]),
        .I2(a_plus_b_minus_q[20]),
        .O(out_a_OBUF[21]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_a_OBUF[22]_inst_i_1 
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][22]_0 [2]),
        .I1(a_plus_b_minus_q[22]),
        .I2(a_plus_b_minus_q[21]),
        .O(out_a_OBUF[22]));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_a_OBUF[2]_inst_i_1 
       (.I0(O[2]),
        .I1(a_plus_b_minus_q[22]),
        .I2(a_plus_b_minus_q[1]),
        .O(out_a_OBUF[2]));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_a_OBUF[3]_inst_i_1 
       (.I0(O[3]),
        .I1(a_plus_b_minus_q[22]),
        .I2(a_plus_b_minus_q[2]),
        .O(out_a_OBUF[3]));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_a_OBUF[4]_inst_i_1 
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][7] [0]),
        .I1(a_plus_b_minus_q[22]),
        .I2(a_plus_b_minus_q[3]),
        .O(out_a_OBUF[4]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_a_OBUF[5]_inst_i_1 
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][7] [1]),
        .I1(a_plus_b_minus_q[22]),
        .I2(a_plus_b_minus_q[4]),
        .O(out_a_OBUF[5]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_a_OBUF[6]_inst_i_1 
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][7] [2]),
        .I1(a_plus_b_minus_q[22]),
        .I2(a_plus_b_minus_q[5]),
        .O(out_a_OBUF[6]));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_a_OBUF[7]_inst_i_1 
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][7] [3]),
        .I1(a_plus_b_minus_q[22]),
        .I2(a_plus_b_minus_q[6]),
        .O(out_a_OBUF[7]));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_a_OBUF[8]_inst_i_1 
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][11] [0]),
        .I1(a_plus_b_minus_q[22]),
        .I2(a_plus_b_minus_q[7]),
        .O(out_a_OBUF[8]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_a_OBUF[9]_inst_i_1 
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][11] [1]),
        .I1(a_plus_b_minus_q[22]),
        .I2(a_plus_b_minus_q[8]),
        .O(out_a_OBUF[9]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_b_OBUF[0]_inst_i_1 
       (.I0(Q[0]),
        .I1(mode_IBUF),
        .I2(sub_out[0]),
        .O(out_b_OBUF[0]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_b_OBUF[10]_inst_i_1 
       (.I0(Q[10]),
        .I1(mode_IBUF),
        .I2(sub_out[10]),
        .O(out_b_OBUF[10]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_b_OBUF[11]_inst_i_1 
       (.I0(Q[11]),
        .I1(mode_IBUF),
        .I2(sub_out[11]),
        .O(out_b_OBUF[11]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_b_OBUF[12]_inst_i_1 
       (.I0(Q[12]),
        .I1(mode_IBUF),
        .I2(sub_out[12]),
        .O(out_b_OBUF[12]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_b_OBUF[13]_inst_i_1 
       (.I0(Q[13]),
        .I1(mode_IBUF),
        .I2(sub_out[13]),
        .O(out_b_OBUF[13]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_b_OBUF[14]_inst_i_1 
       (.I0(Q[14]),
        .I1(mode_IBUF),
        .I2(sub_out[14]),
        .O(out_b_OBUF[14]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_b_OBUF[15]_inst_i_1 
       (.I0(Q[15]),
        .I1(mode_IBUF),
        .I2(sub_out[15]),
        .O(out_b_OBUF[15]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_b_OBUF[16]_inst_i_1 
       (.I0(Q[16]),
        .I1(mode_IBUF),
        .I2(sub_out[16]),
        .O(out_b_OBUF[16]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_b_OBUF[17]_inst_i_1 
       (.I0(Q[17]),
        .I1(mode_IBUF),
        .I2(sub_out[17]),
        .O(out_b_OBUF[17]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_b_OBUF[18]_inst_i_1 
       (.I0(Q[18]),
        .I1(mode_IBUF),
        .I2(sub_out[18]),
        .O(out_b_OBUF[18]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_b_OBUF[19]_inst_i_1 
       (.I0(Q[19]),
        .I1(mode_IBUF),
        .I2(sub_out[19]),
        .O(out_b_OBUF[19]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_b_OBUF[1]_inst_i_1 
       (.I0(Q[1]),
        .I1(mode_IBUF),
        .I2(sub_out[1]),
        .O(out_b_OBUF[1]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_b_OBUF[20]_inst_i_1 
       (.I0(Q[20]),
        .I1(mode_IBUF),
        .I2(sub_out[20]),
        .O(out_b_OBUF[20]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_b_OBUF[21]_inst_i_1 
       (.I0(Q[21]),
        .I1(mode_IBUF),
        .I2(sub_out[21]),
        .O(out_b_OBUF[21]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_b_OBUF[22]_inst_i_1 
       (.I0(Q[22]),
        .I1(mode_IBUF),
        .I2(sub_out[22]),
        .O(out_b_OBUF[22]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_b_OBUF[2]_inst_i_1 
       (.I0(Q[2]),
        .I1(mode_IBUF),
        .I2(sub_out[2]),
        .O(out_b_OBUF[2]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_b_OBUF[3]_inst_i_1 
       (.I0(Q[3]),
        .I1(mode_IBUF),
        .I2(sub_out[3]),
        .O(out_b_OBUF[3]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_b_OBUF[4]_inst_i_1 
       (.I0(Q[4]),
        .I1(mode_IBUF),
        .I2(sub_out[4]),
        .O(out_b_OBUF[4]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_b_OBUF[5]_inst_i_1 
       (.I0(Q[5]),
        .I1(mode_IBUF),
        .I2(sub_out[5]),
        .O(out_b_OBUF[5]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_b_OBUF[6]_inst_i_1 
       (.I0(Q[6]),
        .I1(mode_IBUF),
        .I2(sub_out[6]),
        .O(out_b_OBUF[6]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_b_OBUF[7]_inst_i_1 
       (.I0(Q[7]),
        .I1(mode_IBUF),
        .I2(sub_out[7]),
        .O(out_b_OBUF[7]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_b_OBUF[8]_inst_i_1 
       (.I0(Q[8]),
        .I1(mode_IBUF),
        .I2(sub_out[8]),
        .O(out_b_OBUF[8]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_b_OBUF[9]_inst_i_1 
       (.I0(Q[9]),
        .I1(mode_IBUF),
        .I2(sub_out[9]),
        .O(out_b_OBUF[9]));
  FDRE #(
    .INIT(1'b0)) 
    \out_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\out[0]_i_1_n_0 ),
        .Q(Q[0]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \out_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\out[10]_i_1_n_0 ),
        .Q(Q[10]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \out_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\out[11]_i_1_n_0 ),
        .Q(Q[11]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \out_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\out[12]_i_1_n_0 ),
        .Q(Q[12]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \out_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\out[13]_i_1_n_0 ),
        .Q(Q[13]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \out_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\out[14]_i_1_n_0 ),
        .Q(Q[14]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \out_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\out[15]_i_1_n_0 ),
        .Q(Q[15]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \out_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\out[16]_i_1_n_0 ),
        .Q(Q[16]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \out_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\out[17]_i_1_n_0 ),
        .Q(Q[17]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \out_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\out[18]_i_1_n_0 ),
        .Q(Q[18]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \out_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\out[19]_i_1_n_0 ),
        .Q(Q[19]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \out_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\out[1]_i_1_n_0 ),
        .Q(Q[1]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \out_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\out[20]_i_1_n_0 ),
        .Q(Q[20]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \out_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\out[21]_i_1_n_0 ),
        .Q(Q[21]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \out_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\out[22]_i_1_n_0 ),
        .Q(Q[22]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \out_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\out[2]_i_1_n_0 ),
        .Q(Q[2]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \out_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\out[3]_i_1_n_0 ),
        .Q(Q[3]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \out_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\out[4]_i_1_n_0 ),
        .Q(Q[4]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \out_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\out[5]_i_1_n_0 ),
        .Q(Q[5]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \out_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\out[6]_i_1_n_0 ),
        .Q(Q[6]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \out_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\out[7]_i_1_n_0 ),
        .Q(Q[7]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \out_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\out[8]_i_1_n_0 ),
        .Q(Q[8]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \out_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\out[9]_i_1_n_0 ),
        .Q(Q[9]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \x_temp_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\x_temp_reg[16]_0 [0]),
        .Q(x_temp[0]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \x_temp_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\x_temp_reg[16]_0 [10]),
        .Q(x_temp[10]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \x_temp_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\x_temp_reg[16]_0 [11]),
        .Q(x_temp[11]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \x_temp_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\x_temp_reg[16]_0 [12]),
        .Q(x_temp[12]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \x_temp_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\x_temp_reg[16]_0 [13]),
        .Q(x_temp[13]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \x_temp_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\x_temp_reg[16]_0 [14]),
        .Q(x_temp[14]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \x_temp_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\x_temp_reg[16]_0 [15]),
        .Q(x_temp[15]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \x_temp_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\x_temp_reg[16]_0 [16]),
        .Q(x_temp[16]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \x_temp_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(P[0]),
        .Q(x_temp[17]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \x_temp_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(P[1]),
        .Q(x_temp[18]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \x_temp_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(P[2]),
        .Q(x_temp[19]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \x_temp_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\x_temp_reg[16]_0 [1]),
        .Q(x_temp[1]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \x_temp_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(P[3]),
        .Q(x_temp[20]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \x_temp_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(P[4]),
        .Q(x_temp[21]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \x_temp_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(P[5]),
        .Q(x_temp[22]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \x_temp_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\x_temp_reg[16]_0 [2]),
        .Q(x_temp[2]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \x_temp_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\x_temp_reg[16]_0 [3]),
        .Q(x_temp[3]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \x_temp_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\x_temp_reg[16]_0 [4]),
        .Q(x_temp[4]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \x_temp_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\x_temp_reg[16]_0 [5]),
        .Q(x_temp[5]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \x_temp_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\x_temp_reg[16]_0 [6]),
        .Q(x_temp[6]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \x_temp_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\x_temp_reg[16]_0 [7]),
        .Q(x_temp[7]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \x_temp_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\x_temp_reg[16]_0 [8]),
        .Q(x_temp[8]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \x_temp_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\x_temp_reg[16]_0 [9]),
        .Q(x_temp[9]),
        .R(reset_IBUF));
endmodule

module mod_add
   (a_plus_b_minus_q,
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][3] ,
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][7] ,
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][11] ,
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][15] ,
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][19] ,
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][22] ,
    O,
    \out_a_OBUF[5]_inst_i_1 ,
    S,
    \out_a_OBUF[9]_inst_i_1 ,
    \out_a_OBUF[5]_inst_i_1_0 ,
    \out_a_OBUF[13]_inst_i_1 ,
    \out_a_OBUF[9]_inst_i_1_0 ,
    \out_a_OBUF[17]_inst_i_1 ,
    \out_a_OBUF[21]_inst_i_1 ,
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5] ,
    Q,
    mode_IBUF,
    \DELAY_CHAIN_b[5].shift_reg_b_reg[5] );
  output [22:0]a_plus_b_minus_q;
  output [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][3] ;
  output [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][7] ;
  output [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][11] ;
  output [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][15] ;
  output [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][19] ;
  output [2:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][22] ;
  input [3:0]O;
  input [3:0]\out_a_OBUF[5]_inst_i_1 ;
  input [3:0]S;
  input [3:0]\out_a_OBUF[9]_inst_i_1 ;
  input [3:0]\out_a_OBUF[5]_inst_i_1_0 ;
  input [3:0]\out_a_OBUF[13]_inst_i_1 ;
  input [3:0]\out_a_OBUF[9]_inst_i_1_0 ;
  input [3:0]\out_a_OBUF[17]_inst_i_1 ;
  input [3:0]\out_a_OBUF[21]_inst_i_1 ;
  input [22:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5] ;
  input [22:0]Q;
  input mode_IBUF;
  input [22:0]\DELAY_CHAIN_b[5].shift_reg_b_reg[5] ;

  wire [22:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5] ;
  wire [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][11] ;
  wire [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][15] ;
  wire [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][19] ;
  wire [2:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][22] ;
  wire [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][3] ;
  wire [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][7] ;
  wire [22:0]\DELAY_CHAIN_b[5].shift_reg_b_reg[5] ;
  wire [3:0]O;
  wire [22:0]Q;
  wire [3:0]S;
  wire [22:0]a_plus_b_minus_q;
  wire a_plus_b_minus_q_carry__0_n_0;
  wire a_plus_b_minus_q_carry__0_n_1;
  wire a_plus_b_minus_q_carry__0_n_2;
  wire a_plus_b_minus_q_carry__0_n_3;
  wire a_plus_b_minus_q_carry__1_n_0;
  wire a_plus_b_minus_q_carry__1_n_1;
  wire a_plus_b_minus_q_carry__1_n_2;
  wire a_plus_b_minus_q_carry__1_n_3;
  wire a_plus_b_minus_q_carry__2_n_0;
  wire a_plus_b_minus_q_carry__2_n_1;
  wire a_plus_b_minus_q_carry__2_n_2;
  wire a_plus_b_minus_q_carry__2_n_3;
  wire a_plus_b_minus_q_carry__3_n_0;
  wire a_plus_b_minus_q_carry__3_n_1;
  wire a_plus_b_minus_q_carry__3_n_2;
  wire a_plus_b_minus_q_carry__3_n_3;
  wire a_plus_b_minus_q_carry__4_n_2;
  wire a_plus_b_minus_q_carry__4_n_3;
  wire a_plus_b_minus_q_carry_n_0;
  wire a_plus_b_minus_q_carry_n_1;
  wire a_plus_b_minus_q_carry_n_2;
  wire a_plus_b_minus_q_carry_n_3;
  wire mode_IBUF;
  wire [3:0]\out_a_OBUF[13]_inst_i_1 ;
  wire [3:0]\out_a_OBUF[17]_inst_i_1 ;
  wire [3:0]\out_a_OBUF[21]_inst_i_1 ;
  wire [3:0]\out_a_OBUF[5]_inst_i_1 ;
  wire [3:0]\out_a_OBUF[5]_inst_i_1_0 ;
  wire [3:0]\out_a_OBUF[9]_inst_i_1 ;
  wire [3:0]\out_a_OBUF[9]_inst_i_1_0 ;
  wire [3:2]NLW_a_plus_b_minus_q_carry__4_CO_UNCONNECTED;
  wire [3:3]NLW_a_plus_b_minus_q_carry__4_O_UNCONNECTED;

  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 a_plus_b_minus_q_carry
       (.CI(1'b0),
        .CO({a_plus_b_minus_q_carry_n_0,a_plus_b_minus_q_carry_n_1,a_plus_b_minus_q_carry_n_2,a_plus_b_minus_q_carry_n_3}),
        .CYINIT(O[0]),
        .DI({\out_a_OBUF[5]_inst_i_1 [0],O[3:1]}),
        .O(a_plus_b_minus_q[3:0]),
        .S(S));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 a_plus_b_minus_q_carry__0
       (.CI(a_plus_b_minus_q_carry_n_0),
        .CO({a_plus_b_minus_q_carry__0_n_0,a_plus_b_minus_q_carry__0_n_1,a_plus_b_minus_q_carry__0_n_2,a_plus_b_minus_q_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({\out_a_OBUF[9]_inst_i_1 [0],\out_a_OBUF[5]_inst_i_1 [3:1]}),
        .O(a_plus_b_minus_q[7:4]),
        .S(\out_a_OBUF[5]_inst_i_1_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    a_plus_b_minus_q_carry__0_i_6
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [11]),
        .I1(Q[11]),
        .I2(mode_IBUF),
        .I3(\DELAY_CHAIN_b[5].shift_reg_b_reg[5] [11]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][11] [3]));
  LUT4 #(
    .INIT(16'h56A6)) 
    a_plus_b_minus_q_carry__0_i_7
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [10]),
        .I1(Q[10]),
        .I2(mode_IBUF),
        .I3(\DELAY_CHAIN_b[5].shift_reg_b_reg[5] [10]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][11] [2]));
  LUT4 #(
    .INIT(16'h56A6)) 
    a_plus_b_minus_q_carry__0_i_8
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [9]),
        .I1(Q[9]),
        .I2(mode_IBUF),
        .I3(\DELAY_CHAIN_b[5].shift_reg_b_reg[5] [9]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][11] [1]));
  LUT4 #(
    .INIT(16'h56A6)) 
    a_plus_b_minus_q_carry__0_i_9
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [8]),
        .I1(Q[8]),
        .I2(mode_IBUF),
        .I3(\DELAY_CHAIN_b[5].shift_reg_b_reg[5] [8]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][11] [0]));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 a_plus_b_minus_q_carry__1
       (.CI(a_plus_b_minus_q_carry__0_n_0),
        .CO({a_plus_b_minus_q_carry__1_n_0,a_plus_b_minus_q_carry__1_n_1,a_plus_b_minus_q_carry__1_n_2,a_plus_b_minus_q_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({\out_a_OBUF[13]_inst_i_1 [0],\out_a_OBUF[9]_inst_i_1 [3:1]}),
        .O(a_plus_b_minus_q[11:8]),
        .S(\out_a_OBUF[9]_inst_i_1_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    a_plus_b_minus_q_carry__1_i_6
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [15]),
        .I1(Q[15]),
        .I2(mode_IBUF),
        .I3(\DELAY_CHAIN_b[5].shift_reg_b_reg[5] [15]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][15] [3]));
  LUT4 #(
    .INIT(16'h56A6)) 
    a_plus_b_minus_q_carry__1_i_7
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [14]),
        .I1(Q[14]),
        .I2(mode_IBUF),
        .I3(\DELAY_CHAIN_b[5].shift_reg_b_reg[5] [14]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][15] [2]));
  LUT4 #(
    .INIT(16'h56A6)) 
    a_plus_b_minus_q_carry__1_i_8
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [13]),
        .I1(Q[13]),
        .I2(mode_IBUF),
        .I3(\DELAY_CHAIN_b[5].shift_reg_b_reg[5] [13]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][15] [1]));
  LUT4 #(
    .INIT(16'h56A6)) 
    a_plus_b_minus_q_carry__1_i_9
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [12]),
        .I1(Q[12]),
        .I2(mode_IBUF),
        .I3(\DELAY_CHAIN_b[5].shift_reg_b_reg[5] [12]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][15] [0]));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 a_plus_b_minus_q_carry__2
       (.CI(a_plus_b_minus_q_carry__1_n_0),
        .CO({a_plus_b_minus_q_carry__2_n_0,a_plus_b_minus_q_carry__2_n_1,a_plus_b_minus_q_carry__2_n_2,a_plus_b_minus_q_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(a_plus_b_minus_q[15:12]),
        .S({\out_a_OBUF[17]_inst_i_1 [0],\out_a_OBUF[13]_inst_i_1 [3:1]}));
  LUT4 #(
    .INIT(16'h56A6)) 
    a_plus_b_minus_q_carry__2_i_2
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [19]),
        .I1(Q[19]),
        .I2(mode_IBUF),
        .I3(\DELAY_CHAIN_b[5].shift_reg_b_reg[5] [19]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][19] [3]));
  LUT4 #(
    .INIT(16'h56A6)) 
    a_plus_b_minus_q_carry__2_i_3
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [18]),
        .I1(Q[18]),
        .I2(mode_IBUF),
        .I3(\DELAY_CHAIN_b[5].shift_reg_b_reg[5] [18]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][19] [2]));
  LUT4 #(
    .INIT(16'h56A6)) 
    a_plus_b_minus_q_carry__2_i_4
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [17]),
        .I1(Q[17]),
        .I2(mode_IBUF),
        .I3(\DELAY_CHAIN_b[5].shift_reg_b_reg[5] [17]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][19] [1]));
  LUT4 #(
    .INIT(16'h56A6)) 
    a_plus_b_minus_q_carry__2_i_5
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [16]),
        .I1(Q[16]),
        .I2(mode_IBUF),
        .I3(\DELAY_CHAIN_b[5].shift_reg_b_reg[5] [16]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][19] [0]));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 a_plus_b_minus_q_carry__3
       (.CI(a_plus_b_minus_q_carry__2_n_0),
        .CO({a_plus_b_minus_q_carry__3_n_0,a_plus_b_minus_q_carry__3_n_1,a_plus_b_minus_q_carry__3_n_2,a_plus_b_minus_q_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(a_plus_b_minus_q[19:16]),
        .S({\out_a_OBUF[21]_inst_i_1 [0],\out_a_OBUF[17]_inst_i_1 [3:1]}));
  LUT4 #(
    .INIT(16'h56A6)) 
    a_plus_b_minus_q_carry__3_i_2
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [22]),
        .I1(Q[22]),
        .I2(mode_IBUF),
        .I3(\DELAY_CHAIN_b[5].shift_reg_b_reg[5] [22]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][22] [2]));
  LUT4 #(
    .INIT(16'h56A6)) 
    a_plus_b_minus_q_carry__3_i_3
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [21]),
        .I1(Q[21]),
        .I2(mode_IBUF),
        .I3(\DELAY_CHAIN_b[5].shift_reg_b_reg[5] [21]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][22] [1]));
  LUT4 #(
    .INIT(16'h56A6)) 
    a_plus_b_minus_q_carry__3_i_4
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [20]),
        .I1(Q[20]),
        .I2(mode_IBUF),
        .I3(\DELAY_CHAIN_b[5].shift_reg_b_reg[5] [20]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][22] [0]));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 a_plus_b_minus_q_carry__4
       (.CI(a_plus_b_minus_q_carry__3_n_0),
        .CO({NLW_a_plus_b_minus_q_carry__4_CO_UNCONNECTED[3:2],a_plus_b_minus_q_carry__4_n_2,a_plus_b_minus_q_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_a_plus_b_minus_q_carry__4_O_UNCONNECTED[3],a_plus_b_minus_q[22:20]}),
        .S({1'b0,\out_a_OBUF[21]_inst_i_1 [3:1]}));
  LUT4 #(
    .INIT(16'h56A6)) 
    a_plus_b_minus_q_carry_i_10
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [0]),
        .I1(Q[0]),
        .I2(mode_IBUF),
        .I3(\DELAY_CHAIN_b[5].shift_reg_b_reg[5] [0]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][3] [0]));
  LUT4 #(
    .INIT(16'h56A6)) 
    a_plus_b_minus_q_carry_i_11
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [7]),
        .I1(Q[7]),
        .I2(mode_IBUF),
        .I3(\DELAY_CHAIN_b[5].shift_reg_b_reg[5] [7]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][7] [3]));
  LUT4 #(
    .INIT(16'h56A6)) 
    a_plus_b_minus_q_carry_i_12
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [6]),
        .I1(Q[6]),
        .I2(mode_IBUF),
        .I3(\DELAY_CHAIN_b[5].shift_reg_b_reg[5] [6]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][7] [2]));
  LUT4 #(
    .INIT(16'h56A6)) 
    a_plus_b_minus_q_carry_i_13
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [5]),
        .I1(Q[5]),
        .I2(mode_IBUF),
        .I3(\DELAY_CHAIN_b[5].shift_reg_b_reg[5] [5]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][7] [1]));
  LUT4 #(
    .INIT(16'h56A6)) 
    a_plus_b_minus_q_carry_i_14
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [4]),
        .I1(Q[4]),
        .I2(mode_IBUF),
        .I3(\DELAY_CHAIN_b[5].shift_reg_b_reg[5] [4]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][7] [0]));
  LUT4 #(
    .INIT(16'h56A6)) 
    a_plus_b_minus_q_carry_i_7
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [3]),
        .I1(Q[3]),
        .I2(mode_IBUF),
        .I3(\DELAY_CHAIN_b[5].shift_reg_b_reg[5] [3]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][3] [3]));
  LUT4 #(
    .INIT(16'h56A6)) 
    a_plus_b_minus_q_carry_i_8
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [2]),
        .I1(Q[2]),
        .I2(mode_IBUF),
        .I3(\DELAY_CHAIN_b[5].shift_reg_b_reg[5] [2]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][3] [2]));
  LUT4 #(
    .INIT(16'h56A6)) 
    a_plus_b_minus_q_carry_i_9
       (.I0(\DELAY_CHAIN_a[5].shift_reg_a_reg[5] [1]),
        .I1(Q[1]),
        .I2(mode_IBUF),
        .I3(\DELAY_CHAIN_b[5].shift_reg_b_reg[5] [1]),
        .O(\DELAY_CHAIN_a[5].shift_reg_a_reg[5][3] [1]));
endmodule

module mod_mul
   (S,
    DI,
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][2] ,
    Q,
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][6] ,
    \a[15] ,
    \a[15]_0 ,
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][10] ,
    \out_reg[22] ,
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][22] ,
    out1_carry__1,
    \a[17] ,
    \a[19] ,
    mode,
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][15] ,
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][15]_0 ,
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][11] ,
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][11]_0 ,
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][7] ,
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][7]_0 ,
    O,
    out_b_OBUF,
    out_a_OBUF,
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][22]_0 ,
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][19] ,
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][3] ,
    i___1_carry__2_i_12,
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][7]_1 ,
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5][11]_1 ,
    \out_reg[19] ,
    clk_IBUF_BUFG,
    reset_IBUF,
    A,
    zeta_IBUF,
    mode_IBUF,
    b_IBUF,
    a_IBUF,
    CO,
    \DELAY_CHAIN_a[5].shift_reg_a_reg[5] ,
    sub_out,
    a_plus_b_minus_q,
    a_plus_b_minus_q_carry,
    a_plus_b_minus_q_carry_0,
    a_plus_b_minus_q_carry__0,
    a_plus_b_minus_q_carry__1,
    a_plus_b_minus_q_carry__2,
    a_plus_b_minus_q_carry__3,
    \_inferred__1/i___1_carry ,
    \_inferred__1/i___1_carry_0 ,
    \_inferred__1/i___1_carry__3 ,
    \_inferred__1/i___1_carry__3_0 );
  output [3:0]S;
  output [3:0]DI;
  output [2:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][2] ;
  output [22:0]Q;
  output [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][6] ;
  output [3:0]\a[15] ;
  output [3:0]\a[15]_0 ;
  output [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][10] ;
  output [3:0]\out_reg[22] ;
  output [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][22] ;
  output [3:0]out1_carry__1;
  output [3:0]\a[17] ;
  output [1:0]\a[19] ;
  output [2:0]mode;
  output [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][15] ;
  output [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][15]_0 ;
  output [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][11] ;
  output [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][11]_0 ;
  output [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][7] ;
  output [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][7]_0 ;
  output [3:0]O;
  output [22:0]out_b_OBUF;
  output [22:0]out_a_OBUF;
  output [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][22]_0 ;
  output [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][19] ;
  output [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][3] ;
  output [3:0]i___1_carry__2_i_12;
  output [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][7]_1 ;
  output [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][11]_1 ;
  output [3:0]\out_reg[19] ;
  input clk_IBUF_BUFG;
  input reset_IBUF;
  input [19:0]A;
  input [22:0]zeta_IBUF;
  input mode_IBUF;
  input [22:0]b_IBUF;
  input [22:0]a_IBUF;
  input [0:0]CO;
  input [22:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5] ;
  input [22:0]sub_out;
  input [22:0]a_plus_b_minus_q;
  input [3:0]a_plus_b_minus_q_carry;
  input [3:0]a_plus_b_minus_q_carry_0;
  input [3:0]a_plus_b_minus_q_carry__0;
  input [3:0]a_plus_b_minus_q_carry__1;
  input [3:0]a_plus_b_minus_q_carry__2;
  input [2:0]a_plus_b_minus_q_carry__3;
  input \_inferred__1/i___1_carry ;
  input \_inferred__1/i___1_carry_0 ;
  input \_inferred__1/i___1_carry__3 ;
  input \_inferred__1/i___1_carry__3_0 ;

  wire [19:0]A;
  wire [0:0]CO;
  wire [22:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5] ;
  wire [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][10] ;
  wire [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][11] ;
  wire [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][11]_0 ;
  wire [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][11]_1 ;
  wire [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][15] ;
  wire [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][15]_0 ;
  wire [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][19] ;
  wire [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][22] ;
  wire [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][22]_0 ;
  wire [2:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][2] ;
  wire [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][3] ;
  wire [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][6] ;
  wire [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][7] ;
  wire [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][7]_0 ;
  wire [3:0]\DELAY_CHAIN_a[5].shift_reg_a_reg[5][7]_1 ;
  wire [3:0]DI;
  wire MR_n_100;
  wire MR_n_101;
  wire MR_n_99;
  wire [3:0]O;
  wire [22:0]Q;
  wire [3:0]S;
  wire \_inferred__1/i___1_carry ;
  wire \_inferred__1/i___1_carry_0 ;
  wire \_inferred__1/i___1_carry__3 ;
  wire \_inferred__1/i___1_carry__3_0 ;
  wire [3:0]\a[15] ;
  wire [3:0]\a[15]_0 ;
  wire [3:0]\a[17] ;
  wire [1:0]\a[19] ;
  wire [22:0]a_IBUF;
  wire a_mul_b0_i_1_n_0;
  wire a_mul_b0_i_1_n_1;
  wire a_mul_b0_i_1_n_2;
  wire a_mul_b0_i_1_n_3;
  wire a_mul_b0_i_1_n_4;
  wire a_mul_b0_i_1_n_5;
  wire a_mul_b0_i_1_n_6;
  wire a_mul_b0_i_1_n_7;
  wire a_mul_b0_i_29_n_0;
  wire a_mul_b0_i_2_n_0;
  wire a_mul_b0_i_2_n_1;
  wire a_mul_b0_i_2_n_2;
  wire a_mul_b0_i_2_n_3;
  wire a_mul_b0_i_2_n_4;
  wire a_mul_b0_i_2_n_5;
  wire a_mul_b0_i_2_n_6;
  wire a_mul_b0_i_2_n_7;
  wire a_mul_b0_i_30_n_0;
  wire a_mul_b0_i_31_n_0;
  wire a_mul_b0_i_32_n_0;
  wire a_mul_b0_i_33_n_0;
  wire a_mul_b0_i_34_n_0;
  wire a_mul_b0_i_35_n_0;
  wire a_mul_b0_i_36_n_0;
  wire a_mul_b0_i_37_n_0;
  wire a_mul_b0_i_38_n_0;
  wire a_mul_b0_i_39_n_0;
  wire a_mul_b0_i_3_n_0;
  wire a_mul_b0_i_3_n_1;
  wire a_mul_b0_i_3_n_2;
  wire a_mul_b0_i_3_n_3;
  wire a_mul_b0_i_3_n_4;
  wire a_mul_b0_i_3_n_5;
  wire a_mul_b0_i_3_n_6;
  wire a_mul_b0_i_3_n_7;
  wire a_mul_b0_i_40_n_0;
  wire a_mul_b0_i_41_n_0;
  wire a_mul_b0_i_42_n_0;
  wire a_mul_b0_i_43_n_0;
  wire a_mul_b0_i_44_n_0;
  wire a_mul_b0_i_45_n_0;
  wire a_mul_b0_i_46_n_0;
  wire a_mul_b0_i_47_n_0;
  wire a_mul_b0_i_48_n_0;
  wire a_mul_b0_i_49_n_0;
  wire a_mul_b0_i_4_n_0;
  wire a_mul_b0_i_4_n_1;
  wire a_mul_b0_i_4_n_2;
  wire a_mul_b0_i_4_n_3;
  wire a_mul_b0_i_4_n_4;
  wire a_mul_b0_i_4_n_5;
  wire a_mul_b0_i_4_n_6;
  wire a_mul_b0_i_4_n_7;
  wire a_mul_b0_i_50_n_0;
  wire a_mul_b0_i_51_n_0;
  wire a_mul_b0_i_52_n_0;
  wire a_mul_b0_i_53_n_0;
  wire a_mul_b0_i_54_n_0;
  wire a_mul_b0_i_55_n_0;
  wire a_mul_b0_i_5_n_0;
  wire a_mul_b0_i_5_n_1;
  wire a_mul_b0_i_5_n_2;
  wire a_mul_b0_i_5_n_3;
  wire a_mul_b0_i_5_n_4;
  wire a_mul_b0_i_5_n_5;
  wire a_mul_b0_i_5_n_6;
  wire a_mul_b0_i_5_n_7;
  wire a_mul_b0_n_100;
  wire a_mul_b0_n_101;
  wire a_mul_b0_n_102;
  wire a_mul_b0_n_103;
  wire a_mul_b0_n_104;
  wire a_mul_b0_n_105;
  wire a_mul_b0_n_106;
  wire a_mul_b0_n_107;
  wire a_mul_b0_n_108;
  wire a_mul_b0_n_109;
  wire a_mul_b0_n_110;
  wire a_mul_b0_n_111;
  wire a_mul_b0_n_112;
  wire a_mul_b0_n_113;
  wire a_mul_b0_n_114;
  wire a_mul_b0_n_115;
  wire a_mul_b0_n_116;
  wire a_mul_b0_n_117;
  wire a_mul_b0_n_118;
  wire a_mul_b0_n_119;
  wire a_mul_b0_n_120;
  wire a_mul_b0_n_121;
  wire a_mul_b0_n_122;
  wire a_mul_b0_n_123;
  wire a_mul_b0_n_124;
  wire a_mul_b0_n_125;
  wire a_mul_b0_n_126;
  wire a_mul_b0_n_127;
  wire a_mul_b0_n_128;
  wire a_mul_b0_n_129;
  wire a_mul_b0_n_130;
  wire a_mul_b0_n_131;
  wire a_mul_b0_n_132;
  wire a_mul_b0_n_133;
  wire a_mul_b0_n_134;
  wire a_mul_b0_n_135;
  wire a_mul_b0_n_136;
  wire a_mul_b0_n_137;
  wire a_mul_b0_n_138;
  wire a_mul_b0_n_139;
  wire a_mul_b0_n_140;
  wire a_mul_b0_n_141;
  wire a_mul_b0_n_142;
  wire a_mul_b0_n_143;
  wire a_mul_b0_n_144;
  wire a_mul_b0_n_145;
  wire a_mul_b0_n_146;
  wire a_mul_b0_n_147;
  wire a_mul_b0_n_148;
  wire a_mul_b0_n_149;
  wire a_mul_b0_n_150;
  wire a_mul_b0_n_151;
  wire a_mul_b0_n_152;
  wire a_mul_b0_n_153;
  wire a_mul_b0_n_24;
  wire a_mul_b0_n_25;
  wire a_mul_b0_n_26;
  wire a_mul_b0_n_27;
  wire a_mul_b0_n_28;
  wire a_mul_b0_n_29;
  wire a_mul_b0_n_30;
  wire a_mul_b0_n_31;
  wire a_mul_b0_n_32;
  wire a_mul_b0_n_33;
  wire a_mul_b0_n_34;
  wire a_mul_b0_n_35;
  wire a_mul_b0_n_36;
  wire a_mul_b0_n_37;
  wire a_mul_b0_n_38;
  wire a_mul_b0_n_39;
  wire a_mul_b0_n_40;
  wire a_mul_b0_n_41;
  wire a_mul_b0_n_42;
  wire a_mul_b0_n_43;
  wire a_mul_b0_n_44;
  wire a_mul_b0_n_45;
  wire a_mul_b0_n_46;
  wire a_mul_b0_n_47;
  wire a_mul_b0_n_48;
  wire a_mul_b0_n_49;
  wire a_mul_b0_n_50;
  wire a_mul_b0_n_51;
  wire a_mul_b0_n_52;
  wire a_mul_b0_n_53;
  wire a_mul_b0_n_58;
  wire a_mul_b0_n_59;
  wire a_mul_b0_n_60;
  wire a_mul_b0_n_61;
  wire a_mul_b0_n_62;
  wire a_mul_b0_n_63;
  wire a_mul_b0_n_64;
  wire a_mul_b0_n_65;
  wire a_mul_b0_n_66;
  wire a_mul_b0_n_67;
  wire a_mul_b0_n_68;
  wire a_mul_b0_n_69;
  wire a_mul_b0_n_70;
  wire a_mul_b0_n_71;
  wire a_mul_b0_n_72;
  wire a_mul_b0_n_73;
  wire a_mul_b0_n_74;
  wire a_mul_b0_n_75;
  wire a_mul_b0_n_76;
  wire a_mul_b0_n_77;
  wire a_mul_b0_n_78;
  wire a_mul_b0_n_79;
  wire a_mul_b0_n_80;
  wire a_mul_b0_n_81;
  wire a_mul_b0_n_82;
  wire a_mul_b0_n_83;
  wire a_mul_b0_n_84;
  wire a_mul_b0_n_85;
  wire a_mul_b0_n_86;
  wire a_mul_b0_n_87;
  wire a_mul_b0_n_88;
  wire a_mul_b0_n_89;
  wire a_mul_b0_n_90;
  wire a_mul_b0_n_91;
  wire a_mul_b0_n_92;
  wire a_mul_b0_n_93;
  wire a_mul_b0_n_94;
  wire a_mul_b0_n_95;
  wire a_mul_b0_n_96;
  wire a_mul_b0_n_97;
  wire a_mul_b0_n_98;
  wire a_mul_b0_n_99;
  wire a_mul_b_reg_i_1_n_2;
  wire a_mul_b_reg_i_1_n_3;
  wire a_mul_b_reg_i_1_n_5;
  wire a_mul_b_reg_i_1_n_6;
  wire a_mul_b_reg_i_1_n_7;
  wire a_mul_b_reg_i_2_n_0;
  wire a_mul_b_reg_i_3_n_0;
  wire a_mul_b_reg_i_4_n_0;
  wire a_mul_b_reg_i_5_n_0;
  wire a_mul_b_reg_i_6_n_0;
  wire a_mul_b_reg_n_58;
  wire a_mul_b_reg_n_59;
  wire a_mul_b_reg_n_60;
  wire a_mul_b_reg_n_61;
  wire a_mul_b_reg_n_62;
  wire a_mul_b_reg_n_63;
  wire a_mul_b_reg_n_64;
  wire a_mul_b_reg_n_65;
  wire a_mul_b_reg_n_66;
  wire a_mul_b_reg_n_67;
  wire a_mul_b_reg_n_68;
  wire a_mul_b_reg_n_69;
  wire a_mul_b_reg_n_70;
  wire a_mul_b_reg_n_71;
  wire a_mul_b_reg_n_72;
  wire a_mul_b_reg_n_73;
  wire a_mul_b_reg_n_74;
  wire a_mul_b_reg_n_75;
  wire a_mul_b_reg_n_76;
  wire a_mul_b_reg_n_77;
  wire a_mul_b_reg_n_78;
  wire a_mul_b_reg_n_80;
  wire a_mul_b_reg_n_81;
  wire a_mul_b_reg_n_82;
  wire a_mul_b_reg_n_83;
  wire a_mul_b_reg_n_84;
  wire a_mul_b_reg_n_85;
  wire a_mul_b_reg_n_86;
  wire a_mul_b_reg_n_87;
  wire a_mul_b_reg_n_88;
  wire a_mul_b_reg_n_90;
  wire a_mul_b_reg_n_91;
  wire a_mul_b_reg_n_92;
  wire a_mul_b_reg_n_93;
  wire a_mul_b_reg_n_94;
  wire a_mul_b_reg_n_95;
  wire a_mul_b_reg_n_96;
  wire a_mul_b_reg_n_97;
  wire a_mul_b_reg_n_98;
  wire [22:0]a_plus_b_minus_q;
  wire [3:0]a_plus_b_minus_q_carry;
  wire [3:0]a_plus_b_minus_q_carry_0;
  wire [3:0]a_plus_b_minus_q_carry__0;
  wire [3:0]a_plus_b_minus_q_carry__1;
  wire [3:0]a_plus_b_minus_q_carry__2;
  wire [2:0]a_plus_b_minus_q_carry__3;
  wire [22:0]b_IBUF;
  wire clk_IBUF_BUFG;
  wire [3:0]i___1_carry__2_i_12;
  wire i___1_carry__4_i_11_n_0;
  wire i___1_carry__4_i_8_n_0;
  wire [22:0]in;
  wire [2:0]mode;
  wire mode_IBUF;
  wire [3:0]out1_carry__1;
  wire [22:0]out_a_OBUF;
  wire [22:0]out_b_OBUF;
  wire [3:0]\out_reg[19] ;
  wire [3:0]\out_reg[22] ;
  wire p_0_in;
  wire p_1_in;
  wire p_2_in;
  wire reset_IBUF;
  wire [22:0]sub_out;
  wire [22:0]zeta_IBUF;
  wire NLW_a_mul_b0_CARRYCASCOUT_UNCONNECTED;
  wire NLW_a_mul_b0_MULTSIGNOUT_UNCONNECTED;
  wire NLW_a_mul_b0_OVERFLOW_UNCONNECTED;
  wire NLW_a_mul_b0_PATTERNBDETECT_UNCONNECTED;
  wire NLW_a_mul_b0_PATTERNDETECT_UNCONNECTED;
  wire NLW_a_mul_b0_UNDERFLOW_UNCONNECTED;
  wire [17:0]NLW_a_mul_b0_BCOUT_UNCONNECTED;
  wire [3:0]NLW_a_mul_b0_CARRYOUT_UNCONNECTED;
  wire NLW_a_mul_b_reg_CARRYCASCOUT_UNCONNECTED;
  wire NLW_a_mul_b_reg_MULTSIGNOUT_UNCONNECTED;
  wire NLW_a_mul_b_reg_OVERFLOW_UNCONNECTED;
  wire NLW_a_mul_b_reg_PATTERNBDETECT_UNCONNECTED;
  wire NLW_a_mul_b_reg_PATTERNDETECT_UNCONNECTED;
  wire NLW_a_mul_b_reg_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_a_mul_b_reg_ACOUT_UNCONNECTED;
  wire [17:0]NLW_a_mul_b_reg_BCOUT_UNCONNECTED;
  wire [3:0]NLW_a_mul_b_reg_CARRYOUT_UNCONNECTED;
  wire [47:0]NLW_a_mul_b_reg_PCOUT_UNCONNECTED;
  wire [3:2]NLW_a_mul_b_reg_i_1_CO_UNCONNECTED;
  wire [3:3]NLW_a_mul_b_reg_i_1_O_UNCONNECTED;

  Modular_Reduction MR
       (.A({MR_n_99,MR_n_100,MR_n_101}),
        .CO(CO),
        .\DELAY_CHAIN_a[5].shift_reg_a_reg[5] (\DELAY_CHAIN_a[5].shift_reg_a_reg[5] ),
        .\DELAY_CHAIN_a[5].shift_reg_a_reg[5][10] (\DELAY_CHAIN_a[5].shift_reg_a_reg[5][10] ),
        .\DELAY_CHAIN_a[5].shift_reg_a_reg[5][11] (\DELAY_CHAIN_a[5].shift_reg_a_reg[5][11] ),
        .\DELAY_CHAIN_a[5].shift_reg_a_reg[5][11]_0 (\DELAY_CHAIN_a[5].shift_reg_a_reg[5][11]_0 ),
        .\DELAY_CHAIN_a[5].shift_reg_a_reg[5][11]_1 (\DELAY_CHAIN_a[5].shift_reg_a_reg[5][11]_1 ),
        .\DELAY_CHAIN_a[5].shift_reg_a_reg[5][15] (\DELAY_CHAIN_a[5].shift_reg_a_reg[5][15] ),
        .\DELAY_CHAIN_a[5].shift_reg_a_reg[5][15]_0 (\DELAY_CHAIN_a[5].shift_reg_a_reg[5][15]_0 ),
        .\DELAY_CHAIN_a[5].shift_reg_a_reg[5][19] (\DELAY_CHAIN_a[5].shift_reg_a_reg[5][19] ),
        .\DELAY_CHAIN_a[5].shift_reg_a_reg[5][22] (\DELAY_CHAIN_a[5].shift_reg_a_reg[5][22] ),
        .\DELAY_CHAIN_a[5].shift_reg_a_reg[5][22]_0 (\DELAY_CHAIN_a[5].shift_reg_a_reg[5][22]_0 ),
        .\DELAY_CHAIN_a[5].shift_reg_a_reg[5][2] (\DELAY_CHAIN_a[5].shift_reg_a_reg[5][2] ),
        .\DELAY_CHAIN_a[5].shift_reg_a_reg[5][3] (\DELAY_CHAIN_a[5].shift_reg_a_reg[5][3] ),
        .\DELAY_CHAIN_a[5].shift_reg_a_reg[5][6] (\DELAY_CHAIN_a[5].shift_reg_a_reg[5][6] ),
        .\DELAY_CHAIN_a[5].shift_reg_a_reg[5][7] (\DELAY_CHAIN_a[5].shift_reg_a_reg[5][7] ),
        .\DELAY_CHAIN_a[5].shift_reg_a_reg[5][7]_0 (\DELAY_CHAIN_a[5].shift_reg_a_reg[5][7]_0 ),
        .\DELAY_CHAIN_a[5].shift_reg_a_reg[5][7]_1 (\DELAY_CHAIN_a[5].shift_reg_a_reg[5][7]_1 ),
        .DI(DI),
        .O(O),
        .P({a_mul_b_reg_n_77,a_mul_b_reg_n_78,p_2_in,a_mul_b_reg_n_80,a_mul_b_reg_n_81,a_mul_b_reg_n_82,a_mul_b_reg_n_83,a_mul_b_reg_n_84,a_mul_b_reg_n_85,a_mul_b_reg_n_86,a_mul_b_reg_n_87,a_mul_b_reg_n_88,p_0_in,a_mul_b_reg_n_90,a_mul_b_reg_n_91,a_mul_b_reg_n_92,a_mul_b_reg_n_93,a_mul_b_reg_n_94,a_mul_b_reg_n_95,a_mul_b_reg_n_96,a_mul_b_reg_n_97,a_mul_b_reg_n_98,p_1_in,in[22:17]}),
        .Q(Q),
        .S(S),
        .\_inferred__1/i___1_carry (\_inferred__1/i___1_carry ),
        .\_inferred__1/i___1_carry_0 (\_inferred__1/i___1_carry_0 ),
        .\_inferred__1/i___1_carry__3 (\_inferred__1/i___1_carry__3 ),
        .\_inferred__1/i___1_carry__3_0 (\_inferred__1/i___1_carry__3_0 ),
        .\_inferred__1/i___1_carry__4 (i___1_carry__4_i_8_n_0),
        .\_inferred__1/i___1_carry__4_0 (i___1_carry__4_i_11_n_0),
        .\a[15] (\a[15] ),
        .\a[15]_0 (\a[15]_0 ),
        .\a[17] (\a[17] ),
        .\a[19] (\a[19] ),
        .a_IBUF(a_IBUF),
        .a_plus_b_minus_q(a_plus_b_minus_q),
        .a_plus_b_minus_q_carry(a_plus_b_minus_q_carry),
        .a_plus_b_minus_q_carry_0(a_plus_b_minus_q_carry_0),
        .a_plus_b_minus_q_carry__0(a_plus_b_minus_q_carry__0),
        .a_plus_b_minus_q_carry__1(a_plus_b_minus_q_carry__1),
        .a_plus_b_minus_q_carry__2(a_plus_b_minus_q_carry__2),
        .a_plus_b_minus_q_carry__3(a_plus_b_minus_q_carry__3),
        .b_IBUF(b_IBUF),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .i___1_carry__2_i_12_0(i___1_carry__2_i_12),
        .mode(mode),
        .mode_IBUF(mode_IBUF),
        .out1_carry__1(out1_carry__1),
        .out_a_OBUF(out_a_OBUF),
        .out_b_OBUF(out_b_OBUF),
        .\out_reg[19]_0 (\out_reg[19] ),
        .\out_reg[22]_0 (\out_reg[22] ),
        .reset_IBUF(reset_IBUF),
        .sub_out(sub_out),
        .\x_temp_reg[16]_0 (in[16:0]));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-11 {cell *THIS*}}" *) 
  DSP48E1 #(
    .ACASCREG(1),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(1),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(1),
    .BREG(1),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(0),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    a_mul_b0
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,MR_n_99,MR_n_100,MR_n_101,A}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT({a_mul_b0_n_24,a_mul_b0_n_25,a_mul_b0_n_26,a_mul_b0_n_27,a_mul_b0_n_28,a_mul_b0_n_29,a_mul_b0_n_30,a_mul_b0_n_31,a_mul_b0_n_32,a_mul_b0_n_33,a_mul_b0_n_34,a_mul_b0_n_35,a_mul_b0_n_36,a_mul_b0_n_37,a_mul_b0_n_38,a_mul_b0_n_39,a_mul_b0_n_40,a_mul_b0_n_41,a_mul_b0_n_42,a_mul_b0_n_43,a_mul_b0_n_44,a_mul_b0_n_45,a_mul_b0_n_46,a_mul_b0_n_47,a_mul_b0_n_48,a_mul_b0_n_49,a_mul_b0_n_50,a_mul_b0_n_51,a_mul_b0_n_52,a_mul_b0_n_53}),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,a_mul_b0_i_1_n_7,a_mul_b0_i_2_n_4,a_mul_b0_i_2_n_5,a_mul_b0_i_2_n_6,a_mul_b0_i_2_n_7,a_mul_b0_i_3_n_4,a_mul_b0_i_3_n_5,a_mul_b0_i_3_n_6,a_mul_b0_i_3_n_7,a_mul_b0_i_4_n_4,a_mul_b0_i_4_n_5,a_mul_b0_i_4_n_6,a_mul_b0_i_4_n_7,a_mul_b0_i_5_n_4,a_mul_b0_i_5_n_5,a_mul_b0_i_5_n_6,a_mul_b0_i_5_n_7}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_a_mul_b0_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_a_mul_b0_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_a_mul_b0_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(1'b1),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b1),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(1'b0),
        .CLK(clk_IBUF_BUFG),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_a_mul_b0_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_a_mul_b0_OVERFLOW_UNCONNECTED),
        .P({a_mul_b0_n_58,a_mul_b0_n_59,a_mul_b0_n_60,a_mul_b0_n_61,a_mul_b0_n_62,a_mul_b0_n_63,a_mul_b0_n_64,a_mul_b0_n_65,a_mul_b0_n_66,a_mul_b0_n_67,a_mul_b0_n_68,a_mul_b0_n_69,a_mul_b0_n_70,a_mul_b0_n_71,a_mul_b0_n_72,a_mul_b0_n_73,a_mul_b0_n_74,a_mul_b0_n_75,a_mul_b0_n_76,a_mul_b0_n_77,a_mul_b0_n_78,a_mul_b0_n_79,a_mul_b0_n_80,a_mul_b0_n_81,a_mul_b0_n_82,a_mul_b0_n_83,a_mul_b0_n_84,a_mul_b0_n_85,a_mul_b0_n_86,a_mul_b0_n_87,a_mul_b0_n_88,a_mul_b0_n_89,a_mul_b0_n_90,a_mul_b0_n_91,a_mul_b0_n_92,a_mul_b0_n_93,a_mul_b0_n_94,a_mul_b0_n_95,a_mul_b0_n_96,a_mul_b0_n_97,a_mul_b0_n_98,a_mul_b0_n_99,a_mul_b0_n_100,a_mul_b0_n_101,a_mul_b0_n_102,a_mul_b0_n_103,a_mul_b0_n_104,a_mul_b0_n_105}),
        .PATTERNBDETECT(NLW_a_mul_b0_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_a_mul_b0_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT({a_mul_b0_n_106,a_mul_b0_n_107,a_mul_b0_n_108,a_mul_b0_n_109,a_mul_b0_n_110,a_mul_b0_n_111,a_mul_b0_n_112,a_mul_b0_n_113,a_mul_b0_n_114,a_mul_b0_n_115,a_mul_b0_n_116,a_mul_b0_n_117,a_mul_b0_n_118,a_mul_b0_n_119,a_mul_b0_n_120,a_mul_b0_n_121,a_mul_b0_n_122,a_mul_b0_n_123,a_mul_b0_n_124,a_mul_b0_n_125,a_mul_b0_n_126,a_mul_b0_n_127,a_mul_b0_n_128,a_mul_b0_n_129,a_mul_b0_n_130,a_mul_b0_n_131,a_mul_b0_n_132,a_mul_b0_n_133,a_mul_b0_n_134,a_mul_b0_n_135,a_mul_b0_n_136,a_mul_b0_n_137,a_mul_b0_n_138,a_mul_b0_n_139,a_mul_b0_n_140,a_mul_b0_n_141,a_mul_b0_n_142,a_mul_b0_n_143,a_mul_b0_n_144,a_mul_b0_n_145,a_mul_b0_n_146,a_mul_b0_n_147,a_mul_b0_n_148,a_mul_b0_n_149,a_mul_b0_n_150,a_mul_b0_n_151,a_mul_b0_n_152,a_mul_b0_n_153}),
        .RSTA(reset_IBUF),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(reset_IBUF),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_a_mul_b0_UNDERFLOW_UNCONNECTED));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 a_mul_b0_i_1
       (.CI(a_mul_b0_i_2_n_0),
        .CO({a_mul_b0_i_1_n_0,a_mul_b0_i_1_n_1,a_mul_b0_i_1_n_2,a_mul_b0_i_1_n_3}),
        .CYINIT(1'b0),
        .DI({a_mul_b0_i_29_n_0,a_mul_b0_i_30_n_0,a_mul_b0_i_31_n_0,a_mul_b0_i_32_n_0}),
        .O({a_mul_b0_i_1_n_4,a_mul_b0_i_1_n_5,a_mul_b0_i_1_n_6,a_mul_b0_i_1_n_7}),
        .S({a_mul_b0_i_33_n_0,a_mul_b0_i_34_n_0,a_mul_b0_i_35_n_0,a_mul_b0_i_36_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 a_mul_b0_i_2
       (.CI(a_mul_b0_i_3_n_0),
        .CO({a_mul_b0_i_2_n_0,a_mul_b0_i_2_n_1,a_mul_b0_i_2_n_2,a_mul_b0_i_2_n_3}),
        .CYINIT(1'b0),
        .DI({a_mul_b0_i_37_n_0,a_mul_b0_i_38_n_0,a_mul_b0_i_39_n_0,1'b0}),
        .O({a_mul_b0_i_2_n_4,a_mul_b0_i_2_n_5,a_mul_b0_i_2_n_6,a_mul_b0_i_2_n_7}),
        .S({a_mul_b0_i_40_n_0,a_mul_b0_i_41_n_0,a_mul_b0_i_42_n_0,a_mul_b0_i_43_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    a_mul_b0_i_29
       (.I0(mode_IBUF),
        .I1(zeta_IBUF[18]),
        .O(a_mul_b0_i_29_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 a_mul_b0_i_3
       (.CI(a_mul_b0_i_4_n_0),
        .CO({a_mul_b0_i_3_n_0,a_mul_b0_i_3_n_1,a_mul_b0_i_3_n_2,a_mul_b0_i_3_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({a_mul_b0_i_3_n_4,a_mul_b0_i_3_n_5,a_mul_b0_i_3_n_6,a_mul_b0_i_3_n_7}),
        .S({a_mul_b0_i_44_n_0,a_mul_b0_i_45_n_0,a_mul_b0_i_46_n_0,a_mul_b0_i_47_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    a_mul_b0_i_30
       (.I0(mode_IBUF),
        .I1(zeta_IBUF[17]),
        .O(a_mul_b0_i_30_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    a_mul_b0_i_31
       (.I0(mode_IBUF),
        .I1(zeta_IBUF[16]),
        .O(a_mul_b0_i_31_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    a_mul_b0_i_32
       (.I0(mode_IBUF),
        .I1(zeta_IBUF[15]),
        .O(a_mul_b0_i_32_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    a_mul_b0_i_33
       (.I0(zeta_IBUF[18]),
        .I1(zeta_IBUF[19]),
        .O(a_mul_b0_i_33_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    a_mul_b0_i_34
       (.I0(zeta_IBUF[17]),
        .I1(zeta_IBUF[18]),
        .O(a_mul_b0_i_34_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    a_mul_b0_i_35
       (.I0(zeta_IBUF[16]),
        .I1(zeta_IBUF[17]),
        .O(a_mul_b0_i_35_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    a_mul_b0_i_36
       (.I0(zeta_IBUF[15]),
        .I1(zeta_IBUF[16]),
        .O(a_mul_b0_i_36_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    a_mul_b0_i_37
       (.I0(mode_IBUF),
        .I1(zeta_IBUF[14]),
        .O(a_mul_b0_i_37_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    a_mul_b0_i_38
       (.I0(mode_IBUF),
        .I1(zeta_IBUF[13]),
        .O(a_mul_b0_i_38_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    a_mul_b0_i_39
       (.I0(zeta_IBUF[13]),
        .I1(mode_IBUF),
        .O(a_mul_b0_i_39_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 a_mul_b0_i_4
       (.CI(a_mul_b0_i_5_n_0),
        .CO({a_mul_b0_i_4_n_0,a_mul_b0_i_4_n_1,a_mul_b0_i_4_n_2,a_mul_b0_i_4_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({a_mul_b0_i_4_n_4,a_mul_b0_i_4_n_5,a_mul_b0_i_4_n_6,a_mul_b0_i_4_n_7}),
        .S({a_mul_b0_i_48_n_0,a_mul_b0_i_49_n_0,a_mul_b0_i_50_n_0,a_mul_b0_i_51_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    a_mul_b0_i_40
       (.I0(zeta_IBUF[14]),
        .I1(zeta_IBUF[15]),
        .O(a_mul_b0_i_40_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    a_mul_b0_i_41
       (.I0(zeta_IBUF[13]),
        .I1(zeta_IBUF[14]),
        .O(a_mul_b0_i_41_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    a_mul_b0_i_42
       (.I0(zeta_IBUF[13]),
        .O(a_mul_b0_i_42_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    a_mul_b0_i_43
       (.I0(mode_IBUF),
        .I1(zeta_IBUF[12]),
        .O(a_mul_b0_i_43_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    a_mul_b0_i_44
       (.I0(mode_IBUF),
        .I1(zeta_IBUF[11]),
        .O(a_mul_b0_i_44_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    a_mul_b0_i_45
       (.I0(mode_IBUF),
        .I1(zeta_IBUF[10]),
        .O(a_mul_b0_i_45_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    a_mul_b0_i_46
       (.I0(mode_IBUF),
        .I1(zeta_IBUF[9]),
        .O(a_mul_b0_i_46_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    a_mul_b0_i_47
       (.I0(mode_IBUF),
        .I1(zeta_IBUF[8]),
        .O(a_mul_b0_i_47_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    a_mul_b0_i_48
       (.I0(mode_IBUF),
        .I1(zeta_IBUF[7]),
        .O(a_mul_b0_i_48_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    a_mul_b0_i_49
       (.I0(mode_IBUF),
        .I1(zeta_IBUF[6]),
        .O(a_mul_b0_i_49_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 a_mul_b0_i_5
       (.CI(1'b0),
        .CO({a_mul_b0_i_5_n_0,a_mul_b0_i_5_n_1,a_mul_b0_i_5_n_2,a_mul_b0_i_5_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,mode_IBUF,1'b0}),
        .O({a_mul_b0_i_5_n_4,a_mul_b0_i_5_n_5,a_mul_b0_i_5_n_6,a_mul_b0_i_5_n_7}),
        .S({a_mul_b0_i_52_n_0,a_mul_b0_i_53_n_0,a_mul_b0_i_54_n_0,a_mul_b0_i_55_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    a_mul_b0_i_50
       (.I0(mode_IBUF),
        .I1(zeta_IBUF[5]),
        .O(a_mul_b0_i_50_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    a_mul_b0_i_51
       (.I0(mode_IBUF),
        .I1(zeta_IBUF[4]),
        .O(a_mul_b0_i_51_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    a_mul_b0_i_52
       (.I0(mode_IBUF),
        .I1(zeta_IBUF[3]),
        .O(a_mul_b0_i_52_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    a_mul_b0_i_53
       (.I0(mode_IBUF),
        .I1(zeta_IBUF[2]),
        .O(a_mul_b0_i_53_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    a_mul_b0_i_54
       (.I0(zeta_IBUF[1]),
        .O(a_mul_b0_i_54_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    a_mul_b0_i_55
       (.I0(mode_IBUF),
        .I1(zeta_IBUF[0]),
        .O(a_mul_b0_i_55_n_0));
  DSP48E1 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("CASCADE"),
    .BCASCREG(1),
    .BREG(1),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    a_mul_b_reg
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACIN({a_mul_b0_n_24,a_mul_b0_n_25,a_mul_b0_n_26,a_mul_b0_n_27,a_mul_b0_n_28,a_mul_b0_n_29,a_mul_b0_n_30,a_mul_b0_n_31,a_mul_b0_n_32,a_mul_b0_n_33,a_mul_b0_n_34,a_mul_b0_n_35,a_mul_b0_n_36,a_mul_b0_n_37,a_mul_b0_n_38,a_mul_b0_n_39,a_mul_b0_n_40,a_mul_b0_n_41,a_mul_b0_n_42,a_mul_b0_n_43,a_mul_b0_n_44,a_mul_b0_n_45,a_mul_b0_n_46,a_mul_b0_n_47,a_mul_b0_n_48,a_mul_b0_n_49,a_mul_b0_n_50,a_mul_b0_n_51,a_mul_b0_n_52,a_mul_b0_n_53}),
        .ACOUT(NLW_a_mul_b_reg_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,a_mul_b_reg_i_1_n_5,a_mul_b_reg_i_1_n_6,a_mul_b_reg_i_1_n_7,a_mul_b0_i_1_n_4,a_mul_b0_i_1_n_5,a_mul_b0_i_1_n_6}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_a_mul_b_reg_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_a_mul_b_reg_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_a_mul_b_reg_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b1),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_a_mul_b_reg_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b1,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_a_mul_b_reg_OVERFLOW_UNCONNECTED),
        .P({a_mul_b_reg_n_58,a_mul_b_reg_n_59,a_mul_b_reg_n_60,a_mul_b_reg_n_61,a_mul_b_reg_n_62,a_mul_b_reg_n_63,a_mul_b_reg_n_64,a_mul_b_reg_n_65,a_mul_b_reg_n_66,a_mul_b_reg_n_67,a_mul_b_reg_n_68,a_mul_b_reg_n_69,a_mul_b_reg_n_70,a_mul_b_reg_n_71,a_mul_b_reg_n_72,a_mul_b_reg_n_73,a_mul_b_reg_n_74,a_mul_b_reg_n_75,a_mul_b_reg_n_76,a_mul_b_reg_n_77,a_mul_b_reg_n_78,p_2_in,a_mul_b_reg_n_80,a_mul_b_reg_n_81,a_mul_b_reg_n_82,a_mul_b_reg_n_83,a_mul_b_reg_n_84,a_mul_b_reg_n_85,a_mul_b_reg_n_86,a_mul_b_reg_n_87,a_mul_b_reg_n_88,p_0_in,a_mul_b_reg_n_90,a_mul_b_reg_n_91,a_mul_b_reg_n_92,a_mul_b_reg_n_93,a_mul_b_reg_n_94,a_mul_b_reg_n_95,a_mul_b_reg_n_96,a_mul_b_reg_n_97,a_mul_b_reg_n_98,p_1_in,in[22:17]}),
        .PATTERNBDETECT(NLW_a_mul_b_reg_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_a_mul_b_reg_PATTERNDETECT_UNCONNECTED),
        .PCIN({a_mul_b0_n_106,a_mul_b0_n_107,a_mul_b0_n_108,a_mul_b0_n_109,a_mul_b0_n_110,a_mul_b0_n_111,a_mul_b0_n_112,a_mul_b0_n_113,a_mul_b0_n_114,a_mul_b0_n_115,a_mul_b0_n_116,a_mul_b0_n_117,a_mul_b0_n_118,a_mul_b0_n_119,a_mul_b0_n_120,a_mul_b0_n_121,a_mul_b0_n_122,a_mul_b0_n_123,a_mul_b0_n_124,a_mul_b0_n_125,a_mul_b0_n_126,a_mul_b0_n_127,a_mul_b0_n_128,a_mul_b0_n_129,a_mul_b0_n_130,a_mul_b0_n_131,a_mul_b0_n_132,a_mul_b0_n_133,a_mul_b0_n_134,a_mul_b0_n_135,a_mul_b0_n_136,a_mul_b0_n_137,a_mul_b0_n_138,a_mul_b0_n_139,a_mul_b0_n_140,a_mul_b0_n_141,a_mul_b0_n_142,a_mul_b0_n_143,a_mul_b0_n_144,a_mul_b0_n_145,a_mul_b0_n_146,a_mul_b0_n_147,a_mul_b0_n_148,a_mul_b0_n_149,a_mul_b0_n_150,a_mul_b0_n_151,a_mul_b0_n_152,a_mul_b0_n_153}),
        .PCOUT(NLW_a_mul_b_reg_PCOUT_UNCONNECTED[47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(reset_IBUF),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(reset_IBUF),
        .UNDERFLOW(NLW_a_mul_b_reg_UNDERFLOW_UNCONNECTED));
  FDRE #(
    .INIT(1'b0)) 
    \a_mul_b_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(a_mul_b0_n_105),
        .Q(in[0]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \a_mul_b_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(a_mul_b0_n_95),
        .Q(in[10]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \a_mul_b_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(a_mul_b0_n_94),
        .Q(in[11]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \a_mul_b_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(a_mul_b0_n_93),
        .Q(in[12]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \a_mul_b_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(a_mul_b0_n_92),
        .Q(in[13]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \a_mul_b_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(a_mul_b0_n_91),
        .Q(in[14]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \a_mul_b_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(a_mul_b0_n_90),
        .Q(in[15]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \a_mul_b_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(a_mul_b0_n_89),
        .Q(in[16]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \a_mul_b_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(a_mul_b0_n_104),
        .Q(in[1]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \a_mul_b_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(a_mul_b0_n_103),
        .Q(in[2]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \a_mul_b_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(a_mul_b0_n_102),
        .Q(in[3]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \a_mul_b_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(a_mul_b0_n_101),
        .Q(in[4]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \a_mul_b_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(a_mul_b0_n_100),
        .Q(in[5]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \a_mul_b_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(a_mul_b0_n_99),
        .Q(in[6]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \a_mul_b_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(a_mul_b0_n_98),
        .Q(in[7]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \a_mul_b_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(a_mul_b0_n_97),
        .Q(in[8]),
        .R(reset_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \a_mul_b_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(a_mul_b0_n_96),
        .Q(in[9]),
        .R(reset_IBUF));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 a_mul_b_reg_i_1
       (.CI(a_mul_b0_i_1_n_0),
        .CO({NLW_a_mul_b_reg_i_1_CO_UNCONNECTED[3:2],a_mul_b_reg_i_1_n_2,a_mul_b_reg_i_1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,a_mul_b_reg_i_2_n_0,a_mul_b_reg_i_3_n_0}),
        .O({NLW_a_mul_b_reg_i_1_O_UNCONNECTED[3],a_mul_b_reg_i_1_n_5,a_mul_b_reg_i_1_n_6,a_mul_b_reg_i_1_n_7}),
        .S({1'b0,a_mul_b_reg_i_4_n_0,a_mul_b_reg_i_5_n_0,a_mul_b_reg_i_6_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    a_mul_b_reg_i_2
       (.I0(mode_IBUF),
        .I1(zeta_IBUF[20]),
        .O(a_mul_b_reg_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    a_mul_b_reg_i_3
       (.I0(mode_IBUF),
        .I1(zeta_IBUF[19]),
        .O(a_mul_b_reg_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    a_mul_b_reg_i_4
       (.I0(zeta_IBUF[22]),
        .I1(zeta_IBUF[21]),
        .O(a_mul_b_reg_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    a_mul_b_reg_i_5
       (.I0(zeta_IBUF[20]),
        .I1(zeta_IBUF[21]),
        .O(a_mul_b_reg_i_5_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    a_mul_b_reg_i_6
       (.I0(zeta_IBUF[19]),
        .I1(zeta_IBUF[20]),
        .O(a_mul_b_reg_i_6_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    i___1_carry__4_i_11
       (.I0(a_IBUF[20]),
        .I1(b_IBUF[20]),
        .O(i___1_carry__4_i_11_n_0));
  LUT6 #(
    .INIT(64'h9999969969699969)) 
    i___1_carry__4_i_8
       (.I0(a_IBUF[22]),
        .I1(b_IBUF[22]),
        .I2(a_IBUF[21]),
        .I3(b_IBUF[20]),
        .I4(a_IBUF[20]),
        .I5(b_IBUF[21]),
        .O(i___1_carry__4_i_8_n_0));
endmodule

module mod_sub
   (CO,
    sub_out,
    \a[2] ,
    A,
    \a[0] ,
    \a[16] ,
    \a[18] ,
    DI,
    S,
    out1_carry__1_0,
    out1_carry__1_1,
    i___1_carry_i_7,
    i___1_carry_i_7_0,
    a_mul_b0,
    a_mul_b0_0,
    a_mul_b0_1,
    a_mul_b0_2,
    a_mul_b0_3,
    a_mul_b0_4,
    a_mul_b0_5,
    a_mul_b0_6,
    a_mul_b0_7,
    a_mul_b0_8,
    a_mul_b0_9,
    a_mul_b0_10,
    a_IBUF,
    b_IBUF,
    mode_IBUF);
  output [0:0]CO;
  output [22:0]sub_out;
  output \a[2] ;
  output [19:0]A;
  output \a[0] ;
  output \a[16] ;
  output \a[18] ;
  input [3:0]DI;
  input [3:0]S;
  input [3:0]out1_carry__1_0;
  input [3:0]out1_carry__1_1;
  input [3:0]i___1_carry_i_7;
  input [3:0]i___1_carry_i_7_0;
  input [2:0]a_mul_b0;
  input [3:0]a_mul_b0_0;
  input [3:0]a_mul_b0_1;
  input [3:0]a_mul_b0_2;
  input [3:0]a_mul_b0_3;
  input [3:0]a_mul_b0_4;
  input [3:0]a_mul_b0_5;
  input [3:0]a_mul_b0_6;
  input [3:0]a_mul_b0_7;
  input [3:0]a_mul_b0_8;
  input [1:0]a_mul_b0_9;
  input [2:0]a_mul_b0_10;
  input [3:0]a_IBUF;
  input [19:0]b_IBUF;
  input mode_IBUF;

  wire [19:0]A;
  wire [0:0]CO;
  wire [3:0]DI;
  wire [3:0]S;
  wire \_inferred__1/i___1_carry__0_n_0 ;
  wire \_inferred__1/i___1_carry__0_n_1 ;
  wire \_inferred__1/i___1_carry__0_n_2 ;
  wire \_inferred__1/i___1_carry__0_n_3 ;
  wire \_inferred__1/i___1_carry__1_n_0 ;
  wire \_inferred__1/i___1_carry__1_n_1 ;
  wire \_inferred__1/i___1_carry__1_n_2 ;
  wire \_inferred__1/i___1_carry__1_n_3 ;
  wire \_inferred__1/i___1_carry__2_n_0 ;
  wire \_inferred__1/i___1_carry__2_n_1 ;
  wire \_inferred__1/i___1_carry__2_n_2 ;
  wire \_inferred__1/i___1_carry__2_n_3 ;
  wire \_inferred__1/i___1_carry__3_n_0 ;
  wire \_inferred__1/i___1_carry__3_n_1 ;
  wire \_inferred__1/i___1_carry__3_n_2 ;
  wire \_inferred__1/i___1_carry__3_n_3 ;
  wire \_inferred__1/i___1_carry__4_n_2 ;
  wire \_inferred__1/i___1_carry__4_n_3 ;
  wire \_inferred__1/i___1_carry_n_0 ;
  wire \_inferred__1/i___1_carry_n_1 ;
  wire \_inferred__1/i___1_carry_n_2 ;
  wire \_inferred__1/i___1_carry_n_3 ;
  wire \a[0] ;
  wire \a[16] ;
  wire \a[18] ;
  wire \a[2] ;
  wire [3:0]a_IBUF;
  wire [2:0]a_mul_b0;
  wire [3:0]a_mul_b0_0;
  wire [3:0]a_mul_b0_1;
  wire [2:0]a_mul_b0_10;
  wire [3:0]a_mul_b0_2;
  wire [3:0]a_mul_b0_3;
  wire [3:0]a_mul_b0_4;
  wire [3:0]a_mul_b0_5;
  wire [3:0]a_mul_b0_6;
  wire [3:0]a_mul_b0_7;
  wire [3:0]a_mul_b0_8;
  wire [1:0]a_mul_b0_9;
  wire [19:0]b_IBUF;
  wire [3:0]i___1_carry_i_7;
  wire [3:0]i___1_carry_i_7_0;
  wire mode_IBUF;
  wire out1_carry__0_n_0;
  wire out1_carry__0_n_1;
  wire out1_carry__0_n_2;
  wire out1_carry__0_n_3;
  wire [3:0]out1_carry__1_0;
  wire [3:0]out1_carry__1_1;
  wire out1_carry__1_n_1;
  wire out1_carry__1_n_2;
  wire out1_carry__1_n_3;
  wire out1_carry_n_0;
  wire out1_carry_n_1;
  wire out1_carry_n_2;
  wire out1_carry_n_3;
  wire [22:0]sub_out;
  wire [3:2]\NLW__inferred__1/i___1_carry__4_CO_UNCONNECTED ;
  wire [3:3]\NLW__inferred__1/i___1_carry__4_O_UNCONNECTED ;
  wire [3:0]NLW_out1_carry_O_UNCONNECTED;
  wire [3:0]NLW_out1_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_out1_carry__1_O_UNCONNECTED;

  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \_inferred__1/i___1_carry 
       (.CI(1'b0),
        .CO({\_inferred__1/i___1_carry_n_0 ,\_inferred__1/i___1_carry_n_1 ,\_inferred__1/i___1_carry_n_2 ,\_inferred__1/i___1_carry_n_3 }),
        .CYINIT(1'b0),
        .DI({a_mul_b0,1'b0}),
        .O(sub_out[3:0]),
        .S(a_mul_b0_0));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \_inferred__1/i___1_carry__0 
       (.CI(\_inferred__1/i___1_carry_n_0 ),
        .CO({\_inferred__1/i___1_carry__0_n_0 ,\_inferred__1/i___1_carry__0_n_1 ,\_inferred__1/i___1_carry__0_n_2 ,\_inferred__1/i___1_carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI(a_mul_b0_1),
        .O(sub_out[7:4]),
        .S(a_mul_b0_2));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \_inferred__1/i___1_carry__1 
       (.CI(\_inferred__1/i___1_carry__0_n_0 ),
        .CO({\_inferred__1/i___1_carry__1_n_0 ,\_inferred__1/i___1_carry__1_n_1 ,\_inferred__1/i___1_carry__1_n_2 ,\_inferred__1/i___1_carry__1_n_3 }),
        .CYINIT(1'b0),
        .DI(a_mul_b0_3),
        .O(sub_out[11:8]),
        .S(a_mul_b0_4));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \_inferred__1/i___1_carry__2 
       (.CI(\_inferred__1/i___1_carry__1_n_0 ),
        .CO({\_inferred__1/i___1_carry__2_n_0 ,\_inferred__1/i___1_carry__2_n_1 ,\_inferred__1/i___1_carry__2_n_2 ,\_inferred__1/i___1_carry__2_n_3 }),
        .CYINIT(1'b0),
        .DI(a_mul_b0_5),
        .O(sub_out[15:12]),
        .S(a_mul_b0_6));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \_inferred__1/i___1_carry__3 
       (.CI(\_inferred__1/i___1_carry__2_n_0 ),
        .CO({\_inferred__1/i___1_carry__3_n_0 ,\_inferred__1/i___1_carry__3_n_1 ,\_inferred__1/i___1_carry__3_n_2 ,\_inferred__1/i___1_carry__3_n_3 }),
        .CYINIT(1'b0),
        .DI(a_mul_b0_7),
        .O(sub_out[19:16]),
        .S(a_mul_b0_8));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \_inferred__1/i___1_carry__4 
       (.CI(\_inferred__1/i___1_carry__3_n_0 ),
        .CO({\NLW__inferred__1/i___1_carry__4_CO_UNCONNECTED [3:2],\_inferred__1/i___1_carry__4_n_2 ,\_inferred__1/i___1_carry__4_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,a_mul_b0_9}),
        .O({\NLW__inferred__1/i___1_carry__4_O_UNCONNECTED [3],sub_out[22:20]}),
        .S({1'b0,a_mul_b0_10}));
  LUT3 #(
    .INIT(8'hB8)) 
    a_mul_b0_i_10
       (.I0(sub_out[18]),
        .I1(mode_IBUF),
        .I2(b_IBUF[18]),
        .O(A[18]));
  LUT3 #(
    .INIT(8'hB8)) 
    a_mul_b0_i_11
       (.I0(sub_out[17]),
        .I1(mode_IBUF),
        .I2(b_IBUF[17]),
        .O(A[17]));
  LUT3 #(
    .INIT(8'hB8)) 
    a_mul_b0_i_12
       (.I0(sub_out[16]),
        .I1(mode_IBUF),
        .I2(b_IBUF[16]),
        .O(A[16]));
  LUT3 #(
    .INIT(8'hB8)) 
    a_mul_b0_i_13
       (.I0(sub_out[15]),
        .I1(mode_IBUF),
        .I2(b_IBUF[15]),
        .O(A[15]));
  LUT3 #(
    .INIT(8'hB8)) 
    a_mul_b0_i_14
       (.I0(sub_out[14]),
        .I1(mode_IBUF),
        .I2(b_IBUF[14]),
        .O(A[14]));
  LUT3 #(
    .INIT(8'hB8)) 
    a_mul_b0_i_15
       (.I0(sub_out[13]),
        .I1(mode_IBUF),
        .I2(b_IBUF[13]),
        .O(A[13]));
  LUT3 #(
    .INIT(8'hB8)) 
    a_mul_b0_i_16
       (.I0(sub_out[12]),
        .I1(mode_IBUF),
        .I2(b_IBUF[12]),
        .O(A[12]));
  LUT3 #(
    .INIT(8'hB8)) 
    a_mul_b0_i_17
       (.I0(sub_out[11]),
        .I1(mode_IBUF),
        .I2(b_IBUF[11]),
        .O(A[11]));
  LUT3 #(
    .INIT(8'hB8)) 
    a_mul_b0_i_18
       (.I0(sub_out[10]),
        .I1(mode_IBUF),
        .I2(b_IBUF[10]),
        .O(A[10]));
  LUT3 #(
    .INIT(8'hB8)) 
    a_mul_b0_i_19
       (.I0(sub_out[9]),
        .I1(mode_IBUF),
        .I2(b_IBUF[9]),
        .O(A[9]));
  LUT3 #(
    .INIT(8'hB8)) 
    a_mul_b0_i_20
       (.I0(sub_out[8]),
        .I1(mode_IBUF),
        .I2(b_IBUF[8]),
        .O(A[8]));
  LUT3 #(
    .INIT(8'hB8)) 
    a_mul_b0_i_21
       (.I0(sub_out[7]),
        .I1(mode_IBUF),
        .I2(b_IBUF[7]),
        .O(A[7]));
  LUT3 #(
    .INIT(8'hB8)) 
    a_mul_b0_i_22
       (.I0(sub_out[6]),
        .I1(mode_IBUF),
        .I2(b_IBUF[6]),
        .O(A[6]));
  LUT3 #(
    .INIT(8'hB8)) 
    a_mul_b0_i_23
       (.I0(sub_out[5]),
        .I1(mode_IBUF),
        .I2(b_IBUF[5]),
        .O(A[5]));
  LUT3 #(
    .INIT(8'hB8)) 
    a_mul_b0_i_24
       (.I0(sub_out[4]),
        .I1(mode_IBUF),
        .I2(b_IBUF[4]),
        .O(A[4]));
  LUT3 #(
    .INIT(8'hB8)) 
    a_mul_b0_i_25
       (.I0(sub_out[3]),
        .I1(mode_IBUF),
        .I2(b_IBUF[3]),
        .O(A[3]));
  LUT3 #(
    .INIT(8'hB8)) 
    a_mul_b0_i_26
       (.I0(sub_out[2]),
        .I1(mode_IBUF),
        .I2(b_IBUF[2]),
        .O(A[2]));
  LUT3 #(
    .INIT(8'hB8)) 
    a_mul_b0_i_27
       (.I0(sub_out[1]),
        .I1(mode_IBUF),
        .I2(b_IBUF[1]),
        .O(A[1]));
  LUT3 #(
    .INIT(8'hB8)) 
    a_mul_b0_i_28
       (.I0(sub_out[0]),
        .I1(mode_IBUF),
        .I2(b_IBUF[0]),
        .O(A[0]));
  LUT3 #(
    .INIT(8'hB8)) 
    a_mul_b0_i_9
       (.I0(sub_out[19]),
        .I1(mode_IBUF),
        .I2(b_IBUF[19]),
        .O(A[19]));
  LUT2 #(
    .INIT(4'hB)) 
    i___1_carry__3_i_14
       (.I0(a_IBUF[3]),
        .I1(b_IBUF[18]),
        .O(\a[18] ));
  LUT2 #(
    .INIT(4'hB)) 
    i___1_carry__3_i_17
       (.I0(a_IBUF[2]),
        .I1(b_IBUF[16]),
        .O(\a[16] ));
  LUT2 #(
    .INIT(4'h9)) 
    i___1_carry_i_11
       (.I0(a_IBUF[1]),
        .I1(b_IBUF[2]),
        .O(\a[2] ));
  LUT2 #(
    .INIT(4'h2)) 
    i___1_carry_i_13
       (.I0(a_IBUF[0]),
        .I1(b_IBUF[0]),
        .O(\a[0] ));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 out1_carry
       (.CI(1'b0),
        .CO({out1_carry_n_0,out1_carry_n_1,out1_carry_n_2,out1_carry_n_3}),
        .CYINIT(1'b1),
        .DI(DI),
        .O(NLW_out1_carry_O_UNCONNECTED[3:0]),
        .S(S));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 out1_carry__0
       (.CI(out1_carry_n_0),
        .CO({out1_carry__0_n_0,out1_carry__0_n_1,out1_carry__0_n_2,out1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI(out1_carry__1_0),
        .O(NLW_out1_carry__0_O_UNCONNECTED[3:0]),
        .S(out1_carry__1_1));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 out1_carry__1
       (.CI(out1_carry__0_n_0),
        .CO({CO,out1_carry__1_n_1,out1_carry__1_n_2,out1_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI(i___1_carry_i_7),
        .O(NLW_out1_carry__1_O_UNCONNECTED[3:0]),
        .S(i___1_carry_i_7_0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif

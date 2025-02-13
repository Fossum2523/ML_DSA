// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Thu Feb  6 00:49:13 2025
// Host        : LAPTOP-2P71OMBV running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               C:/Users/USER/Desktop/ML_DSA_syn/IMP/NTT/Modular_Reduction/Modular_Reduction.sim/sim_1/synth/timing/xsim/tb_Modular_Reduction_time_synth.v
// Design      : Modular_Reduction
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7k70tfbv676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* NotValidForBitStream *)
module Modular_Reduction
   (in,
    out);
  input [45:0]in;
  output [22:0]out;

  wire [10:0]d;
  wire [23:1]g;
  wire [45:0]in;
  wire [45:0]in_IBUF;
  wire [22:0]out;
  wire [22:0]out_OBUF;
  wire \out_OBUF[11]_inst_i_10_n_0 ;
  wire \out_OBUF[11]_inst_i_11_n_0 ;
  wire \out_OBUF[11]_inst_i_11_n_1 ;
  wire \out_OBUF[11]_inst_i_11_n_2 ;
  wire \out_OBUF[11]_inst_i_11_n_3 ;
  wire \out_OBUF[11]_inst_i_12_n_0 ;
  wire \out_OBUF[11]_inst_i_13_n_0 ;
  wire \out_OBUF[11]_inst_i_14_n_0 ;
  wire \out_OBUF[11]_inst_i_15_n_0 ;
  wire \out_OBUF[11]_inst_i_16_n_0 ;
  wire \out_OBUF[11]_inst_i_17_n_0 ;
  wire \out_OBUF[11]_inst_i_18_n_0 ;
  wire \out_OBUF[11]_inst_i_19_n_0 ;
  wire \out_OBUF[11]_inst_i_2_n_0 ;
  wire \out_OBUF[11]_inst_i_2_n_1 ;
  wire \out_OBUF[11]_inst_i_2_n_2 ;
  wire \out_OBUF[11]_inst_i_2_n_3 ;
  wire \out_OBUF[11]_inst_i_2_n_4 ;
  wire \out_OBUF[11]_inst_i_2_n_5 ;
  wire \out_OBUF[11]_inst_i_2_n_6 ;
  wire \out_OBUF[11]_inst_i_2_n_7 ;
  wire \out_OBUF[11]_inst_i_3_n_0 ;
  wire \out_OBUF[11]_inst_i_4_n_0 ;
  wire \out_OBUF[11]_inst_i_5_n_0 ;
  wire \out_OBUF[11]_inst_i_6_n_0 ;
  wire \out_OBUF[11]_inst_i_7_n_0 ;
  wire \out_OBUF[11]_inst_i_8_n_0 ;
  wire \out_OBUF[11]_inst_i_9_n_0 ;
  wire \out_OBUF[12]_inst_i_2_n_0 ;
  wire \out_OBUF[12]_inst_i_2_n_1 ;
  wire \out_OBUF[12]_inst_i_2_n_2 ;
  wire \out_OBUF[12]_inst_i_2_n_3 ;
  wire \out_OBUF[12]_inst_i_3_n_0 ;
  wire \out_OBUF[12]_inst_i_4_n_0 ;
  wire \out_OBUF[12]_inst_i_5_n_0 ;
  wire \out_OBUF[12]_inst_i_6_n_0 ;
  wire \out_OBUF[15]_inst_i_10_n_0 ;
  wire \out_OBUF[15]_inst_i_11_n_0 ;
  wire \out_OBUF[15]_inst_i_11_n_1 ;
  wire \out_OBUF[15]_inst_i_11_n_2 ;
  wire \out_OBUF[15]_inst_i_11_n_3 ;
  wire \out_OBUF[15]_inst_i_12_n_0 ;
  wire \out_OBUF[15]_inst_i_13_n_0 ;
  wire \out_OBUF[15]_inst_i_14_n_0 ;
  wire \out_OBUF[15]_inst_i_15_n_0 ;
  wire \out_OBUF[15]_inst_i_16_n_0 ;
  wire \out_OBUF[15]_inst_i_17_n_0 ;
  wire \out_OBUF[15]_inst_i_18_n_0 ;
  wire \out_OBUF[15]_inst_i_19_n_0 ;
  wire \out_OBUF[15]_inst_i_2_n_0 ;
  wire \out_OBUF[15]_inst_i_2_n_1 ;
  wire \out_OBUF[15]_inst_i_2_n_2 ;
  wire \out_OBUF[15]_inst_i_2_n_3 ;
  wire \out_OBUF[15]_inst_i_2_n_4 ;
  wire \out_OBUF[15]_inst_i_2_n_5 ;
  wire \out_OBUF[15]_inst_i_2_n_6 ;
  wire \out_OBUF[15]_inst_i_2_n_7 ;
  wire \out_OBUF[15]_inst_i_3_n_0 ;
  wire \out_OBUF[15]_inst_i_4_n_0 ;
  wire \out_OBUF[15]_inst_i_5_n_0 ;
  wire \out_OBUF[15]_inst_i_6_n_0 ;
  wire \out_OBUF[15]_inst_i_7_n_0 ;
  wire \out_OBUF[15]_inst_i_8_n_0 ;
  wire \out_OBUF[15]_inst_i_9_n_0 ;
  wire \out_OBUF[16]_inst_i_2_n_0 ;
  wire \out_OBUF[16]_inst_i_2_n_1 ;
  wire \out_OBUF[16]_inst_i_2_n_2 ;
  wire \out_OBUF[16]_inst_i_2_n_3 ;
  wire \out_OBUF[16]_inst_i_3_n_0 ;
  wire \out_OBUF[16]_inst_i_4_n_0 ;
  wire \out_OBUF[16]_inst_i_5_n_0 ;
  wire \out_OBUF[16]_inst_i_6_n_0 ;
  wire \out_OBUF[16]_inst_i_7_n_0 ;
  wire \out_OBUF[19]_inst_i_10_n_0 ;
  wire \out_OBUF[19]_inst_i_11_n_0 ;
  wire \out_OBUF[19]_inst_i_11_n_1 ;
  wire \out_OBUF[19]_inst_i_11_n_2 ;
  wire \out_OBUF[19]_inst_i_11_n_3 ;
  wire \out_OBUF[19]_inst_i_12_n_0 ;
  wire \out_OBUF[19]_inst_i_12_n_1 ;
  wire \out_OBUF[19]_inst_i_12_n_2 ;
  wire \out_OBUF[19]_inst_i_12_n_3 ;
  wire \out_OBUF[19]_inst_i_13_n_0 ;
  wire \out_OBUF[19]_inst_i_13_n_1 ;
  wire \out_OBUF[19]_inst_i_13_n_2 ;
  wire \out_OBUF[19]_inst_i_13_n_3 ;
  wire \out_OBUF[19]_inst_i_13_n_4 ;
  wire \out_OBUF[19]_inst_i_13_n_5 ;
  wire \out_OBUF[19]_inst_i_13_n_6 ;
  wire \out_OBUF[19]_inst_i_14_n_0 ;
  wire \out_OBUF[19]_inst_i_15_n_0 ;
  wire \out_OBUF[19]_inst_i_16_n_0 ;
  wire \out_OBUF[19]_inst_i_17_n_0 ;
  wire \out_OBUF[19]_inst_i_18_n_0 ;
  wire \out_OBUF[19]_inst_i_19_n_0 ;
  wire \out_OBUF[19]_inst_i_20_n_0 ;
  wire \out_OBUF[19]_inst_i_21_n_0 ;
  wire \out_OBUF[19]_inst_i_22_n_0 ;
  wire \out_OBUF[19]_inst_i_23_n_0 ;
  wire \out_OBUF[19]_inst_i_2_n_0 ;
  wire \out_OBUF[19]_inst_i_2_n_1 ;
  wire \out_OBUF[19]_inst_i_2_n_2 ;
  wire \out_OBUF[19]_inst_i_2_n_3 ;
  wire \out_OBUF[19]_inst_i_2_n_4 ;
  wire \out_OBUF[19]_inst_i_2_n_5 ;
  wire \out_OBUF[19]_inst_i_2_n_6 ;
  wire \out_OBUF[19]_inst_i_2_n_7 ;
  wire \out_OBUF[19]_inst_i_3_n_0 ;
  wire \out_OBUF[19]_inst_i_4_n_0 ;
  wire \out_OBUF[19]_inst_i_5_n_0 ;
  wire \out_OBUF[19]_inst_i_6_n_0 ;
  wire \out_OBUF[19]_inst_i_7_n_0 ;
  wire \out_OBUF[19]_inst_i_8_n_0 ;
  wire \out_OBUF[19]_inst_i_9_n_0 ;
  wire \out_OBUF[20]_inst_i_2_n_0 ;
  wire \out_OBUF[20]_inst_i_2_n_1 ;
  wire \out_OBUF[20]_inst_i_2_n_2 ;
  wire \out_OBUF[20]_inst_i_2_n_3 ;
  wire \out_OBUF[20]_inst_i_3_n_0 ;
  wire \out_OBUF[20]_inst_i_4_n_0 ;
  wire \out_OBUF[20]_inst_i_5_n_0 ;
  wire \out_OBUF[20]_inst_i_6_n_0 ;
  wire \out_OBUF[22]_inst_i_10_n_0 ;
  wire \out_OBUF[22]_inst_i_11_n_0 ;
  wire \out_OBUF[22]_inst_i_12_n_0 ;
  wire \out_OBUF[22]_inst_i_13_n_0 ;
  wire \out_OBUF[22]_inst_i_14_n_2 ;
  wire \out_OBUF[22]_inst_i_14_n_3 ;
  wire \out_OBUF[22]_inst_i_15_n_3 ;
  wire \out_OBUF[22]_inst_i_16_n_0 ;
  wire \out_OBUF[22]_inst_i_16_n_1 ;
  wire \out_OBUF[22]_inst_i_16_n_2 ;
  wire \out_OBUF[22]_inst_i_16_n_3 ;
  wire \out_OBUF[22]_inst_i_17_n_0 ;
  wire \out_OBUF[22]_inst_i_17_n_1 ;
  wire \out_OBUF[22]_inst_i_17_n_2 ;
  wire \out_OBUF[22]_inst_i_17_n_3 ;
  wire \out_OBUF[22]_inst_i_18_n_0 ;
  wire \out_OBUF[22]_inst_i_19_n_0 ;
  wire \out_OBUF[22]_inst_i_19_n_1 ;
  wire \out_OBUF[22]_inst_i_19_n_2 ;
  wire \out_OBUF[22]_inst_i_19_n_3 ;
  wire \out_OBUF[22]_inst_i_19_n_4 ;
  wire \out_OBUF[22]_inst_i_19_n_5 ;
  wire \out_OBUF[22]_inst_i_19_n_6 ;
  wire \out_OBUF[22]_inst_i_19_n_7 ;
  wire \out_OBUF[22]_inst_i_20_n_0 ;
  wire \out_OBUF[22]_inst_i_21_n_0 ;
  wire \out_OBUF[22]_inst_i_22_n_0 ;
  wire \out_OBUF[22]_inst_i_23_n_0 ;
  wire \out_OBUF[22]_inst_i_24_n_0 ;
  wire \out_OBUF[22]_inst_i_25_n_0 ;
  wire \out_OBUF[22]_inst_i_26_n_0 ;
  wire \out_OBUF[22]_inst_i_27_n_0 ;
  wire \out_OBUF[22]_inst_i_2_n_1 ;
  wire \out_OBUF[22]_inst_i_2_n_2 ;
  wire \out_OBUF[22]_inst_i_2_n_3 ;
  wire \out_OBUF[22]_inst_i_2_n_5 ;
  wire \out_OBUF[22]_inst_i_2_n_6 ;
  wire \out_OBUF[22]_inst_i_2_n_7 ;
  wire \out_OBUF[22]_inst_i_3_n_2 ;
  wire \out_OBUF[22]_inst_i_3_n_3 ;
  wire \out_OBUF[22]_inst_i_4_n_0 ;
  wire \out_OBUF[22]_inst_i_5_n_0 ;
  wire \out_OBUF[22]_inst_i_6_n_0 ;
  wire \out_OBUF[22]_inst_i_7_n_0 ;
  wire \out_OBUF[22]_inst_i_8_n_0 ;
  wire \out_OBUF[22]_inst_i_9_n_0 ;
  wire \out_OBUF[3]_inst_i_10_n_0 ;
  wire \out_OBUF[3]_inst_i_10_n_2 ;
  wire \out_OBUF[3]_inst_i_10_n_3 ;
  wire \out_OBUF[3]_inst_i_10_n_5 ;
  wire \out_OBUF[3]_inst_i_10_n_6 ;
  wire \out_OBUF[3]_inst_i_10_n_7 ;
  wire \out_OBUF[3]_inst_i_11_n_0 ;
  wire \out_OBUF[3]_inst_i_12_n_0 ;
  wire \out_OBUF[3]_inst_i_13_n_0 ;
  wire \out_OBUF[3]_inst_i_14_n_0 ;
  wire \out_OBUF[3]_inst_i_15_n_0 ;
  wire \out_OBUF[3]_inst_i_2_n_0 ;
  wire \out_OBUF[3]_inst_i_2_n_1 ;
  wire \out_OBUF[3]_inst_i_2_n_2 ;
  wire \out_OBUF[3]_inst_i_2_n_3 ;
  wire \out_OBUF[3]_inst_i_2_n_4 ;
  wire \out_OBUF[3]_inst_i_2_n_5 ;
  wire \out_OBUF[3]_inst_i_2_n_6 ;
  wire \out_OBUF[3]_inst_i_2_n_7 ;
  wire \out_OBUF[3]_inst_i_3_n_0 ;
  wire \out_OBUF[3]_inst_i_4_n_0 ;
  wire \out_OBUF[3]_inst_i_5_n_0 ;
  wire \out_OBUF[3]_inst_i_6_n_0 ;
  wire \out_OBUF[3]_inst_i_7_n_0 ;
  wire \out_OBUF[3]_inst_i_8_n_0 ;
  wire \out_OBUF[3]_inst_i_9_n_0 ;
  wire \out_OBUF[4]_inst_i_2_n_0 ;
  wire \out_OBUF[4]_inst_i_2_n_1 ;
  wire \out_OBUF[4]_inst_i_2_n_2 ;
  wire \out_OBUF[4]_inst_i_2_n_3 ;
  wire \out_OBUF[4]_inst_i_3_n_0 ;
  wire \out_OBUF[4]_inst_i_4_n_0 ;
  wire \out_OBUF[4]_inst_i_5_n_0 ;
  wire \out_OBUF[4]_inst_i_6_n_0 ;
  wire \out_OBUF[7]_inst_i_10_n_0 ;
  wire \out_OBUF[7]_inst_i_11_n_0 ;
  wire \out_OBUF[7]_inst_i_11_n_1 ;
  wire \out_OBUF[7]_inst_i_11_n_2 ;
  wire \out_OBUF[7]_inst_i_11_n_3 ;
  wire \out_OBUF[7]_inst_i_11_n_7 ;
  wire \out_OBUF[7]_inst_i_12_n_0 ;
  wire \out_OBUF[7]_inst_i_13_n_0 ;
  wire \out_OBUF[7]_inst_i_14_n_0 ;
  wire \out_OBUF[7]_inst_i_15_n_0 ;
  wire \out_OBUF[7]_inst_i_16_n_0 ;
  wire \out_OBUF[7]_inst_i_17_n_0 ;
  wire \out_OBUF[7]_inst_i_18_n_0 ;
  wire \out_OBUF[7]_inst_i_2_n_0 ;
  wire \out_OBUF[7]_inst_i_2_n_1 ;
  wire \out_OBUF[7]_inst_i_2_n_2 ;
  wire \out_OBUF[7]_inst_i_2_n_3 ;
  wire \out_OBUF[7]_inst_i_2_n_4 ;
  wire \out_OBUF[7]_inst_i_2_n_5 ;
  wire \out_OBUF[7]_inst_i_2_n_6 ;
  wire \out_OBUF[7]_inst_i_2_n_7 ;
  wire \out_OBUF[7]_inst_i_3_n_0 ;
  wire \out_OBUF[7]_inst_i_4_n_0 ;
  wire \out_OBUF[7]_inst_i_5_n_0 ;
  wire \out_OBUF[7]_inst_i_6_n_0 ;
  wire \out_OBUF[7]_inst_i_7_n_0 ;
  wire \out_OBUF[7]_inst_i_8_n_0 ;
  wire \out_OBUF[7]_inst_i_9_n_0 ;
  wire \out_OBUF[8]_inst_i_2_n_0 ;
  wire \out_OBUF[8]_inst_i_2_n_1 ;
  wire \out_OBUF[8]_inst_i_2_n_2 ;
  wire \out_OBUF[8]_inst_i_2_n_3 ;
  wire \out_OBUF[8]_inst_i_3_n_0 ;
  wire \out_OBUF[8]_inst_i_4_n_0 ;
  wire \out_OBUF[8]_inst_i_5_n_0 ;
  wire \out_OBUF[8]_inst_i_6_n_0 ;
  wire sel;
  wire [23:1]y;
  wire [0:0]\NLW_out_OBUF[19]_inst_i_13_O_UNCONNECTED ;
  wire [2:2]\NLW_out_OBUF[22]_inst_i_14_CO_UNCONNECTED ;
  wire [3:3]\NLW_out_OBUF[22]_inst_i_14_O_UNCONNECTED ;
  wire [3:1]\NLW_out_OBUF[22]_inst_i_15_CO_UNCONNECTED ;
  wire [3:2]\NLW_out_OBUF[22]_inst_i_15_O_UNCONNECTED ;
  wire [3:3]\NLW_out_OBUF[22]_inst_i_2_CO_UNCONNECTED ;
  wire [3:2]\NLW_out_OBUF[22]_inst_i_3_CO_UNCONNECTED ;
  wire [3:3]\NLW_out_OBUF[22]_inst_i_3_O_UNCONNECTED ;
  wire [2:2]\NLW_out_OBUF[3]_inst_i_10_CO_UNCONNECTED ;
  wire [3:3]\NLW_out_OBUF[3]_inst_i_10_O_UNCONNECTED ;

initial begin
 $sdf_annotate("tb_Modular_Reduction_time_synth.sdf",,,,"tool_control");
end
  IBUF \in_IBUF[0]_inst 
       (.I(in[0]),
        .O(in_IBUF[0]));
  IBUF \in_IBUF[10]_inst 
       (.I(in[10]),
        .O(in_IBUF[10]));
  IBUF \in_IBUF[11]_inst 
       (.I(in[11]),
        .O(in_IBUF[11]));
  IBUF \in_IBUF[12]_inst 
       (.I(in[12]),
        .O(in_IBUF[12]));
  IBUF \in_IBUF[13]_inst 
       (.I(in[13]),
        .O(in_IBUF[13]));
  IBUF \in_IBUF[14]_inst 
       (.I(in[14]),
        .O(in_IBUF[14]));
  IBUF \in_IBUF[15]_inst 
       (.I(in[15]),
        .O(in_IBUF[15]));
  IBUF \in_IBUF[16]_inst 
       (.I(in[16]),
        .O(in_IBUF[16]));
  IBUF \in_IBUF[17]_inst 
       (.I(in[17]),
        .O(in_IBUF[17]));
  IBUF \in_IBUF[18]_inst 
       (.I(in[18]),
        .O(in_IBUF[18]));
  IBUF \in_IBUF[19]_inst 
       (.I(in[19]),
        .O(in_IBUF[19]));
  IBUF \in_IBUF[1]_inst 
       (.I(in[1]),
        .O(in_IBUF[1]));
  IBUF \in_IBUF[20]_inst 
       (.I(in[20]),
        .O(in_IBUF[20]));
  IBUF \in_IBUF[21]_inst 
       (.I(in[21]),
        .O(in_IBUF[21]));
  IBUF \in_IBUF[22]_inst 
       (.I(in[22]),
        .O(in_IBUF[22]));
  IBUF \in_IBUF[23]_inst 
       (.I(in[23]),
        .O(in_IBUF[23]));
  IBUF \in_IBUF[24]_inst 
       (.I(in[24]),
        .O(in_IBUF[24]));
  IBUF \in_IBUF[25]_inst 
       (.I(in[25]),
        .O(in_IBUF[25]));
  IBUF \in_IBUF[26]_inst 
       (.I(in[26]),
        .O(in_IBUF[26]));
  IBUF \in_IBUF[27]_inst 
       (.I(in[27]),
        .O(in_IBUF[27]));
  IBUF \in_IBUF[28]_inst 
       (.I(in[28]),
        .O(in_IBUF[28]));
  IBUF \in_IBUF[29]_inst 
       (.I(in[29]),
        .O(in_IBUF[29]));
  IBUF \in_IBUF[2]_inst 
       (.I(in[2]),
        .O(in_IBUF[2]));
  IBUF \in_IBUF[30]_inst 
       (.I(in[30]),
        .O(in_IBUF[30]));
  IBUF \in_IBUF[31]_inst 
       (.I(in[31]),
        .O(in_IBUF[31]));
  IBUF \in_IBUF[32]_inst 
       (.I(in[32]),
        .O(in_IBUF[32]));
  IBUF \in_IBUF[33]_inst 
       (.I(in[33]),
        .O(in_IBUF[33]));
  IBUF \in_IBUF[34]_inst 
       (.I(in[34]),
        .O(in_IBUF[34]));
  IBUF \in_IBUF[35]_inst 
       (.I(in[35]),
        .O(in_IBUF[35]));
  IBUF \in_IBUF[36]_inst 
       (.I(in[36]),
        .O(in_IBUF[36]));
  IBUF \in_IBUF[37]_inst 
       (.I(in[37]),
        .O(in_IBUF[37]));
  IBUF \in_IBUF[38]_inst 
       (.I(in[38]),
        .O(in_IBUF[38]));
  IBUF \in_IBUF[39]_inst 
       (.I(in[39]),
        .O(in_IBUF[39]));
  IBUF \in_IBUF[3]_inst 
       (.I(in[3]),
        .O(in_IBUF[3]));
  IBUF \in_IBUF[40]_inst 
       (.I(in[40]),
        .O(in_IBUF[40]));
  IBUF \in_IBUF[41]_inst 
       (.I(in[41]),
        .O(in_IBUF[41]));
  IBUF \in_IBUF[42]_inst 
       (.I(in[42]),
        .O(in_IBUF[42]));
  IBUF \in_IBUF[43]_inst 
       (.I(in[43]),
        .O(in_IBUF[43]));
  IBUF \in_IBUF[44]_inst 
       (.I(in[44]),
        .O(in_IBUF[44]));
  IBUF \in_IBUF[45]_inst 
       (.I(in[45]),
        .O(in_IBUF[45]));
  IBUF \in_IBUF[4]_inst 
       (.I(in[4]),
        .O(in_IBUF[4]));
  IBUF \in_IBUF[5]_inst 
       (.I(in[5]),
        .O(in_IBUF[5]));
  IBUF \in_IBUF[6]_inst 
       (.I(in[6]),
        .O(in_IBUF[6]));
  IBUF \in_IBUF[7]_inst 
       (.I(in[7]),
        .O(in_IBUF[7]));
  IBUF \in_IBUF[8]_inst 
       (.I(in[8]),
        .O(in_IBUF[8]));
  IBUF \in_IBUF[9]_inst 
       (.I(in[9]),
        .O(in_IBUF[9]));
  OBUF \out_OBUF[0]_inst 
       (.I(out_OBUF[0]),
        .O(out[0]));
  LUT2 #(
    .INIT(4'h9)) 
    \out_OBUF[0]_inst_i_1 
       (.I0(g[23]),
        .I1(\out_OBUF[3]_inst_i_2_n_7 ),
        .O(out_OBUF[0]));
  OBUF \out_OBUF[10]_inst 
       (.I(out_OBUF[10]),
        .O(out[10]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_OBUF[10]_inst_i_1 
       (.I0(\out_OBUF[11]_inst_i_2_n_5 ),
        .I1(g[23]),
        .I2(g[10]),
        .O(out_OBUF[10]));
  OBUF \out_OBUF[11]_inst 
       (.I(out_OBUF[11]),
        .O(out[11]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_OBUF[11]_inst_i_1 
       (.I0(\out_OBUF[11]_inst_i_2_n_4 ),
        .I1(g[23]),
        .I2(g[11]),
        .O(out_OBUF[11]));
  LUT4 #(
    .INIT(16'hD22D)) 
    \out_OBUF[11]_inst_i_10 
       (.I0(y[7]),
        .I1(in_IBUF[7]),
        .I2(y[8]),
        .I3(in_IBUF[8]),
        .O(\out_OBUF[11]_inst_i_10_n_0 ));
  CARRY4 \out_OBUF[11]_inst_i_11 
       (.CI(\out_OBUF[7]_inst_i_11_n_0 ),
        .CO({\out_OBUF[11]_inst_i_11_n_0 ,\out_OBUF[11]_inst_i_11_n_1 ,\out_OBUF[11]_inst_i_11_n_2 ,\out_OBUF[11]_inst_i_11_n_3 }),
        .CYINIT(1'b0),
        .DI({\out_OBUF[11]_inst_i_12_n_0 ,\out_OBUF[11]_inst_i_13_n_0 ,\out_OBUF[11]_inst_i_14_n_0 ,\out_OBUF[11]_inst_i_15_n_0 }),
        .O(y[7:4]),
        .S({\out_OBUF[11]_inst_i_16_n_0 ,\out_OBUF[11]_inst_i_17_n_0 ,\out_OBUF[11]_inst_i_18_n_0 ,\out_OBUF[11]_inst_i_19_n_0 }));
  LUT2 #(
    .INIT(4'h8)) 
    \out_OBUF[11]_inst_i_12 
       (.I0(in_IBUF[39]),
        .I1(in_IBUF[29]),
        .O(\out_OBUF[11]_inst_i_12_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \out_OBUF[11]_inst_i_13 
       (.I0(in_IBUF[38]),
        .I1(in_IBUF[28]),
        .O(\out_OBUF[11]_inst_i_13_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \out_OBUF[11]_inst_i_14 
       (.I0(in_IBUF[37]),
        .I1(in_IBUF[27]),
        .O(\out_OBUF[11]_inst_i_14_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \out_OBUF[11]_inst_i_15 
       (.I0(in_IBUF[36]),
        .I1(in_IBUF[26]),
        .O(\out_OBUF[11]_inst_i_15_n_0 ));
  LUT4 #(
    .INIT(16'h8778)) 
    \out_OBUF[11]_inst_i_16 
       (.I0(in_IBUF[29]),
        .I1(in_IBUF[39]),
        .I2(in_IBUF[40]),
        .I3(in_IBUF[30]),
        .O(\out_OBUF[11]_inst_i_16_n_0 ));
  LUT4 #(
    .INIT(16'h8778)) 
    \out_OBUF[11]_inst_i_17 
       (.I0(in_IBUF[28]),
        .I1(in_IBUF[38]),
        .I2(in_IBUF[39]),
        .I3(in_IBUF[29]),
        .O(\out_OBUF[11]_inst_i_17_n_0 ));
  LUT4 #(
    .INIT(16'h8778)) 
    \out_OBUF[11]_inst_i_18 
       (.I0(in_IBUF[27]),
        .I1(in_IBUF[37]),
        .I2(in_IBUF[38]),
        .I3(in_IBUF[28]),
        .O(\out_OBUF[11]_inst_i_18_n_0 ));
  LUT4 #(
    .INIT(16'h8778)) 
    \out_OBUF[11]_inst_i_19 
       (.I0(in_IBUF[26]),
        .I1(in_IBUF[36]),
        .I2(in_IBUF[37]),
        .I3(in_IBUF[27]),
        .O(\out_OBUF[11]_inst_i_19_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \out_OBUF[11]_inst_i_2 
       (.CI(\out_OBUF[7]_inst_i_2_n_0 ),
        .CO({\out_OBUF[11]_inst_i_2_n_0 ,\out_OBUF[11]_inst_i_2_n_1 ,\out_OBUF[11]_inst_i_2_n_2 ,\out_OBUF[11]_inst_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({\out_OBUF[11]_inst_i_3_n_0 ,\out_OBUF[11]_inst_i_4_n_0 ,\out_OBUF[11]_inst_i_5_n_0 ,\out_OBUF[11]_inst_i_6_n_0 }),
        .O({\out_OBUF[11]_inst_i_2_n_4 ,\out_OBUF[11]_inst_i_2_n_5 ,\out_OBUF[11]_inst_i_2_n_6 ,\out_OBUF[11]_inst_i_2_n_7 }),
        .S({\out_OBUF[11]_inst_i_7_n_0 ,\out_OBUF[11]_inst_i_8_n_0 ,\out_OBUF[11]_inst_i_9_n_0 ,\out_OBUF[11]_inst_i_10_n_0 }));
  LUT2 #(
    .INIT(4'hB)) 
    \out_OBUF[11]_inst_i_3 
       (.I0(in_IBUF[10]),
        .I1(y[10]),
        .O(\out_OBUF[11]_inst_i_3_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \out_OBUF[11]_inst_i_4 
       (.I0(in_IBUF[9]),
        .I1(y[9]),
        .O(\out_OBUF[11]_inst_i_4_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \out_OBUF[11]_inst_i_5 
       (.I0(in_IBUF[8]),
        .I1(y[8]),
        .O(\out_OBUF[11]_inst_i_5_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \out_OBUF[11]_inst_i_6 
       (.I0(in_IBUF[7]),
        .I1(y[7]),
        .O(\out_OBUF[11]_inst_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hD22D)) 
    \out_OBUF[11]_inst_i_7 
       (.I0(y[10]),
        .I1(in_IBUF[10]),
        .I2(y[11]),
        .I3(in_IBUF[11]),
        .O(\out_OBUF[11]_inst_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hD22D)) 
    \out_OBUF[11]_inst_i_8 
       (.I0(y[9]),
        .I1(in_IBUF[9]),
        .I2(y[10]),
        .I3(in_IBUF[10]),
        .O(\out_OBUF[11]_inst_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hD22D)) 
    \out_OBUF[11]_inst_i_9 
       (.I0(y[8]),
        .I1(in_IBUF[8]),
        .I2(y[9]),
        .I3(in_IBUF[9]),
        .O(\out_OBUF[11]_inst_i_9_n_0 ));
  OBUF \out_OBUF[12]_inst 
       (.I(out_OBUF[12]),
        .O(out[12]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_OBUF[12]_inst_i_1 
       (.I0(\out_OBUF[15]_inst_i_2_n_7 ),
        .I1(g[23]),
        .I2(g[12]),
        .O(out_OBUF[12]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \out_OBUF[12]_inst_i_2 
       (.CI(\out_OBUF[8]_inst_i_2_n_0 ),
        .CO({\out_OBUF[12]_inst_i_2_n_0 ,\out_OBUF[12]_inst_i_2_n_1 ,\out_OBUF[12]_inst_i_2_n_2 ,\out_OBUF[12]_inst_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({\out_OBUF[11]_inst_i_2_n_4 ,\out_OBUF[11]_inst_i_2_n_5 ,\out_OBUF[11]_inst_i_2_n_6 ,\out_OBUF[11]_inst_i_2_n_7 }),
        .O(g[12:9]),
        .S({\out_OBUF[12]_inst_i_3_n_0 ,\out_OBUF[12]_inst_i_4_n_0 ,\out_OBUF[12]_inst_i_5_n_0 ,\out_OBUF[12]_inst_i_6_n_0 }));
  LUT2 #(
    .INIT(4'h9)) 
    \out_OBUF[12]_inst_i_3 
       (.I0(\out_OBUF[11]_inst_i_2_n_4 ),
        .I1(\out_OBUF[15]_inst_i_2_n_7 ),
        .O(\out_OBUF[12]_inst_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \out_OBUF[12]_inst_i_4 
       (.I0(\out_OBUF[11]_inst_i_2_n_5 ),
        .I1(\out_OBUF[11]_inst_i_2_n_4 ),
        .O(\out_OBUF[12]_inst_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \out_OBUF[12]_inst_i_5 
       (.I0(\out_OBUF[11]_inst_i_2_n_6 ),
        .I1(\out_OBUF[11]_inst_i_2_n_5 ),
        .O(\out_OBUF[12]_inst_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \out_OBUF[12]_inst_i_6 
       (.I0(\out_OBUF[11]_inst_i_2_n_7 ),
        .I1(\out_OBUF[11]_inst_i_2_n_6 ),
        .O(\out_OBUF[12]_inst_i_6_n_0 ));
  OBUF \out_OBUF[13]_inst 
       (.I(out_OBUF[13]),
        .O(out[13]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_OBUF[13]_inst_i_1 
       (.I0(\out_OBUF[15]_inst_i_2_n_6 ),
        .I1(g[23]),
        .I2(g[13]),
        .O(out_OBUF[13]));
  OBUF \out_OBUF[14]_inst 
       (.I(out_OBUF[14]),
        .O(out[14]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_OBUF[14]_inst_i_1 
       (.I0(\out_OBUF[15]_inst_i_2_n_5 ),
        .I1(g[23]),
        .I2(g[14]),
        .O(out_OBUF[14]));
  OBUF \out_OBUF[15]_inst 
       (.I(out_OBUF[15]),
        .O(out[15]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_OBUF[15]_inst_i_1 
       (.I0(\out_OBUF[15]_inst_i_2_n_4 ),
        .I1(g[23]),
        .I2(g[15]),
        .O(out_OBUF[15]));
  LUT4 #(
    .INIT(16'hD22D)) 
    \out_OBUF[15]_inst_i_10 
       (.I0(y[11]),
        .I1(in_IBUF[11]),
        .I2(y[12]),
        .I3(in_IBUF[12]),
        .O(\out_OBUF[15]_inst_i_10_n_0 ));
  CARRY4 \out_OBUF[15]_inst_i_11 
       (.CI(\out_OBUF[11]_inst_i_11_n_0 ),
        .CO({\out_OBUF[15]_inst_i_11_n_0 ,\out_OBUF[15]_inst_i_11_n_1 ,\out_OBUF[15]_inst_i_11_n_2 ,\out_OBUF[15]_inst_i_11_n_3 }),
        .CYINIT(1'b0),
        .DI({\out_OBUF[15]_inst_i_12_n_0 ,\out_OBUF[15]_inst_i_13_n_0 ,\out_OBUF[15]_inst_i_14_n_0 ,\out_OBUF[15]_inst_i_15_n_0 }),
        .O(y[11:8]),
        .S({\out_OBUF[15]_inst_i_16_n_0 ,\out_OBUF[15]_inst_i_17_n_0 ,\out_OBUF[15]_inst_i_18_n_0 ,\out_OBUF[15]_inst_i_19_n_0 }));
  LUT2 #(
    .INIT(4'h8)) 
    \out_OBUF[15]_inst_i_12 
       (.I0(in_IBUF[43]),
        .I1(in_IBUF[33]),
        .O(\out_OBUF[15]_inst_i_12_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \out_OBUF[15]_inst_i_13 
       (.I0(in_IBUF[42]),
        .I1(in_IBUF[32]),
        .O(\out_OBUF[15]_inst_i_13_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \out_OBUF[15]_inst_i_14 
       (.I0(in_IBUF[41]),
        .I1(in_IBUF[31]),
        .O(\out_OBUF[15]_inst_i_14_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \out_OBUF[15]_inst_i_15 
       (.I0(in_IBUF[40]),
        .I1(in_IBUF[30]),
        .O(\out_OBUF[15]_inst_i_15_n_0 ));
  LUT4 #(
    .INIT(16'h8778)) 
    \out_OBUF[15]_inst_i_16 
       (.I0(in_IBUF[43]),
        .I1(in_IBUF[33]),
        .I2(in_IBUF[44]),
        .I3(in_IBUF[34]),
        .O(\out_OBUF[15]_inst_i_16_n_0 ));
  LUT4 #(
    .INIT(16'h8778)) 
    \out_OBUF[15]_inst_i_17 
       (.I0(in_IBUF[32]),
        .I1(in_IBUF[42]),
        .I2(in_IBUF[43]),
        .I3(in_IBUF[33]),
        .O(\out_OBUF[15]_inst_i_17_n_0 ));
  LUT4 #(
    .INIT(16'h8778)) 
    \out_OBUF[15]_inst_i_18 
       (.I0(in_IBUF[31]),
        .I1(in_IBUF[41]),
        .I2(in_IBUF[42]),
        .I3(in_IBUF[32]),
        .O(\out_OBUF[15]_inst_i_18_n_0 ));
  LUT4 #(
    .INIT(16'h8778)) 
    \out_OBUF[15]_inst_i_19 
       (.I0(in_IBUF[30]),
        .I1(in_IBUF[40]),
        .I2(in_IBUF[41]),
        .I3(in_IBUF[31]),
        .O(\out_OBUF[15]_inst_i_19_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \out_OBUF[15]_inst_i_2 
       (.CI(\out_OBUF[11]_inst_i_2_n_0 ),
        .CO({\out_OBUF[15]_inst_i_2_n_0 ,\out_OBUF[15]_inst_i_2_n_1 ,\out_OBUF[15]_inst_i_2_n_2 ,\out_OBUF[15]_inst_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({\out_OBUF[15]_inst_i_3_n_0 ,\out_OBUF[15]_inst_i_4_n_0 ,\out_OBUF[15]_inst_i_5_n_0 ,\out_OBUF[15]_inst_i_6_n_0 }),
        .O({\out_OBUF[15]_inst_i_2_n_4 ,\out_OBUF[15]_inst_i_2_n_5 ,\out_OBUF[15]_inst_i_2_n_6 ,\out_OBUF[15]_inst_i_2_n_7 }),
        .S({\out_OBUF[15]_inst_i_7_n_0 ,\out_OBUF[15]_inst_i_8_n_0 ,\out_OBUF[15]_inst_i_9_n_0 ,\out_OBUF[15]_inst_i_10_n_0 }));
  LUT5 #(
    .INIT(32'hF6F660F6)) 
    \out_OBUF[15]_inst_i_3 
       (.I0(y[14]),
        .I1(in_IBUF[14]),
        .I2(d[1]),
        .I3(y[13]),
        .I4(in_IBUF[13]),
        .O(\out_OBUF[15]_inst_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h2DD2D22D)) 
    \out_OBUF[15]_inst_i_4 
       (.I0(y[13]),
        .I1(in_IBUF[13]),
        .I2(d[1]),
        .I3(in_IBUF[14]),
        .I4(y[14]),
        .O(\out_OBUF[15]_inst_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \out_OBUF[15]_inst_i_5 
       (.I0(y[13]),
        .I1(in_IBUF[13]),
        .I2(d[0]),
        .O(\out_OBUF[15]_inst_i_5_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \out_OBUF[15]_inst_i_6 
       (.I0(in_IBUF[11]),
        .I1(y[11]),
        .O(\out_OBUF[15]_inst_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h9669699696699669)) 
    \out_OBUF[15]_inst_i_7 
       (.I0(\out_OBUF[15]_inst_i_3_n_0 ),
        .I1(y[15]),
        .I2(in_IBUF[15]),
        .I3(d[2]),
        .I4(in_IBUF[14]),
        .I5(y[14]),
        .O(\out_OBUF[15]_inst_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h6969966969966969)) 
    \out_OBUF[15]_inst_i_8 
       (.I0(y[14]),
        .I1(in_IBUF[14]),
        .I2(d[1]),
        .I3(in_IBUF[13]),
        .I4(y[13]),
        .I5(d[0]),
        .O(\out_OBUF[15]_inst_i_8_n_0 ));
  LUT5 #(
    .INIT(32'h69699669)) 
    \out_OBUF[15]_inst_i_9 
       (.I0(d[0]),
        .I1(in_IBUF[13]),
        .I2(y[13]),
        .I3(y[12]),
        .I4(in_IBUF[12]),
        .O(\out_OBUF[15]_inst_i_9_n_0 ));
  OBUF \out_OBUF[16]_inst 
       (.I(out_OBUF[16]),
        .O(out[16]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_OBUF[16]_inst_i_1 
       (.I0(\out_OBUF[19]_inst_i_2_n_7 ),
        .I1(g[23]),
        .I2(g[16]),
        .O(out_OBUF[16]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \out_OBUF[16]_inst_i_2 
       (.CI(\out_OBUF[12]_inst_i_2_n_0 ),
        .CO({\out_OBUF[16]_inst_i_2_n_0 ,\out_OBUF[16]_inst_i_2_n_1 ,\out_OBUF[16]_inst_i_2_n_2 ,\out_OBUF[16]_inst_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({\out_OBUF[15]_inst_i_2_n_4 ,\out_OBUF[15]_inst_i_2_n_5 ,\out_OBUF[16]_inst_i_3_n_0 ,\out_OBUF[15]_inst_i_2_n_6 }),
        .O(g[16:13]),
        .S({\out_OBUF[16]_inst_i_4_n_0 ,\out_OBUF[16]_inst_i_5_n_0 ,\out_OBUF[16]_inst_i_6_n_0 ,\out_OBUF[16]_inst_i_7_n_0 }));
  LUT1 #(
    .INIT(2'h1)) 
    \out_OBUF[16]_inst_i_3 
       (.I0(sel),
        .O(\out_OBUF[16]_inst_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \out_OBUF[16]_inst_i_4 
       (.I0(\out_OBUF[15]_inst_i_2_n_4 ),
        .I1(\out_OBUF[19]_inst_i_2_n_7 ),
        .O(\out_OBUF[16]_inst_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \out_OBUF[16]_inst_i_5 
       (.I0(\out_OBUF[15]_inst_i_2_n_5 ),
        .I1(\out_OBUF[15]_inst_i_2_n_4 ),
        .O(\out_OBUF[16]_inst_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \out_OBUF[16]_inst_i_6 
       (.I0(sel),
        .I1(\out_OBUF[15]_inst_i_2_n_5 ),
        .O(\out_OBUF[16]_inst_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \out_OBUF[16]_inst_i_7 
       (.I0(\out_OBUF[15]_inst_i_2_n_6 ),
        .I1(\out_OBUF[15]_inst_i_2_n_7 ),
        .O(\out_OBUF[16]_inst_i_7_n_0 ));
  OBUF \out_OBUF[17]_inst 
       (.I(out_OBUF[17]),
        .O(out[17]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_OBUF[17]_inst_i_1 
       (.I0(\out_OBUF[19]_inst_i_2_n_6 ),
        .I1(g[23]),
        .I2(g[17]),
        .O(out_OBUF[17]));
  OBUF \out_OBUF[18]_inst 
       (.I(out_OBUF[18]),
        .O(out[18]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_OBUF[18]_inst_i_1 
       (.I0(\out_OBUF[19]_inst_i_2_n_5 ),
        .I1(g[23]),
        .I2(g[18]),
        .O(out_OBUF[18]));
  OBUF \out_OBUF[19]_inst 
       (.I(out_OBUF[19]),
        .O(out[19]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_OBUF[19]_inst_i_1 
       (.I0(\out_OBUF[19]_inst_i_2_n_4 ),
        .I1(g[23]),
        .I2(g[19]),
        .O(out_OBUF[19]));
  LUT6 #(
    .INIT(64'h9669699696699669)) 
    \out_OBUF[19]_inst_i_10 
       (.I0(\out_OBUF[19]_inst_i_6_n_0 ),
        .I1(y[16]),
        .I2(in_IBUF[16]),
        .I3(d[3]),
        .I4(in_IBUF[15]),
        .I5(y[15]),
        .O(\out_OBUF[19]_inst_i_10_n_0 ));
  CARRY4 \out_OBUF[19]_inst_i_11 
       (.CI(1'b0),
        .CO({\out_OBUF[19]_inst_i_11_n_0 ,\out_OBUF[19]_inst_i_11_n_1 ,\out_OBUF[19]_inst_i_11_n_2 ,\out_OBUF[19]_inst_i_11_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,\out_OBUF[3]_inst_i_10_n_0 ,\out_OBUF[3]_inst_i_10_n_5 }),
        .O(d[3:0]),
        .S({\out_OBUF[19]_inst_i_13_n_4 ,\out_OBUF[19]_inst_i_13_n_5 ,\out_OBUF[19]_inst_i_14_n_0 ,\out_OBUF[19]_inst_i_15_n_0 }));
  CARRY4 \out_OBUF[19]_inst_i_12 
       (.CI(\out_OBUF[15]_inst_i_11_n_0 ),
        .CO({\out_OBUF[19]_inst_i_12_n_0 ,\out_OBUF[19]_inst_i_12_n_1 ,\out_OBUF[19]_inst_i_12_n_2 ,\out_OBUF[19]_inst_i_12_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,in_IBUF[36],\out_OBUF[19]_inst_i_16_n_0 }),
        .O(y[15:12]),
        .S({in_IBUF[38:37],\out_OBUF[19]_inst_i_17_n_0 ,\out_OBUF[19]_inst_i_18_n_0 }));
  CARRY4 \out_OBUF[19]_inst_i_13 
       (.CI(1'b0),
        .CO({\out_OBUF[19]_inst_i_13_n_0 ,\out_OBUF[19]_inst_i_13_n_1 ,\out_OBUF[19]_inst_i_13_n_2 ,\out_OBUF[19]_inst_i_13_n_3 }),
        .CYINIT(1'b0),
        .DI({\out_OBUF[19]_inst_i_19_n_0 ,\out_OBUF[7]_inst_i_13_n_0 ,\out_OBUF[7]_inst_i_14_n_0 ,1'b0}),
        .O({\out_OBUF[19]_inst_i_13_n_4 ,\out_OBUF[19]_inst_i_13_n_5 ,\out_OBUF[19]_inst_i_13_n_6 ,\NLW_out_OBUF[19]_inst_i_13_O_UNCONNECTED [0]}),
        .S({\out_OBUF[19]_inst_i_20_n_0 ,\out_OBUF[19]_inst_i_21_n_0 ,\out_OBUF[19]_inst_i_22_n_0 ,\out_OBUF[19]_inst_i_23_n_0 }));
  LUT2 #(
    .INIT(4'h6)) 
    \out_OBUF[19]_inst_i_14 
       (.I0(\out_OBUF[3]_inst_i_10_n_0 ),
        .I1(\out_OBUF[19]_inst_i_13_n_6 ),
        .O(\out_OBUF[19]_inst_i_14_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \out_OBUF[19]_inst_i_15 
       (.I0(\out_OBUF[3]_inst_i_10_n_5 ),
        .I1(\out_OBUF[7]_inst_i_11_n_7 ),
        .O(\out_OBUF[19]_inst_i_15_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \out_OBUF[19]_inst_i_16 
       (.I0(in_IBUF[44]),
        .I1(in_IBUF[34]),
        .O(\out_OBUF[19]_inst_i_16_n_0 ));
  LUT3 #(
    .INIT(8'h78)) 
    \out_OBUF[19]_inst_i_17 
       (.I0(in_IBUF[45]),
        .I1(in_IBUF[35]),
        .I2(in_IBUF[36]),
        .O(\out_OBUF[19]_inst_i_17_n_0 ));
  LUT4 #(
    .INIT(16'h8778)) 
    \out_OBUF[19]_inst_i_18 
       (.I0(in_IBUF[44]),
        .I1(in_IBUF[34]),
        .I2(in_IBUF[45]),
        .I3(in_IBUF[35]),
        .O(\out_OBUF[19]_inst_i_18_n_0 ));
  LUT3 #(
    .INIT(8'hE8)) 
    \out_OBUF[19]_inst_i_19 
       (.I0(in_IBUF[35]),
        .I1(in_IBUF[25]),
        .I2(in_IBUF[45]),
        .O(\out_OBUF[19]_inst_i_19_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \out_OBUF[19]_inst_i_2 
       (.CI(\out_OBUF[15]_inst_i_2_n_0 ),
        .CO({\out_OBUF[19]_inst_i_2_n_0 ,\out_OBUF[19]_inst_i_2_n_1 ,\out_OBUF[19]_inst_i_2_n_2 ,\out_OBUF[19]_inst_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({\out_OBUF[19]_inst_i_3_n_0 ,\out_OBUF[19]_inst_i_4_n_0 ,\out_OBUF[19]_inst_i_5_n_0 ,\out_OBUF[19]_inst_i_6_n_0 }),
        .O({\out_OBUF[19]_inst_i_2_n_4 ,\out_OBUF[19]_inst_i_2_n_5 ,\out_OBUF[19]_inst_i_2_n_6 ,\out_OBUF[19]_inst_i_2_n_7 }),
        .S({\out_OBUF[19]_inst_i_7_n_0 ,\out_OBUF[19]_inst_i_8_n_0 ,\out_OBUF[19]_inst_i_9_n_0 ,\out_OBUF[19]_inst_i_10_n_0 }));
  LUT5 #(
    .INIT(32'hE81717E8)) 
    \out_OBUF[19]_inst_i_20 
       (.I0(in_IBUF[45]),
        .I1(in_IBUF[25]),
        .I2(in_IBUF[35]),
        .I3(in_IBUF[36]),
        .I4(in_IBUF[26]),
        .O(\out_OBUF[19]_inst_i_20_n_0 ));
  LUT4 #(
    .INIT(16'h6996)) 
    \out_OBUF[19]_inst_i_21 
       (.I0(\out_OBUF[7]_inst_i_13_n_0 ),
        .I1(in_IBUF[25]),
        .I2(in_IBUF[35]),
        .I3(in_IBUF[45]),
        .O(\out_OBUF[19]_inst_i_21_n_0 ));
  (* HLUTNM = "lutpair1" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \out_OBUF[19]_inst_i_22 
       (.I0(in_IBUF[34]),
        .I1(in_IBUF[24]),
        .I2(in_IBUF[44]),
        .I3(\out_OBUF[7]_inst_i_14_n_0 ),
        .O(\out_OBUF[19]_inst_i_22_n_0 ));
  (* HLUTNM = "lutpair0" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \out_OBUF[19]_inst_i_23 
       (.I0(in_IBUF[33]),
        .I1(in_IBUF[23]),
        .I2(in_IBUF[43]),
        .O(\out_OBUF[19]_inst_i_23_n_0 ));
  LUT5 #(
    .INIT(32'hF6F660F6)) 
    \out_OBUF[19]_inst_i_3 
       (.I0(y[18]),
        .I1(in_IBUF[18]),
        .I2(d[5]),
        .I3(y[17]),
        .I4(in_IBUF[17]),
        .O(\out_OBUF[19]_inst_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hF6F660F6)) 
    \out_OBUF[19]_inst_i_4 
       (.I0(y[17]),
        .I1(in_IBUF[17]),
        .I2(d[4]),
        .I3(y[16]),
        .I4(in_IBUF[16]),
        .O(\out_OBUF[19]_inst_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hF6F660F6)) 
    \out_OBUF[19]_inst_i_5 
       (.I0(y[16]),
        .I1(in_IBUF[16]),
        .I2(d[3]),
        .I3(y[15]),
        .I4(in_IBUF[15]),
        .O(\out_OBUF[19]_inst_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hF6F660F6)) 
    \out_OBUF[19]_inst_i_6 
       (.I0(y[15]),
        .I1(in_IBUF[15]),
        .I2(d[2]),
        .I3(y[14]),
        .I4(in_IBUF[14]),
        .O(\out_OBUF[19]_inst_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h9669699696699669)) 
    \out_OBUF[19]_inst_i_7 
       (.I0(\out_OBUF[19]_inst_i_3_n_0 ),
        .I1(y[19]),
        .I2(in_IBUF[19]),
        .I3(d[6]),
        .I4(in_IBUF[18]),
        .I5(y[18]),
        .O(\out_OBUF[19]_inst_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h9669699696699669)) 
    \out_OBUF[19]_inst_i_8 
       (.I0(\out_OBUF[19]_inst_i_4_n_0 ),
        .I1(y[18]),
        .I2(in_IBUF[18]),
        .I3(d[5]),
        .I4(in_IBUF[17]),
        .I5(y[17]),
        .O(\out_OBUF[19]_inst_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h9669699696699669)) 
    \out_OBUF[19]_inst_i_9 
       (.I0(\out_OBUF[19]_inst_i_5_n_0 ),
        .I1(y[17]),
        .I2(in_IBUF[17]),
        .I3(d[4]),
        .I4(in_IBUF[16]),
        .I5(y[16]),
        .O(\out_OBUF[19]_inst_i_9_n_0 ));
  OBUF \out_OBUF[1]_inst 
       (.I(out_OBUF[1]),
        .O(out[1]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_OBUF[1]_inst_i_1 
       (.I0(\out_OBUF[3]_inst_i_2_n_6 ),
        .I1(g[23]),
        .I2(g[1]),
        .O(out_OBUF[1]));
  OBUF \out_OBUF[20]_inst 
       (.I(out_OBUF[20]),
        .O(out[20]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_OBUF[20]_inst_i_1 
       (.I0(\out_OBUF[22]_inst_i_2_n_7 ),
        .I1(g[23]),
        .I2(g[20]),
        .O(out_OBUF[20]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \out_OBUF[20]_inst_i_2 
       (.CI(\out_OBUF[16]_inst_i_2_n_0 ),
        .CO({\out_OBUF[20]_inst_i_2_n_0 ,\out_OBUF[20]_inst_i_2_n_1 ,\out_OBUF[20]_inst_i_2_n_2 ,\out_OBUF[20]_inst_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({\out_OBUF[19]_inst_i_2_n_4 ,\out_OBUF[19]_inst_i_2_n_5 ,\out_OBUF[19]_inst_i_2_n_6 ,\out_OBUF[19]_inst_i_2_n_7 }),
        .O(g[20:17]),
        .S({\out_OBUF[20]_inst_i_3_n_0 ,\out_OBUF[20]_inst_i_4_n_0 ,\out_OBUF[20]_inst_i_5_n_0 ,\out_OBUF[20]_inst_i_6_n_0 }));
  LUT2 #(
    .INIT(4'h9)) 
    \out_OBUF[20]_inst_i_3 
       (.I0(\out_OBUF[19]_inst_i_2_n_4 ),
        .I1(\out_OBUF[22]_inst_i_2_n_7 ),
        .O(\out_OBUF[20]_inst_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \out_OBUF[20]_inst_i_4 
       (.I0(\out_OBUF[19]_inst_i_2_n_5 ),
        .I1(\out_OBUF[19]_inst_i_2_n_4 ),
        .O(\out_OBUF[20]_inst_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \out_OBUF[20]_inst_i_5 
       (.I0(\out_OBUF[19]_inst_i_2_n_6 ),
        .I1(\out_OBUF[19]_inst_i_2_n_5 ),
        .O(\out_OBUF[20]_inst_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \out_OBUF[20]_inst_i_6 
       (.I0(\out_OBUF[19]_inst_i_2_n_7 ),
        .I1(\out_OBUF[19]_inst_i_2_n_6 ),
        .O(\out_OBUF[20]_inst_i_6_n_0 ));
  OBUF \out_OBUF[21]_inst 
       (.I(out_OBUF[21]),
        .O(out[21]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_OBUF[21]_inst_i_1 
       (.I0(\out_OBUF[22]_inst_i_2_n_6 ),
        .I1(g[23]),
        .I2(g[21]),
        .O(out_OBUF[21]));
  OBUF \out_OBUF[22]_inst 
       (.I(out_OBUF[22]),
        .O(out[22]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_OBUF[22]_inst_i_1 
       (.I0(\out_OBUF[22]_inst_i_2_n_5 ),
        .I1(g[23]),
        .I2(g[22]),
        .O(out_OBUF[22]));
  LUT6 #(
    .INIT(64'h9669699696699669)) 
    \out_OBUF[22]_inst_i_10 
       (.I0(\out_OBUF[22]_inst_i_6_n_0 ),
        .I1(y[20]),
        .I2(in_IBUF[20]),
        .I3(d[7]),
        .I4(in_IBUF[19]),
        .I5(y[19]),
        .O(\out_OBUF[22]_inst_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \out_OBUF[22]_inst_i_11 
       (.I0(\out_OBUF[22]_inst_i_2_n_5 ),
        .I1(sel),
        .O(\out_OBUF[22]_inst_i_11_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \out_OBUF[22]_inst_i_12 
       (.I0(\out_OBUF[22]_inst_i_2_n_6 ),
        .I1(\out_OBUF[22]_inst_i_2_n_5 ),
        .O(\out_OBUF[22]_inst_i_12_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \out_OBUF[22]_inst_i_13 
       (.I0(\out_OBUF[22]_inst_i_2_n_7 ),
        .I1(\out_OBUF[22]_inst_i_2_n_6 ),
        .O(\out_OBUF[22]_inst_i_13_n_0 ));
  CARRY4 \out_OBUF[22]_inst_i_14 
       (.CI(\out_OBUF[22]_inst_i_17_n_0 ),
        .CO({y[23],\NLW_out_OBUF[22]_inst_i_14_CO_UNCONNECTED [2],\out_OBUF[22]_inst_i_14_n_2 ,\out_OBUF[22]_inst_i_14_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_out_OBUF[22]_inst_i_14_O_UNCONNECTED [3],y[22:20]}),
        .S({1'b1,in_IBUF[45:43]}));
  CARRY4 \out_OBUF[22]_inst_i_15 
       (.CI(\out_OBUF[22]_inst_i_16_n_0 ),
        .CO({\NLW_out_OBUF[22]_inst_i_15_CO_UNCONNECTED [3],d[10],\NLW_out_OBUF[22]_inst_i_15_CO_UNCONNECTED [1],\out_OBUF[22]_inst_i_15_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_out_OBUF[22]_inst_i_15_O_UNCONNECTED [3:2],d[9:8]}),
        .S({1'b0,1'b1,\out_OBUF[3]_inst_i_10_n_6 ,\out_OBUF[3]_inst_i_10_n_7 }));
  CARRY4 \out_OBUF[22]_inst_i_16 
       (.CI(\out_OBUF[19]_inst_i_11_n_0 ),
        .CO({\out_OBUF[22]_inst_i_16_n_0 ,\out_OBUF[22]_inst_i_16_n_1 ,\out_OBUF[22]_inst_i_16_n_2 ,\out_OBUF[22]_inst_i_16_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(d[7:4]),
        .S({\out_OBUF[22]_inst_i_19_n_4 ,\out_OBUF[22]_inst_i_19_n_5 ,\out_OBUF[22]_inst_i_19_n_6 ,\out_OBUF[22]_inst_i_19_n_7 }));
  CARRY4 \out_OBUF[22]_inst_i_17 
       (.CI(\out_OBUF[19]_inst_i_12_n_0 ),
        .CO({\out_OBUF[22]_inst_i_17_n_0 ,\out_OBUF[22]_inst_i_17_n_1 ,\out_OBUF[22]_inst_i_17_n_2 ,\out_OBUF[22]_inst_i_17_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(y[19:16]),
        .S(in_IBUF[42:39]));
  LUT2 #(
    .INIT(4'hB)) 
    \out_OBUF[22]_inst_i_18 
       (.I0(in_IBUF[21]),
        .I1(y[21]),
        .O(\out_OBUF[22]_inst_i_18_n_0 ));
  CARRY4 \out_OBUF[22]_inst_i_19 
       (.CI(\out_OBUF[19]_inst_i_13_n_0 ),
        .CO({\out_OBUF[22]_inst_i_19_n_0 ,\out_OBUF[22]_inst_i_19_n_1 ,\out_OBUF[22]_inst_i_19_n_2 ,\out_OBUF[22]_inst_i_19_n_3 }),
        .CYINIT(1'b0),
        .DI({\out_OBUF[22]_inst_i_20_n_0 ,\out_OBUF[22]_inst_i_21_n_0 ,\out_OBUF[22]_inst_i_22_n_0 ,\out_OBUF[22]_inst_i_23_n_0 }),
        .O({\out_OBUF[22]_inst_i_19_n_4 ,\out_OBUF[22]_inst_i_19_n_5 ,\out_OBUF[22]_inst_i_19_n_6 ,\out_OBUF[22]_inst_i_19_n_7 }),
        .S({\out_OBUF[22]_inst_i_24_n_0 ,\out_OBUF[22]_inst_i_25_n_0 ,\out_OBUF[22]_inst_i_26_n_0 ,\out_OBUF[22]_inst_i_27_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \out_OBUF[22]_inst_i_2 
       (.CI(\out_OBUF[19]_inst_i_2_n_0 ),
        .CO({\NLW_out_OBUF[22]_inst_i_2_CO_UNCONNECTED [3],\out_OBUF[22]_inst_i_2_n_1 ,\out_OBUF[22]_inst_i_2_n_2 ,\out_OBUF[22]_inst_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,\out_OBUF[22]_inst_i_4_n_0 ,\out_OBUF[22]_inst_i_5_n_0 ,\out_OBUF[22]_inst_i_6_n_0 }),
        .O({sel,\out_OBUF[22]_inst_i_2_n_5 ,\out_OBUF[22]_inst_i_2_n_6 ,\out_OBUF[22]_inst_i_2_n_7 }),
        .S({\out_OBUF[22]_inst_i_7_n_0 ,\out_OBUF[22]_inst_i_8_n_0 ,\out_OBUF[22]_inst_i_9_n_0 ,\out_OBUF[22]_inst_i_10_n_0 }));
  LUT2 #(
    .INIT(4'h8)) 
    \out_OBUF[22]_inst_i_20 
       (.I0(in_IBUF[39]),
        .I1(in_IBUF[29]),
        .O(\out_OBUF[22]_inst_i_20_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \out_OBUF[22]_inst_i_21 
       (.I0(in_IBUF[38]),
        .I1(in_IBUF[28]),
        .O(\out_OBUF[22]_inst_i_21_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \out_OBUF[22]_inst_i_22 
       (.I0(in_IBUF[37]),
        .I1(in_IBUF[27]),
        .O(\out_OBUF[22]_inst_i_22_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \out_OBUF[22]_inst_i_23 
       (.I0(in_IBUF[36]),
        .I1(in_IBUF[26]),
        .O(\out_OBUF[22]_inst_i_23_n_0 ));
  LUT4 #(
    .INIT(16'h8778)) 
    \out_OBUF[22]_inst_i_24 
       (.I0(in_IBUF[29]),
        .I1(in_IBUF[39]),
        .I2(in_IBUF[40]),
        .I3(in_IBUF[30]),
        .O(\out_OBUF[22]_inst_i_24_n_0 ));
  LUT4 #(
    .INIT(16'h8778)) 
    \out_OBUF[22]_inst_i_25 
       (.I0(in_IBUF[28]),
        .I1(in_IBUF[38]),
        .I2(in_IBUF[39]),
        .I3(in_IBUF[29]),
        .O(\out_OBUF[22]_inst_i_25_n_0 ));
  LUT4 #(
    .INIT(16'h8778)) 
    \out_OBUF[22]_inst_i_26 
       (.I0(in_IBUF[27]),
        .I1(in_IBUF[37]),
        .I2(in_IBUF[38]),
        .I3(in_IBUF[28]),
        .O(\out_OBUF[22]_inst_i_26_n_0 ));
  LUT4 #(
    .INIT(16'h8778)) 
    \out_OBUF[22]_inst_i_27 
       (.I0(in_IBUF[26]),
        .I1(in_IBUF[36]),
        .I2(in_IBUF[37]),
        .I3(in_IBUF[27]),
        .O(\out_OBUF[22]_inst_i_27_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \out_OBUF[22]_inst_i_3 
       (.CI(\out_OBUF[20]_inst_i_2_n_0 ),
        .CO({\NLW_out_OBUF[22]_inst_i_3_CO_UNCONNECTED [3:2],\out_OBUF[22]_inst_i_3_n_2 ,\out_OBUF[22]_inst_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,\out_OBUF[22]_inst_i_2_n_6 ,\out_OBUF[22]_inst_i_2_n_7 }),
        .O({\NLW_out_OBUF[22]_inst_i_3_O_UNCONNECTED [3],g[23:21]}),
        .S({1'b0,\out_OBUF[22]_inst_i_11_n_0 ,\out_OBUF[22]_inst_i_12_n_0 ,\out_OBUF[22]_inst_i_13_n_0 }));
  LUT5 #(
    .INIT(32'hF6F660F6)) 
    \out_OBUF[22]_inst_i_4 
       (.I0(y[21]),
        .I1(in_IBUF[21]),
        .I2(d[8]),
        .I3(y[20]),
        .I4(in_IBUF[20]),
        .O(\out_OBUF[22]_inst_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hF6F660F6)) 
    \out_OBUF[22]_inst_i_5 
       (.I0(y[20]),
        .I1(in_IBUF[20]),
        .I2(d[7]),
        .I3(y[19]),
        .I4(in_IBUF[19]),
        .O(\out_OBUF[22]_inst_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hF6F660F6)) 
    \out_OBUF[22]_inst_i_6 
       (.I0(y[19]),
        .I1(in_IBUF[19]),
        .I2(d[6]),
        .I3(y[18]),
        .I4(in_IBUF[18]),
        .O(\out_OBUF[22]_inst_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h7887E11E1EE17887)) 
    \out_OBUF[22]_inst_i_7 
       (.I0(\out_OBUF[22]_inst_i_18_n_0 ),
        .I1(d[9]),
        .I2(d[10]),
        .I3(y[23]),
        .I4(in_IBUF[22]),
        .I5(y[22]),
        .O(\out_OBUF[22]_inst_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h9669699696699669)) 
    \out_OBUF[22]_inst_i_8 
       (.I0(\out_OBUF[22]_inst_i_4_n_0 ),
        .I1(y[22]),
        .I2(in_IBUF[22]),
        .I3(d[9]),
        .I4(in_IBUF[21]),
        .I5(y[21]),
        .O(\out_OBUF[22]_inst_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h9669699696699669)) 
    \out_OBUF[22]_inst_i_9 
       (.I0(\out_OBUF[22]_inst_i_5_n_0 ),
        .I1(y[21]),
        .I2(in_IBUF[21]),
        .I3(d[8]),
        .I4(in_IBUF[20]),
        .I5(y[20]),
        .O(\out_OBUF[22]_inst_i_9_n_0 ));
  OBUF \out_OBUF[2]_inst 
       (.I(out_OBUF[2]),
        .O(out[2]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_OBUF[2]_inst_i_1 
       (.I0(\out_OBUF[3]_inst_i_2_n_5 ),
        .I1(g[23]),
        .I2(g[2]),
        .O(out_OBUF[2]));
  OBUF \out_OBUF[3]_inst 
       (.I(out_OBUF[3]),
        .O(out[3]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_OBUF[3]_inst_i_1 
       (.I0(\out_OBUF[3]_inst_i_2_n_4 ),
        .I1(g[23]),
        .I2(g[3]),
        .O(out_OBUF[3]));
  CARRY4 \out_OBUF[3]_inst_i_10 
       (.CI(\out_OBUF[22]_inst_i_19_n_0 ),
        .CO({\out_OBUF[3]_inst_i_10_n_0 ,\NLW_out_OBUF[3]_inst_i_10_CO_UNCONNECTED [2],\out_OBUF[3]_inst_i_10_n_2 ,\out_OBUF[3]_inst_i_10_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,\out_OBUF[3]_inst_i_11_n_0 ,\out_OBUF[3]_inst_i_12_n_0 }),
        .O({\NLW_out_OBUF[3]_inst_i_10_O_UNCONNECTED [3],\out_OBUF[3]_inst_i_10_n_5 ,\out_OBUF[3]_inst_i_10_n_6 ,\out_OBUF[3]_inst_i_10_n_7 }),
        .S({1'b1,\out_OBUF[3]_inst_i_13_n_0 ,\out_OBUF[3]_inst_i_14_n_0 ,\out_OBUF[3]_inst_i_15_n_0 }));
  LUT2 #(
    .INIT(4'h8)) 
    \out_OBUF[3]_inst_i_11 
       (.I0(in_IBUF[41]),
        .I1(in_IBUF[31]),
        .O(\out_OBUF[3]_inst_i_11_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \out_OBUF[3]_inst_i_12 
       (.I0(in_IBUF[40]),
        .I1(in_IBUF[30]),
        .O(\out_OBUF[3]_inst_i_12_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \out_OBUF[3]_inst_i_13 
       (.I0(in_IBUF[42]),
        .I1(in_IBUF[32]),
        .O(\out_OBUF[3]_inst_i_13_n_0 ));
  LUT4 #(
    .INIT(16'h8778)) 
    \out_OBUF[3]_inst_i_14 
       (.I0(in_IBUF[31]),
        .I1(in_IBUF[41]),
        .I2(in_IBUF[42]),
        .I3(in_IBUF[32]),
        .O(\out_OBUF[3]_inst_i_14_n_0 ));
  LUT4 #(
    .INIT(16'h8778)) 
    \out_OBUF[3]_inst_i_15 
       (.I0(in_IBUF[30]),
        .I1(in_IBUF[40]),
        .I2(in_IBUF[41]),
        .I3(in_IBUF[31]),
        .O(\out_OBUF[3]_inst_i_15_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \out_OBUF[3]_inst_i_2 
       (.CI(1'b0),
        .CO({\out_OBUF[3]_inst_i_2_n_0 ,\out_OBUF[3]_inst_i_2_n_1 ,\out_OBUF[3]_inst_i_2_n_2 ,\out_OBUF[3]_inst_i_2_n_3 }),
        .CYINIT(1'b1),
        .DI({\out_OBUF[3]_inst_i_3_n_0 ,\out_OBUF[3]_inst_i_4_n_0 ,\out_OBUF[3]_inst_i_5_n_0 ,1'b1}),
        .O({\out_OBUF[3]_inst_i_2_n_4 ,\out_OBUF[3]_inst_i_2_n_5 ,\out_OBUF[3]_inst_i_2_n_6 ,\out_OBUF[3]_inst_i_2_n_7 }),
        .S({\out_OBUF[3]_inst_i_6_n_0 ,\out_OBUF[3]_inst_i_7_n_0 ,\out_OBUF[3]_inst_i_8_n_0 ,\out_OBUF[3]_inst_i_9_n_0 }));
  LUT2 #(
    .INIT(4'hB)) 
    \out_OBUF[3]_inst_i_3 
       (.I0(in_IBUF[2]),
        .I1(y[2]),
        .O(\out_OBUF[3]_inst_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h71)) 
    \out_OBUF[3]_inst_i_4 
       (.I0(y[1]),
        .I1(\out_OBUF[3]_inst_i_10_n_0 ),
        .I2(in_IBUF[1]),
        .O(\out_OBUF[3]_inst_i_4_n_0 ));
  (* HLUTNM = "lutpair2" *) 
  LUT5 #(
    .INIT(32'h69FF0069)) 
    \out_OBUF[3]_inst_i_5 
       (.I0(in_IBUF[23]),
        .I1(in_IBUF[33]),
        .I2(in_IBUF[43]),
        .I3(\out_OBUF[3]_inst_i_10_n_5 ),
        .I4(in_IBUF[0]),
        .O(\out_OBUF[3]_inst_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hD22D)) 
    \out_OBUF[3]_inst_i_6 
       (.I0(y[2]),
        .I1(in_IBUF[2]),
        .I2(y[3]),
        .I3(in_IBUF[3]),
        .O(\out_OBUF[3]_inst_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h2BD4D42B)) 
    \out_OBUF[3]_inst_i_7 
       (.I0(in_IBUF[1]),
        .I1(\out_OBUF[3]_inst_i_10_n_0 ),
        .I2(y[1]),
        .I3(y[2]),
        .I4(in_IBUF[2]),
        .O(\out_OBUF[3]_inst_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h6996)) 
    \out_OBUF[3]_inst_i_8 
       (.I0(\out_OBUF[3]_inst_i_5_n_0 ),
        .I1(\out_OBUF[3]_inst_i_10_n_0 ),
        .I2(y[1]),
        .I3(in_IBUF[1]),
        .O(\out_OBUF[3]_inst_i_8_n_0 ));
  (* HLUTNM = "lutpair2" *) 
  LUT5 #(
    .INIT(32'h69969669)) 
    \out_OBUF[3]_inst_i_9 
       (.I0(in_IBUF[23]),
        .I1(in_IBUF[33]),
        .I2(in_IBUF[43]),
        .I3(\out_OBUF[3]_inst_i_10_n_5 ),
        .I4(in_IBUF[0]),
        .O(\out_OBUF[3]_inst_i_9_n_0 ));
  OBUF \out_OBUF[4]_inst 
       (.I(out_OBUF[4]),
        .O(out[4]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_OBUF[4]_inst_i_1 
       (.I0(\out_OBUF[7]_inst_i_2_n_7 ),
        .I1(g[23]),
        .I2(g[4]),
        .O(out_OBUF[4]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \out_OBUF[4]_inst_i_2 
       (.CI(1'b0),
        .CO({\out_OBUF[4]_inst_i_2_n_0 ,\out_OBUF[4]_inst_i_2_n_1 ,\out_OBUF[4]_inst_i_2_n_2 ,\out_OBUF[4]_inst_i_2_n_3 }),
        .CYINIT(\out_OBUF[3]_inst_i_2_n_7 ),
        .DI({\out_OBUF[3]_inst_i_2_n_4 ,\out_OBUF[3]_inst_i_2_n_5 ,sel,\out_OBUF[3]_inst_i_2_n_6 }),
        .O(g[4:1]),
        .S({\out_OBUF[4]_inst_i_3_n_0 ,\out_OBUF[4]_inst_i_4_n_0 ,\out_OBUF[4]_inst_i_5_n_0 ,\out_OBUF[4]_inst_i_6_n_0 }));
  LUT2 #(
    .INIT(4'h9)) 
    \out_OBUF[4]_inst_i_3 
       (.I0(\out_OBUF[3]_inst_i_2_n_4 ),
        .I1(\out_OBUF[7]_inst_i_2_n_7 ),
        .O(\out_OBUF[4]_inst_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \out_OBUF[4]_inst_i_4 
       (.I0(\out_OBUF[3]_inst_i_2_n_5 ),
        .I1(\out_OBUF[3]_inst_i_2_n_4 ),
        .O(\out_OBUF[4]_inst_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \out_OBUF[4]_inst_i_5 
       (.I0(sel),
        .I1(\out_OBUF[3]_inst_i_2_n_5 ),
        .O(\out_OBUF[4]_inst_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \out_OBUF[4]_inst_i_6 
       (.I0(sel),
        .I1(\out_OBUF[3]_inst_i_2_n_6 ),
        .O(\out_OBUF[4]_inst_i_6_n_0 ));
  OBUF \out_OBUF[5]_inst 
       (.I(out_OBUF[5]),
        .O(out[5]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_OBUF[5]_inst_i_1 
       (.I0(\out_OBUF[7]_inst_i_2_n_6 ),
        .I1(g[23]),
        .I2(g[5]),
        .O(out_OBUF[5]));
  OBUF \out_OBUF[6]_inst 
       (.I(out_OBUF[6]),
        .O(out[6]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_OBUF[6]_inst_i_1 
       (.I0(\out_OBUF[7]_inst_i_2_n_5 ),
        .I1(g[23]),
        .I2(g[6]),
        .O(out_OBUF[6]));
  OBUF \out_OBUF[7]_inst 
       (.I(out_OBUF[7]),
        .O(out[7]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_OBUF[7]_inst_i_1 
       (.I0(\out_OBUF[7]_inst_i_2_n_4 ),
        .I1(g[23]),
        .I2(g[7]),
        .O(out_OBUF[7]));
  LUT4 #(
    .INIT(16'hD22D)) 
    \out_OBUF[7]_inst_i_10 
       (.I0(y[3]),
        .I1(in_IBUF[3]),
        .I2(y[4]),
        .I3(in_IBUF[4]),
        .O(\out_OBUF[7]_inst_i_10_n_0 ));
  CARRY4 \out_OBUF[7]_inst_i_11 
       (.CI(1'b0),
        .CO({\out_OBUF[7]_inst_i_11_n_0 ,\out_OBUF[7]_inst_i_11_n_1 ,\out_OBUF[7]_inst_i_11_n_2 ,\out_OBUF[7]_inst_i_11_n_3 }),
        .CYINIT(1'b0),
        .DI({\out_OBUF[7]_inst_i_12_n_0 ,\out_OBUF[7]_inst_i_13_n_0 ,\out_OBUF[7]_inst_i_14_n_0 ,1'b0}),
        .O({y[3:1],\out_OBUF[7]_inst_i_11_n_7 }),
        .S({\out_OBUF[7]_inst_i_15_n_0 ,\out_OBUF[7]_inst_i_16_n_0 ,\out_OBUF[7]_inst_i_17_n_0 ,\out_OBUF[7]_inst_i_18_n_0 }));
  LUT3 #(
    .INIT(8'hE8)) 
    \out_OBUF[7]_inst_i_12 
       (.I0(in_IBUF[35]),
        .I1(in_IBUF[25]),
        .I2(in_IBUF[45]),
        .O(\out_OBUF[7]_inst_i_12_n_0 ));
  (* HLUTNM = "lutpair1" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    \out_OBUF[7]_inst_i_13 
       (.I0(in_IBUF[34]),
        .I1(in_IBUF[24]),
        .I2(in_IBUF[44]),
        .O(\out_OBUF[7]_inst_i_13_n_0 ));
  (* HLUTNM = "lutpair0" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    \out_OBUF[7]_inst_i_14 
       (.I0(in_IBUF[33]),
        .I1(in_IBUF[23]),
        .I2(in_IBUF[43]),
        .O(\out_OBUF[7]_inst_i_14_n_0 ));
  LUT5 #(
    .INIT(32'hE81717E8)) 
    \out_OBUF[7]_inst_i_15 
       (.I0(in_IBUF[45]),
        .I1(in_IBUF[25]),
        .I2(in_IBUF[35]),
        .I3(in_IBUF[36]),
        .I4(in_IBUF[26]),
        .O(\out_OBUF[7]_inst_i_15_n_0 ));
  LUT4 #(
    .INIT(16'h6996)) 
    \out_OBUF[7]_inst_i_16 
       (.I0(\out_OBUF[7]_inst_i_13_n_0 ),
        .I1(in_IBUF[25]),
        .I2(in_IBUF[35]),
        .I3(in_IBUF[45]),
        .O(\out_OBUF[7]_inst_i_16_n_0 ));
  LUT4 #(
    .INIT(16'h6996)) 
    \out_OBUF[7]_inst_i_17 
       (.I0(\out_OBUF[7]_inst_i_14_n_0 ),
        .I1(in_IBUF[24]),
        .I2(in_IBUF[34]),
        .I3(in_IBUF[44]),
        .O(\out_OBUF[7]_inst_i_17_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \out_OBUF[7]_inst_i_18 
       (.I0(in_IBUF[43]),
        .I1(in_IBUF[33]),
        .I2(in_IBUF[23]),
        .O(\out_OBUF[7]_inst_i_18_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \out_OBUF[7]_inst_i_2 
       (.CI(\out_OBUF[3]_inst_i_2_n_0 ),
        .CO({\out_OBUF[7]_inst_i_2_n_0 ,\out_OBUF[7]_inst_i_2_n_1 ,\out_OBUF[7]_inst_i_2_n_2 ,\out_OBUF[7]_inst_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({\out_OBUF[7]_inst_i_3_n_0 ,\out_OBUF[7]_inst_i_4_n_0 ,\out_OBUF[7]_inst_i_5_n_0 ,\out_OBUF[7]_inst_i_6_n_0 }),
        .O({\out_OBUF[7]_inst_i_2_n_4 ,\out_OBUF[7]_inst_i_2_n_5 ,\out_OBUF[7]_inst_i_2_n_6 ,\out_OBUF[7]_inst_i_2_n_7 }),
        .S({\out_OBUF[7]_inst_i_7_n_0 ,\out_OBUF[7]_inst_i_8_n_0 ,\out_OBUF[7]_inst_i_9_n_0 ,\out_OBUF[7]_inst_i_10_n_0 }));
  LUT2 #(
    .INIT(4'hB)) 
    \out_OBUF[7]_inst_i_3 
       (.I0(in_IBUF[6]),
        .I1(y[6]),
        .O(\out_OBUF[7]_inst_i_3_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \out_OBUF[7]_inst_i_4 
       (.I0(in_IBUF[5]),
        .I1(y[5]),
        .O(\out_OBUF[7]_inst_i_4_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \out_OBUF[7]_inst_i_5 
       (.I0(in_IBUF[4]),
        .I1(y[4]),
        .O(\out_OBUF[7]_inst_i_5_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \out_OBUF[7]_inst_i_6 
       (.I0(in_IBUF[3]),
        .I1(y[3]),
        .O(\out_OBUF[7]_inst_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hD22D)) 
    \out_OBUF[7]_inst_i_7 
       (.I0(y[6]),
        .I1(in_IBUF[6]),
        .I2(y[7]),
        .I3(in_IBUF[7]),
        .O(\out_OBUF[7]_inst_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hD22D)) 
    \out_OBUF[7]_inst_i_8 
       (.I0(y[5]),
        .I1(in_IBUF[5]),
        .I2(y[6]),
        .I3(in_IBUF[6]),
        .O(\out_OBUF[7]_inst_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hD22D)) 
    \out_OBUF[7]_inst_i_9 
       (.I0(y[4]),
        .I1(in_IBUF[4]),
        .I2(y[5]),
        .I3(in_IBUF[5]),
        .O(\out_OBUF[7]_inst_i_9_n_0 ));
  OBUF \out_OBUF[8]_inst 
       (.I(out_OBUF[8]),
        .O(out[8]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_OBUF[8]_inst_i_1 
       (.I0(\out_OBUF[11]_inst_i_2_n_7 ),
        .I1(g[23]),
        .I2(g[8]),
        .O(out_OBUF[8]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \out_OBUF[8]_inst_i_2 
       (.CI(\out_OBUF[4]_inst_i_2_n_0 ),
        .CO({\out_OBUF[8]_inst_i_2_n_0 ,\out_OBUF[8]_inst_i_2_n_1 ,\out_OBUF[8]_inst_i_2_n_2 ,\out_OBUF[8]_inst_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({\out_OBUF[7]_inst_i_2_n_4 ,\out_OBUF[7]_inst_i_2_n_5 ,\out_OBUF[7]_inst_i_2_n_6 ,\out_OBUF[7]_inst_i_2_n_7 }),
        .O(g[8:5]),
        .S({\out_OBUF[8]_inst_i_3_n_0 ,\out_OBUF[8]_inst_i_4_n_0 ,\out_OBUF[8]_inst_i_5_n_0 ,\out_OBUF[8]_inst_i_6_n_0 }));
  LUT2 #(
    .INIT(4'h9)) 
    \out_OBUF[8]_inst_i_3 
       (.I0(\out_OBUF[7]_inst_i_2_n_4 ),
        .I1(\out_OBUF[11]_inst_i_2_n_7 ),
        .O(\out_OBUF[8]_inst_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \out_OBUF[8]_inst_i_4 
       (.I0(\out_OBUF[7]_inst_i_2_n_5 ),
        .I1(\out_OBUF[7]_inst_i_2_n_4 ),
        .O(\out_OBUF[8]_inst_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \out_OBUF[8]_inst_i_5 
       (.I0(\out_OBUF[7]_inst_i_2_n_6 ),
        .I1(\out_OBUF[7]_inst_i_2_n_5 ),
        .O(\out_OBUF[8]_inst_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \out_OBUF[8]_inst_i_6 
       (.I0(\out_OBUF[7]_inst_i_2_n_7 ),
        .I1(\out_OBUF[7]_inst_i_2_n_6 ),
        .O(\out_OBUF[8]_inst_i_6_n_0 ));
  OBUF \out_OBUF[9]_inst 
       (.I(out_OBUF[9]),
        .O(out[9]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \out_OBUF[9]_inst_i_1 
       (.I0(\out_OBUF[11]_inst_i_2_n_6 ),
        .I1(g[23]),
        .I2(g[9]),
        .O(out_OBUF[9]));
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

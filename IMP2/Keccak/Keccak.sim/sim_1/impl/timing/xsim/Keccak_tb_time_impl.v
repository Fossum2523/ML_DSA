// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Fri Apr 25 02:48:53 2025
// Host        : DESKTOP-5RUADSS running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               C:/Users/fossu/Desktop/ML_DSA_Syn_new/IMP2/Keccak/Keccak.sim/sim_1/impl/timing/xsim/Keccak_tb_time_impl.v
// Design      : Keccak
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xczu7ev-ffvf1517-1LV-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module IBUF_UNIQ_BASE_
   (O,
    I);
  output O;
  input I;

  wire I;
  wire O;
  wire OUT;
  wire NLW_IBUFCTRL_INST_IBUFDISABLE_UNCONNECTED;
  wire NLW_IBUFCTRL_INST_INTERMDISABLE_UNCONNECTED;
  wire NLW_IBUFCTRL_INST_T_UNCONNECTED;
  wire NLW_INBUF_INST_OSC_EN_UNCONNECTED;
  wire NLW_INBUF_INST_VREF_UNCONNECTED;
  wire [3:0]NLW_INBUF_INST_OSC_UNCONNECTED;

  IBUFCTRL IBUFCTRL_INST
       (.I(OUT),
        .IBUFDISABLE(NLW_IBUFCTRL_INST_IBUFDISABLE_UNCONNECTED),
        .INTERMDISABLE(NLW_IBUFCTRL_INST_INTERMDISABLE_UNCONNECTED),
        .O(O),
        .T(NLW_IBUFCTRL_INST_T_UNCONNECTED));
  INBUF INBUF_INST
       (.O(OUT),
        .OSC(NLW_INBUF_INST_OSC_UNCONNECTED[3:0]),
        .OSC_EN(NLW_INBUF_INST_OSC_EN_UNCONNECTED),
        .PAD(I),
        .VREF(NLW_INBUF_INST_VREF_UNCONNECTED));
endmodule

module IBUF_HD1
   (O,
    I);
  output O;
  input I;

  wire I;
  wire O;
  wire OUT;
  wire NLW_IBUFCTRL_INST_IBUFDISABLE_UNCONNECTED;
  wire NLW_IBUFCTRL_INST_INTERMDISABLE_UNCONNECTED;
  wire NLW_IBUFCTRL_INST_T_UNCONNECTED;
  wire NLW_INBUF_INST_OSC_EN_UNCONNECTED;
  wire NLW_INBUF_INST_VREF_UNCONNECTED;
  wire [3:0]NLW_INBUF_INST_OSC_UNCONNECTED;

  IBUFCTRL IBUFCTRL_INST
       (.I(OUT),
        .IBUFDISABLE(NLW_IBUFCTRL_INST_IBUFDISABLE_UNCONNECTED),
        .INTERMDISABLE(NLW_IBUFCTRL_INST_INTERMDISABLE_UNCONNECTED),
        .O(O),
        .T(NLW_IBUFCTRL_INST_T_UNCONNECTED));
  INBUF INBUF_INST
       (.O(OUT),
        .OSC(NLW_INBUF_INST_OSC_UNCONNECTED[3:0]),
        .OSC_EN(NLW_INBUF_INST_OSC_EN_UNCONNECTED),
        .PAD(I),
        .VREF(NLW_INBUF_INST_VREF_UNCONNECTED));
endmodule

module IBUF_HD2
   (O,
    I);
  output O;
  input I;

  wire I;
  wire O;
  wire OUT;
  wire NLW_IBUFCTRL_INST_IBUFDISABLE_UNCONNECTED;
  wire NLW_IBUFCTRL_INST_INTERMDISABLE_UNCONNECTED;
  wire NLW_IBUFCTRL_INST_T_UNCONNECTED;
  wire NLW_INBUF_INST_OSC_EN_UNCONNECTED;
  wire NLW_INBUF_INST_VREF_UNCONNECTED;
  wire [3:0]NLW_INBUF_INST_OSC_UNCONNECTED;

  IBUFCTRL IBUFCTRL_INST
       (.I(OUT),
        .IBUFDISABLE(NLW_IBUFCTRL_INST_IBUFDISABLE_UNCONNECTED),
        .INTERMDISABLE(NLW_IBUFCTRL_INST_INTERMDISABLE_UNCONNECTED),
        .O(O),
        .T(NLW_IBUFCTRL_INST_T_UNCONNECTED));
  INBUF INBUF_INST
       (.O(OUT),
        .OSC(NLW_INBUF_INST_OSC_UNCONNECTED[3:0]),
        .OSC_EN(NLW_INBUF_INST_OSC_EN_UNCONNECTED),
        .PAD(I),
        .VREF(NLW_INBUF_INST_VREF_UNCONNECTED));
endmodule

module IBUF_HD3
   (O,
    I);
  output O;
  input I;

  wire I;
  wire O;
  wire OUT;
  wire NLW_IBUFCTRL_INST_IBUFDISABLE_UNCONNECTED;
  wire NLW_IBUFCTRL_INST_INTERMDISABLE_UNCONNECTED;
  wire NLW_IBUFCTRL_INST_T_UNCONNECTED;
  wire NLW_INBUF_INST_OSC_EN_UNCONNECTED;
  wire NLW_INBUF_INST_VREF_UNCONNECTED;
  wire [3:0]NLW_INBUF_INST_OSC_UNCONNECTED;

  IBUFCTRL IBUFCTRL_INST
       (.I(OUT),
        .IBUFDISABLE(NLW_IBUFCTRL_INST_IBUFDISABLE_UNCONNECTED),
        .INTERMDISABLE(NLW_IBUFCTRL_INST_INTERMDISABLE_UNCONNECTED),
        .O(O),
        .T(NLW_IBUFCTRL_INST_T_UNCONNECTED));
  INBUF INBUF_INST
       (.O(OUT),
        .OSC(NLW_INBUF_INST_OSC_UNCONNECTED[3:0]),
        .OSC_EN(NLW_INBUF_INST_OSC_EN_UNCONNECTED),
        .PAD(I),
        .VREF(NLW_INBUF_INST_VREF_UNCONNECTED));
endmodule

module IBUF_HD4
   (O,
    I);
  output O;
  input I;

  wire I;
  wire O;
  wire OUT;
  wire NLW_IBUFCTRL_INST_IBUFDISABLE_UNCONNECTED;
  wire NLW_IBUFCTRL_INST_INTERMDISABLE_UNCONNECTED;
  wire NLW_IBUFCTRL_INST_T_UNCONNECTED;
  wire NLW_INBUF_INST_OSC_EN_UNCONNECTED;
  wire NLW_INBUF_INST_VREF_UNCONNECTED;
  wire [3:0]NLW_INBUF_INST_OSC_UNCONNECTED;

  IBUFCTRL IBUFCTRL_INST
       (.I(OUT),
        .IBUFDISABLE(NLW_IBUFCTRL_INST_IBUFDISABLE_UNCONNECTED),
        .INTERMDISABLE(NLW_IBUFCTRL_INST_INTERMDISABLE_UNCONNECTED),
        .O(O),
        .T(NLW_IBUFCTRL_INST_T_UNCONNECTED));
  INBUF INBUF_INST
       (.O(OUT),
        .OSC(NLW_INBUF_INST_OSC_UNCONNECTED[3:0]),
        .OSC_EN(NLW_INBUF_INST_OSC_EN_UNCONNECTED),
        .PAD(I),
        .VREF(NLW_INBUF_INST_VREF_UNCONNECTED));
endmodule

module IBUF_HD5
   (O,
    I);
  output O;
  input I;

  wire I;
  wire O;
  wire OUT;
  wire NLW_IBUFCTRL_INST_IBUFDISABLE_UNCONNECTED;
  wire NLW_IBUFCTRL_INST_INTERMDISABLE_UNCONNECTED;
  wire NLW_IBUFCTRL_INST_T_UNCONNECTED;
  wire NLW_INBUF_INST_OSC_EN_UNCONNECTED;
  wire NLW_INBUF_INST_VREF_UNCONNECTED;
  wire [3:0]NLW_INBUF_INST_OSC_UNCONNECTED;

  IBUFCTRL IBUFCTRL_INST
       (.I(OUT),
        .IBUFDISABLE(NLW_IBUFCTRL_INST_IBUFDISABLE_UNCONNECTED),
        .INTERMDISABLE(NLW_IBUFCTRL_INST_INTERMDISABLE_UNCONNECTED),
        .O(O),
        .T(NLW_IBUFCTRL_INST_T_UNCONNECTED));
  INBUF INBUF_INST
       (.O(OUT),
        .OSC(NLW_INBUF_INST_OSC_UNCONNECTED[3:0]),
        .OSC_EN(NLW_INBUF_INST_OSC_EN_UNCONNECTED),
        .PAD(I),
        .VREF(NLW_INBUF_INST_VREF_UNCONNECTED));
endmodule

module IBUF_HD6
   (O,
    I);
  output O;
  input I;

  wire I;
  wire O;
  wire OUT;
  wire NLW_IBUFCTRL_INST_IBUFDISABLE_UNCONNECTED;
  wire NLW_IBUFCTRL_INST_INTERMDISABLE_UNCONNECTED;
  wire NLW_IBUFCTRL_INST_T_UNCONNECTED;
  wire NLW_INBUF_INST_OSC_EN_UNCONNECTED;
  wire NLW_INBUF_INST_VREF_UNCONNECTED;
  wire [3:0]NLW_INBUF_INST_OSC_UNCONNECTED;

  IBUFCTRL IBUFCTRL_INST
       (.I(OUT),
        .IBUFDISABLE(NLW_IBUFCTRL_INST_IBUFDISABLE_UNCONNECTED),
        .INTERMDISABLE(NLW_IBUFCTRL_INST_INTERMDISABLE_UNCONNECTED),
        .O(O),
        .T(NLW_IBUFCTRL_INST_T_UNCONNECTED));
  INBUF INBUF_INST
       (.O(OUT),
        .OSC(NLW_INBUF_INST_OSC_UNCONNECTED[3:0]),
        .OSC_EN(NLW_INBUF_INST_OSC_EN_UNCONNECTED),
        .PAD(I),
        .VREF(NLW_INBUF_INST_VREF_UNCONNECTED));
endmodule

module F_Permutation
   (calc,
    f_out_ready,
    Q,
    SR,
    i_sti_buf0,
    clk_IBUF_BUFG,
    calc0,
    E);
  output calc;
  output f_out_ready;
  output [0:0]Q;
  input [0:0]SR;
  input i_sti_buf0;
  input clk_IBUF_BUFG;
  input calc0;
  input [0:0]E;

  wire [0:0]E;
  wire [0:0]Q;
  wire [0:0]SR;
  wire calc;
  wire calc0;
  wire clk_IBUF_BUFG;
  wire f_out_ready;
  wire \i_reg_n_0_[0] ;
  wire \i_reg_n_0_[10] ;
  wire \i_reg_n_0_[11] ;
  wire \i_reg_n_0_[12] ;
  wire \i_reg_n_0_[13] ;
  wire \i_reg_n_0_[14] ;
  wire \i_reg_n_0_[15] ;
  wire \i_reg_n_0_[16] ;
  wire \i_reg_n_0_[17] ;
  wire \i_reg_n_0_[18] ;
  wire \i_reg_n_0_[19] ;
  wire \i_reg_n_0_[1] ;
  wire \i_reg_n_0_[20] ;
  wire \i_reg_n_0_[21] ;
  wire \i_reg_n_0_[2] ;
  wire \i_reg_n_0_[3] ;
  wire \i_reg_n_0_[4] ;
  wire \i_reg_n_0_[5] ;
  wire \i_reg_n_0_[6] ;
  wire \i_reg_n_0_[7] ;
  wire \i_reg_n_0_[8] ;
  wire \i_reg_n_0_[9] ;
  wire i_sti_buf;
  wire i_sti_buf0;
  wire out_ready_i_1_n_0;
  wire out_ready_i_2_n_0;
  wire out_ready_i_3_n_0;
  wire out_ready_i_4_n_0;
  wire out_ready_i_5_n_0;
  wire out_ready_i_6_n_0;
  wire out_ready_i_7_n_0;

  FDRE #(
    .INIT(1'b0)) 
    calc_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(calc0),
        .Q(calc),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \i_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(i_sti_buf),
        .Q(\i_reg_n_0_[0] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \i_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(\i_reg_n_0_[9] ),
        .Q(\i_reg_n_0_[10] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \i_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(\i_reg_n_0_[10] ),
        .Q(\i_reg_n_0_[11] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \i_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(\i_reg_n_0_[11] ),
        .Q(\i_reg_n_0_[12] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \i_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(\i_reg_n_0_[12] ),
        .Q(\i_reg_n_0_[13] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \i_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(\i_reg_n_0_[13] ),
        .Q(\i_reg_n_0_[14] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \i_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(\i_reg_n_0_[14] ),
        .Q(\i_reg_n_0_[15] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \i_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(\i_reg_n_0_[15] ),
        .Q(\i_reg_n_0_[16] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \i_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(\i_reg_n_0_[16] ),
        .Q(\i_reg_n_0_[17] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \i_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(\i_reg_n_0_[17] ),
        .Q(\i_reg_n_0_[18] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \i_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(\i_reg_n_0_[18] ),
        .Q(\i_reg_n_0_[19] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \i_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(\i_reg_n_0_[0] ),
        .Q(\i_reg_n_0_[1] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \i_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(\i_reg_n_0_[19] ),
        .Q(\i_reg_n_0_[20] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \i_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(\i_reg_n_0_[20] ),
        .Q(\i_reg_n_0_[21] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \i_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(\i_reg_n_0_[21] ),
        .Q(Q),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \i_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(\i_reg_n_0_[1] ),
        .Q(\i_reg_n_0_[2] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \i_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(\i_reg_n_0_[2] ),
        .Q(\i_reg_n_0_[3] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \i_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(\i_reg_n_0_[3] ),
        .Q(\i_reg_n_0_[4] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \i_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(\i_reg_n_0_[4] ),
        .Q(\i_reg_n_0_[5] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \i_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(\i_reg_n_0_[5] ),
        .Q(\i_reg_n_0_[6] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \i_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(\i_reg_n_0_[6] ),
        .Q(\i_reg_n_0_[7] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \i_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(\i_reg_n_0_[7] ),
        .Q(\i_reg_n_0_[8] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \i_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(\i_reg_n_0_[8] ),
        .Q(\i_reg_n_0_[9] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    i_sti_buf_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(i_sti_buf0),
        .Q(i_sti_buf),
        .R(SR));
  LUT6 #(
    .INIT(64'h00000000EEEEEEE0)) 
    out_ready_i_1
       (.I0(f_out_ready),
        .I1(Q),
        .I2(out_ready_i_2_n_0),
        .I3(out_ready_i_3_n_0),
        .I4(out_ready_i_4_n_0),
        .I5(SR),
        .O(out_ready_i_1_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    out_ready_i_2
       (.I0(Q),
        .I1(\i_reg_n_0_[20] ),
        .I2(\i_reg_n_0_[21] ),
        .I3(out_ready_i_5_n_0),
        .O(out_ready_i_2_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    out_ready_i_3
       (.I0(\i_reg_n_0_[5] ),
        .I1(\i_reg_n_0_[4] ),
        .I2(\i_reg_n_0_[7] ),
        .I3(\i_reg_n_0_[6] ),
        .I4(out_ready_i_6_n_0),
        .O(out_ready_i_3_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    out_ready_i_4
       (.I0(\i_reg_n_0_[13] ),
        .I1(\i_reg_n_0_[12] ),
        .I2(\i_reg_n_0_[15] ),
        .I3(\i_reg_n_0_[14] ),
        .I4(out_ready_i_7_n_0),
        .O(out_ready_i_4_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    out_ready_i_5
       (.I0(\i_reg_n_0_[18] ),
        .I1(\i_reg_n_0_[19] ),
        .I2(\i_reg_n_0_[16] ),
        .I3(\i_reg_n_0_[17] ),
        .O(out_ready_i_5_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    out_ready_i_6
       (.I0(\i_reg_n_0_[2] ),
        .I1(\i_reg_n_0_[3] ),
        .I2(\i_reg_n_0_[0] ),
        .I3(\i_reg_n_0_[1] ),
        .O(out_ready_i_6_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    out_ready_i_7
       (.I0(\i_reg_n_0_[10] ),
        .I1(\i_reg_n_0_[11] ),
        .I2(\i_reg_n_0_[8] ),
        .I3(\i_reg_n_0_[9] ),
        .O(out_ready_i_7_n_0));
  FDRE #(
    .INIT(1'b0)) 
    out_ready_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(out_ready_i_1_n_0),
        .Q(f_out_ready),
        .R(1'b0));
endmodule

(* ECO_CHECKSUM = "50162de1" *) (* G = "1'b0" *) (* H = "1'b1" *) 
(* NotValidForBitStream *)
(* \DesignAttr:ENABLE_NOC_NETLIST_VIEW  *) 
(* \DesignAttr:ENABLE_AIE_NETLIST_VIEW  *) 
module Keccak
   (clk,
    reset,
    in,
    in_ready,
    is_last,
    squeeze,
    mode,
    sha_hold,
    byte_num,
    buffer_full,
    buffer_last,
    out_ready);
  input clk;
  input reset;
  input [63:0]in;
  input in_ready;
  input is_last;
  input squeeze;
  input mode;
  input sha_hold;
  input [2:0]byte_num;
  output buffer_full;
  output buffer_last;
  output out_ready;

  wire buffer_full;
  wire buffer_full_OBUF;
  wire buffer_last;
  wire buffer_last_OBUF;
  wire calc;
  wire calc0;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire f_out_ready;
  wire i;
  wire i_sti_buf0;
  wire in_ready;
  wire in_ready_IBUF;
  wire is_last;
  wire is_last_IBUF;
  wire mode;
  wire mode_IBUF;
  wire out_ready;
  wire out_ready_OBUF;
  wire p_0_in;
  wire reset;
  wire reset_IBUF;
  wire sha_hold;
  wire sha_hold_IBUF;
  wire squeeze;
  wire squeeze_IBUF;

initial begin
 $sdf_annotate("Keccak_tb_time_impl.sdf",,,,"tool_control");
end
  OBUF buffer_full_OBUF_inst
       (.I(buffer_full_OBUF),
        .O(buffer_full));
  OBUF buffer_last_OBUF_inst
       (.I(buffer_last_OBUF),
        .O(buffer_last));
  (* XILINX_LEGACY_PRIM = "BUFG" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE" *) 
  BUFGCE #(
    .CE_TYPE("ASYNC"),
    .SIM_DEVICE("ULTRASCALE_PLUS"),
    .STARTUP_SYNC("FALSE")) 
    clk_IBUF_BUFG_inst
       (.CE(1'b1),
        .I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF_UNIQ_BASE_ clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  F_Permutation f_permutation_
       (.E(i),
        .Q(p_0_in),
        .SR(reset_IBUF),
        .calc(calc),
        .calc0(calc0),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .f_out_ready(f_out_ready),
        .i_sti_buf0(i_sti_buf0));
  IBUF_HD1 in_ready_IBUF_inst
       (.I(in_ready),
        .O(in_ready_IBUF));
  IBUF_HD2 is_last_IBUF_inst
       (.I(is_last),
        .O(is_last_IBUF));
  IBUF_HD3 mode_IBUF_inst
       (.I(mode),
        .O(mode_IBUF));
  OBUF out_ready_OBUF_inst
       (.I(out_ready_OBUF),
        .O(out_ready));
  Padder padder_
       (.E(i),
        .Q(p_0_in),
        .SR(reset_IBUF),
        .buffer_full_OBUF(buffer_full_OBUF),
        .buffer_last_OBUF(buffer_last_OBUF),
        .calc(calc),
        .calc0(calc0),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .f_out_ready(f_out_ready),
        .i_sti_buf0(i_sti_buf0),
        .in_ready_IBUF(in_ready_IBUF),
        .is_last_IBUF(is_last_IBUF),
        .mode_IBUF(mode_IBUF),
        .out_ready_OBUF(out_ready_OBUF),
        .sha_hold_IBUF(sha_hold_IBUF),
        .squeeze_IBUF(squeeze_IBUF));
  IBUF_HD4 reset_IBUF_inst
       (.I(reset),
        .O(reset_IBUF));
  IBUF_HD5 sha_hold_IBUF_inst
       (.I(sha_hold),
        .O(sha_hold_IBUF));
  IBUF_HD6 squeeze_IBUF_inst
       (.I(squeeze),
        .O(squeeze_IBUF));
endmodule

module Padder
   (E,
    i_sti_buf0,
    calc0,
    out_ready_OBUF,
    buffer_full_OBUF,
    buffer_last_OBUF,
    SR,
    is_last_IBUF,
    clk_IBUF_BUFG,
    mode_IBUF,
    calc,
    sha_hold_IBUF,
    squeeze_IBUF,
    f_out_ready,
    Q,
    in_ready_IBUF);
  output [0:0]E;
  output i_sti_buf0;
  output calc0;
  output out_ready_OBUF;
  output buffer_full_OBUF;
  output buffer_last_OBUF;
  input [0:0]SR;
  input is_last_IBUF;
  input clk_IBUF_BUFG;
  input mode_IBUF;
  input calc;
  input sha_hold_IBUF;
  input squeeze_IBUF;
  input f_out_ready;
  input [0:0]Q;
  input in_ready_IBUF;

  wire [0:0]E;
  wire [0:0]Q;
  wire [0:0]SR;
  wire buffer_full_OBUF;
  wire buffer_last_OBUF;
  wire calc;
  wire calc0;
  wire clk_IBUF_BUFG;
  wire done;
  wire done_i_1_n_0;
  wire f_out_ready;
  wire i0;
  wire \i[0]_i_1_n_0 ;
  wire \i[10]_i_1_n_0 ;
  wire \i[11]_i_1_n_0 ;
  wire \i[12]_i_1_n_0 ;
  wire \i[13]_i_1_n_0 ;
  wire \i[14]_i_1_n_0 ;
  wire \i[15]_i_1_n_0 ;
  wire \i[16]_i_1_n_0 ;
  wire \i[17]_i_1_n_0 ;
  wire \i[18]_i_1_n_0 ;
  wire \i[19]_i_1_n_0 ;
  wire \i[1]_i_1_n_0 ;
  wire \i[20]_i_2_n_0 ;
  wire \i[2]_i_1_n_0 ;
  wire \i[3]_i_1_n_0 ;
  wire \i[4]_i_1_n_0 ;
  wire \i[5]_i_1_n_0 ;
  wire \i[6]_i_1_n_0 ;
  wire \i[7]_i_1_n_0 ;
  wire \i[8]_i_1_n_0 ;
  wire \i[9]_i_1_n_0 ;
  wire \i_reg_n_0_[0] ;
  wire \i_reg_n_0_[10] ;
  wire \i_reg_n_0_[11] ;
  wire \i_reg_n_0_[12] ;
  wire \i_reg_n_0_[13] ;
  wire \i_reg_n_0_[14] ;
  wire \i_reg_n_0_[15] ;
  wire \i_reg_n_0_[17] ;
  wire \i_reg_n_0_[18] ;
  wire \i_reg_n_0_[19] ;
  wire \i_reg_n_0_[1] ;
  wire \i_reg_n_0_[20] ;
  wire \i_reg_n_0_[2] ;
  wire \i_reg_n_0_[3] ;
  wire \i_reg_n_0_[4] ;
  wire \i_reg_n_0_[5] ;
  wire \i_reg_n_0_[6] ;
  wire \i_reg_n_0_[7] ;
  wire \i_reg_n_0_[8] ;
  wire \i_reg_n_0_[9] ;
  wire i_sti_buf0;
  wire in_ready_IBUF;
  wire is_last_IBUF;
  wire mode_IBUF;
  wire out_ready_OBUF;
  wire p_0_in;
  wire sha_hold_IBUF;
  wire squeeze_IBUF;
  wire state;

  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    buffer_full_OBUF_inst_i_1
       (.I0(p_0_in),
        .I1(mode_IBUF),
        .I2(\i_reg_n_0_[20] ),
        .O(buffer_full_OBUF));
  LUT6 #(
    .INIT(64'h0C000CAA00000000)) 
    buffer_last_OBUF_inst_i_1
       (.I0(\i_reg_n_0_[19] ),
        .I1(\i_reg_n_0_[15] ),
        .I2(p_0_in),
        .I3(mode_IBUF),
        .I4(\i_reg_n_0_[20] ),
        .I5(in_ready_IBUF),
        .O(buffer_last_OBUF));
  LUT6 #(
    .INIT(64'hAAAAFFFFFEAEFEAE)) 
    calc_i_1
       (.I0(squeeze_IBUF),
        .I1(\i_reg_n_0_[20] ),
        .I2(mode_IBUF),
        .I3(p_0_in),
        .I4(Q),
        .I5(calc),
        .O(calc0));
  LUT5 #(
    .INIT(32'hFFFFB800)) 
    done_i_1
       (.I0(p_0_in),
        .I1(mode_IBUF),
        .I2(\i_reg_n_0_[20] ),
        .I3(state),
        .I4(done),
        .O(done_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    done_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(done_i_1_n_0),
        .Q(done),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hBABF)) 
    \i[0]_i_1 
       (.I0(calc),
        .I1(p_0_in),
        .I2(mode_IBUF),
        .I3(\i_reg_n_0_[20] ),
        .O(\i[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h8A888AAA)) 
    \i[10]_i_1 
       (.I0(\i_reg_n_0_[9] ),
        .I1(calc),
        .I2(p_0_in),
        .I3(mode_IBUF),
        .I4(\i_reg_n_0_[20] ),
        .O(\i[10]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h8A888AAA)) 
    \i[11]_i_1 
       (.I0(\i_reg_n_0_[10] ),
        .I1(calc),
        .I2(p_0_in),
        .I3(mode_IBUF),
        .I4(\i_reg_n_0_[20] ),
        .O(\i[11]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h8A888AAA)) 
    \i[12]_i_1 
       (.I0(\i_reg_n_0_[11] ),
        .I1(calc),
        .I2(p_0_in),
        .I3(mode_IBUF),
        .I4(\i_reg_n_0_[20] ),
        .O(\i[12]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h8A888AAA)) 
    \i[13]_i_1 
       (.I0(\i_reg_n_0_[12] ),
        .I1(calc),
        .I2(p_0_in),
        .I3(mode_IBUF),
        .I4(\i_reg_n_0_[20] ),
        .O(\i[13]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h8A888AAA)) 
    \i[14]_i_1 
       (.I0(\i_reg_n_0_[13] ),
        .I1(calc),
        .I2(p_0_in),
        .I3(mode_IBUF),
        .I4(\i_reg_n_0_[20] ),
        .O(\i[14]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h8A888AAA)) 
    \i[15]_i_1 
       (.I0(\i_reg_n_0_[14] ),
        .I1(calc),
        .I2(p_0_in),
        .I3(mode_IBUF),
        .I4(\i_reg_n_0_[20] ),
        .O(\i[15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h8A888AAA)) 
    \i[16]_i_1 
       (.I0(\i_reg_n_0_[15] ),
        .I1(calc),
        .I2(p_0_in),
        .I3(mode_IBUF),
        .I4(\i_reg_n_0_[20] ),
        .O(\i[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h888C)) 
    \i[17]_i_1 
       (.I0(calc),
        .I1(p_0_in),
        .I2(mode_IBUF),
        .I3(\i_reg_n_0_[20] ),
        .O(\i[17]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h8A888AAA)) 
    \i[18]_i_1 
       (.I0(\i_reg_n_0_[17] ),
        .I1(calc),
        .I2(p_0_in),
        .I3(mode_IBUF),
        .I4(\i_reg_n_0_[20] ),
        .O(\i[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h8A888AAA)) 
    \i[19]_i_1 
       (.I0(\i_reg_n_0_[18] ),
        .I1(calc),
        .I2(p_0_in),
        .I3(mode_IBUF),
        .I4(\i_reg_n_0_[20] ),
        .O(\i[19]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h8A888AAA)) 
    \i[1]_i_1 
       (.I0(\i_reg_n_0_[0] ),
        .I1(calc),
        .I2(p_0_in),
        .I3(mode_IBUF),
        .I4(\i_reg_n_0_[20] ),
        .O(\i[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h55335530)) 
    \i[20]_i_1 
       (.I0(calc),
        .I1(done),
        .I2(in_ready_IBUF),
        .I3(buffer_full_OBUF),
        .I4(state),
        .O(i0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h8A888AAA)) 
    \i[20]_i_2 
       (.I0(\i_reg_n_0_[19] ),
        .I1(calc),
        .I2(p_0_in),
        .I3(mode_IBUF),
        .I4(\i_reg_n_0_[20] ),
        .O(\i[20]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h0000FFE2)) 
    \i[22]_i_1 
       (.I0(\i_reg_n_0_[20] ),
        .I1(mode_IBUF),
        .I2(p_0_in),
        .I3(calc),
        .I4(sha_hold_IBUF),
        .O(E));
  LUT5 #(
    .INIT(32'h8A888AAA)) 
    \i[2]_i_1 
       (.I0(\i_reg_n_0_[1] ),
        .I1(calc),
        .I2(p_0_in),
        .I3(mode_IBUF),
        .I4(\i_reg_n_0_[20] ),
        .O(\i[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h8A888AAA)) 
    \i[3]_i_1 
       (.I0(\i_reg_n_0_[2] ),
        .I1(calc),
        .I2(p_0_in),
        .I3(mode_IBUF),
        .I4(\i_reg_n_0_[20] ),
        .O(\i[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h8A888AAA)) 
    \i[4]_i_1 
       (.I0(\i_reg_n_0_[3] ),
        .I1(calc),
        .I2(p_0_in),
        .I3(mode_IBUF),
        .I4(\i_reg_n_0_[20] ),
        .O(\i[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h8A888AAA)) 
    \i[5]_i_1 
       (.I0(\i_reg_n_0_[4] ),
        .I1(calc),
        .I2(p_0_in),
        .I3(mode_IBUF),
        .I4(\i_reg_n_0_[20] ),
        .O(\i[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h8A888AAA)) 
    \i[6]_i_1 
       (.I0(\i_reg_n_0_[5] ),
        .I1(calc),
        .I2(p_0_in),
        .I3(mode_IBUF),
        .I4(\i_reg_n_0_[20] ),
        .O(\i[6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h8A888AAA)) 
    \i[7]_i_1 
       (.I0(\i_reg_n_0_[6] ),
        .I1(calc),
        .I2(p_0_in),
        .I3(mode_IBUF),
        .I4(\i_reg_n_0_[20] ),
        .O(\i[7]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h8A888AAA)) 
    \i[8]_i_1 
       (.I0(\i_reg_n_0_[7] ),
        .I1(calc),
        .I2(p_0_in),
        .I3(mode_IBUF),
        .I4(\i_reg_n_0_[20] ),
        .O(\i[8]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h8A888AAA)) 
    \i[9]_i_1 
       (.I0(\i_reg_n_0_[8] ),
        .I1(calc),
        .I2(p_0_in),
        .I3(mode_IBUF),
        .I4(\i_reg_n_0_[20] ),
        .O(\i[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \i_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(i0),
        .D(\i[0]_i_1_n_0 ),
        .Q(\i_reg_n_0_[0] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \i_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(i0),
        .D(\i[10]_i_1_n_0 ),
        .Q(\i_reg_n_0_[10] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \i_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(i0),
        .D(\i[11]_i_1_n_0 ),
        .Q(\i_reg_n_0_[11] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \i_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(i0),
        .D(\i[12]_i_1_n_0 ),
        .Q(\i_reg_n_0_[12] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \i_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(i0),
        .D(\i[13]_i_1_n_0 ),
        .Q(\i_reg_n_0_[13] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \i_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(i0),
        .D(\i[14]_i_1_n_0 ),
        .Q(\i_reg_n_0_[14] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \i_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(i0),
        .D(\i[15]_i_1_n_0 ),
        .Q(\i_reg_n_0_[15] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \i_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(i0),
        .D(\i[16]_i_1_n_0 ),
        .Q(p_0_in),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \i_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(i0),
        .D(\i[17]_i_1_n_0 ),
        .Q(\i_reg_n_0_[17] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \i_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(i0),
        .D(\i[18]_i_1_n_0 ),
        .Q(\i_reg_n_0_[18] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \i_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(i0),
        .D(\i[19]_i_1_n_0 ),
        .Q(\i_reg_n_0_[19] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \i_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(i0),
        .D(\i[1]_i_1_n_0 ),
        .Q(\i_reg_n_0_[1] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \i_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(i0),
        .D(\i[20]_i_2_n_0 ),
        .Q(\i_reg_n_0_[20] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \i_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(i0),
        .D(\i[2]_i_1_n_0 ),
        .Q(\i_reg_n_0_[2] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \i_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(i0),
        .D(\i[3]_i_1_n_0 ),
        .Q(\i_reg_n_0_[3] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \i_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(i0),
        .D(\i[4]_i_1_n_0 ),
        .Q(\i_reg_n_0_[4] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \i_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(i0),
        .D(\i[5]_i_1_n_0 ),
        .Q(\i_reg_n_0_[5] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \i_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(i0),
        .D(\i[6]_i_1_n_0 ),
        .Q(\i_reg_n_0_[6] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \i_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(i0),
        .D(\i[7]_i_1_n_0 ),
        .Q(\i_reg_n_0_[7] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \i_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(i0),
        .D(\i[8]_i_1_n_0 ),
        .Q(\i_reg_n_0_[8] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \i_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(i0),
        .D(\i[9]_i_1_n_0 ),
        .Q(\i_reg_n_0_[9] ),
        .R(SR));
  LUT6 #(
    .INIT(64'hFFFFFFFFAAAAFEAE)) 
    i_sti_buf_i_1
       (.I0(squeeze_IBUF),
        .I1(\i_reg_n_0_[20] ),
        .I2(mode_IBUF),
        .I3(p_0_in),
        .I4(calc),
        .I5(f_out_ready),
        .O(i_sti_buf0));
  LUT4 #(
    .INIT(16'h02A2)) 
    out_ready_OBUF_inst_i_1
       (.I0(f_out_ready),
        .I1(\i_reg_n_0_[20] ),
        .I2(mode_IBUF),
        .I3(p_0_in),
        .O(out_ready_OBUF));
  FDRE #(
    .INIT(1'b0)) 
    state_reg
       (.C(clk_IBUF_BUFG),
        .CE(is_last_IBUF),
        .D(is_last_IBUF),
        .Q(state),
        .R(SR));
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

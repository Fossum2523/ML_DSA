// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Wed May  7 18:39:48 2025
// Host        : DESKTOP-5RUADSS running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/fossu/Desktop/ML_DSA_Syn_new/IMP3/MLDSA/MLDSA.gen/sources_1/ip/Ture_Dual_Port_RAM_23x1024_3/Ture_Dual_Port_RAM_23x1024_sim_netlist.v
// Design      : Ture_Dual_Port_RAM_23x1024
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k70tfbv676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Ture_Dual_Port_RAM_23x1024,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module Ture_Dual_Port_RAM_23x1024
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta,
    clkb,
    enb,
    web,
    addrb,
    dinb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [22:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [22:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [0:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [9:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [22:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [22:0]doutb;

  wire [9:0]addra;
  wire [9:0]addrb;
  wire clka;
  wire clkb;
  wire [22:0]dina;
  wire [22:0]dinb;
  wire [22:0]douta;
  wire [22:0]doutb;
  wire ena;
  wire enb;
  wire [0:0]wea;
  wire [0:0]web;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [9:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [9:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [22:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "10" *) 
  (* C_ADDRB_WIDTH = "10" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     5.945 mW" *) 
  (* C_FAMILY = "kintex7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "Ture_Dual_Port_RAM_23x1024.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "2" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1024" *) 
  (* C_READ_DEPTH_B = "1024" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "23" *) 
  (* C_READ_WIDTH_B = "23" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "1024" *) 
  (* C_WRITE_DEPTH_B = "1024" *) 
  (* C_WRITE_MODE_A = "READ_FIRST" *) 
  (* C_WRITE_MODE_B = "READ_FIRST" *) 
  (* C_WRITE_WIDTH_A = "23" *) 
  (* C_WRITE_WIDTH_B = "23" *) 
  (* C_XDEVICEFAMILY = "kintex7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  Ture_Dual_Port_RAM_23x1024_blk_mem_gen_v8_4_7 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[9:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[9:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[22:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(web));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2023.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
jLV29U0rrfMIZhYJzdoUrPoqB9eHQ5NXmWyCdqnN3Wgm+GU4C3zthrN1m4QGiaj0thPCIynZbX+0
7yjtkv+T5ByJ6NhiofAwWseGLvPXlYu6ERAPvi4SAYpF2VUqQHtPAbPmnPubGdDRgIEpeobF7hsz
rEcpEru1pyiScUriyuo=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
vsoizVrOONWw/DhjRLEYrtRmtji+Ok63CbpSg/l9VnoKAi8tAzqRbQ57atGB2N6IGGbKHkbK2Uzh
EHgWvYZeyt4hE+bpQX91vc9PNxfjQMGzPoFD3jCWk30EmEk+AND39eWx+DhJ8xhFuucoOQ2GwyAk
B+Mjs15naPE7DvlHel8hnD4dfSdYhGKp96oozu8JeBto8aHG6poOuYkxSwaut7NCI+mabCkMxtMp
RrydgmRuTvhRTbJMyx5CxFSZTRDrS5aU1vaRlnMiqKCI7g2KY9pemYaJsFeVodBuo6IyKGynyEhs
wr+VtUhQDtaVhMkwB95WwmMoDk9F2L5Au1I+TQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
W081dPMCWhKs5YlQD7n3zvf7+PTcnb8eFWxoVs8+zHLkxDMA1klITbsfztGYvJFce8Yao5XQLLqZ
oUE5Pq2arq+zwICFUcLjdMsmP1WmL82znHOPHm83zNwrxWMloHkySAqzFbgJeHa973uZqj0M8ydc
sYmzCYVlGVjt0QX0xqA=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Zpc3MmdLWaVOv+S4z2POuoyslYoAbWc+Npxq2UyQRtDwf566IId3uwAetolMAgfLo/G3ezuSOXMn
8NznS37h9XvmVrxA50SAux68P87WgkLtiUYqM3CMBKkxNlZ/TR8WzTuQyFdvzkOE9lp8HC7LXnk5
RDsnOM+su46FW7ysY01COslo9Xc7rhs6WFqx29+Xcqk8+ZMLSzaJfuwZdNmJFS3Q1vhlq3ZeYqMl
wMieB731KsPxjxp7VKNHpTbgFryC2isqc4ohBDOt52M/Bz4B/rIpFeHfZ7X3jWSiKtSuBsDN2NXf
EMjfAT248dlK7NxJ+NBNPhS5sLxTiGyQhta57A==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rPMYqnkKhJKV1wltOfDrKos9ZbucaoX3WGTuqsdLkGpcKObzslHBwlGrKtWV7bZYmS2SM+QuEMfa
CE+tCUdsSiprp+n5BuSQlJa6BJ8mlqccjoo/JLw2QEmUhyMXQ3TLGomGGoZdeTmMPXhUBAOyLPea
Ddc8mgtTN8Kpy117GOTXDKP+IKJqW01fLrPJpgEhFiJCbyElLgtCRWmI94gX+y4XNVS0Cd1YwNw6
4nHgnEdC7fXARDKcYO3VsWC/pdzPQgursXloNLrVYa6i2xr+8E1V0+nSWwNYQZP7XUIVqXKMU8Ea
bT4acXrRCF/5tJJ5B9JparYI0zxXSbaakn1dIw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2022_10", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mfroTgL8g2pyIXQ/mGO9YHm19cd5mOlJ++qpusOYeVxGmkIhvF4aKx+AyIUz2yGGAeCtOzIasHty
pyqKgZhibSqxcpHgR0m6GOxXXOXJiHaK8NzxUzXeRJovcBI/WjtDhXeb1LRMI1J97jVBtJPJQH0Y
fGOD7jWvkvQwxnrZdyLp6kPWgSIcavHHDbO7iJv4gnyGp6W3/FCDo2RKWNLoW+SNjSdLZ6YRP8a+
ldaGU8TYvJ03KWlmik7repuN6AwxCjg2KeQ+x1sBAEXzROXomuSbvX3ZAo8UiIKAQY1SJumHLG3L
QI/S4Wbl1Hz6LDTsttMwP480gq6+tb6s1E4oWw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QJIabgm8dx/gVHbOQFwt8maOKVHFgkpZTPR6dzD8fqoGo9M9oGPTqBqchtPZWgv2UYFF2KEUSlV4
L3SDXBKrLs+NsAVTcICaEMiEi6j82zj/C1LsPkQfS8RLrg0ab8lbDMb5YqJ7lkHs3iM65x2iN1Mf
66cTgCbkAdl3rDpab75btpTQt5ZKiq5CSY3RZfyIW0uWbTGTELm6liuRKM9+K8BQwTU7A+FFFQBA
/9eJwQYzNNA/iwoYJ2WTPd6pBlzXriNLu9M+/2bYicNBSuH1PBR9v2ESrTB6k7EiV1zvBXV9NuG/
sFt4MumWMuSNwP2W38bQATxxW/l0IrmaXGOC/w==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
lhKf/Vgj6pHpme1ji4HVe36BU8pMkam/2I9lFeyOiBnIbzgdEGfLJBcEvkL33A7s0hxa6LFbHnkT
upgMpPjmIghBz3xUQ13vpiY152thFec6qvlcdg1r+GTmnBOSFl6g/OfZ3eFUhfsve6ZjQHpXnKFo
a55hN2+eP1EG9+VxGeM7XkHaeFhEIry52qtnmg072KEFIwRiGs2d/TJ4AqupuIdIiP1kTN9k+oqa
2ta1vdtqPY0dDHqrf+5YSd0CejkhQeCqg/bauLP3755SwdOPRgooG5ANT8hUpTiFMFXtU+GC9NSp
evJtMHUy1NbgMmhFHO+w3URLEdjSaBxZPD7YLdWkF65jY526tJzoek+BzEKoBaGfCaY7O1nHKXm+
89k3rPUy0Xo4/0nHpno+N/Db09heJPbnGsCwN/l+KnR6Lz8kvWziBjZe0ijOkKI+T12y3T1VeOtY
H/aqtNlQt1mhFwrbw6ezaAiDPVbCQXnly6b4tbb8+nFsxWOGIGAfLozB

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PNsQ8uEcQYrl+GaDuBaq1tQ5br5aAdaqHnyrc0NVu/JnQUk53jaiLx8Oz5fNACvWelUUk2/C+P5I
b2rbU1bb/dC6TqC5J1N0yoMYRYw58u4Lrl8Kgqgt9Rlph5Qgzzfxp+oblXF/pO4mRyAXpZhpNkFT
0Ar9BUtPOTOtJ9/g53SRnZ6GjxzfeD+25J4fcXBNo2gCTgUkwiLSsJRwTB/cJmn+dZPwPdIOHEP9
TkfDK+OrbLYO3T+DFBTCMRNH2NB1J9sc5s+nPU8iYnjgPTo6HoGW+LIlCz6yNJMZzJzoeW708utc
0fJXkT7vLDVh7olvy3V9AAY8Do0YR1kiZlhVhQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
zAz8RnGHFebkJFAS+gjC+mXHW7m7We+JgSmIz15mS01u/4+9Ng0sJfkeXOClmVPTQ2Mp2Yuv6/6f
ehzUTcANilWsqLM6Q1FToCPNX/NTqodlcHirGM7b5R9yevouNT/aqH12nmbunBQmBHmehNutdCjG
r6Z7kZgeZ2ZE7MMOF0rTy1XHEPkqgMNTRoS8R/pPWPTW4/j+bn3aJj0Q/fTz4Gi3mbSUKWs2fREQ
UKiuolNJkN6DiDvhlVYHUyytXNJG44ikmBXehoQQRLapkYaxnQmMRT1ok9uY6pKoy71CtvJ3Mt2x
EQv1GU2i4qQyAOwa0mkEohWXduicU6tDz3zQwQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TK3eE9V+v1z2P1KjG4GrjhA1n3qDOpNzLGXdtjnjhF0QBFPSuhC+nmNqTPOb3p2a9r5KD0miY3Cd
+KpjH6Ao09E2/LD2Go4aLQh6vP+9BldlSKEwCGfx2NjBQrXWVH21lQR7IRjOvyTOclpd7SgtUJLw
dvebETyLiKr9C6RfnIBeptuCA3iJlXfwkh6I0JfzD5WBizQkotioZmmrXv5105pCXQ4Ta1WThFsA
2ll9dZeSjEDHUxxhfyfjryv9m4VL89ZDU/rGITsdptwB1BC1jLqmPDymY05lyECnjA6NIR5GGfI4
K2y2f4GfikKoN5r9IOvFzw963Wm82ZZPtXOKGg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 31424)
`pragma protect data_block
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
bFJKDNo0boG1gwkc80SA7t0=
`pragma protect end_protected
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

// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Wed May  7 18:26:57 2025
// Host        : DESKTOP-5RUADSS running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/fossu/Desktop/ML_DSA_Syn_new/IMP3/MLDSA/MLDSA.gen/sources_1/ip/Ture_Dual_Port_RAM_23x1024_2/Ture_Dual_Port_RAM_23x1024_sim_netlist.v
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     5.5875 mW" *) 
  (* C_FAMILY = "kintex7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "1" *) 
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
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
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
qagkpvxAM2sENCXad6slHNQ=
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

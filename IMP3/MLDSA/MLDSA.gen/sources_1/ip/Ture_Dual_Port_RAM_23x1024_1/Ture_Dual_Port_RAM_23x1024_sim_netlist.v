// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Wed May  7 16:43:44 2025
// Host        : DESKTOP-5RUADSS running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/fossu/Desktop/ML_DSA_Syn_new/IMP3/MLDSA/MLDSA.gen/sources_1/ip/Ture_Dual_Port_RAM_23x1024_1/Ture_Dual_Port_RAM_23x1024_sim_netlist.v
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
1uph53IKO/DEz2+D7onAAY8=
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

// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Tue May  6 12:30:41 2025
// Host        : DESKTOP-5RUADSS running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/fossu/Desktop/ML_DSA_Syn_new/IMP2/Data_Mem/Data_Mem.gen/sources_1/ip/Ture_Dual_Port_RAM_23x1024/Ture_Dual_Port_RAM_23x1024_sim_netlist.v
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
HEXqfXVZ6v9g3+KosKzwMh8=
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

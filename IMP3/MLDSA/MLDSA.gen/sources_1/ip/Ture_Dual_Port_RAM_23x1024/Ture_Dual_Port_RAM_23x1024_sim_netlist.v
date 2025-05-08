// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Wed May  7 16:16:54 2025
// Host        : DESKTOP-5RUADSS running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/fossu/Desktop/ML_DSA_Syn_new/IMP3/MLDSA/MLDSA.gen/sources_1/ip/Ture_Dual_Port_RAM_23x1024/Ture_Dual_Port_RAM_23x1024_sim_netlist.v
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
    rsta,
    ena,
    wea,
    addra,
    dina,
    douta,
    clkb,
    rstb,
    enb,
    web,
    addrb,
    dinb,
    doutb,
    rsta_busy,
    rstb_busy);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA RST" *) input rsta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [22:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [22:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB RST" *) input rstb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [0:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [9:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [22:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [22:0]doutb;
  output rsta_busy;
  output rstb_busy;

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
  wire rsta;
  wire rsta_busy;
  wire rstb;
  wire rstb_busy;
  wire [0:0]wea;
  wire [0:0]web;
  wire NLW_U0_dbiterr_UNCONNECTED;
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
  (* C_EN_SAFETY_CKT = "1" *) 
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
  (* C_HAS_RSTA = "1" *) 
  (* C_HAS_RSTB = "1" *) 
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
        .rsta(rsta),
        .rsta_busy(rsta_busy),
        .rstb(rstb),
        .rstb_busy(rstb_busy),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 38352)
`pragma protect data_block
+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
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

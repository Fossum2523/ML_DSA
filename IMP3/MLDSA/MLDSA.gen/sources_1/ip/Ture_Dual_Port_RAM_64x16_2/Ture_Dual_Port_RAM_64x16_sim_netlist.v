// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Wed May  7 18:27:37 2025
// Host        : DESKTOP-5RUADSS running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/fossu/Desktop/ML_DSA_Syn_new/IMP3/MLDSA/MLDSA.gen/sources_1/ip/Ture_Dual_Port_RAM_64x16_2/Ture_Dual_Port_RAM_64x16_sim_netlist.v
// Design      : Ture_Dual_Port_RAM_64x16
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k70tfbv676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Ture_Dual_Port_RAM_64x16,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module Ture_Dual_Port_RAM_64x16
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
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [3:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [63:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [63:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [0:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [3:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [63:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [63:0]doutb;

  wire [3:0]addra;
  wire [3:0]addrb;
  wire clka;
  wire clkb;
  wire [63:0]dina;
  wire [63:0]dinb;
  wire [63:0]douta;
  wire [63:0]doutb;
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
  wire [3:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "4" *) 
  (* C_ADDRB_WIDTH = "4" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "2" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     11.8086 mW" *) 
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
  (* C_INIT_FILE = "Ture_Dual_Port_RAM_64x16.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "2" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "16" *) 
  (* C_READ_DEPTH_B = "16" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "64" *) 
  (* C_READ_WIDTH_B = "64" *) 
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
  (* C_WRITE_DEPTH_A = "16" *) 
  (* C_WRITE_DEPTH_B = "16" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "64" *) 
  (* C_WRITE_WIDTH_B = "64" *) 
  (* C_XDEVICEFAMILY = "kintex7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  Ture_Dual_Port_RAM_64x16_blk_mem_gen_v8_4_7 U0
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
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[3:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[3:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 48960)
`pragma protect data_block
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
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

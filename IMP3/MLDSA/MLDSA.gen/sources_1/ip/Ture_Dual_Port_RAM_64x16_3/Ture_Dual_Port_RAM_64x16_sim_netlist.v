// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Wed May  7 18:38:59 2025
// Host        : DESKTOP-5RUADSS running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/fossu/Desktop/ML_DSA_Syn_new/IMP3/MLDSA/MLDSA.gen/sources_1/ip/Ture_Dual_Port_RAM_64x16_3/Ture_Dual_Port_RAM_64x16_sim_netlist.v
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     12.523601 mW" *) 
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
  (* C_WRITE_MODE_A = "READ_FIRST" *) 
  (* C_WRITE_MODE_B = "READ_FIRST" *) 
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

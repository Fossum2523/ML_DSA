// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Wed May  7 16:45:13 2025
// Host        : DESKTOP-5RUADSS running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/fossu/Desktop/ML_DSA_Syn_new/IMP3/MLDSA/MLDSA.gen/sources_1/ip/Ture_Dual_Port_RAM_64x16_1/Ture_Dual_Port_RAM_64x16_sim_netlist.v
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

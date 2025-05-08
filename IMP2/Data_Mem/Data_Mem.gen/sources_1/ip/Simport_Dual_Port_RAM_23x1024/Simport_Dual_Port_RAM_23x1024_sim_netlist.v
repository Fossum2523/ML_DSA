// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Tue May  6 12:06:51 2025
// Host        : DESKTOP-5RUADSS running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top Simport_Dual_Port_RAM_23x1024 -prefix
//               Simport_Dual_Port_RAM_23x1024_ blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k70tfbv676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module Simport_Dual_Port_RAM_23x1024
   (clka,
    ena,
    wea,
    addra,
    dina,
    clkb,
    enb,
    addrb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [22:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [9:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [22:0]doutb;

  wire [9:0]addra;
  wire [9:0]addrb;
  wire clka;
  wire clkb;
  wire [22:0]dina;
  wire [22:0]doutb;
  wire ena;
  wire enb;
  wire [0:0]wea;
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
  wire [22:0]NLW_U0_douta_UNCONNECTED;
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     4.937925 mW" *) 
  (* C_FAMILY = "kintex7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
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
  (* C_INIT_FILE = "blk_mem_gen_0.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "1" *) 
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
  (* C_WRITE_MODE_A = "NO_CHANGE" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "23" *) 
  (* C_WRITE_WIDTH_B = "23" *) 
  (* C_XDEVICEFAMILY = "kintex7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  Simport_Dual_Port_RAM_23x1024_blk_mem_gen_v8_4_7 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(NLW_U0_douta_UNCONNECTED[22:0]),
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
        .web(1'b0));
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 29344)
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

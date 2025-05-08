// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Tue May  6 12:06:52 2025
// Host        : DESKTOP-5RUADSS running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/fossu/Desktop/ML_DSA_Syn_new/IMP2/Data_Mem/Data_Mem.gen/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k70tfbv676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module blk_mem_gen_0
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
  blk_mem_gen_0_blk_mem_gen_v8_4_7 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 29456)
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

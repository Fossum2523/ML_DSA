// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Tue May  6 12:06:51 2025
// Host        : DESKTOP-5RUADSS running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k70tfbv676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_7 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 29472)
`pragma protect data_block
HTE2jP9koW0mADIeTCLG4GW9hPoLXADfIoRpPxBlmH7THLrUTiFGOsL1CmkwX+fA5w0qa2x5xlJw
M5QluXUG1yFppRnfuLuEwONe3UIDxMYweR2p4yn16xg+2/xl7tkJKyFiRIvpF4pAeIcEqaRP8nue
hH2TM9rNpm+OBVtcbCvQvFmps35ApVSOtsj3HBqtCibaFJxRHe2pMnXCQCLnoK8L+b9A4kkaSVhE
dfPGrqkXPqv2NtkrDEQ/rvYj9iJCILpcDs0E/lr+ubSsDksyrA2p4KmaKGWICo62WSqvWm7kqx2Z
ftPqe9LJXoBIYUsAheTdczOJvVBO0erjqlwhD8zZ6noEqB+YEPZkWEIdmJJY3YQB7zpi1Gnl0gG6
QYDZywrRIi0Gc8c2MFeNWres7S+s0jC2mpwopqkk3BnNYTFIj6fRYV4UISkT0tu8CZgJ4OsRiJjG
kBk4GOdGtwVJsKheJVLutxhXNLcP6WNe8ShB90fHMXxeqarYhr+pHuRU/roJG6US4UUzKK87Bt8G
Sv+RUw5PlcbPJW80iHLuo7nngkHcv3pPwjdQrIEF9ikQS0dc4UXOpKCL96EF0PXCL3T9oUlhm1h3
+TJ1tX8/nXQ59FbjGkqH/qOEB33isXC24BNAMDwk8SH3b5QwEXdX6QO53XL7tR6i+gUouj2t5Awg
860ByGizSWhQWgm5jU7axPn5opCuCqB4/dU+bRBxMBzx0bq4lxGABzqfnEAFjXRtUHNais+cUXdt
rNZOS4jC+mkGVB40kLFzdAPSXNlGmkSQDTmjaGOYJt8wnQsONCllTFDro9xFOFwMCPn2pXT18mxh
YwqDl7TzKXeuiqFJiFiPi+zK3J4nvPrdGrTRKfiIuhzCGr0jCUEGJJ7ZRIMhqIAnZduAMW6b0fpH
AA+dpaymoH1Wn+k4mI1SvAq2r3MtATqrWjZvMElgth1/8ep+5Vu2VN34AYEhYAOTCxx1g4N1vvmI
ewEaTpC9DR/10gXvABjQw0dHecluUhimPNqEnGkfkK11cGSR7tEHReZbT5jlxGzLfcWFDbHTWkr4
G3u8vk21zrkWLcMhO3Zgb7J2Hd4d89b7/lH8Ij2Lwcjh+48V7kQmWUIxD3KJ9KETqtuqUbkBS+kU
w0cMVl287UqDx3EieePdiJLyTXkSO89PTnw1Tp6WpEk/rNvv6UbdgXxSavc5jPYCa/fAxCARHnfq
t8gawmTJq/SIHGrB7r0LNq5Jf7oMxW5rX9i24ouoWfFdq9FKUS/gcoB9GNZ6FUFZr5TzoJnhFwmL
H5o9GMn7uc3EIxQmYm4V358VYAEfJqBQZiSsFoVw9WTj4YkikbxKS13jcFIFCmqX6I2nBw6gyi7j
DVetLaqF4LPLqdrluKGZ1AtjYiNvLv4TRAfn+NYynz70Mx57RD4Rc9bQzQ4yRMbYI8BNDaCXnsey
9+ncIOiv2WcTJjoDcJ+log4Tz/t2Ko71mTkuT/qOW5vDWOoNzdDlpkJO0bx9GIDNlkhmDkPbzKj8
EWAeZetQwrbXhZ8RVhslEizRk98HYJODjgNYgKkeJS7g6exWSWEjy0fEem21jarohPq2OYCJRRLP
uS0Skj5KR+BWfOfezkpDWlRWqBmnb0mZZ59gQDr22t3OryftpGPQSHrdeSxZfckZw85Swh/4mPDU
U5UWQdIqIKfIWH+r4brStLEO6tFxeleBmYVVtyxrnI8iziRoniYpG4ASHUfq0Px+MMPlCegyoS2x
O4Chxxir8mp9s8HUMi9SzE3lE71A0lTGChzpL/+4Z56qkcg5wOGvyy52DtVr84h3C6lgf0P7AP9j
tS12wmENtPQ6AaWRSjcdeWyOx4S7yxYdpWIZ8XBJ+yMNuPDlAO7jg7toQwdKYsZrP8wWLeVz2AcA
tPvLGrn4XRhtKMgAFvAdvFvewV+pYIrBhdMw/xIxZKeOTr1g/uLtrkwl+Kjf7gSkeUOAHBSmr3hV
8INZDb7+gqSBxA1G5ATiJxdKt6k814Dtj8I/hlOIZJo06nivQO0zRhoShor71HUa6d1uM9jtyG7b
5TMp5fDUNEGruA8Hkj4UBbejREiBjihuRB2HqOiDE0QIMByYSnLrDYwDfHT5ufNOjommcQJEaTjp
tpsAS8O6ejilJ/3A7wnw70uIcu8IqiF2KcrPHykdUXmX2w2rBxd/eciMTT+0CW4rYNqRRNU4cCxq
0UmZI9e/6ux9kbb1LHOiPEXTOIwuF+mET1AL4K8yivBDpVnavFXuzYxV3KM84bS05H37nG4lzHqn
tFinqkJHVv5tYXM695IoKiGwkM1zNvQzHaooTAnPmoNAVdVjCPthZJafuERH4On760bbkwq0i2hp
NhjFdG3JCzehMxf73cRKoh9lsLGiw6DAd+yiqPON2tpC+w4AR6gmSLJBrmOimkVDBvx/Veka2SKT
fRYoWcu/xsqFsPgTkOEg2+rj6ye2/K6q7WhogSV9cPaCtBpf4qd2jFn2EMTNVEDCo4ITu9PH3/rL
RmhXslI1vQ+ZE6l7GCrpK1g83RBLkwRpdh+hchBTnFlNlTUg6WtWIw6z5VxZEW6mHerzD5yn+AQS
e2KnEZYB0xf70TbdvkOEYozWJoVi+MK5uJWEKrQi9eZp7NuuXt3OqrHbD8aYlbOb1YFx3Grfw6ip
3zjkGgUHufitqT82G0cOAL3oU5cd2GZ90XZbzBFAd6ihm1pxvJ42jVQueO9qfIBIJ3d179hZl0f4
I+dyJpq1Kyg0llZuiY4NTa+NgZ3TzyYAdR+L1RnAFtd2niHJ6JdQj4rCYFQAT6hiaAJbZkCCzv5A
+5EQjGqsloBvnrn7sZ6GlRytkbaEqndUawRQbNQ1RbVM/89sE06ft+u3JuEoHRliN84WRX+6vbg4
zS5zCDtXVxBf/PAUEO5KOQ6pYnqxEMpp7zU8y71EMX5YN/f00MdEsvYABp/LmHfcaNU9mNTGTM4T
v2W4aGcqEYWiJl6C+hb5okm7J/uSL8CLSuI4WqFnovWcYPsY7AYNHvnRQXSK+vjuT9DO6wjYTu/l
XtWfQx9CLyAzBK1/l6KeI3zPAPzfyMTBXTix4uQMFkDCO41d5o4Q+iyucRimrFyFONY3GFtP2X9H
SETAvSe44+JSraS44dcCDvvt9Rv6G1I4IDRTWNk0DPpxK6UJWSDLHKhu4StWgonuWIMEx4fSuvqF
LUc84lJ/JjpGQ6rZkheJ4y3kM5VRUEW3S8i1tneqGaVpkIUyf+ce6UiNBc6h0asxLwOFJuPjGmUd
XIAipGw+LRvP81G393xpI6umvuuvwH35NyJOxhvyQZupS083B9at+SMdJuwMMGU3574XQPy8/pwJ
FjGeEzDOuOvYw24A/0HM6+qNVJ9uzmGanGntr4MgvE0dklDLu3oAm9NKP/UyxSeB4d5uUkxJjvRS
2P+atPUT1QkycqN/nLhBKmGPWMVAzswHShJHPDtIqq6kN9GmOrXIMJfZSdZFNo8I6o0Tq0n9TMDF
Gbj2DhxYZE2YS41SgeAUGTU7naZTJS9LQ9PCE/x8cnymvha7PzfCuH3L0gHYOFGC/txyWmOFZXlo
Wp7wZz+dsuOSUrR0dJeK+iCIuXP/nUCSaeQ2gjjykOq2kU6JEeHZRG56XzwGDnfChPmuUv9YmFed
mDBn2qRPy5AaCWzInnTR1Oc40Sb7N1/M1DGhL+ZkLrZUsrYcDeDxgEF3LYJXUOxRpB8vnwu2tXY7
QixuKemIf/oY72imcOfyFHUMJmTiCQ5M0zwSEkO1dNR2oYZzdwk3/nvQNU2m4ZrmQkHd0fQdOuFx
h81NquTpTC6+YUinuotYXwLh//URhFoFnOH/qXd2h3bdgsUNH7DJV6YvRXWg3J959wtEKU+riY60
ZcwzdMPl1tYpTNkBZFRfxsxrG+hXQHV404cBHEidxscZMLuaY2EYg5BkBcCKYcs2CHRHKZgGsZDM
JndBLYCV5KL0nh1KP285uMkR3V8V4DhYU6R4pC7X6XKuQZBWLkZOIjhOeJBZcAIi6vSmBltaoMbh
v9L82wlknHu9Ceu2z8RR4F5e3F1Du7PQ44Xv8grXufInsc9bcmMC649DUUTdqM1gmmrdwocCeQfo
69/gwFNvTzk8HvAnj4fIT4M1u+5F3DEvwlh1sskt9InA5J3WWEGBC0jkQ1ojGCJIWsVskouFTq9A
GkyQ1cNYCG8yiYajE3dIsnIT8Q/IV2+L5LdL7BVgVYAyGNWTgq4z7SMwxtKBAoBqI04GE9e2i58F
iAkbx6ukwmi6+IUJfB0c7teSaR5KAglVIrznCPVN1OijN1fcN/ihv4G3oZD4RNgniLgnOumVL7T6
vC4nDDQZ5VXO1KnnWFK4qB/FmPSgcUb0eLcsKkdcLgFKOJTiS6fQia7ZI4qQy/gm2RcxFJ8BQNB6
74wHClf3p9iCf1ROdnZJKA0sofEIL6q5+qQ7xvTckyL+wDshtjRxr2yE3y7eckCsLzncec4hc42r
rR246NQ/57Xd1cmhQhZnx+abccF7yrErVKa3iWbSrnq2NFjvABHK35ukUMtHWDdoo08Lom3dWPxQ
q4t2864OnoUlzvOftTSRd3ZEDM5ggst9zrYkofEAQrjodR1Lv2Iqt37a3ciuw6YLx//9qxeDM7lM
5l8EQBeViBpbLJvXKkhC2tpmsHbME2dWSfo/j0yKAPm6X4SNziaeIgJb6QjTzKHl3OmbeijI9ArP
2gf7ec2LfngRWEF+9zryYNB/2N1pqIz0so1uibFcZXBuJRhnZIpsGaTySmPwkCDkA1VmMTG/IJhl
rW5u3xlrxr9pA+5NH84VmFqnsGzv25HUZOEZebpgxMpjXLCOqDDZJOHn0OqftC1Gd1UL3xPZ0XxM
NAFsPmbZEJIlth9oKYValCbjPuLaVSOCnLqsoZwqRurUh7dFKRT6bsufqTelO6ud+E8XetVw7DDO
0mTTOZ5/Ybq223lJWhP6f7fGr143e3W1AAWHEgorNPuFQ4f38VCojZw1dASi3X1PsO3mZk47888v
a1qqR7A+SdG6B9UX85Idym6DEaoZPy/HZasFEprZzUiMgjiRyzZSJGseFOoqeepjAS30ZyQMxMwI
RuYPeGz88hVi9dQh0LFypKQW0y5WwAhwxqnEyUrGiN4YY2PlO0S9qGtGDK4VdagKXyzJ0btz/Lro
VDW4SeIiN5eMqtnNmAlT/r4jR8HUG1dv/QbeaT3h5muywsysMsG0KaiI1zYQ52ZsDIAFcSbiEoos
a42/wTt83Ybxv8m5vlKZrhZtKoyabR6/a40lH+FOsg9bV88Pd92XH68uZ3pTinbxxCa/eDyV3sD6
Pth/ezZDzeCLmahgJW2eJ6nHh8zIQevhPjGgG8TDqGxXJ6U+0MHh75PNfV3fFAB0JaB2sK64YuTb
5QTFcUPomaUixdzAjigKxCk/OvGhBBIRO5tSytfEnCkckuAS85jRje3+MvmFdiAlgQ56mc7l8b48
96YldTJy8I7RkTfnrOtpYB7jfnCwl6oGSwv3xSbuLEmy2D8hfOWOoSA9DrTLkeQL9dxxKtR54H4f
TOSNWA/S1UuohvLsb+5Nsr5z1rJf6SL1H4Oq2fZzyC4UXucaykZ0m93rwM8bfngU8iEMaHHFzbJl
Jpj57d254Nlfi0i1oHWImzbcIzL/WeaeP4u2mbmjtTs/l9tgUc5WTYtFgdR79s2ss02B/yKCAZDQ
mwv2Kp6Hjrz4vSDTOUJK4E10/uAzw0FPOpDpVsB99iK57zsj4rcKq0lQECAwPdCOEScpcSdSZaJb
8Wfj94s29/zEUaTWLAMA9FR5GUV1OwDqREzOPnwXi19NT1pc6/W5GJZQ7mP0l8aSriFcg0CEJR/k
1bDVWfbWSrpo5rwYowCUMivrB5yah4EqIf1M3gBgJUyNwOhDUtCcQS7RdLmGZm4g9mzrSPopIde9
/FHCUy1IzYvPHxI5rEF8oiqHeAzOMM1cHRS/9r6j9/CLcefK3eHSmqcPo4nC06KUyX+vj7JYPBnY
BdjBWglhg/JrJQf7cM6AuEjoJh4Hx3JSqSTd6ofgG2eG8XA7AcdSMN5RPWJf3oQv+NbohV/Ju7i8
FkhxkX5I7ppROzOshrTBiTRj5Q8B5Ra5UpXpbYJn5PORooerhp7iqCOW+7IUrtp6XVj+TRBAp0po
6atA9v1qSW1PcfssH50wMYlH8Te/S9WnByJJoqzzjHDBFZmLk4eBQM3j2Enwb65WXuB8xXQhDGAe
17rEAoCoTfbG21cKjEvM+LB6vIPsE5XdI3qVeNWHruZAJknuwWRep0Nm8S9vru51Q42qz8Y0IidF
xhCesYHyDjv43cl+OpdwakvxNA9jLPhhMpfVrYXqXl5Wqsbi65E6SRolPvFX1YcpaJQbelNkODwh
hImLFWoQz3bXc5BJnUE/m3BN7KbP6/x3mHY5GxPELS0S8/Z2BvDN8+LFngcMaoctkHdqM9X7mZuO
VcWrYNPCNyyw2eyk7mR9NWNui9GxBhop4yMpnbZcHbuI3sMmmB+8lnKUZ7k32PyuiIvfGoYpQgVw
qBYGV3cyLmeQAHkw1AoiUFEYPjWdYNzKPN6alr4FNHSqC35LLtYhJe8Y91+0Q1xxVMHXL14OqA2F
14DLAzkuhC7gf2EZ5VANw5AjpydogBvYO/NpX+MdPiRZhQrOVCpIM+hkzeq1RT6n7of7Jm6yeUmJ
EGnqFNQCcycU/xtACWzN1mbfxiUyemB77BX7bm0ABPp6cBYvu2dNm+6qDUAp1zZRe0OEDJjvr9A/
AN6CBAtxlv0ZTV2AnL6fNhwVaq2dnE96rCtAxlfh5E9yRGs0syD5pGsCPaP+RUq37E+D1QxqGID8
LPZJSjr68K4J2FdXwnpIoCjL1Jxx33jUxDrKusLXzy+CARJDv9oaUe9ixkQcyDLjRPAqnCeXRwO1
YByQEWE6F3cidcm//G9JGfFJfeu+mVtF0ddxIUEKztEtGO9Es1flI3hq2RXZ9ixkCUqsbGIQdrbk
7b1nGbiXQv9eVFX2gBONMhjrI6LwS4hFJlWivy2GLbyAGtVRtZxUAu6yBAAm4ssQKVz1gwzPadYc
f3YSunGDiLaXw6UfQlg94yEmeCka+7rJMYvW0LmhIEASqgg13eviIzL3dxOtDzOKyNkodbEEKSYF
i5jl7g3hvSgsGyW+HdtvCFcle5zyfawWbWUx9wGNvkLhkI6bDdOhe5+6Mh78k/yjohtAXRXYVdjX
9qek01gZoFtxrlKe0mnyFgvPflg0nwr5ZD7KvToYC9OyiKZz9birA9seC6NLmS4AA6Y8P1LGDkw2
Bsdd256SscP/eDFvUnol+uycuoRCjxI67qmnwod9xVI+LOh6HJRbbo36P4TdV6eoEKv5jytS7elk
8Tz5eiWVqE+vE/Tnx6LV/lUmC/kRh9OnKopBW2VHAyluG2v8QTNLcQsGc94pTwfsjNKH7EQZNHxb
xhtHBWSy4jKJQw90Nk7T4AFzF1La3OKC/U5/EicEHneVZop+v5AydE8XEdKwqUNxqFFG0dU6ZdVT
vwZQQZxfqFoDTYQeo1QiFMFBoekOuR/IM9ZJFWMQzigHAHuUjctXsjlxkpkN7tAb9Yh2y1U+x2Rb
0IM0Bh+YY+30pR2MqTYS1ujg5dAdbhxITXveun9I1IxwrRKdoQ7aHxHa3MwCJSO+isQYvbJcrngO
RR7hFSQJmTeRaK1Uq9cxFCDLc6ehWUtY7hgAcw+TSbM7MqKGK2tmKilRunEP2/lUYcRIKx2a86vO
cDLg1UUUhNdF+eB7cb4coWKm0D/U0oi3zQgpy0dyZymTj5rGEo38jndyZozQigd0426OWy8OFqRh
vaM1RmlQPElnC6frXJGXbhhH9VPThh69tdMrx8hvBRt7VmX+B9u2mxOWgHFFpk3yGMsEnd2FA1Ws
jKgcV47NlRh3yfX+jbu6bSiptPkwK26MOWW3ux/bHVQW2ffbJbNX8q4PcJkdBpqP48h46uxTnPTS
4pECfeaCcBdZzT3hK4Moo7BjReBgPHIhIoWzhVPX/cHG2e/1JXn0BTMeWr5DNgPjLgU+5daUi0vx
qt8DUKDT3bzRRQ5RnGYKM1+TuIDtpzhaFWcL7pxVD687AA0D9InnxHwR1V9EItAfOUCbeXihmzgT
x/3+i7L/ge6wcQfWjsnzxpdkqv4hMniWwznLf4eB+IV5olqgtxv9Cupur5Kzq5Exd4dmq3LWamG3
CHY6xt1kd61jGjnIsZKnDuEFdmw96gQS14lEmqFVGEqz2pHosBleajU36oSBbfnl7wIqdq998L1x
ILG/Sa+b0qmnY9J5S+qJwezVcKbTQudSkYgPkMCJPUs4agFiev3tKJV+Vw5u6VtwmbJDBGAWgX+Y
UFf+Mx+uQ6d2Oyo+80EZXwF8XJ3lF6Dje3/6DUKgkTUf950PWscAd4E580IOj8DeSk506P9g73V6
8rmvN7Qf+z9OLlEJPAPjgJSDOYEbGQUKpZxeG/IWF7guuiWXNHiPkW2D/toi22bTUVK1mI36SFU4
GrhWlMOO2VZ8r327Cdbrbrv+oSAqXUWqiOg5xXaKz9nq7IiIxbWc1RMZKluSADkITduMxf0KEqgg
69M8w+JNMKQKdsZZnYNk19msGV0s11QutJJW369OzkcCGuAkig5cbawJtISNJ0xd2tF893l9xmAD
rgVDbw6se9XDF3Hmyu/uDaYb5Q2VlO2vNUemer5wNoCjGFAsfE2giORgCnVVK8EvGIvx42WX3/1q
z0XqwZHZV+NP7BLVGitW+8lq2dmYdkUMvNgS5YgWkGeYIyQGnVq1EeMuJ2zfLu+4N/7R88ag6ZSa
uoZObG5cB11+XFhdTEFv9ihvh1ra11ItEUdZJNuqhWaU1ROBIbYpNaTOm5eJpc/hTKqplM9+72Aw
Xh/8n4IB9HwXl3fLLATrtqCxpGV3FuITskwsL4r+L6RnSQ0lz3GBQOH+bgc1bOcvfd5PxcuTY/Nr
21j0zdxztjtdUWCUoX+JtANp3GMgzOQfUT5G+xA4vfZeM+CMsdxeK+JW7XT0JxO3uoiOKIbvAcqq
xbiU234N+QAypSF/WX29M7V0BgsOvjpT6358E8qMG8iojmzEnOJOJDvQV2bEZjHMfcl0tvzM4/yu
VHVS1B23yJgZc7wupokvdjg47dWXGPiNYWemntppQmyj9iFcdf699nUgT2EaUbb3CtVPKOSIwLs9
blXCfHckqqQmEUUjwxMZldLv18sn/KM5uI4QTOsbcNtT+3kILpSa078s0TR5LSjoYA4ZKScsDOmy
RhsjcQeV3rdBCNGl1wyKcWGTjvTvunoYH2Epb9IbUvwB94Vg8hF0TXrB8Vll8eexAVBYEBYlbkq9
KOKWreORfaM3pp8kpP9WhX8sKHF4LMrtrOg7p/vm3jdA1D9MD4No5kIzhGcxr/fZkaIPfgWvAdWa
qNlw+3vVvIWTennCsSuU6P4jwbMORoDstJx0G0ODtN6iScP1eNcaSWDtkttZ3ulR8yw5l2VXiCJO
nA0a8/nWBAnP02u9kfXlPbnnDv+HRfRR0C7R7nLGrNDGcvOGfSPM3UYSfGHB9qYn+JGMa5hnAYrR
dAN28E4dWbB0KmvOiCmq7zRmKFAlb4lv5peHiopgFvT+N2pSyF3Lo3zn1fBg8vUHxns8uC5GOW11
xVSt63/Lco9+qEC+0LFcllvwW8MCIVQsUC5NhZoJul0bBlNYe8857EMovlrOZq3O7jbK96cMuZhY
6dWWrnb2a/sqbRQ9dHJ1Yp3wnTXgI/ieB/pGqN5ZAppHqDvkZYJKBMQoO8M0DpQI4YJuZm1W+Znm
KJbLXbPoRpcjEniP3KyHKzT/MUAGX+/vIRVuzlZ770NcbNZIje36qgKEHz5Uwsg+5GNa34400jB3
eFq9QS9LXCG84kRMzbyo08fhOBp3wYD2V3DMaHt+l29DuYh6AKhiX3XgoyP+YewoME9sDw57MfgV
PQyW9FIL50m11qbInhe4T9zrJf3EX9wZA73WqTUSPqyPVwnV27+l4O+n9oyTgiA1m1GJU/Ulbzpo
+TnQ9Gd4nz1XuiimDRCEG1GgGL/wzMmje2iPDeuolT5FE8szsQDb69z4AsNm05T6IY3AXV5aFcOM
lF2FXtlgdsPZd5YzwtD3pAOBC8mbgj6iW26Ka9LN+lGwjm0mxscrBnOUrLiuPq7MP4lScaLkgNBW
Z5n9sTwBQdA6X/5QD2XwdL5lrvgVCqt0CVWrKHDCCbHy57lm924NIOBQ5Elxg06gzlu5xCsjX1Sn
o5qOZIk98Q6zMRD9UZbdJfVWbEn4Az2+WLPEelsuWlI4kbJDEc393vNXlc8KbqXbPPfzoDdK0smP
/dec9GvIyGkDSMmbY46IHXmhKTMfiv96C3SwXMWVuTinpM4BJ1SPsJjc+yJlyRlMELnvfLsf/7GK
X/3/DbW67ZBjeSiWKh6eBgIE5xoG39oy92v1sEF2HjdoZl0+45qxVfYh9nQmJmar9HAqClQBlGfg
YaaSB4YZYhmPM1geJubp6ftE4v3UiN8+DXzOSZAC7h5dKPbstjUvCPaykR8DD2g1ngNikTm0f+zP
z+pRCjFUewIvrxVYvkMOa7c3VF9TCJ5OU4m6IR3KOQD/YnocK4ytP/PIpbOCqEsrW5mKxj8SBaAM
XzzJUHHwmOLK/n723Wr7B5FMroybuN5nojbbB7SScnDGBE4lzkP0CHm8KtnCDN3ap9tYHulgXHu7
dS66L5gUc67cT0z7wqzoaaAIQoBc6lAlVu9I9BTDAPRNY2+O3p9b0dMxjIvFeFiumtw8F0+ImezO
+3dl0bgMxfeo9/fUlQh+1xwoLZxMHMN3iPr2ofCrFLJzAmEsSxDbwglWsLrvRpc4pi0RlFpGj1DO
MM2Yo5Xw78N1DltHfMi7xx2x59Br52xNBUpfCQJDhfTU6dOEAE4W4t2FqVvODrRHlpcoaUErCY1N
bD07t8fOYgChekyWVrvXExfN+S5HXx4WpnjH4YN11762OPLY0mpw+t16IDUJwcW5DGFEhXtYA8to
CTC3eHApUO2fH0FxK3zp2HHMZEcR4ofmV523qlBqv4AGtz3mf2sOrSS2CbHZdzSs3jzTv0XpcyIe
Bw0xxBygf2vDGsT/gJESOjgxPWOEsxEHnMJ0NnhMh5ufYD6POxV4Td92Gl+CTMu6PTs5f4rNw3T/
3Uf5PfwvPP58diVZ3t0sx5d8qFbVF4gz56a8IwKpEtwzYx8gV81xdys+cmMnV7E+SzytuVOrqzP2
hkU1JBu8/FiWl9fo0X42TJb1IIbeGLL4tK7ZpA/6j+2lcA0Z004/f4yUucUVAXtdgNCT4eDtmtTk
h73iYyQ0ZfeMdB/xRceO6p+TJrla5jRSVNKzFjxRVSBfYVl8wPWvS90dkPv6HvRg3rP4RlMHz/2v
I/jlu1yUiK+MyfxxQIRKl6ofFyds/u1zmN1CvDA1aCuuAhzof5gl57bSpfCJVCQwWZ7RMKrxU+B+
6zW7sawKHnUAY/h6/66u3IGMq0yXzECuhqbaznDC/DyjZVjaybTxljnS7EIiZvigjmS5t6u4fuWg
xypaXeMlpqofoYv43aIy5rRA3dhTfKcq7S9B6lijsnekdFMe+GP3iV2rtf+AVeBGTUcW+ceRPiE9
CFhJFlTGF0zKhNn0e1iXNeO2HAstOlDfCErfJMTL25v2+DC/zgO1vbL1cR8gX5MVMBXqBq70t1h+
nBd4//jh77EJYYz75TRvtT2NKUpFQt5KS59wdazK3cxpvqKb/Ks12Ravx4oGEdKYV0NEnodDTifF
OhaGk4UPbB+jiHs91s6IjGKXVEQj2/qmlG/cnDkzKvWMeIYrkfCtPPEwna5lDrVBQDyQaRL79K/w
30FNuizXXB5b1UXs6sYcQ/93OMn9WmKzVbntwU8ByJOUjKH96csQjM/72zuzCwGgQVnV9YOMSoHb
/Jn9p/+ERn4dJ19dYiZfnW7s2NaQ3BG3JvTu1GsRvp70sSZ0aAa2/5t5qyKs1jKt0F1pnPpAvXN+
VapRLYv62voA1+Cl+l794lzZ+VZDL9mjdIM3dSPHhagfhAPyMy6BZewq46nN/8waxakobyiQML+i
zmFi5SJSC9o9/GD38KQZuHykrT84z4ad+eP7y3L+5jBX18tYO85udtkooIUqr/UFc1lxPmNTMuZJ
n9s7wTl1SreXoME+1+shHd+dGeY0h0vbC+5bbI605+fX4LBRQxbqOLqh9piZ6Zee0aXvjpexf7Wk
q2VyHOqkqPhrc3nGXGj6nD4/osS2h+WB34hFaH5W//S6ic3oekgUpVErfw5ByFLXzkMH3Lhj8N4w
YjkC6Yk7watJJJ1iO069fIN/swAkHbfjz5M28AVaHv0EfBCbDzv+htNjgKxQ1t9g1NsW8Xf54w7y
3ckkzzDj0V99mFA4d1HfrijqbkZfebQxag/d5bB/Zu4LuYWetVtABwkZzTdlT9eQWIegIxjiNmup
Ul+HHEqkTtdByCNQnYYRmlxS/6bbfcg0Ik4usVOj7JRtVYiPGP0/YmTQN7FSk33XX2yReayK7MpT
d77mw7jy13UTPN6k6DiWK8OVTSboz39ivS59eE4ech/VxEwSSoRCY9h4Kn1yV7o4MSJIGI88W4rk
aKiC5K2MbGUOz5dlI3p0QVWb2Wm7JCVhF8Gw8yBlHIjVgoBTlyNEVFLvMOgYiKf/Lc7U4wGWsIsW
sBX/2z8Mk1aP2YKpedHxGWaT2xl60BcBIK3bgWot9Er5qibwrJO3csyO0OkugekRaibgDWjMr3pR
+HZCteQ5Taf9s+OTzx2mIuol/s7x12/KuWbnXY2mTMEVzAN/qaQK4nlwQK9A+zYIHxhdjMcEVcCP
jox+lGeYKds8mcsOeglJ5W9zeDpO7dRZA5aG/O2X4+wrSQRgr0ZoHSpPZVadloEfvXjCH5oZmyR3
mmX6xDJRK+KcZ8+IlrC8Hlq9O9K0TI1HnVzF3f5nrG7Vc+yBIli9PCWCYpOVp2FQ2FuxGshmRtrt
WYS3kczZLj571eUnpNyeGfVOp8zu/+5fD+oIapgrEB9TWc9gQ2CCMHXtXvdDy6ZlUcCprKtGbf2I
Fu9yZqF3oKKvm+i+6idZOV0rWVUcm/50iCO8m8Cg8CECfKV/SVrjvoz+pFJBcijUVA5DiTu2T5Mv
jzkgP6MJjhBBzA0v/H6a++aS4bBg/F4H6ZrwD7RVSAyKEdn3P0ygFT9hlAX46gCNV5cwTLtPR0ol
EDYRnX/Caj+2k3vttzI3PCiSauX3y+AK4a+nFaup8rmNPbH3iAwhrs9p+iXhgIWUpWc9wLcafzRd
apuK+K4UQi333d6TWc3sxVIPWl1SWwtatA/yfik+n5TJYApYjq8a7+wPmO28EvLNHWcd6aqykOEp
oeCixOzr/zHuWKl5x7BJsDCRE2Rk3rMQkrQF4q0Sp2wQv74RbTbcCQdB41huNVJWGHEVIariMY4t
RRaFCCaS094/fryQmHjbNSfz9wh7jTHTIyBIXjkdBxiUZIG2xIiC0/akiIuArV+QiUAAyLy8ksjv
T4dca1Ml6A2jPKRzf0EdKtq41URAmQ6gKxqtYKoQGuvy6D/klIUawGIBT//6X5Z9yn1EmxGWHgSY
v7MGY9V9/Daoxx1cbr9ELLfxYCczh6kfZ61LgB5ZFkeZH1Z+RXkP+9iutwithV/vFT+BzZTlAVFD
DCFfWoJBVKZeVDL5ks/tF1waz2CrsFrqQ4B36SKiwbi1B1qe5C0nb4BVMOggweiFK5XiLN3bSs21
3st4rWHyVrYgEW5ynwEwT65K1T88LorsvzTzJbPrrlwunOachPPk938YqP9pronDFOGBkh76zmV7
mkMCCjA/MbGHw17Kzeu+wUnLvREE18YEh+Hf19FbUY/5eUyhbw8e1TbAkaKUenOtz7f2nRKmsORw
R3+8mvpE5wOpZgL7HEemE8aO+xQS/q458Hh+XBs+VWm2y+nzx7J/yerRl3pDkMLNsSDRFzE57ssR
NTCxmtLG2DjxH9iT3xol1Tgtt/1/wAUDJMuveBmNj0HGWjyPr5kWvZXyD1UlfBTm3FVbarQXMC8i
WbT9g2Ynm8WB2Z176zELBpAVd0PjxAlB3QxC9eFQ68YcuDPot+VquP7iExmb/YWOuM/t2m38gBRK
5QSMHyxKkE8EyqkC76BovWq7om0JOqkwevZOO26u5pOCBDEHe1fI5rZ55NE9tQI6LTIvjAmnZS9u
sfpk0OdHjdV9uMEBzKd3Dy3zdJ08lqVD2IKE/7x4CfUOXwQ31m8/FDzw1lTrvegBC86vPYI3rWI0
TILq7klrhrpNVkOaz9Ry2+z2s8R+rQKRP3Ay+OUpojlb/aRj9DHWQKmxkIoPQQcLlwG6679xtHZW
afqD6wjGimvpM5iftaQRmQStfmtLhLv6InQO9ezLmI/aFxqEx9ILZ9u+fc0L0azIiR9/2AyM/XAm
aLJzV9Z8qBIZgunDsH2BHTZKH4pvEgGJ4anajaQmVEKJMmDwfKaXLSwOQsi5xPMKwAFrghkrGFxg
SFFdQ3lEBkXNyL4Xigul1Bt+f54AbHJPY4E7K32K1Rmrizms/X1Zn3JdL8S496l0UikBxTIR4O0S
aY9l8iguoOzy3BZJXeAZvbN/pdAyVZgIu6hY+bTtLahRezfhSuHZFGTuwtKX135Pl7DSdR9no60i
ocjog7JIX2QD5qAWbRvr9H1bUxXM3LcWN5qLgsqsq7SnXpxtENZpGGJAHSLJYcBOJ7P9F1VcXNSU
6/RDhrj1lN65dMHMwyfY7SrtuCg+ln/e8ywjV8Vpt/jjaIitD5Rh0VZ0u5YvhgM8b/4+UZ+R5iI2
62zkmSbDZs4Uu9btFw849CGE4TmaJ83G+MOu8bK1YsGY/uoqEf4Y1OVznTVGnyMR2VVl3vkfdxzH
zIBTOMoShVkmV44trEu7CGmLldCkiGcocGhUWzvombRdvHBrFvot0d08bcZTuAUzSEs96exFNKg7
oyUlQD1g4sDQJ+5UJO8MMr5iiKF7RTAsVrYrHOIY5RQ/iPy+5Ukd92s/k4pngB7046oE/dD92gHX
st+HPC84trJWyXYkk5cOo5TV1HmdE4XAAJRwfSSUSgHCQoXh96aqeCOBGDvURlAlO7Ov1QNRzcHN
flkZg6fdw71q/l8/e/PjRfMOKWsv/zeUtf6EUBykiHZH2EmIFakC2/gyBQUVLUDR76tt6f16IdjE
Zte2N1/oWUHPcIPgqi6yU94HnAUmyytI2iV/ARTPHB0+oMPsaVKTFSWo5XKTv1vCVvAx7bikx0KV
3JyDMTfuzQHzKQteYWrlsKN+EQToJIEIGEXk+R+TXvp5A6EmhmnxQiHzQjbXQwJGNuAUtPYuDCvQ
W9K9GhU+1sqmtu7A8Lzq7Byew7GIU6TDD/pmpqy8itsB1XaDlL0CE+3xTSNDOR0VdzHnbMAcS68Y
99tHNnSSltuGbU1bMYvr4tL0WaT+WvqIrY9TSXlmiosTIQYU6fVTT7/YmSMBQ1xCPm6b1PEbCjL/
yzmOyEIRqU5klfdWPPmREN2glBtX9ROahucWVp8k6KNozuw9hBl1u/jLqvmGHtk2HjxXbPj+bgNl
KgpVejTLIIbYSv4RzpGLrD+OD9obkeztvfFHj3OI1NO6tGR2FFdtzVJA76DsjZXlQRKS/gcy8WSU
7p9/Lh3aiFC+OKFT/PApv3SHkw8BuYyx9dBw9gN3BRbWdSN4AjO1u/vnfJDyUdwCtrOzge7xpgkA
R2YEOiJkB9aUa9Bfti8o/E/+NvjIg13w+XnTWoa1krWLo6qFDMA32hgc+SMQiKbvV7UmBQCahBTt
Fg/Z5i54vTvtRPX3bwlekrvS1GhzMSXWNgmeOU+LaML1fuTDt4sxuAgnn+NXZXf1FQIl9g8XKDAg
sxVJDtH5AkteE47c+37uRGVvLryT1Wd3LqaZ02DvUHuHpYuUOWiZKOpmrKintfps2KA/E9ZgBRr5
XydlgwJpMh9q/5xqJn5xRw3ZTPsupwogBMoiER2gQJRTP8lovFgZ/aMeFK1qbVzf91aNpiBKVhqE
Y+QhaKS5BzfbEzJ+yWrZvVaHENnaHy3mgVn8sZwWRACbzl9TBcNPQXjViT1BFGzahJV9tq+mf/gt
E/t+kBXFg9Jr2muwBsuKSuDZpO8jSCyweQjqn/hvvk4wDDGuME+gjY57VPBHYFLsNh3rH5Fm9wqc
KDDdUAIacV44u8iZfYh/q4uqFhC27Z/hESWDgzXzNwSomopOJTTmKAovsc+chkNZVqHCMU+qfE5c
nYhS1eeRER4HDZBC951kpaFugpnB6SfxyetkPAYAF6aoX5xBjasfkX6fMZ6YoYnL4w8MmjoRSirA
I/umRZ0/sgLOpG+K/5GUj8DHgurrSkv5iXosqRo2jfeUK+nsAuyyIbknxqnPXPziFktHtqVDMyca
OM2Qdo0Sc5CD3sU6S3aLZHT4AHthdkcKVlKjyGnj2L8AUhNyDDIejjMBavilRvbREs34uSsN3Fkw
qiiJtkCV33AuEa8eDtqUcrJkOPVwa/6HFR38TfK4wlw1ji8jfgvcx2WNTe09V8iCBeGo/0XjvHHp
MaOeZPTxAxAsflIpvnL/74eMgctkYwUJZ7ezEO6psR//nRhmOyGzDeQqRbxWAynIOBJtfdep5XEY
5L0Pn4tBgMkHYi/PPWCS2fDUbZrV5My28IrBhqzQsIXBbIMZQWoOAE9fzXPtJxdnQauRYC7kq5RG
KAc1kpHL4f/tx3bttuVm2HiiqJflIq3YdE6pX7iQGiSQoxheI/Ie4UZvoz6Trb4fqPKxBxwXqWxv
q+tTqz1OBvaEScJFI8XfhbQ1QYxbS+s4sbruJssaWbwzi2ougkzxVC/GEwO8msCv3oPEyvHgBRMj
uRMiy1sDBONz7oDoyHuebgW6/w9IUt7hWeIiH/nyyF5ZBk0TvDR0LOzLw/NMfWZQrAWw/s8tXfdv
DGfsf/9oKRIO52mQKWMOfCUUrt//vKJnMApU9Bj9UyZQFVOmjzGzWLeDH/kTYAEtAJeJ4OVhtySH
bQ9+XMu+e9HXBV+sUQglRUYOLCt7FB5gOIX6vdyb9fDbsA8nHhuseld8iAHZeE4FCEsgeSeVL0vA
V0PJNfv6LOqt16SfwzgR8TkUtZ7TlHZp+L78Zs8xmcsTCWcn5VP/JYq8+BYD/4QZs/vv/RuAy8Bb
HeZr9tBDfBZGerxlvbVtE8SjGH+2mNayKZbahnmc/06+DmsCiiHbddf1n61Y/KYn3k4s8/YekvOF
tAKXMeLyb0OU66Az4Wex5xwnBjF6ZIZ8vvqCFfn2KoCyDz1bUQbWH1AQOZat8METaGWXiGfEcHdu
+fe4SLZlTbFFr0Oc3Anoiv8TOPE+REA/7nVeQAqOvPj08M6WpV/YINjO6Sy0Z1QPKllbRgKyIInS
rXna9NYQ63392oS8gbRjV4zMuCs7lSV9Vr8Ctrs1iUKos3zmFp1yHE3m2/u5jyZtMmgakXqk7Pbx
whr53VgOl27yR5Q6PUVmdiXuvuLNuvN0cgOkBnYk+50e0baDSYjZ2cSPbvqnuVONtxCzjA8rglRX
Bqqa9lTrmq8RvChE+5AGHH4dm5G36zi+vbkbY/a75m4sExMYhpCCS2JaE+FY8+/AKCLrsiKR+w0N
K4B+uUnhhjA147J7OJc+lMkq7XpAC3If6PAiAaTkSa13U+PWr+HFTc4SbG7Xx0pcSzWBysHRmfi8
MZ+FBa1r7OOf7eBr/MW7q99tDe4PNh/FZ0+k1o64yRd2ZicCmxfKcVLsOe+ttYkmTde2YiaC18CK
40Cnp8IYHolzVToK/3U3ZycL0pXIngFQ2Mf+djD1gDK8XYspGvDLQy1wIV2C0KDswQFgnltiLg1G
BLQckv/D2AS7x16bQ6UyqzLVwhor/GP7LqbsPxzjcl41BHpqZalEjFailLtTvQh7UO64xcVzzGaw
aEy+JEhsQ/ErpHfOWuNQTetQLVpO8QclCdgPEP5hiRHPEwnG6YhvZcAAUlRq2nwI+Ws56HrP4i4p
BF7QpI2bHgfq0z6MbblULWmBy+EXIWcBVegS5oB+r0z6E6MUkC0KV3vVHVWV18C6FS1SdWxoFE3G
mG4VyxvxNVKSJ0xAFziajvRIIo7tffJozE1PNzbDVb5p/2Jmav1PGzldpVJ2/eRtsdTdcZH2SM6U
iIAFDtg6O2hyfeFAOl2jfK9WB9TVfsBTi/f28TyGcmSwH4FVZ9EyT2isELWW9MytQBePG4N8rgPL
0M5U7sxPdotHZrAJ6DEdEGCEM4cfgAU4E/zCiDXqPdjURDd757wVsSMCnfhZ+znPEL/hLaihGWfS
53jVs/4/VT/BFyHicWRsUxt0Kz+nIduEIFFT1dj8Uz14uqSNsSYNjUYTGhRst92YFbu88SS1V1lk
hKEBjBYsnFKvv4wMQlfKEcSetOD1w/8VC89x0JwtJpEt/Yti8SvwCPVXS8ePX9CXFV33kC7oyQv1
DDf9IRqFYUB0MFTYkn+kIXPpBNcXETMVHJLYrkyL/n7oVe2bkXqRTSJCKrzBHYsZn8LnfJnTCb4a
3r3MBz4MSfP2pQR9X3Zg2yidccczPJ43o1DVi4JzqF2pCJ03cLOKSXcHBc+/bqJ60CoF5gM1IR7q
RfZ2dv9CZ9t9U00TWxetDhJwWLT8ulToE4eh7T/AF65lF6rwvNpBHFNz0nkYI5taewMkW/HIkY3e
Dk0t0fovGjxwAoI/0B2uFliRwq+WRtn4yKw7bLJBQxfH+fQdBLMPELEDIYSKhKtNylMaHPMM1S74
pxmJT/SZIh5zIEfCN+Jko1ErutQevlO3j+64bpjOKfdfXcBE8ee6egktsqedJQha+PeQ0yKEfIhv
olOmblWu7T89LHITMcjmgFTv85iZYu3fTosOlVendquL7Tz3gxV5hvcJXyAIUexa2POJBHHVgVnw
QNVwN8rpgUX+Gg7h3d3ndKylTMbcmNzqcUoviuyoXOiQYjopISwNgk5KaOo0dIOGPaEM7bODfqi1
mngWrD3UEIrly9W4RjUgeVGH+fvlhUft45muSkLmtwGgSrLEIc3D8BkYyMDR4JD5UPh2sAlmVSYg
rtI5qVdrinpBLYT9UE5L2FoOQjfvonVgXkd/gimjGlFQrEq7K351SRsBCcbJyzBJ05utloz/Z3jn
AOboKUn5Nz2ZlcUCf61rWBphW/WIGYxinLauzYrgN7bGUcO1P2JKvNwBrqn83xqei2mJ0Xlvp1F4
FabDJ6gtAorYvNNz1n+HuwHI3T6YCYcavhNPrdHdWx6bJLqHKRrk53oirotrQyzHZzI2z/tAUl3k
k1b0agvyLoWOrTn4u4rzelt9zXRWVElD/ooihwhr3ROKDED4nVppIiALw2V2DevTtzzU0zN8dlGL
8q1TaTZbxH819Xno8n1xdMq5hFxmxLBlEuPWyZZKNF6pT5aQ1Vty5c8NKVlUdhKXIQoHlV43mcCz
TcM9s/dTAqqyYXHkusl0W9WqARNrF7lBl6tfPB0Ibqfn/QTIybUW1Yh9nqcFNS3TjVwW3TFiJ+L4
u+ikhl201plLOQ5TUepzdawq07v+rqYkueEu0WodO9AUZ8kr8T3vHNGOHgGroqyFjL0l7xfCmm6p
1mN+NUKKwsX+6npWzjNw4TeM3WtXY7WhLLtxuvxppcMmHGXXLpal/922N3DIjfeDgMh/ryl1qLyu
WEannGJ/TEIrovP7yYWJsmOZ0LNfx/+Ul/Xdvq8iTpEB8rLyzFKf7vWmBJachow/ZRFIM/ad9nP5
1fBEikbjxJ/levO1x8a+RJlq4XppsXa6et1+zf/g/OBYDOIZYsTlwFRd8KC/s+S+/D0sVqZZJLkB
XVrpPPbT48v6XeBAoTgoqYg8EWGdKB+8ptjvcE4N0fbYH/XwypBLw5pZGuI/5eSOVc6jdTHGeJL5
u8o5epK+3hb2M/Yt2rMDt0DwHWspX5tZDCjQp6CJoOqf88py8lrP03/MhbIKx+kQjXb4vX7lPz6t
UYfQFIlJWg25DNGQ32+tPeCueQOuXXB20Oexmvgxk72Gbhd5TTsDd2Uyzd85IdrlO74kd6zD1rR9
RO79xG8GoRhj2Jt/1SWXeE0/WxomxQGw9LrIVMKRyOjLO2+z0KO96IiNbAqqyzi3u7UOcX/x8DdU
CDPKKRV7+97eyiPl+HuqtcjoR4mQiUUnk4t1oymNoH+2FBnzcRMrqTjGwZD8G5qYOvmqvLBmp9uT
bqNYrwCBJGsv3yPVnzJCgJb/tPpgLiucnpTKL2dS52lKr2qNxBmbZFqKr9IrISwCZM/nwnzWnNxd
5OX4hEov5xMkqhqkkhxUwPc2YsPuSS5z8Ao/3oS9ULIC0K6jtJQSZxdx1YfzL/DLBOJpQNRNv79M
ESTJSdhhXe36BzyULowhGcV2ph4ag8GWL6k9lojs9TsmCi4dFYrom3zNjKInn3d9se7O2qP9+jSg
2ykO622hV75WAsxr5VCYnz9LM3JmBVWzATgLrCHPeO7UychcYnpUxa2Q9ZofxwDQUuQx7vhj0Klo
YEh1eZXZkrtzUVPeeAVpsKfi9fwMqaMyFbrFtCPREcMSgTJR5SfMXGTImdlzbWSF2tmyjdh/w92R
PqeOK+Z3leauguWwEVEQPGtjabMndN2BUXhnmAfEpPgWa5K6JCRwsfgiWYLtVRTCm0tLEmd9dORk
PUghcDvNMOzS21VbBDR5LJZkRzdKYHhaCqBjHJI4GLjYcGYsO6AJ3ZuZ53D63lTeNmtCgJWqBGZr
5hpPibnVRwYlJX5FXr0iV5nZcOf0AiWKuztvJUkOQ9sYc7hys2YmUMhg2tP29pEFCuVpmZhukdPo
Msw4To/avXrcjWabmjI16Lm60zM738R5nEXKEU3onHa80RWAoCvP+a1wpZ2VWZaeaNZ3/iCMTha/
7KJrXAluiw0mw2P5bUwETzpPLxLhz1a2li3xw+5F34H5Vcafo4TGgLwPUCs+Do6VDr5863cVm13Q
5Ej6hrku6aCYOeED3hoDaVPoEjGfMpOfaTOleYM3wYs6FVFx2neHiaum9vPgJIWgmOtr3iQJkGsR
eJu4J1k+dwu4sge57fZwY7quw3artTcuDezKHig71kdGLX7PTZmEiW4LjRYBJ6C5wV4IKMuVAxQB
X0n9FuacJw+XfEAIVX5I0Rq4ayI0mbKhZfQAIOWjhbnlERbg63v+76ILxVORj/OOJLDW/30oLvgI
QBqVQqI0wCQROhC5TvPY/XpYA+ws2EfzNGbme4B92NNAz3+64UpaNBfimS5giOLkx9AImSrfouz/
RD7tB/2Cs/61Y9xISEqPCSoxSzoln4D5aUE9VmoREH6IXfSE4iXeYt9K5SYvDqtWcMsugT9XSm7w
dB0FiUZ7zg2gd94r4l4vSfPLeB/fv3J+JW1Qd4DG1e8VS4WF70v4TsKAYBECmAQqs4/NAfAg0wQT
jiKefMODtgDOWRFS4l9FX9GQ7i7B43U1rS5kyA2Sfoo6ewaoL8Uu1q8U7KiuhCSUOFQZbOuInIW0
vkrPTRHxJWpSe7qsKQmHmnVphPbJbkWc87n3l+FZ0DiaseCKa7oWrUU1gaJJNOOTzecQHzXDAQLG
MLAhu5s6fnETdcGj4mvkWEfRI7z71PahT85fDppK8SnA3Sdfu/KV20JsO+8FCt81FiiFi73cPhvG
s54qC/OC+vX2xo6qIBBrgMzlyoggaOd+8YOuTEzBCpEeZ5T24sO/hWg92KpLPOEhr+LoTmo9AO8g
aDwLNP8oz72osHbkRK4Ddd1ZfZINeJYeYTEGiRg94bcNUhdB1v41EdQ0cbVugQtCiFP2kP5llMJi
xMs5RbsGGbD+tPBWYG6eD8kriJfCOXC06soNO7a3/AE5ANS0WTHmThlqhhAIBkeye7QL8rBxyrVT
r8bn+oH9KoRYUxOFyQ7gUINBqGtP4uvOYqAPLf0/dpaUewT37guaXH60GlC7VUb7XbVx11VEud4w
KGGdinbTOkZdVuDV40/6d4Rv32SxoZqKn4oNW6swE7VbSR5yreOJAk4FR9N2TerOlWHFDWFLu3oy
sNe1AlEshSYJUF2oZhi5auuRtspL7raksiCG2GbC27F3WF3CmdaHlhXC8dBlF2VN4FLUQzuTtH4j
l6ERX2s0RUdxG1cBnEQuwlnLI8cp5A3ekmX4ETQypdT80M0gFVl33a7Hm8pBsN6Z2pwf2UD2tQuo
9DvmO0eYoh6l6Zejs7nrBhndEKmW7rhP3CJSdNMnXiDd177njCXYZRXd8wRD/eqIzOpAgEiqGCwq
GfbSWa26N9PLrkwiPGDUNZEEa29WR1oy5oCbAqc8cL5zrgZqYWIfzTYWm8msfisfV5i62SdQTx7f
wcotyRksMTguniUeojofuTqxyDwQ3q6JRdYqOHKmDQRgcTyskqIYlStuRZBdayW8/a+sPJFLTbzN
DRerb9g0f1OFk8QIcDPhH8x1/vbGZc1JrK64s/+S7O3hZSo8puvjGPMoiU8iRbmHpnSUVydvq3QY
WR/4MTDFPR3K3nKofohTBLLZuibvN/yl7Xl5BhN1/9Gf7jd4dH78t2fIHJKyopfEPZ3o6lDeILFB
WKTE5ZkHCDVy+3vqyT88mOKjEl08gqVMUMgfEdtvpQ/LL9sY/DSf4esUdx1rcUhPiiZhNifalT+B
7MT29HkaU0ZW3Zsn9nlSQf0aAkrXcI9loRziZpy+U9sv+70Bw7e9SbLhBh6zoKJQFF1i4u1i8z+w
L6uKdnDDfquNBIy7GcMHIlyLdWVe8B1NhgjhwMIhRoXlqfNwlQMNc3qjLZ+KrzZ4rq9tO5vUEHh7
x2w3NMeIeJAh3NtOE/2f2CifRvukKFVbSAHpt1/eDszx8DfpATRF4++IygjCTwMh+GDk1IwOGD1l
ADoQoC8GRgytQECh7ri7rORxNo0cVuIcwQKG7YkxDWjqNgjNkhc9ORLBSJZEWDhnxYcY/eIctCVf
dLjSbK1D+tpNODiy7Q/uTE3XcwlRt0sOuz7yZYBkANxo1fMfAqHXiWxAo6855BT3w5fLL9Z288Zy
pNgLim/lrcWj27xryDoij39FRrPE7izYaMun/EskWXQzirL5wC+HS9pZI/n69YKxL7kOkBNyGs9L
d3NcK3NxqhtZs+Jdnm2r9U15s89mtx5W10mHQ3MiHKHAI7VjjmtEhJ2OkfRoLKWSCs6OWxn4r56R
f5qDaoCpH5stjStD9ZF4MkCXyCoHc9ZOAKO9vdy+m+Yx0EZKv7PBHN+/zAZNZGJi1mMEGyNAxhKJ
JPaga7IaBpqZU5OztrfbYS3SEHOjPp8ZYillqAH4t215GkzqYz39GzDid/mBsmajBkExOm122pUf
W6DlujFtQUAJBCUNHf2XTfTS/+OqcRgSarginjc8iOYepx0tG7o2jQBfGPPq/QuYmEZq7gurHaH0
o5QXsYmcGe+dB19hFqPsj8qd4QiZ4/fr+W5er7PIW4eR7i5V/SMiiB4gZhqDKlwLiLpEcm3//bPK
ca4pWKwZRc0kUS5m7656H7LbROaiqKMLVbTcRL7El+ZV0HNYJogXmUtXqmYj8dusznJWhM8iv+8t
SGLkQpeoiX5FUIkz9KITUa1h1xuzCgSi2tbAHc0RxB9a3TeRHv6OFMAdVUx8Gi+QUkAK25992hpj
PPvlNF/8dUPt8FFgQ6wcQducbFXrGGvdCQjdhVXTWzRS0IgyafVvMJ9Ku+Scz1VZtP+UnChoUx9v
1R1azBkWt9f+9a2MunZ7CxbHS8lWyzV7rW2P0I3/vXjPrTW15tNBJcarK5+Z4xkmizuVSjIM24xs
OqPugDjK1NnNjWCBAe1BMwX3HRd5s3R5j3Bx/EAVkK7L0pGXTjaL6FX00oFEqWbhhsH9j70yfg3v
s/3atFf8GWYKIYkrucvX1chtW7dJGwxOTCGTe3lTXMeMnXbTGaL5gSjakyx3R0A1Je+PIP5XXbN2
8weVH2k0VgNzdKfXfs3CuOpfxRw/mLD5pCvfO1ol1+/hyzpk40pDaDz8iUmtTZO8koJ4b4AsXz63
EJmNWJsgjzJtJnxtJXuvZ5++Xc+c5PRTCCCISM75bwFebPMJAshUiOdR1zCj3lqRUxOTP/K+pMcf
xQQndD/6A3XPj+Im9zMobDy50c8znnBgAboneW4yVdoVURbLEa4VBCAEze8cEjWXm6ROFBN6yp6l
0hlGrZFh5mNZqKG/k6OD9ptCcxMZsuHry0VL3WTA6DiXFdEQM99/JiLs8m973500Htl6NcyUEu43
3kdq8kUl1/VMnqXHpu9Cjx8N2N9NYperfpF4Ma6WrvkFngkFGvZev0wgeHrkGIv02ChIhD1VWD/i
a3I3iBI9JRME5p53VLCRTPpGXzJ0eTUI/Wj3qxnXO8SkAvDRMjcX2Xh2ZEm3kGQuaVySei7ilItJ
J7RYBJVwIO/0b6Khv+PKarr6kpr9UlP9RESrvENCCbvoy6NLlahNrYtzS7jMRfqzv7M0rTSlLIOQ
rdi+hEXbgUZnpLjQcJtSg1OXFrlGYFC/c+D9FrdbEsAq4OAtQ5dahVc1gmuu+9KtlSRcKpGJncM0
Nu3a6J2jyVkjU9OvkrkCm/sPBnEOIzeFdkYG4rUT7U6dCnsfAX++A+bm4+6khcmdFRfPIpCyHE3P
Zei9ms2wQ2fm+l+dRb8YlS15CkExLgNI9bXs7JUC87y0VzNtqXcIeb4lT8S3KbKBktfKtsfHgyJt
gF32JtBFk9Al7jyGBEFLOlLz/Nh2ZdYa1AlClNB4kLVjmmZ8/jjxEGSdzS0vGGSEh99l+YVHdxiw
Cmghv9eU6+2tgcSr7pJFhjDDcT7TS1fnlJlJm6JodXsYpEuv+TJwm+fBkCv40DZeMd0Pof9gE8KP
M7c58REmoGWthFjbqLXLooEZwuxde36pTWJ/5ygzV2aX8ZRXyHbtQg1c/eJ3cZShtMwT66/5+RR9
ranJM2rJKt836WtRrqufvRA6h50p3p0u2haxaR5mhQu4kcQn/OuHtIXb9WPJT55AUpB9YAdsOHxa
NTm3s3yDZ9ljvyD7t4/9XWDgwK5HjtjaT7iRk0oH+N2G7mqcc4IBbbTu42SCI7FZPH/BFltfRsDq
lQsm+TjaSh/X8i6ZOwbQgY3vgnkqY7Q0ImAK0N+Xnvc1tHUdFVNCjoj8d+PnBlBjUqBO66OZGme6
2eeVGHg+0mBAgzUmTCkQV2LEmySFxI4NRFlys+J6vTnAqFGBNpTkGBlpXCwvyEQMq8D5XL4HOa14
ZzuBh2vPsB1HKyV68ZJJlcGsKAbofB8sHKYJdikL6zouEkC4idqmlqWseBoou0EQj98k6vh0u15B
b5yzVwhHIUMl9uMbvFyWDGMNaMmdnFKlKcKYxFiR/45b9I05U8fuwMzMb/yx3octvJCqC2IWZ/6M
KSTpDzvJ/vm9KXddaOloLkU4CNvgNfmiqMVY0P3X6zAzYgF0k3bNCuRhGQc9/0JY5C+lIToqBUmA
8aailZFDp84tNbjFb3uBq6hojTgnBYc+Gq+FlS65qHQjcvAdPlh+aABN1JSJrGRTom+m+7cWmf9q
Xv8HZcKLg2bjOEmj1p9YgOYL9VuTR68TUEps1VJkrd4zA7vgnvUz9T6fW1fQexKCj9AVsxdpclaB
fWfHD4lBIq7xAKxc1q1oIOPbpbIMhnrEH8kHICZLHTiLt7ikoSHblWnx4AisGt6ojfVZ/t4UTnAp
7hdbbCvHnQ6lNkmUg7bKDT+WkJ2oIFDTwDtbxIkW8cybHCiNpVR+ezAlj1pEpKJzeQlGYYSGja1t
sa4NQgdT3dA4oojSr8K9muaMRkZOvWkgrP7AWwKY/Gk32CyJcgoRHk5LWA3a46BjyEsPSG9M5N0n
+cNWNqhTx2EjaLgBn0sbvgkuAElebmrEIDNV3H4qlGV5eFvtKmh9nwIMZOIPGLrtTLqurMP4z4s9
uTZx3oy2T4J2vlYV0GJ4TcfHUFrFgH0HBt3vNQ+upeU5sfdGW4eMp0XsOCcrp5GA+54uYL5ZLfyH
B1INq+rvXCKD0sNRtUClObMvaAnqT2dt8oE8W9CcueNU61lQ4UKhhPNN2Mdoc2S2fV2vrwuwVUq3
ZB0+wRBxxexBu4cIBuUPs2VZ0QIcMh0v0IAhFsR21X3bcxVo363Uo0bgiMzYgHXuXv+Wd/B/+y4Z
bzjv8Ig7YamKJxiEXSlPMC1PZW+xKeT9vUAMz2JT+WIBGHwViTU3OQuUOWkII2u4AbIqPNlRoeMU
q9ZvlhbNHuwYMPsAeDbqP246YBWVWdsjy44/CU9tOk9OHsIUPnex0b75KIxiw6yRoH2LqWTeMxLE
26/kIJPbJs/B+P+xTlHoDNhkXfaZAkfLznmA0n1DgU/ipx3aKmbOECeV+/ka5jP+z+gNqlyPQsKI
C9YFSjTfrwW3Hw7xzXC8FaulxJNZR32B5Er9HOEKt9opV4QeIMrWyWDN1H+xjqZXv13kBvGEJPCD
pwmdYONlLBZCyxPmG7hoFq9fNYjbHLZuKoRg2u4q0Riknr7wo4PmCiDO9CdN/sHNs+khUjoEK16N
JyCaxJC5MLwMBA7RkF1NhFi61PiTWfhP7xaiUeS4f5/NqKARR/lltd5dFa4xtSxam3Myqy0D+BJq
BTVLxsKpOCpl0ZzMqr+tRMWPAh21pJjulGzLY1KxgXI/YqM/6pcPz+bmy+4Uhgz9k+82shZKMfCV
ee+g6q8zv3+mhCm/RWTTyvaJP0KXpX0uEDhYq8WFb1t7qUCl6DzQQU0yFpKTocIFfBUjFKUcY2Pw
5TYTWwJ5Q253iOCPaSO7F46dBWfcQ9hsx4yd2/m7QvAhHfOKHcNf604s0D79whBiLTydtsFuZ5lx
FsFTVcuZTYuTF+8uwJpDw6nucVwYvviw3J0ZWXlkGed7qM045uvHR+eED3uF/mAoCh68gUcNQ8+h
ofaT7l5GNm7mtiW9w8VTmcSXCjOQwUdWuGkSbC3k6JiHnttV8Iu5OcQiC3vhmYVgZDI3310yr76H
jNQr/lAYmh5a1wI1+g2LI67G7TW1kbtlkrA2oW3E3Iusu8yDlWvBpHYYf8cPQGcIDuvnRay/t2fe
mB4NZ9jr/IQWjB13dOAfDeptrxyUOHud6hYYsmTSQ5l4Ph62uiqUq0NjKHD6yu8kBTm790tjSYSv
nVllYCGF0z5Jm/UerQpw48+8DSgv8nhjRI4SqzcFeUXhky2tdNf2UtksLiM2iSf3qps5ndgguooM
V2C8W3U2bhuqqemW89sFwciJEsDXnqRDhELUg1tmGkXHZJ4jYj5wZwMw8TqV84c72oJbuaOJZGpa
EaxhQRS8hYR4y1qq0BNekwQc5AgSZMSw2rClM4+vklAW4evptMAOXZpqqjNDmRhC/BD4O8sbbGPp
nPCQ0bGT0DxTUWDDXykASWYMElgIISZkVFdkk3mBrp7mtb5BX0PELhHRkoXTowuVLp2ghzoJtBy2
QSD/lGhp0OatHRFVMvxOvCdBZhCxcmr7ksKwNswWFXSn7pu69o2uVZ5fjXV3mjBrs+ul6XhzFX1O
l74e5yONkRP40c2erR+NPTdC/9AEknE1TDHj5t/oX3rMDlYs7zPhKk883ecsLptlXlpAoNHBD61X
ZLfLZ8wMA8/1R54WnLBXHVI+rGcMQCffjexG/yNv8LHcPpuWJ++q6sws+pPHBypQldsHrz7vDgnQ
F0KcS+rb6rha8qeotiUp8Cp7hWppEWsA11LxfWy2F2HOYgcss+PgqHsOIvErCDK8/Dc+kdiL4Gw+
ZLmW/y2JhrorypHbD1tIFob5+igzjowW0THQ3KSG+mfFexIduTn0V8aK100WmLzG4cN35mLyyben
JoTxkvsazG4Y2wIsHcwJCRzxhgP82rZ+xymUItE3+7sfsT1dyM0w2VqyjDox/K0dw+F+8g/Qwf/I
RAuL4I4ormNEbi0n7EAGTOxodRp6GARI+1HSGNWcD9COsUxOGGYdqraANJ0KbYt2IqyCbZFl/lk7
CAX/0MHbxpm/g84yoOpEBhDljjGZnXADFz5YkYwf6J+5sbnVw/quRa0YLe9KisZsOL3t9WfCLe7H
EevImxkIMv2xiMz8V88dxzi7IWwmif8m0eTkYjEr6zZglzNHzTk9Y7tbSbYqdInEVluOzfQSeTfg
LoQzkN8eNwb7Gj6mQxdVm+8T3jdaP83W7YJj3+65k/67UTOqFgqqc4l8ZJt7bHIepoZjj+B1XU3E
3a0N5jS8q/UQMwJJSCPhWk5Vi3L6RzJ0RN84JnJ+fC7ud3MKPX0srBRE5t1ZZtJ9Nr7IzFZRooke
yvb3tGdlZeU/MNIVmSsB6lSqu2aGBZF/sdo4cH4x9oNCqu8CQPmVzll/gN5VO2ycheryVBSe3U/S
kP/1y+/bPqhBlYZ8l1WXWNjrJF88TrH36aqeVjRZVoBPK1MZYKm6yHyQvy7r4Ngr6iOa9aC3qosU
R2caZQelRB/F92Db0YtvQR9HanSCVqcNYqaCdXDgkvXBjC2pML/gajxtqte62JbUAhWbXyHIZhKo
NgVZmdajNIUnC41YsZ79BPKVUqzwPKpp4KzCGjOLf/EqpUQdRswpAX7HOAlRKhjTuSZLtu8duhIP
IghRYqnY/Owesf2+ZGCYSVyomCboFrpdUjn5BkmbNOF7Dvr3f7CXjtNHK54IJgIfhTweFB46sBwo
/YLnOoYLyD0Hmh5GuhUshHZuoBLvATRIlJcjRap3gDv1J6S4Txe1ViwCWA4W2cKuLolLjtCz51te
XHQ8oTR+I4cQUgnhmvwdLYUE3zq4WoVu4pGE9D87ZVBQTvjdo6LikYDMqSgUvSvu83+bmJPWSgcW
rfAwT3spwyu5GzbS+XsqjC++M0qSwnvUStvqvaqWRe4vYxI/kORwX+oeQWcizzUIQaMS9emev16c
5//4Ql2UZWQK/iPgGs+7L1yZprFVi/WmiuUzi4uONPeATtcaRnX+fRuIZg+PSjlhKI6QzFHRdkod
NddFM2k9X0XvuFBqmqXC1+2GTotBuW1hNEmqPRXqw7twgVbmVlpJhKU/NydXJoZaQ8Q8RD/GDFt3
Nh9tTo8XGVZGtboPqfUhdf7qR4w7vCkmiTOR3lHXsw1hmUEJNh/MmHGlji5+dxI/UyL2ZQQFnuwC
FUtCEovGFs0aIoRry0ysu+wXY/Z5GeA6YFRnr5c5+SIpsc78bkeSvzg9ZUCwEZji1/YZgdnrTccc
lzOf3OXKmwO7WLtgF3Mb+jTgLb/PdvCBn/O30i78uPNqMrpNf+CTbvh/PfNV+mEoyY7egQV+gE0a
Bqy3ZKrkqpfuFzI72SGVgOq/3mWuHnLWwq7SFnXX2mlCrNn94itFeGSCKNGwn8FjwDQAM45PXgk/
tCfF58Ddy3pJ0b1LLfLVU61pWZNHamwN40rOpB5NTiFFNlQD+juNU1ywCx5bjXY2F5g2NahZkvWv
FGYtI8jHAPz8fJ9C51WxFapVAdxhoXmT1c3ttRxaBck4hMPCxcx6lbaEhQUe/7lvSOTjUjWVS2Ft
yxe1RDYgHO2B6kpv3wSWiYTqD1LFk4ATFGIWmOfJafrMNjF3I27fqGAz6/q+R61AnT+GSn9IeMHG
lbkwJ3Kb8P8/1BcrhMju50m9UD+bYzSRXBodgYmldKoDfha+6ZIXKocQpeHVNXV/BI47wpuhJZnQ
kyk36pYRgAbyVYnwSnM0Dfu5HEoGaZMik1zc8r5pbds6XegbBgiUiKAHeRxr7h7yxMhRjeyLFYZn
aYrhrRMyws/A7skYgvrY1tjDcfoRh4cx94MVPdOH0h8HX19SuKphIIt1l5E8yjMRDB59MfIoXzyh
aIK7xJfYYsicbyWhHRH2SibfbybTrTO7nta/T7kulPh1qkCEDHWXh9l5mGWKK8ICQh4YNqX06YB9
1zYUSuCwJqOBFTw4WCCB9Jkssk5OKSFlm8ss44YUwmd7+QaH8/8+QYq/ycs4Gj0eL8bS2hQHNYem
2m/McHF4TkrT4hBh+W4hEv1ulVb/fuLhMuFm0EQk6KmyZnDolbw3JFhJkc5F5Hh6iLoy65NCRIKg
c6rx0542yJB2y3HzD/hNHcvJWX1euRS2P9Ki/zCkKG5znMV3bNxrkCeJdOezNDoDF8KyvOXoHSc9
CYtnHJzamHltJnhHT8izNgdxFFP4rRKFmDpEGP9rhqcpvGbXE3OOgZjupJKcnOCs6ByK1WTzDcYu
JCuVDpNlQ+cjdML5/wFb7/ZxFecb4sA3JGtj29cge9onasI6mvdnf0zL02vV1CZ1HN2gWXG/3QEZ
l6pgfvEaJ5KugkWNJxf0xKyxMkAQhaLVF0myVe8BNwYTp/EI0ufJ5i1FuSnZyIOU8AQc/fuHv0eE
ZBs7bRrRGMDykK4sLv+UeFzTkUOEbW8SytsKySFdoRizAY/kvfr0Sn+y7AzbL7FNQeSgLz1lFAZ/
8CAXYyHh8A6iGTVzynWc3wcTnoRxOqnChQpwlj/z2TiGX7kYez2fjq3mM26iMyq8rxQzMhABEGae
uppXr6+4eMiX3FJjzdWDw61DVVGhr7LkE2nR/HH3jy3000RG3bslZUTKK02oi4guIKiSmPmiw8h+
Ef2/wmMhRLsQUdvudiuAuYsQ5B2mCg/Y0rCTD5XTPVwL2vVui21oLUU4Z7Xp76BlbnKPbg5O9ydr
8bV2tZ8yeTtJvSAYP0bL++fniR1IckpftzPGVGTm2f5pcyFJH6GPGsOcT0ES4H35cxnfae0HgKpA
4nRmyzjdjkihyRBv/Bc8jx48TFSn+BXHX9kZ6ZD83d11Gf1KudMzh0iiR9l0Yq/JlDhz4wFYZ8L+
4frcfACO4Jf3GFrnlHL4vPnOOagIm/f5lyWZIAP4/ClOBtnBjX8ToMdNB1w/wR3+04PPUdJoHFVo
U83viixdum3wylI6UB93qDHJMvgQ9YK4Nu09/kRtKSNBTrIOUOEOtsAusGaemD6WUapvt4kw1/fX
ZRamr8zttEwRddXE3xQ/0Tz6m3K3CQrtmWF18DZej+jNg3PBb8SJxbRGo7qGXOyRpM8Y1M+aFCjR
tKGoxRoFd51FvckPWugOCwqlSaZYriaJYCsp9eqn0ZkCJobMXvRjG03fobWmTcdeOQwO5RtQ/rfE
9L+FPXpjWS0aO7nG2nu8uviD5DA3guXE41R55bZ35OQVZPX4BOXiwqSA907CEa0g8RXSw5Zs/ALY
8nD+fw2XBwZfD5nCfMme0MSbSANBehK6PGBFJcOfNAubWC5Gapy7JMqjv3qCor3KiI+iZhDVD0bI
fXDK+Z01z5UcRevZNsJ2qAdj1O5+6FngcOH+MZ3T4MuluWoV5s9QZCVM3mACiHmsF+hCMBNfDTH2
M/zjjH2+yyETCpftyksl69UNuN226UOUM3mvCEqlTZVqMOJkwxwtzwkBzCD0Js1tLpCtJ4guBDB0
BVi6RhE6m+ZPWQljdvMcJEVxCNEdIrQSfEI90v3EzdLGdjKV5i7irh+6OcksX49peZ7JP91LOdey
/f3EVoxPmh45xInudt9E9QHCFnl/VyfSnXhdKjpBLKYlvz1SERoFujpS1z9+ViBocx+pR+N9jyhc
hMQrlYWg6Wb6/T5JA3ZPNrxQKSRLd3qjLjJrN0yDBnovlpJTf+7UJihvcJrZbHdQALkzY4Js6+sz
W2oGYHAVBZn6KdP6kqYkYXXzw5D+btEBPM5SAg3s1x+gXB3Xi2a5xR8mEcUgem7XOPZz7twT18p+
hjxIyARwODAUbGzSsNByRwm1ac9tksw/+XSWjrurdDdw2k1Y3dgfC3pcAkqx0+u+q0FSOqtWUt2Y
zrNGNK82p1cqCfmbNfRGMNYvK8RAfIavaEnhvp4ZXtWOVZwSBzOh6trZNvQnl43NB5g7OTw43Nku
y2nMn/cBYfQkApOofMEtnjp4760kbnsE0WmCEUQUiERb3A2NzEmTEgKJsXN3S1G8UoA9NQNCDDLr
CsQuS9PX/+ne7acvpEmuaRj9OAPXDcFWEblkRZFoKQoDYDhuw6jPmARnzpXTCSZGYtqmv2JuKKKw
yJ6fMhZ9Vnk507uGc7cDIWRLVtbaccSU09t6qNkDNX6CLuFgK4WoUYE+++eFtu+2jFxOg+duzQvk
HnIg1Paofbst6QFH7ooNMqUJjeDIacAGQ0jdT+zL0mm1wnC6iFJCOGmcArYDztW1Y4vii3lby7Qc
GBR1NPIgTyeZLd44VwUzN9n6f9vUi9SlzTJDxlENdgpOrK9dfhun3EvqeWXvcVQJoV5WdVAPW0+C
wb38Sj0KYbBJD7CAfLpDHQuvD0m2oiErmBY5bQuhu17eUpyvzHqCFLcNjgI4kG2+0lvmXYMMdMBY
d5FIO48Foz/jyQ1hwV9qfEL9Ly1u6EymoLy6flo+oeMs9I9zRdUJ21OJV9R0YgHNsO3N6VAKkRiL
iy5HTn9+eUTblSLaIJaB3SAN1s4Rr4a3UmwFdz83hwjdug4geoICSFAq7Hj40sEj2xcHTJ6jtKEH
TlVj0MnisoIsqY1N0qA0ODTSvp8LcaZng+ve4ovZkzaXjN+ujom97Pdxp9ip2AV90x7j4RHcUh36
ZvG7r11ORs6BzUDSTuP4igur7TP5HmATh/QPCzu5B3Gq6jbUcGPeKnfMAVqrrlDgvb7oQoKu3mxX
mlQ3dyo9CBGkqyO2AYarA3T9UxXve22fSH7HNd+vsq1VeNxwPBElBrJG6aawnvBspjjQzP8xJAts
przarCPKNu6UI/T5DFLqFGdf37IT/rJJ9imfWMoyk+Ue4JJ7O3Fux+HxoauDcnxzE5k6Umr942sM
mr2F9RXQl+Z9UBRk/KjIVOVbma9RUP3HClwDVD9KkJYnGm6tC8ciTqrr3rsPx5i1YEnlfdub3BFc
lPnX2dcpOTZ3NgLt3vAyHbBmfdghc0Keu8STyoBIRaBrwUS8ZSUC5sU3GMp9zBJWDrcrlnvpP0PI
7bdzhbSRmL8Q2okd76PlV1zFXRXXbgAuH0AbOQkikhNFpBCGFF2diy7Jlw/9IyOX3c17ZYwARg0W
1kFZBeJ891ZIJOAq7L76W1W2KWMHUxfHgs86m3/Xq0rtnAFsjzPw/mhOV3jvNF+9x70g3JIcC7fm
NESPegXDJvxMwYSbw5fQRkMxyAqTq2E5JhQE7yPs+5LDE6MLG0POD4QD9/QCN/S/y0OuQnL5xy8o
av6ssFmdHLGxdo8QagBy1sirV5OZvZWfnEzo/2eQaSGaESEqPN0qkQfU5XUUwb9Z5Ic1Zp9GKPfE
ljRQ3rQS9Mfg5MrzqjjpTX5fegxcfQuNvIkg8367GfeDYq81lUt4pWZHjE7TLz6g06zU8dEWVL07
FkNuJBNypaNgBC5lwuM737EYuwZMaL/DPwfj+1nhYe+7PPMOkTbl/pkNY0CigKZqWDvK8mhtWY3O
Ur4lUqPbeYyao/OzdnADKPmM0ZXe2zWCc9dMRDMsdpHhla4qSjqmp9FfsadBxIY/iQYkXZLznZMW
WCyIKz4jWkoF/J7QsgqM2GNt429Dk1Rr/JfzTGze+CsJMQqLwlwI80aBiLdPGiUL0Fc6D9STnkjp
TQ1xtFoHla0ergsUrM8zivjzVkkJ8QTQD6Zh3JGm9s3buRGq70HpP1Q08DdpVJt6scks7ejjdYjq
a2z6zgiC57w291qfvtVoFJnY45aHZvDh49q3X4YI5L2wkWCVCbg5N33n17NcauYzmbXVGVRe8e3B
UPSG91FAABXIviKy/uMt7AqjiRhEOamvwK+FoNPJyOPY/ycrziBjy/Yo47U/NKvlFUJlfuLb1hfd
iIrgsz+RvT09oewfH8zhO25exCSGGn89qxOlnIdts1kqG2MC6FVPJRSPBBr47B+SkDuNhFpx3hvU
tG7itJ8dchPUHZfQsYExZrEEA5KFzp8kPrSfVXmCtxwTfZoCZimJR6r9EaRmQmf3ALPy7lBsxXKS
39/p/Bjyb5ozuwOxKvJqWVepbv08xGYYAdhREpoak1h/w9tjv7F8AGdmZZv4R+4V2Xc8giTU2ed4
yERmbobL1MApAPwZYO8gAdES6U9URHL5uNwXV2yuXI9FwhJWz8XrkRFm+psg8JGMNhzcGsnCzhbY
jV0zXrQE/en3vOjj4F2BJA3zunqda+MRnmwMjKEfuU7ZnHrddshZH0xu6TmnJ0mArbYHkedUo19P
i+A0bBkRaGvuEcIUwJqYGT5t1YyPzgrfgG9X8EUN55VhWn6SAry/6mEYMbj2oOSStCgQMY7jCC7f
RhoyKJzvqCjw7V0bR+5xBRn8bSXQ+gyojbNybp4biWzxo6zrmKxl2VFFHTYZvBnCbVTfjjWF72hU
+GSr14hhE+qQ18QBsQDAjjDRsneW/R1XB6ktavLpj54PXjriFxkeI3hjPSeSnBSz2s6hHwEvlNHT
MpUmOTuW3KyUBLfRGsbzl91n2TrxGiYgRwoxRZaNOrY/4GmB1GKzn0CyGchjfGj0LFF4uNgmAOuh
Zx1Mlw2ToDfaHfjclnH+772kQtwIcI1V1gjXj7WX9EQskJHei1Waq2a/Xl6hdX8P5cvmk9i2KXNU
JFqWPdDYOk7daR3z0qBr4b85lb418Kd8eRA2XmIkaXwYbpmx9j3mUYEIo9xSxyknqZBVyUeM56tt
qAkOBS1BBRqowVDW4HggDr2lcILjf84HFQ706uk93h1JyoQ+Y/O8VSHXvaHtSymUNwP8rv7nNzmg
b2z55rs0DdwKLcTE95ECF4GLeUUelaLTIE2+6dIFKVX6aZ7WlTHNQSpHsgJsizSLnOKgFIX1JATo
P3VaiCNp7JewyXf6QtI65TpeOfN37/4Jk/a9MrQ98QPGEOP3pIDQhQfV/T7sfbxRxF5VNKWOyU5U
+PRY6mtYea0jaEZQYpQWSI2x81AcAV9VBBwKmuqrRoMuVus7jvr3K0A6f1vCO4V6wrcY+JM5yX21
LT6Deb9ptr0lYvaAhs4Lzztcz+ZWcUdCsi2DQBxSDe7hAthawFj+VuxgtMRP+3KqYANyP+MEcTjk
VO5xjlhFaInTFK+RIxp/y9pFdKc4mjgHwUPFcQ7kMFyxI0p6l2VNXtc/a6CFOK/p1ERYp3XWZKY1
pJylJDBgisn0yd91vvyAPUVhzhxbsFL/b1OwmwgtiAPu8vLru/LtI3j0s34NarjT1EFmljiy+yGj
RybRQbhEXVTAW2nJsb/H/P3CQXshAUMUd/4loNJrtT4bGqbOrs0uYeZ5rCxEJH2Ooae3+QThPpPt
F62aI4yvJHqAMwdmsMTUX2RtSw60jNquPfDv0tRF9O4L/zd6tgEsqCOM+Nz0H67e0+8L+eeqyDd/
0RRiMaexhEUqhA+iTufxRE5bhp39ydFa+wpe0cYxUFwDOij3K9ubTDyBcVljfQbHkns+dJGMzhPl
8J9RUj+qUq3gTqq2DoeHd/KuGK++2gDtBPL1S9u4Yb33UlAKt/zRXTS43bbrzVvuMh2406Hzqfzo
Ppf2mOi1wyQDstJSucA2GzVFnbdcqugrFtem05CrMK8eDqqe3DL1Zho7NOgq2QdhP2IPABQlX8G9
gZ89Bl5QvwfEKE1TWZmC79HckbGOVKZm34m/RX6q/Jer0uEn5CwIaFswK4BfQLEzqvbm+GFmYatX
iKPS+2QY4eiQNQlK+sa5S4JNLJ8NxDWMWB+m0BGRAsFRYBBiQjHt1VyrTnPIbKKOBuLZDD5Uh1pw
gT4Ky3as8YZZmpamiSdfmfvXDBQnsXazxEjAf7PQUJAUr6Zbpsk2iG41+Gig3qLVy8B1fklvYKP6
z8Isq3v10sXLYqFpiUWMJIdBAaQces9ACUEohhuvAFAdoThmugFMl+T9+/A8XLPEs666u9r3oIuM
6mkSH+fdojSyYZAP0LrpzU/765xRhSI8Od8VMflePNB6ajpjUGn/7Njg/2SYt6YxMWXz7cfM5ilj
SsMUgOCRzwBSL+P6S5UpJ3OEuheL1mfLYht6Pfnl4IQRqoDhzQEoRpJmg/+c4OmeoIhlA0nWlnrT
aq3cqvyJJDu9QEornKgxCzqvef/UPp6pXj5YUwk89+4xWmTgoTykUjWyAWH+bTIykA686GG3YRjs
q7BRp4X6Yl+sZDg6R9BTI6xBCSKW8KTbmePVvT2hCXvkn/wTdD6FUNiSCmSt+RL9AKa/WBx/2TT2
TzjUKf4BHHR0lJSKvKps0fa3mjZy0KE/wMtnGwkvl0ERSD6vdH6NUSmOh48ExaDLTisq52uQ953A
8wW/kk0zVQQi0LJoV86uh0TnjskmpIo93GeYdncTxqd0Jg01Xk6ygfX5eOtUQeSe3RR4b26s4Qyw
leR0LcA6hgGWfMBuWxkyIxAsBCncGCahDT3r4fjiXYupJOGWGNkZCTUw9GjsYe7gFJY6EJLqWLgm
W1/mQo9qqFW9UGISrP4bdfq8gX+4crh1jHkTqPbxYsfmAyO7PgFihGVc2MdPmAvXoOWtztFB6Idw
C3n2xXMvxBYSTiJCZ2eGflFgJAsEma6JlcK0HdqDEkZQv6O8PGjwIEAUswANSLnJaY0CMBnISxER
ZJP7BkqWCOn2pFekf9aYwJ4wnB/QDzPNW8Vi2NCJJzjhGSMnrauTkKV6KXxh/QhDpQtGVQhz+zT9
xsAzEpqBbeJ/yTSI6hf73dMOVC1OnJPJR0LiH4P9eXZHpgv9ProCB6A+psSfLkfmSpTQHriVwYm/
WA8dCvckG6jUpQYEaReicLSQq2DYq4C4Dp1mNUYiqVGUMerIVPL7Dqg47M3t/4K/4htu6SLjuwiR
1JhWjijfYRVWglxjZwSnDji2vCga7pU4ZnZ1HIyTnPOb7H3XD/yrrL5hAIUFTM5IfG+16VRvmidK
ZDn9kl+7IW7NVSvwcNtMUk6ZSf97XyTzLt/uxK8pgKhWZx9efNPzYMNh1vsxocVistEzQm/9rx+7
JV1iDj3BrMwqmIWP31XhXECiFj1VdCb25at01xXfrqKIF78gj18YbOg54n5HZlm1PpPl1pqyf0SE
ecYJLRyb0uD5aFtQdEH0UJVqakBufqnCoWf3FT1iyFmfDkBJ/iE6HOWAjxcPgGNj7pmfhSamocnh
exGczaM6x/+xEkoWJCH9v8OAOM4ErlDZmF108xKJUFXRGLCTltLLNAHQU0v6gU8EWL36tF0/Wd7V
GMu2vgOgv+om7tqxQjAkuXr7K5wIWsXtaDWhg5xTj6c6mTjwOj+kWEPHbcY+03SB3XOQCRLWxPKh
kEb8YlFaWugTr0fOzmJhpRIp+mveA0tr+MzXe3FUDOMuCjc6S48b3P4zN/LYOHxQAu5kfjvIFQh2
ly955DbO1Q4++0WyicsjfT3ejdbGrZ//M23VEMbhMSbZNAO0i/h05svUlXe+VR4buHYYE8Xkhlws
fujKs+d89H9RYZkSIBFXYNBJh3H3VwskJgpkfYoyEDOtbAyCV1eJ9LByoZEECtNOoV8S8c0RkSVj
RUzndsVgA1OWvmiVAZOvFiThGRQGeVzNq5PJ6aLVK96I57CdftVQ/EntCF38WztJ0/7l4EfdNRIf
re7ZS0ZJTnRn+1UFl5kFY0zxkTvbjSpPH/y/rKIIYh1ux6yvpNkE5SnQ7aBkrD6Ubx4UUBlYP7xr
uyQUvc+aujkhSBzdgvq5xg0oPuW3xQ/EIyMLZ8k8pW6dJ9zc69b1sVsvf2FGBEm2ZjTv/IbPGK8i
jQ2wHMiStJTGBCEmFGSs896XpFpEvIzPQ2mvQxMlj2WoJSP/VHua4/+Vv51l+U5dfKhSP2QLD+l7
nB3FHMzLM+9DN03PHJmoahArtfG8IY8Rp+k55IDGMTeMD1WTL2+mUsxe5oBoTPhHTg2m5eRdhK4q
j7IWhsDYQ3XW7SOqPlSAjSgv55oKfiV7ZLmBtU30hE5JEuSfAR5iMu0ey7qGkiVDUHbLUu7/+Lnz
fAybvAePc6b/4O/jpP4hi0qrm0tRykdoYK6HptZ4JnwisRmlLYW33c8UmuDCRZkP97Of2P/K4Ngf
E1krvLriDuEvIqQ082zMnntOMa+Bw66hQ6pLj1adIcv5pKYa2EbDoRDJAd5K4+JUIvuWHYZtvIhY
iv5V82y0sRAzJhKuJ54EeTOdgy/OnSK5Bg5H1fW1R03gta6umzpcSEn1LWRJoRby8Fkw957OhNo3
doW4YHgO48RpSrZX1QbaakoGFS5b2Fa901vaWcbfhr8l6+ck5HmlHTYw0ym2uUfcDQeaFSiAMkAG
NdsrPUUYb7sDpVS8PpKeUr+WwT4IzU+NZA/pWCexpNJA9UiSAt+Q6JylEO+lWu8/SJpJlvdRraGX
sQshu5cnG87k2AaLiVsImJitho3zGhp0P7RKQJgDxthRlkQ8spTr/53x3T+b9Tu5qmWnV0paAtBz
tuh2UdpJ6oGbG1XIntow0UdRZRd7Sw3W4KDcJfhrtXqKKaHTbFr6xxHJr32YVxnb/jbcmb4EB7CJ
BB4dYZCgws5roXB3cIISw9LvtwVZr/iilQv1Uc7XuziMhQHZTzYIkfCRdER9B9KYqHHy1J5l0tbX
EMZdyXkoqoWxyNSfEDk1R7zda+aOiXspmwIwyCd7vWcDsYnQv0HZrcKvn7kS3xKu+1v1LptZjbXv
HDb+lnA1RXBTBPl6iwT526f6/XS7K8JJTwLxFCGPpf2xhcZML5pTqcbOh1DZITMidaZPDw+3vwte
cHEFmF4Xp8pQMTBrEcXAJsfNjoVB/vxtTkHfq6Wpw+45ntNnkG3/BehgWuf0mu78yxZEpMEVm0Mk
aC90LCKFvz/6AemGYT2EIR3NNq2GQAQl03IPnJ1qP+Y1Kstnt37pznvcrKRQJPkfd49FOpL5jW8B
G/0oecqUriwrtrLyoi9MGrinnnGn/mg6ei0AJX30PV1bAwAeNvK+ymP/KArdZeX65Pus+lb5hhW2
xNiCc7kKffp31q5sJ4jekcUUs2Bpp95oauN2f4QAxgbMA4lGfN2u5ic0IxVfeBDadshkqrHBfdxB
UA370oxkLSviHAz/Z3bvOVM4vdkvchbmyoCl8saikC01997U02z0Xu+oaVNRRRY5NO2nozv8TkNF
YnyZy3P5o/bv0U7lPw5tgJ4tcrOv0LOuHdU+g86kC9n0b91EHFJHDpvUaNf2v1JfEeMxE1hxXtL7
kg8ShfBbe60/4qQh5KUsfcuj+gaA8wO7sJ1kEq1YW/J33a3lCCsN6SzD4CsFZL4nDGn2rEQQGXF7
9VHIOlXar+HmKujRAH2610e6PXqxEG8hcKiwHywMj89jg6kB5Tgy0VE2IeiAnlFHRUU3Pbnm/to4
ZvwQb84kcK8spGhY6CePK6A98vj7u1fILaHANdyAxZ8qtWeJmJ5maHmzC1s0xBJ3sgO6Sd9fxsgq
Q5E/
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

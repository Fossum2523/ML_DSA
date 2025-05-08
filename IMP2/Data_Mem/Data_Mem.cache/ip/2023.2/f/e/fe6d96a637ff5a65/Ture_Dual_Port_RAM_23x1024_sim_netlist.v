// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Tue May  6 12:30:41 2025
// Host        : DESKTOP-5RUADSS running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ Ture_Dual_Port_RAM_23x1024_sim_netlist.v
// Design      : Ture_Dual_Port_RAM_23x1024
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k70tfbv676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Ture_Dual_Port_RAM_23x1024,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_7 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 31296)
`pragma protect data_block
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
x/kD
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

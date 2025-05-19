// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Wed May  7 18:26:57 2025
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     5.5875 mW" *) 
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
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 31312)
`pragma protect data_block
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
PvDRrYSvldTNwi+q79xFzLeRZA==
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

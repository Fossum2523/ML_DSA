// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Wed May  7 18:39:47 2025
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
Ohfc
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

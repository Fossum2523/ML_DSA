// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Wed May  7 18:26:14 2025
// Host        : DESKTOP-5RUADSS running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ Ture_Dual_Port_RAM_23x4096_sim_netlist.v
// Design      : Ture_Dual_Port_RAM_23x4096
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k70tfbv676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Ture_Dual_Port_RAM_23x4096,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
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
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [11:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [22:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [22:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [0:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [11:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [22:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [22:0]doutb;

  wire [11:0]addra;
  wire [11:0]addrb;
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
  wire [11:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [11:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [22:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "12" *) 
  (* C_ADDRB_WIDTH = "12" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "3" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     15.159799 mW" *) 
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
  (* C_INIT_FILE = "Ture_Dual_Port_RAM_23x4096.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "2" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "4096" *) 
  (* C_READ_DEPTH_B = "4096" *) 
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
  (* C_WRITE_DEPTH_A = "4096" *) 
  (* C_WRITE_DEPTH_B = "4096" *) 
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
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[11:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[11:0]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 66608)
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

// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Wed May  7 16:43:43 2025
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
tywM
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

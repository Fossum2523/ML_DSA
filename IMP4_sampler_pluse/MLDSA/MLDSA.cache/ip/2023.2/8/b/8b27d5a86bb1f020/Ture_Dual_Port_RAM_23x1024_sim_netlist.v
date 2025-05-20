// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Wed May  7 16:16:53 2025
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
    rsta,
    ena,
    wea,
    addra,
    dina,
    douta,
    clkb,
    rstb,
    enb,
    web,
    addrb,
    dinb,
    doutb,
    rsta_busy,
    rstb_busy);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA RST" *) input rsta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [22:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [22:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB RST" *) input rstb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [0:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [9:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [22:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [22:0]doutb;
  output rsta_busy;
  output rstb_busy;

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
  wire rsta;
  wire rsta_busy;
  wire rstb;
  wire rstb_busy;
  wire [0:0]wea;
  wire [0:0]web;
  wire NLW_U0_dbiterr_UNCONNECTED;
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
  (* C_EN_SAFETY_CKT = "1" *) 
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
  (* C_HAS_RSTA = "1" *) 
  (* C_HAS_RSTB = "1" *) 
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
        .rsta(rsta),
        .rsta_busy(rsta_busy),
        .rstb(rstb),
        .rstb_busy(rstb_busy),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 38240)
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

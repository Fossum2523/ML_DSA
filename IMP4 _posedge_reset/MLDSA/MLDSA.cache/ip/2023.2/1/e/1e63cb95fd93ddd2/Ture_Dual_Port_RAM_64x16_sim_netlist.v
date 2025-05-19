// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Wed May  7 16:23:55 2025
// Host        : DESKTOP-5RUADSS running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ Ture_Dual_Port_RAM_64x16_sim_netlist.v
// Design      : Ture_Dual_Port_RAM_64x16
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k70tfbv676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Ture_Dual_Port_RAM_64x16,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
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
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [3:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [63:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [63:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB RST" *) input rstb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [0:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [3:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [63:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [63:0]doutb;
  output rsta_busy;
  output rstb_busy;

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
  (* C_EN_SAFETY_CKT = "1" *) 
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
  (* C_HAS_RSTA = "1" *) 
  (* C_HAS_RSTB = "1" *) 
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
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[3:0]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 57904)
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

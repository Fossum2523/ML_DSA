// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Wed May  7 18:27:37 2025
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
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [3:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [63:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [63:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [0:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [3:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [63:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [63:0]doutb;

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
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     11.8086 mW" *) 
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
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 48928)
`pragma protect data_block
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
Xl8PJSdYCLgHDtrM2jBHjzIJ5IlhKA==
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

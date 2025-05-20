// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Wed May  7 18:38:58 2025
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     12.523601 mW" *) 
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
SZlAoD+NuhumzHyMnI8SwDpNlKCXdQ==
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

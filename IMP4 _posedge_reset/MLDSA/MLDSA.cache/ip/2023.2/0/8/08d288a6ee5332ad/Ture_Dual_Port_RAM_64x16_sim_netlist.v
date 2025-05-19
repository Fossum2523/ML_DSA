// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Wed May  7 16:45:12 2025
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
WUcLms+BWpP0VeMqfdd/LPlIrsXGWQ==
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

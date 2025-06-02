module MLDSA_AXI_CHIP (
    input               clk,
    input               resetn,

    // AXI4-Lite Slave Interface
    input  wire [31:0]  s_axi_awaddr,//
    input  wire         s_axi_awvalid,//
    output wire         s_axi_awready,//

    input  wire [31:0]  s_axi_wdata,//
    input  wire [3:0]   s_axi_wstrb,//
    input  wire         s_axi_wvalid,//
    output wire         s_axi_wready,//

    output wire [1:0]   s_axi_bresp,//
    output wire         s_axi_bvalid,//
    input  wire         s_axi_bready,//

    input  wire [31:0]  s_axi_araddr,//
    input  wire         s_axi_arvalid,//
    output wire         s_axi_arready,//

    output wire [31:0]  s_axi_rdata,//
    output wire [1:0]   s_axi_rresp,//
    output wire         s_axi_rvalid,//
    input  wire         s_axi_rready,//

    // AXI4-Stream Slave A
    input  wire [63:0]  s_axis_a_tdata,//
    input  wire         s_axis_a_tvalid,//
    input  wire         s_axis_a_tlast,//
    output wire         s_axis_a_tready,//

    // AXI4-Stream Slave B
    input  wire [63:0]  s_axis_b_tdata,//
    input  wire         s_axis_b_tvalid,//
    input  wire         s_axis_b_tlast,//
    output wire         s_axis_b_tready,//

    // AXI4-Stream Master Output
    output wire [63:0]  m_axis_tdata,//
    output wire         m_axis_tvalid,//
    output wire         m_axis_tlast,//
    input  wire         m_axis_tready//
);

// Internal signals
wire            i_clk;
wire            i_resetn;
wire [31:0]     i_s_axi_awaddr;
wire            i_s_axi_awvalid;
wire [31:0]     i_s_axi_wdata;
wire [3:0]      i_s_axi_wstrb;
wire            i_s_axi_wvalid;
wire            i_s_axi_bready;
wire [31:0]     i_s_axi_araddr;
wire            i_s_axi_arvalid;
wire            i_s_axi_rready;
wire [63:0]     i_s_axis_a_tdata;
wire            i_s_axis_a_tvalid;
wire            i_s_axis_a_tlast;
wire [63:0]     i_s_axis_b_tdata;
wire            i_s_axis_b_tvalid;
wire            i_s_axis_b_tlast;
wire            i_m_axis_tready;
wire            i_s_axi_awready;
wire            i_s_axi_wready;
wire [1:0]      i_s_axi_bresp;
wire            i_s_axi_bvalid;
wire            i_s_axi_arready;
wire [31:0]     i_s_axi_rdata;
wire [1:0]      i_s_axi_rresp;
wire            i_s_axi_rvalid;
wire            i_s_axis_a_tready;
wire            i_s_axis_b_tready;
wire [63:0]     i_m_axis_tdata;
wire            i_m_axis_tvalid;
wire            i_m_axis_tlast;

// Input Pad Wrapping
PDIDGZ IPAD_clk (.PAD(clk), .C(i_clk));
PDIDGZ IPAD_resetn (.PAD(resetn), .C(i_resetn));


PDIDGZ IPAD_s_axi_awaddr0 (.PAD(s_axi_awaddr[0]), .C(i_s_axi_awaddr[0]));
PDIDGZ IPAD_s_axi_awaddr1 (.PAD(s_axi_awaddr[1]), .C(i_s_axi_awaddr[1]));
PDIDGZ IPAD_s_axi_awaddr2 (.PAD(s_axi_awaddr[2]), .C(i_s_axi_awaddr[2]));
PDIDGZ IPAD_s_axi_awaddr3 (.PAD(s_axi_awaddr[3]), .C(i_s_axi_awaddr[3]));
PDIDGZ IPAD_s_axi_awaddr4 (.PAD(s_axi_awaddr[4]), .C(i_s_axi_awaddr[4]));
PDIDGZ IPAD_s_axi_awaddr5 (.PAD(s_axi_awaddr[5]), .C(i_s_axi_awaddr[5]));
PDIDGZ IPAD_s_axi_awaddr6 (.PAD(s_axi_awaddr[6]), .C(i_s_axi_awaddr[6]));
PDIDGZ IPAD_s_axi_awaddr7 (.PAD(s_axi_awaddr[7]), .C(i_s_axi_awaddr[7]));
PDIDGZ IPAD_s_axi_awaddr8 (.PAD(s_axi_awaddr[8]), .C(i_s_axi_awaddr[8]));
PDIDGZ IPAD_s_axi_awaddr9 (.PAD(s_axi_awaddr[9]), .C(i_s_axi_awaddr[9]));
PDIDGZ IPAD_s_axi_awaddr10 (.PAD(s_axi_awaddr[10]), .C(i_s_axi_awaddr[10]));
PDIDGZ IPAD_s_axi_awaddr11 (.PAD(s_axi_awaddr[11]), .C(i_s_axi_awaddr[11]));
PDIDGZ IPAD_s_axi_awaddr12 (.PAD(s_axi_awaddr[12]), .C(i_s_axi_awaddr[12]));
PDIDGZ IPAD_s_axi_awaddr13 (.PAD(s_axi_awaddr[13]), .C(i_s_axi_awaddr[13]));
PDIDGZ IPAD_s_axi_awaddr14 (.PAD(s_axi_awaddr[14]), .C(i_s_axi_awaddr[14]));
PDIDGZ IPAD_s_axi_awaddr15 (.PAD(s_axi_awaddr[15]), .C(i_s_axi_awaddr[15]));
PDIDGZ IPAD_s_axi_awaddr16 (.PAD(s_axi_awaddr[16]), .C(i_s_axi_awaddr[16]));
PDIDGZ IPAD_s_axi_awaddr17 (.PAD(s_axi_awaddr[17]), .C(i_s_axi_awaddr[17]));
PDIDGZ IPAD_s_axi_awaddr18 (.PAD(s_axi_awaddr[18]), .C(i_s_axi_awaddr[18]));
PDIDGZ IPAD_s_axi_awaddr19 (.PAD(s_axi_awaddr[19]), .C(i_s_axi_awaddr[19]));
PDIDGZ IPAD_s_axi_awaddr20 (.PAD(s_axi_awaddr[20]), .C(i_s_axi_awaddr[20]));
PDIDGZ IPAD_s_axi_awaddr21 (.PAD(s_axi_awaddr[21]), .C(i_s_axi_awaddr[21]));
PDIDGZ IPAD_s_axi_awaddr22 (.PAD(s_axi_awaddr[22]), .C(i_s_axi_awaddr[22]));
PDIDGZ IPAD_s_axi_awaddr23 (.PAD(s_axi_awaddr[23]), .C(i_s_axi_awaddr[23]));
PDIDGZ IPAD_s_axi_awaddr24 (.PAD(s_axi_awaddr[24]), .C(i_s_axi_awaddr[24]));
PDIDGZ IPAD_s_axi_awaddr25 (.PAD(s_axi_awaddr[25]), .C(i_s_axi_awaddr[25]));
PDIDGZ IPAD_s_axi_awaddr26 (.PAD(s_axi_awaddr[26]), .C(i_s_axi_awaddr[26]));
PDIDGZ IPAD_s_axi_awaddr27 (.PAD(s_axi_awaddr[27]), .C(i_s_axi_awaddr[27]));
PDIDGZ IPAD_s_axi_awaddr28 (.PAD(s_axi_awaddr[28]), .C(i_s_axi_awaddr[28]));
PDIDGZ IPAD_s_axi_awaddr29 (.PAD(s_axi_awaddr[29]), .C(i_s_axi_awaddr[29]));
PDIDGZ IPAD_s_axi_awaddr30 (.PAD(s_axi_awaddr[30]), .C(i_s_axi_awaddr[30]));
PDIDGZ IPAD_s_axi_awaddr31 (.PAD(s_axi_awaddr[31]), .C(i_s_axi_awaddr[31]));

PDIDGZ IPAD_s_axi_awvalid (.PAD(s_axi_awvalid), .C(i_s_axi_awvalid));
PDIDGZ IPAD_s_axi_wdata0 (.PAD(s_axi_wdata[0]), .C(i_s_axi_wdata[0]));
PDIDGZ IPAD_s_axi_wdata1 (.PAD(s_axi_wdata[1]), .C(i_s_axi_wdata[1]));
PDIDGZ IPAD_s_axi_wdata2 (.PAD(s_axi_wdata[2]), .C(i_s_axi_wdata[2]));
PDIDGZ IPAD_s_axi_wdata3 (.PAD(s_axi_wdata[3]), .C(i_s_axi_wdata[3]));
PDIDGZ IPAD_s_axi_wdata4 (.PAD(s_axi_wdata[4]), .C(i_s_axi_wdata[4]));
PDIDGZ IPAD_s_axi_wdata5 (.PAD(s_axi_wdata[5]), .C(i_s_axi_wdata[5]));
PDIDGZ IPAD_s_axi_wdata6 (.PAD(s_axi_wdata[6]), .C(i_s_axi_wdata[6]));
PDIDGZ IPAD_s_axi_wdata7 (.PAD(s_axi_wdata[7]), .C(i_s_axi_wdata[7]));
PDIDGZ IPAD_s_axi_wdata8 (.PAD(s_axi_wdata[8]), .C(i_s_axi_wdata[8]));
PDIDGZ IPAD_s_axi_wdata9 (.PAD(s_axi_wdata[9]), .C(i_s_axi_wdata[9]));
PDIDGZ IPAD_s_axi_wdata10 (.PAD(s_axi_wdata[10]), .C(i_s_axi_wdata[10]));
PDIDGZ IPAD_s_axi_wdata11 (.PAD(s_axi_wdata[11]), .C(i_s_axi_wdata[11]));
PDIDGZ IPAD_s_axi_wdata12 (.PAD(s_axi_wdata[12]), .C(i_s_axi_wdata[12]));
PDIDGZ IPAD_s_axi_wdata13 (.PAD(s_axi_wdata[13]), .C(i_s_axi_wdata[13]));
PDIDGZ IPAD_s_axi_wdata14 (.PAD(s_axi_wdata[14]), .C(i_s_axi_wdata[14]));
PDIDGZ IPAD_s_axi_wdata15 (.PAD(s_axi_wdata[15]), .C(i_s_axi_wdata[15]));
PDIDGZ IPAD_s_axi_wdata16 (.PAD(s_axi_wdata[16]), .C(i_s_axi_wdata[16]));
PDIDGZ IPAD_s_axi_wdata17 (.PAD(s_axi_wdata[17]), .C(i_s_axi_wdata[17]));
PDIDGZ IPAD_s_axi_wdata18 (.PAD(s_axi_wdata[18]), .C(i_s_axi_wdata[18]));
PDIDGZ IPAD_s_axi_wdata19 (.PAD(s_axi_wdata[19]), .C(i_s_axi_wdata[19]));
PDIDGZ IPAD_s_axi_wdata20 (.PAD(s_axi_wdata[20]), .C(i_s_axi_wdata[20]));
PDIDGZ IPAD_s_axi_wdata21 (.PAD(s_axi_wdata[21]), .C(i_s_axi_wdata[21]));
PDIDGZ IPAD_s_axi_wdata22 (.PAD(s_axi_wdata[22]), .C(i_s_axi_wdata[22]));
PDIDGZ IPAD_s_axi_wdata23 (.PAD(s_axi_wdata[23]), .C(i_s_axi_wdata[23]));
PDIDGZ IPAD_s_axi_wdata24 (.PAD(s_axi_wdata[24]), .C(i_s_axi_wdata[24]));
PDIDGZ IPAD_s_axi_wdata25 (.PAD(s_axi_wdata[25]), .C(i_s_axi_wdata[25]));
PDIDGZ IPAD_s_axi_wdata26 (.PAD(s_axi_wdata[26]), .C(i_s_axi_wdata[26]));
PDIDGZ IPAD_s_axi_wdata27 (.PAD(s_axi_wdata[27]), .C(i_s_axi_wdata[27]));
PDIDGZ IPAD_s_axi_wdata28 (.PAD(s_axi_wdata[28]), .C(i_s_axi_wdata[28]));
PDIDGZ IPAD_s_axi_wdata29 (.PAD(s_axi_wdata[29]), .C(i_s_axi_wdata[29]));
PDIDGZ IPAD_s_axi_wdata30 (.PAD(s_axi_wdata[30]), .C(i_s_axi_wdata[30]));
PDIDGZ IPAD_s_axi_wdata31 (.PAD(s_axi_wdata[31]), .C(i_s_axi_wdata[31]));

PDIDGZ IPAD_s_axi_wstrb0 (.PAD(s_axi_wstrb[0]), .C(i_s_axi_wstrb[0]));
PDIDGZ IPAD_s_axi_wstrb1 (.PAD(s_axi_wstrb[1]), .C(i_s_axi_wstrb[1]));
PDIDGZ IPAD_s_axi_wstrb2 (.PAD(s_axi_wstrb[2]), .C(i_s_axi_wstrb[2]));
PDIDGZ IPAD_s_axi_wstrb3 (.PAD(s_axi_wstrb[3]), .C(i_s_axi_wstrb[3]));

PDIDGZ IPAD_s_axi_wvalid (.PAD(s_axi_wvalid), .C(i_s_axi_wvalid));
PDIDGZ IPAD_s_axi_bready (.PAD(s_axi_bready), .C(i_s_axi_bready));

PDIDGZ IPAD_s_axi_araddr0 (.PAD(s_axi_araddr[0]), .C(i_s_axi_araddr[0]));
PDIDGZ IPAD_s_axi_araddr1 (.PAD(s_axi_araddr[1]), .C(i_s_axi_araddr[1]));
PDIDGZ IPAD_s_axi_araddr2 (.PAD(s_axi_araddr[2]), .C(i_s_axi_araddr[2]));
PDIDGZ IPAD_s_axi_araddr3 (.PAD(s_axi_araddr[3]), .C(i_s_axi_araddr[3]));
PDIDGZ IPAD_s_axi_araddr4 (.PAD(s_axi_araddr[4]), .C(i_s_axi_araddr[4]));
PDIDGZ IPAD_s_axi_araddr5 (.PAD(s_axi_araddr[5]), .C(i_s_axi_araddr[5]));
PDIDGZ IPAD_s_axi_araddr6 (.PAD(s_axi_araddr[6]), .C(i_s_axi_araddr[6]));
PDIDGZ IPAD_s_axi_araddr7 (.PAD(s_axi_araddr[7]), .C(i_s_axi_araddr[7]));
PDIDGZ IPAD_s_axi_araddr8 (.PAD(s_axi_araddr[8]), .C(i_s_axi_araddr[8]));
PDIDGZ IPAD_s_axi_araddr9 (.PAD(s_axi_araddr[9]), .C(i_s_axi_araddr[9]));
PDIDGZ IPAD_s_axi_araddr10 (.PAD(s_axi_araddr[10]), .C(i_s_axi_araddr[10]));
PDIDGZ IPAD_s_axi_araddr11 (.PAD(s_axi_araddr[11]), .C(i_s_axi_araddr[11]));
PDIDGZ IPAD_s_axi_araddr12 (.PAD(s_axi_araddr[12]), .C(i_s_axi_araddr[12]));
PDIDGZ IPAD_s_axi_araddr13 (.PAD(s_axi_araddr[13]), .C(i_s_axi_araddr[13]));
PDIDGZ IPAD_s_axi_araddr14 (.PAD(s_axi_araddr[14]), .C(i_s_axi_araddr[14]));
PDIDGZ IPAD_s_axi_araddr15 (.PAD(s_axi_araddr[15]), .C(i_s_axi_araddr[15]));
PDIDGZ IPAD_s_axi_araddr16 (.PAD(s_axi_araddr[16]), .C(i_s_axi_araddr[16]));
PDIDGZ IPAD_s_axi_araddr17 (.PAD(s_axi_araddr[17]), .C(i_s_axi_araddr[17]));
PDIDGZ IPAD_s_axi_araddr18 (.PAD(s_axi_araddr[18]), .C(i_s_axi_araddr[18]));
PDIDGZ IPAD_s_axi_araddr19 (.PAD(s_axi_araddr[19]), .C(i_s_axi_araddr[19]));
PDIDGZ IPAD_s_axi_araddr20 (.PAD(s_axi_araddr[20]), .C(i_s_axi_araddr[20]));
PDIDGZ IPAD_s_axi_araddr21 (.PAD(s_axi_araddr[21]), .C(i_s_axi_araddr[21]));
PDIDGZ IPAD_s_axi_araddr22 (.PAD(s_axi_araddr[22]), .C(i_s_axi_araddr[22]));
PDIDGZ IPAD_s_axi_araddr23 (.PAD(s_axi_araddr[23]), .C(i_s_axi_araddr[23]));
PDIDGZ IPAD_s_axi_araddr24 (.PAD(s_axi_araddr[24]), .C(i_s_axi_araddr[24]));
PDIDGZ IPAD_s_axi_araddr25 (.PAD(s_axi_araddr[25]), .C(i_s_axi_araddr[25]));
PDIDGZ IPAD_s_axi_araddr26 (.PAD(s_axi_araddr[26]), .C(i_s_axi_araddr[26]));
PDIDGZ IPAD_s_axi_araddr27 (.PAD(s_axi_araddr[27]), .C(i_s_axi_araddr[27]));
PDIDGZ IPAD_s_axi_araddr28 (.PAD(s_axi_araddr[28]), .C(i_s_axi_araddr[28]));
PDIDGZ IPAD_s_axi_araddr29 (.PAD(s_axi_araddr[29]), .C(i_s_axi_araddr[29]));
PDIDGZ IPAD_s_axi_araddr30 (.PAD(s_axi_araddr[30]), .C(i_s_axi_araddr[30])); 
PDIDGZ IPAD_s_axi_araddr31 (.PAD(s_axi_araddr[31]), .C(i_s_axi_araddr[31])); 


PDIDGZ IPAD_s_axi_arvalid (.PAD(s_axi_arvalid), .C(i_s_axi_arvalid));
PDIDGZ IPAD_s_axi_rready (.PAD(s_axi_rready), .C(i_s_axi_rready));

PDIDGZ IPAD_s_axis_a_tdata0 (.PAD(s_axis_a_tdata[0]), .C(i_s_axis_a_tdata[0]));
PDIDGZ IPAD_s_axis_a_tdata1 (.PAD(s_axis_a_tdata[1]), .C(i_s_axis_a_tdata[1]));
PDIDGZ IPAD_s_axis_a_tdata2 (.PAD(s_axis_a_tdata[2]), .C(i_s_axis_a_tdata[2]));
PDIDGZ IPAD_s_axis_a_tdata3 (.PAD(s_axis_a_tdata[3]), .C(i_s_axis_a_tdata[3]));
PDIDGZ IPAD_s_axis_a_tdata4 (.PAD(s_axis_a_tdata[4]), .C(i_s_axis_a_tdata[4]));
PDIDGZ IPAD_s_axis_a_tdata5 (.PAD(s_axis_a_tdata[5]), .C(i_s_axis_a_tdata[5]));
PDIDGZ IPAD_s_axis_a_tdata6 (.PAD(s_axis_a_tdata[6]), .C(i_s_axis_a_tdata[6]));
PDIDGZ IPAD_s_axis_a_tdata7 (.PAD(s_axis_a_tdata[7]), .C(i_s_axis_a_tdata[7]));
PDIDGZ IPAD_s_axis_a_tdata8 (.PAD(s_axis_a_tdata[8]), .C(i_s_axis_a_tdata[8]));
PDIDGZ IPAD_s_axis_a_tdata9 (.PAD(s_axis_a_tdata[9]), .C(i_s_axis_a_tdata[9]));
PDIDGZ IPAD_s_axis_a_tdata10 (.PAD(s_axis_a_tdata[10]), .C(i_s_axis_a_tdata[10]));
PDIDGZ IPAD_s_axis_a_tdata11 (.PAD(s_axis_a_tdata[11]), .C(i_s_axis_a_tdata[11]));
PDIDGZ IPAD_s_axis_a_tdata12 (.PAD(s_axis_a_tdata[12]), .C(i_s_axis_a_tdata[12]));
PDIDGZ IPAD_s_axis_a_tdata13 (.PAD(s_axis_a_tdata[13]), .C(i_s_axis_a_tdata[13]));
PDIDGZ IPAD_s_axis_a_tdata14 (.PAD(s_axis_a_tdata[14]), .C(i_s_axis_a_tdata[14]));
PDIDGZ IPAD_s_axis_a_tdata15 (.PAD(s_axis_a_tdata[15]), .C(i_s_axis_a_tdata[15]));
PDIDGZ IPAD_s_axis_a_tdata16 (.PAD(s_axis_a_tdata[16]), .C(i_s_axis_a_tdata[16]));
PDIDGZ IPAD_s_axis_a_tdata17 (.PAD(s_axis_a_tdata[17]), .C(i_s_axis_a_tdata[17]));
PDIDGZ IPAD_s_axis_a_tdata18 (.PAD(s_axis_a_tdata[18]), .C(i_s_axis_a_tdata[18]));
PDIDGZ IPAD_s_axis_a_tdata19 (.PAD(s_axis_a_tdata[19]), .C(i_s_axis_a_tdata[19]));
PDIDGZ IPAD_s_axis_a_tdata20 (.PAD(s_axis_a_tdata[20]), .C(i_s_axis_a_tdata[20]));
PDIDGZ IPAD_s_axis_a_tdata21 (.PAD(s_axis_a_tdata[21]), .C(i_s_axis_a_tdata[21]));
PDIDGZ IPAD_s_axis_a_tdata22 (.PAD(s_axis_a_tdata[22]), .C(i_s_axis_a_tdata[22]));
PDIDGZ IPAD_s_axis_a_tdata23 (.PAD(s_axis_a_tdata[23]), .C(i_s_axis_a_tdata[23]));
PDIDGZ IPAD_s_axis_a_tdata24 (.PAD(s_axis_a_tdata[24]), .C(i_s_axis_a_tdata[24]));
PDIDGZ IPAD_s_axis_a_tdata25 (.PAD(s_axis_a_tdata[25]), .C(i_s_axis_a_tdata[25]));
PDIDGZ IPAD_s_axis_a_tdata26 (.PAD(s_axis_a_tdata[26]), .C(i_s_axis_a_tdata[26]));
PDIDGZ IPAD_s_axis_a_tdata27 (.PAD(s_axis_a_tdata[27]), .C(i_s_axis_a_tdata[27]));
PDIDGZ IPAD_s_axis_a_tdata28 (.PAD(s_axis_a_tdata[28]), .C(i_s_axis_a_tdata[28]));
PDIDGZ IPAD_s_axis_a_tdata29 (.PAD(s_axis_a_tdata[29]), .C(i_s_axis_a_tdata[29]));
PDIDGZ IPAD_s_axis_a_tdata30 (.PAD(s_axis_a_tdata[30]), .C(i_s_axis_a_tdata[30]));
PDIDGZ IPAD_s_axis_a_tdata31 (.PAD(s_axis_a_tdata[31]), .C(i_s_axis_a_tdata[31]));
PDIDGZ IPAD_s_axis_a_tdata32 (.PAD(s_axis_a_tdata[32]), .C(i_s_axis_a_tdata[32]));
PDIDGZ IPAD_s_axis_a_tdata33 (.PAD(s_axis_a_tdata[33]), .C(i_s_axis_a_tdata[33]));
PDIDGZ IPAD_s_axis_a_tdata34 (.PAD(s_axis_a_tdata[34]), .C(i_s_axis_a_tdata[34]));
PDIDGZ IPAD_s_axis_a_tdata35 (.PAD(s_axis_a_tdata[35]), .C(i_s_axis_a_tdata[35]));
PDIDGZ IPAD_s_axis_a_tdata36 (.PAD(s_axis_a_tdata[36]), .C(i_s_axis_a_tdata[36]));
PDIDGZ IPAD_s_axis_a_tdata37 (.PAD(s_axis_a_tdata[37]), .C(i_s_axis_a_tdata[37]));
PDIDGZ IPAD_s_axis_a_tdata38 (.PAD(s_axis_a_tdata[38]), .C(i_s_axis_a_tdata[38]));
PDIDGZ IPAD_s_axis_a_tdata39 (.PAD(s_axis_a_tdata[39]), .C(i_s_axis_a_tdata[39]));
PDIDGZ IPAD_s_axis_a_tdata40 (.PAD(s_axis_a_tdata[40]), .C(i_s_axis_a_tdata[40]));
PDIDGZ IPAD_s_axis_a_tdata41 (.PAD(s_axis_a_tdata[41]), .C(i_s_axis_a_tdata[41]));
PDIDGZ IPAD_s_axis_a_tdata42 (.PAD(s_axis_a_tdata[42]), .C(i_s_axis_a_tdata[42]));
PDIDGZ IPAD_s_axis_a_tdata43 (.PAD(s_axis_a_tdata[43]), .C(i_s_axis_a_tdata[43]));
PDIDGZ IPAD_s_axis_a_tdata44 (.PAD(s_axis_a_tdata[44]), .C(i_s_axis_a_tdata[44]));
PDIDGZ IPAD_s_axis_a_tdata45 (.PAD(s_axis_a_tdata[45]), .C(i_s_axis_a_tdata[45]));
PDIDGZ IPAD_s_axis_a_tdata46 (.PAD(s_axis_a_tdata[46]), .C(i_s_axis_a_tdata[46]));
PDIDGZ IPAD_s_axis_a_tdata47 (.PAD(s_axis_a_tdata[47]), .C(i_s_axis_a_tdata[47]));
PDIDGZ IPAD_s_axis_a_tdata48 (.PAD(s_axis_a_tdata[48]), .C(i_s_axis_a_tdata[48]));
PDIDGZ IPAD_s_axis_a_tdata49 (.PAD(s_axis_a_tdata[49]), .C(i_s_axis_a_tdata[49]));
PDIDGZ IPAD_s_axis_a_tdata50 (.PAD(s_axis_a_tdata[50]), .C(i_s_axis_a_tdata[50]));
PDIDGZ IPAD_s_axis_a_tdata51 (.PAD(s_axis_a_tdata[51]), .C(i_s_axis_a_tdata[51]));
PDIDGZ IPAD_s_axis_a_tdata52 (.PAD(s_axis_a_tdata[52]), .C(i_s_axis_a_tdata[52]));
PDIDGZ IPAD_s_axis_a_tdata53 (.PAD(s_axis_a_tdata[53]), .C(i_s_axis_a_tdata[53]));
PDIDGZ IPAD_s_axis_a_tdata54 (.PAD(s_axis_a_tdata[54]), .C(i_s_axis_a_tdata[54]));
PDIDGZ IPAD_s_axis_a_tdata55 (.PAD(s_axis_a_tdata[55]), .C(i_s_axis_a_tdata[55]));
PDIDGZ IPAD_s_axis_a_tdata56 (.PAD(s_axis_a_tdata[56]), .C(i_s_axis_a_tdata[56]));
PDIDGZ IPAD_s_axis_a_tdata57 (.PAD(s_axis_a_tdata[57]), .C(i_s_axis_a_tdata[57]));
PDIDGZ IPAD_s_axis_a_tdata58 (.PAD(s_axis_a_tdata[58]), .C(i_s_axis_a_tdata[58]));
PDIDGZ IPAD_s_axis_a_tdata59 (.PAD(s_axis_a_tdata[59]), .C(i_s_axis_a_tdata[59]));
PDIDGZ IPAD_s_axis_a_tdata60 (.PAD(s_axis_a_tdata[60]), .C(i_s_axis_a_tdata[60]));
PDIDGZ IPAD_s_axis_a_tdata61 (.PAD(s_axis_a_tdata[61]), .C(i_s_axis_a_tdata[61]));
PDIDGZ IPAD_s_axis_a_tdata62 (.PAD(s_axis_a_tdata[62]), .C(i_s_axis_a_tdata[62]));
PDIDGZ IPAD_s_axis_a_tdata63 (.PAD(s_axis_a_tdata[63]), .C(i_s_axis_a_tdata[63]));
PDIDGZ IPAD_s_axis_a_tvalid (.PAD(s_axis_a_tvalid), .C(i_s_axis_a_tvalid));
PDIDGZ IPAD_s_axis_a_tlast (.PAD(s_axis_a_tlast), .C(i_s_axis_a_tlast));
PDIDGZ IPAD_s_axis_b_tdata0 (.PAD(s_axis_b_tdata[0]), .C(i_s_axis_b_tdata[0]));
PDIDGZ IPAD_s_axis_b_tdata1 (.PAD(s_axis_b_tdata[1]), .C(i_s_axis_b_tdata[1]));
PDIDGZ IPAD_s_axis_b_tdata2 (.PAD(s_axis_b_tdata[2]), .C(i_s_axis_b_tdata[2]));
PDIDGZ IPAD_s_axis_b_tdata3 (.PAD(s_axis_b_tdata[3]), .C(i_s_axis_b_tdata[3]));
PDIDGZ IPAD_s_axis_b_tdata4 (.PAD(s_axis_b_tdata[4]), .C(i_s_axis_b_tdata[4]));
PDIDGZ IPAD_s_axis_b_tdata5 (.PAD(s_axis_b_tdata[5]), .C(i_s_axis_b_tdata[5]));
PDIDGZ IPAD_s_axis_b_tdata6 (.PAD(s_axis_b_tdata[6]), .C(i_s_axis_b_tdata[6]));
PDIDGZ IPAD_s_axis_b_tdata7 (.PAD(s_axis_b_tdata[7]), .C(i_s_axis_b_tdata[7]));
PDIDGZ IPAD_s_axis_b_tdata8 (.PAD(s_axis_b_tdata[8]), .C(i_s_axis_b_tdata[8]));
PDIDGZ IPAD_s_axis_b_tdata9 (.PAD(s_axis_b_tdata[9]), .C(i_s_axis_b_tdata[9]));
PDIDGZ IPAD_s_axis_b_tdata10 (.PAD(s_axis_b_tdata[10]), .C(i_s_axis_b_tdata[10]));
PDIDGZ IPAD_s_axis_b_tdata11 (.PAD(s_axis_b_tdata[11]), .C(i_s_axis_b_tdata[11]));
PDIDGZ IPAD_s_axis_b_tdata12 (.PAD(s_axis_b_tdata[12]), .C(i_s_axis_b_tdata[12]));
PDIDGZ IPAD_s_axis_b_tdata13 (.PAD(s_axis_b_tdata[13]), .C(i_s_axis_b_tdata[13]));
PDIDGZ IPAD_s_axis_b_tdata14 (.PAD(s_axis_b_tdata[14]), .C(i_s_axis_b_tdata[14]));
PDIDGZ IPAD_s_axis_b_tdata15 (.PAD(s_axis_b_tdata[15]), .C(i_s_axis_b_tdata[15]));
PDIDGZ IPAD_s_axis_b_tdata16 (.PAD(s_axis_b_tdata[16]), .C(i_s_axis_b_tdata[16]));
PDIDGZ IPAD_s_axis_b_tdata17 (.PAD(s_axis_b_tdata[17]), .C(i_s_axis_b_tdata[17]));
PDIDGZ IPAD_s_axis_b_tdata18 (.PAD(s_axis_b_tdata[18]), .C(i_s_axis_b_tdata[18]));
PDIDGZ IPAD_s_axis_b_tdata19 (.PAD(s_axis_b_tdata[19]), .C(i_s_axis_b_tdata[19]));
PDIDGZ IPAD_s_axis_b_tdata20 (.PAD(s_axis_b_tdata[20]), .C(i_s_axis_b_tdata[20]));
PDIDGZ IPAD_s_axis_b_tdata21 (.PAD(s_axis_b_tdata[21]), .C(i_s_axis_b_tdata[21]));
PDIDGZ IPAD_s_axis_b_tdata22 (.PAD(s_axis_b_tdata[22]), .C(i_s_axis_b_tdata[22]));
PDIDGZ IPAD_s_axis_b_tdata23 (.PAD(s_axis_b_tdata[23]), .C(i_s_axis_b_tdata[23]));
PDIDGZ IPAD_s_axis_b_tdata24 (.PAD(s_axis_b_tdata[24]), .C(i_s_axis_b_tdata[24]));
PDIDGZ IPAD_s_axis_b_tdata25 (.PAD(s_axis_b_tdata[25]), .C(i_s_axis_b_tdata[25]));
PDIDGZ IPAD_s_axis_b_tdata26 (.PAD(s_axis_b_tdata[26]), .C(i_s_axis_b_tdata[26]));
PDIDGZ IPAD_s_axis_b_tdata27 (.PAD(s_axis_b_tdata[27]), .C(i_s_axis_b_tdata[27]));
PDIDGZ IPAD_s_axis_b_tdata28 (.PAD(s_axis_b_tdata[28]), .C(i_s_axis_b_tdata[28]));
PDIDGZ IPAD_s_axis_b_tdata29 (.PAD(s_axis_b_tdata[29]), .C(i_s_axis_b_tdata[29]));
PDIDGZ IPAD_s_axis_b_tdata30 (.PAD(s_axis_b_tdata[30]), .C(i_s_axis_b_tdata[30]));
PDIDGZ IPAD_s_axis_b_tdata31 (.PAD(s_axis_b_tdata[31]), .C(i_s_axis_b_tdata[31]));
PDIDGZ IPAD_s_axis_b_tdata32 (.PAD(s_axis_b_tdata[32]), .C(i_s_axis_b_tdata[32]));
PDIDGZ IPAD_s_axis_b_tdata33 (.PAD(s_axis_b_tdata[33]), .C(i_s_axis_b_tdata[33]));
PDIDGZ IPAD_s_axis_b_tdata34 (.PAD(s_axis_b_tdata[34]), .C(i_s_axis_b_tdata[34]));
PDIDGZ IPAD_s_axis_b_tdata35 (.PAD(s_axis_b_tdata[35]), .C(i_s_axis_b_tdata[35]));
PDIDGZ IPAD_s_axis_b_tdata36 (.PAD(s_axis_b_tdata[36]), .C(i_s_axis_b_tdata[36]));
PDIDGZ IPAD_s_axis_b_tdata37 (.PAD(s_axis_b_tdata[37]), .C(i_s_axis_b_tdata[37]));
PDIDGZ IPAD_s_axis_b_tdata38 (.PAD(s_axis_b_tdata[38]), .C(i_s_axis_b_tdata[38]));
PDIDGZ IPAD_s_axis_b_tdata39 (.PAD(s_axis_b_tdata[39]), .C(i_s_axis_b_tdata[39]));
PDIDGZ IPAD_s_axis_b_tdata40 (.PAD(s_axis_b_tdata[40]), .C(i_s_axis_b_tdata[40]));
PDIDGZ IPAD_s_axis_b_tdata41 (.PAD(s_axis_b_tdata[41]), .C(i_s_axis_b_tdata[41]));
PDIDGZ IPAD_s_axis_b_tdata42 (.PAD(s_axis_b_tdata[42]), .C(i_s_axis_b_tdata[42]));
PDIDGZ IPAD_s_axis_b_tdata43 (.PAD(s_axis_b_tdata[43]), .C(i_s_axis_b_tdata[43]));
PDIDGZ IPAD_s_axis_b_tdata44 (.PAD(s_axis_b_tdata[44]), .C(i_s_axis_b_tdata[44]));
PDIDGZ IPAD_s_axis_b_tdata45 (.PAD(s_axis_b_tdata[45]), .C(i_s_axis_b_tdata[45]));
PDIDGZ IPAD_s_axis_b_tdata46 (.PAD(s_axis_b_tdata[46]), .C(i_s_axis_b_tdata[46]));
PDIDGZ IPAD_s_axis_b_tdata47 (.PAD(s_axis_b_tdata[47]), .C(i_s_axis_b_tdata[47]));
PDIDGZ IPAD_s_axis_b_tdata48 (.PAD(s_axis_b_tdata[48]), .C(i_s_axis_b_tdata[48]));
PDIDGZ IPAD_s_axis_b_tdata49 (.PAD(s_axis_b_tdata[49]), .C(i_s_axis_b_tdata[49]));
PDIDGZ IPAD_s_axis_b_tdata50 (.PAD(s_axis_b_tdata[50]), .C(i_s_axis_b_tdata[50]));
PDIDGZ IPAD_s_axis_b_tdata51 (.PAD(s_axis_b_tdata[51]), .C(i_s_axis_b_tdata[51]));
PDIDGZ IPAD_s_axis_b_tdata52 (.PAD(s_axis_b_tdata[52]), .C(i_s_axis_b_tdata[52]));
PDIDGZ IPAD_s_axis_b_tdata53 (.PAD(s_axis_b_tdata[53]), .C(i_s_axis_b_tdata[53]));
PDIDGZ IPAD_s_axis_b_tdata54 (.PAD(s_axis_b_tdata[54]), .C(i_s_axis_b_tdata[54]));
PDIDGZ IPAD_s_axis_b_tdata55 (.PAD(s_axis_b_tdata[55]), .C(i_s_axis_b_tdata[55]));
PDIDGZ IPAD_s_axis_b_tdata56 (.PAD(s_axis_b_tdata[56]), .C(i_s_axis_b_tdata[56]));
PDIDGZ IPAD_s_axis_b_tdata57 (.PAD(s_axis_b_tdata[57]), .C(i_s_axis_b_tdata[57]));
PDIDGZ IPAD_s_axis_b_tdata58 (.PAD(s_axis_b_tdata[58]), .C(i_s_axis_b_tdata[58]));
PDIDGZ IPAD_s_axis_b_tdata59 (.PAD(s_axis_b_tdata[59]), .C(i_s_axis_b_tdata[59]));
PDIDGZ IPAD_s_axis_b_tdata60 (.PAD(s_axis_b_tdata[60]), .C(i_s_axis_b_tdata[60]));
PDIDGZ IPAD_s_axis_b_tdata61 (.PAD(s_axis_b_tdata[61]), .C(i_s_axis_b_tdata[61]));
PDIDGZ IPAD_s_axis_b_tdata62 (.PAD(s_axis_b_tdata[62]), .C(i_s_axis_b_tdata[62]));
PDIDGZ IPAD_s_axis_b_tdata63 (.PAD(s_axis_b_tdata[63]), .C(i_s_axis_b_tdata[63]));
PDIDGZ IPAD_s_axis_b_tvalid (.PAD(s_axis_b_tvalid), .C(i_s_axis_b_tvalid));
PDIDGZ IPAD_s_axis_b_tlast (.PAD(s_axis_b_tlast), .C(i_s_axis_b_tlast));
PDIDGZ IPAD_m_axis_tready (.PAD(m_axis_tready), .C(i_m_axis_tready));

// Output Pad Wrapping
PDO16CDG OPAD_s_axi_awready (.I(i_s_axi_awready), .PAD(s_axi_awready));
PDO16CDG OPAD_s_axi_wready (.I(i_s_axi_wready), .PAD(s_axi_wready));
PDO16CDG OPAD_s_axi_bresp0 (.I(i_s_axi_bresp[0]), .PAD(s_axi_bresp[0]));
PDO16CDG OPAD_s_axi_bresp1 (.I(i_s_axi_bresp[1]), .PAD(s_axi_bresp[1]));
PDO16CDG OPAD_s_axi_bvalid (.I(i_s_axi_bvalid), .PAD(s_axi_bvalid));
PDO16CDG OPAD_s_axi_arready (.I(i_s_axi_arready), .PAD(s_axi_arready));
PDO16CDG OPAD_s_axi_rdata0 (.I(i_s_axi_rdata[0]), .PAD(s_axi_rdata[0]));
PDO16CDG OPAD_s_axi_rdata1 (.I(i_s_axi_rdata[1]), .PAD(s_axi_rdata[1]));
PDO16CDG OPAD_s_axi_rdata2 (.I(i_s_axi_rdata[2]), .PAD(s_axi_rdata[2]));
PDO16CDG OPAD_s_axi_rdata3 (.I(i_s_axi_rdata[3]), .PAD(s_axi_rdata[3]));
PDO16CDG OPAD_s_axi_rdata4 (.I(i_s_axi_rdata[4]), .PAD(s_axi_rdata[4]));
PDO16CDG OPAD_s_axi_rdata5 (.I(i_s_axi_rdata[5]), .PAD(s_axi_rdata[5]));
PDO16CDG OPAD_s_axi_rdata6 (.I(i_s_axi_rdata[6]), .PAD(s_axi_rdata[6]));
PDO16CDG OPAD_s_axi_rdata7 (.I(i_s_axi_rdata[7]), .PAD(s_axi_rdata[7]));
PDO16CDG OPAD_s_axi_rdata8 (.I(i_s_axi_rdata[8]), .PAD(s_axi_rdata[8]));
PDO16CDG OPAD_s_axi_rdata9 (.I(i_s_axi_rdata[9]), .PAD(s_axi_rdata[9]));
PDO16CDG OPAD_s_axi_rdata10 (.I(i_s_axi_rdata[10]), .PAD(s_axi_rdata[10]));
PDO16CDG OPAD_s_axi_rdata11 (.I(i_s_axi_rdata[11]), .PAD(s_axi_rdata[11]));
PDO16CDG OPAD_s_axi_rdata12 (.I(i_s_axi_rdata[12]), .PAD(s_axi_rdata[12]));
PDO16CDG OPAD_s_axi_rdata13 (.I(i_s_axi_rdata[13]), .PAD(s_axi_rdata[13]));
PDO16CDG OPAD_s_axi_rdata14 (.I(i_s_axi_rdata[14]), .PAD(s_axi_rdata[14]));
PDO16CDG OPAD_s_axi_rdata15 (.I(i_s_axi_rdata[15]), .PAD(s_axi_rdata[15]));
PDO16CDG OPAD_s_axi_rdata16 (.I(i_s_axi_rdata[16]), .PAD(s_axi_rdata[16]));
PDO16CDG OPAD_s_axi_rdata17 (.I(i_s_axi_rdata[17]), .PAD(s_axi_rdata[17]));
PDO16CDG OPAD_s_axi_rdata18 (.I(i_s_axi_rdata[18]), .PAD(s_axi_rdata[18]));
PDO16CDG OPAD_s_axi_rdata19 (.I(i_s_axi_rdata[19]), .PAD(s_axi_rdata[19]));
PDO16CDG OPAD_s_axi_rdata20 (.I(i_s_axi_rdata[20]), .PAD(s_axi_rdata[20]));
PDO16CDG OPAD_s_axi_rdata21 (.I(i_s_axi_rdata[21]), .PAD(s_axi_rdata[21]));
PDO16CDG OPAD_s_axi_rdata22 (.I(i_s_axi_rdata[22]), .PAD(s_axi_rdata[22]));
PDO16CDG OPAD_s_axi_rdata23 (.I(i_s_axi_rdata[23]), .PAD(s_axi_rdata[23]));
PDO16CDG OPAD_s_axi_rdata24 (.I(i_s_axi_rdata[24]), .PAD(s_axi_rdata[24]));
PDO16CDG OPAD_s_axi_rdata25 (.I(i_s_axi_rdata[25]), .PAD(s_axi_rdata[25]));
PDO16CDG OPAD_s_axi_rdata26 (.I(i_s_axi_rdata[26]), .PAD(s_axi_rdata[26]));
PDO16CDG OPAD_s_axi_rdata27 (.I(i_s_axi_rdata[27]), .PAD(s_axi_rdata[27]));
PDO16CDG OPAD_s_axi_rdata28 (.I(i_s_axi_rdata[28]), .PAD(s_axi_rdata[28]));
PDO16CDG OPAD_s_axi_rdata29 (.I(i_s_axi_rdata[29]), .PAD(s_axi_rdata[29]));
PDO16CDG OPAD_s_axi_rdata30 (.I(i_s_axi_rdata[30]), .PAD(s_axi_rdata[30]));
PDO16CDG OPAD_s_axi_rdata31 (.I(i_s_axi_rdata[31]), .PAD(s_axi_rdata[31]));
PDO16CDG OPAD_s_axi_rresp0 (.I(i_s_axi_rresp[0]), .PAD(s_axi_rresp[0]));
PDO16CDG OPAD_s_axi_rresp1 (.I(i_s_axi_rresp[1]), .PAD(s_axi_rresp[1]));
PDO16CDG OPAD_s_axi_rvalid (.I(i_s_axi_rvalid), .PAD(s_axi_rvalid));
PDO16CDG OPAD_s_axis_a_tready (.I(i_s_axis_a_tready), .PAD(s_axis_a_tready));
PDO16CDG OPAD_s_axis_b_tready (.I(i_s_axis_b_tready), .PAD(s_axis_b_tready));
PDO16CDG OPAD_m_axis_tdata0 (.I(i_m_axis_tdata[0]), .PAD(m_axis_tdata[0]));
PDO16CDG OPAD_m_axis_tdata1 (.I(i_m_axis_tdata[1]), .PAD(m_axis_tdata[1]));
PDO16CDG OPAD_m_axis_tdata2 (.I(i_m_axis_tdata[2]), .PAD(m_axis_tdata[2]));
PDO16CDG OPAD_m_axis_tdata3 (.I(i_m_axis_tdata[3]), .PAD(m_axis_tdata[3]));
PDO16CDG OPAD_m_axis_tdata4 (.I(i_m_axis_tdata[4]), .PAD(m_axis_tdata[4]));
PDO16CDG OPAD_m_axis_tdata5 (.I(i_m_axis_tdata[5]), .PAD(m_axis_tdata[5]));
PDO16CDG OPAD_m_axis_tdata6 (.I(i_m_axis_tdata[6]), .PAD(m_axis_tdata[6]));
PDO16CDG OPAD_m_axis_tdata7 (.I(i_m_axis_tdata[7]), .PAD(m_axis_tdata[7]));
PDO16CDG OPAD_m_axis_tdata8 (.I(i_m_axis_tdata[8]), .PAD(m_axis_tdata[8]));
PDO16CDG OPAD_m_axis_tdata9 (.I(i_m_axis_tdata[9]), .PAD(m_axis_tdata[9]));
PDO16CDG OPAD_m_axis_tdata10 (.I(i_m_axis_tdata[10]), .PAD(m_axis_tdata[10]));
PDO16CDG OPAD_m_axis_tdata11 (.I(i_m_axis_tdata[11]), .PAD(m_axis_tdata[11]));
PDO16CDG OPAD_m_axis_tdata12 (.I(i_m_axis_tdata[12]), .PAD(m_axis_tdata[12]));
PDO16CDG OPAD_m_axis_tdata13 (.I(i_m_axis_tdata[13]), .PAD(m_axis_tdata[13]));
PDO16CDG OPAD_m_axis_tdata14 (.I(i_m_axis_tdata[14]), .PAD(m_axis_tdata[14]));
PDO16CDG OPAD_m_axis_tdata15 (.I(i_m_axis_tdata[15]), .PAD(m_axis_tdata[15]));
PDO16CDG OPAD_m_axis_tdata16 (.I(i_m_axis_tdata[16]), .PAD(m_axis_tdata[16]));
PDO16CDG OPAD_m_axis_tdata17 (.I(i_m_axis_tdata[17]), .PAD(m_axis_tdata[17]));
PDO16CDG OPAD_m_axis_tdata18 (.I(i_m_axis_tdata[18]), .PAD(m_axis_tdata[18]));
PDO16CDG OPAD_m_axis_tdata19 (.I(i_m_axis_tdata[19]), .PAD(m_axis_tdata[19]));
PDO16CDG OPAD_m_axis_tdata20 (.I(i_m_axis_tdata[20]), .PAD(m_axis_tdata[20]));
PDO16CDG OPAD_m_axis_tdata21 (.I(i_m_axis_tdata[21]), .PAD(m_axis_tdata[21]));
PDO16CDG OPAD_m_axis_tdata22 (.I(i_m_axis_tdata[22]), .PAD(m_axis_tdata[22]));
PDO16CDG OPAD_m_axis_tdata23 (.I(i_m_axis_tdata[23]), .PAD(m_axis_tdata[23]));
PDO16CDG OPAD_m_axis_tdata24 (.I(i_m_axis_tdata[24]), .PAD(m_axis_tdata[24]));
PDO16CDG OPAD_m_axis_tdata25 (.I(i_m_axis_tdata[25]), .PAD(m_axis_tdata[25]));
PDO16CDG OPAD_m_axis_tdata26 (.I(i_m_axis_tdata[26]), .PAD(m_axis_tdata[26]));
PDO16CDG OPAD_m_axis_tdata27 (.I(i_m_axis_tdata[27]), .PAD(m_axis_tdata[27]));
PDO16CDG OPAD_m_axis_tdata28 (.I(i_m_axis_tdata[28]), .PAD(m_axis_tdata[28]));
PDO16CDG OPAD_m_axis_tdata29 (.I(i_m_axis_tdata[29]), .PAD(m_axis_tdata[29]));
PDO16CDG OPAD_m_axis_tdata30 (.I(i_m_axis_tdata[30]), .PAD(m_axis_tdata[30]));
PDO16CDG OPAD_m_axis_tdata31 (.I(i_m_axis_tdata[31]), .PAD(m_axis_tdata[31]));
PDO16CDG OPAD_m_axis_tdata32 (.I(i_m_axis_tdata[32]), .PAD(m_axis_tdata[32]));
PDO16CDG OPAD_m_axis_tdata33 (.I(i_m_axis_tdata[33]), .PAD(m_axis_tdata[33]));
PDO16CDG OPAD_m_axis_tdata34 (.I(i_m_axis_tdata[34]), .PAD(m_axis_tdata[34]));
PDO16CDG OPAD_m_axis_tdata35 (.I(i_m_axis_tdata[35]), .PAD(m_axis_tdata[35]));
PDO16CDG OPAD_m_axis_tdata36 (.I(i_m_axis_tdata[36]), .PAD(m_axis_tdata[36]));
PDO16CDG OPAD_m_axis_tdata37 (.I(i_m_axis_tdata[37]), .PAD(m_axis_tdata[37]));
PDO16CDG OPAD_m_axis_tdata38 (.I(i_m_axis_tdata[38]), .PAD(m_axis_tdata[38]));
PDO16CDG OPAD_m_axis_tdata39 (.I(i_m_axis_tdata[39]), .PAD(m_axis_tdata[39]));
PDO16CDG OPAD_m_axis_tdata40 (.I(i_m_axis_tdata[40]), .PAD(m_axis_tdata[40]));
PDO16CDG OPAD_m_axis_tdata41 (.I(i_m_axis_tdata[41]), .PAD(m_axis_tdata[41]));
PDO16CDG OPAD_m_axis_tdata42 (.I(i_m_axis_tdata[42]), .PAD(m_axis_tdata[42]));
PDO16CDG OPAD_m_axis_tdata43 (.I(i_m_axis_tdata[43]), .PAD(m_axis_tdata[43]));
PDO16CDG OPAD_m_axis_tdata44 (.I(i_m_axis_tdata[44]), .PAD(m_axis_tdata[44]));
PDO16CDG OPAD_m_axis_tdata45 (.I(i_m_axis_tdata[45]), .PAD(m_axis_tdata[45]));
PDO16CDG OPAD_m_axis_tdata46 (.I(i_m_axis_tdata[46]), .PAD(m_axis_tdata[46]));
PDO16CDG OPAD_m_axis_tdata47 (.I(i_m_axis_tdata[47]), .PAD(m_axis_tdata[47]));
PDO16CDG OPAD_m_axis_tdata48 (.I(i_m_axis_tdata[48]), .PAD(m_axis_tdata[48]));
PDO16CDG OPAD_m_axis_tdata49 (.I(i_m_axis_tdata[49]), .PAD(m_axis_tdata[49]));
PDO16CDG OPAD_m_axis_tdata50 (.I(i_m_axis_tdata[50]), .PAD(m_axis_tdata[50]));
PDO16CDG OPAD_m_axis_tdata51 (.I(i_m_axis_tdata[51]), .PAD(m_axis_tdata[51]));
PDO16CDG OPAD_m_axis_tdata52 (.I(i_m_axis_tdata[52]), .PAD(m_axis_tdata[52]));
PDO16CDG OPAD_m_axis_tdata53 (.I(i_m_axis_tdata[53]), .PAD(m_axis_tdata[53]));
PDO16CDG OPAD_m_axis_tdata54 (.I(i_m_axis_tdata[54]), .PAD(m_axis_tdata[54]));
PDO16CDG OPAD_m_axis_tdata55 (.I(i_m_axis_tdata[55]), .PAD(m_axis_tdata[55]));
PDO16CDG OPAD_m_axis_tdata56 (.I(i_m_axis_tdata[56]), .PAD(m_axis_tdata[56]));
PDO16CDG OPAD_m_axis_tdata57 (.I(i_m_axis_tdata[57]), .PAD(m_axis_tdata[57]));
PDO16CDG OPAD_m_axis_tdata58 (.I(i_m_axis_tdata[58]), .PAD(m_axis_tdata[58]));
PDO16CDG OPAD_m_axis_tdata59 (.I(i_m_axis_tdata[59]), .PAD(m_axis_tdata[59]));
PDO16CDG OPAD_m_axis_tdata60 (.I(i_m_axis_tdata[60]), .PAD(m_axis_tdata[60]));
PDO16CDG OPAD_m_axis_tdata61 (.I(i_m_axis_tdata[61]), .PAD(m_axis_tdata[61]));
PDO16CDG OPAD_m_axis_tdata62 (.I(i_m_axis_tdata[62]), .PAD(m_axis_tdata[62]));
PDO16CDG OPAD_m_axis_tdata63 (.I(i_m_axis_tdata[63]), .PAD(m_axis_tdata[63]));
PDO16CDG OPAD_m_axis_tvalid (.I(i_m_axis_tvalid), .PAD(m_axis_tvalid));
PDO16CDG OPAD_m_axis_tlast (.I(i_m_axis_tlast), .PAD(m_axis_tlast));

// DUT instantiation
MLDSA_AXI_TOP MLDSA_AXI_TOP_(
    .clk(i_clk),
    .resetn(i_resetn),
    .s_axi_awaddr(i_s_axi_awaddr),
    .s_axi_awvalid(i_s_axi_awvalid),
    .s_axi_wdata(i_s_axi_wdata),
    .s_axi_wstrb(i_s_axi_wstrb),
    .s_axi_wvalid(i_s_axi_wvalid),
    .s_axi_bready(i_s_axi_bready),
    .s_axi_araddr(i_s_axi_araddr),
    .s_axi_arvalid(i_s_axi_arvalid),
    .s_axi_rready(i_s_axi_rready),
    .s_axis_a_tdata(i_s_axis_a_tdata),
    .s_axis_a_tvalid(i_s_axis_a_tvalid),
    .s_axis_a_tlast(i_s_axis_a_tlast),
    .s_axis_b_tdata(i_s_axis_b_tdata),
    .s_axis_b_tvalid(i_s_axis_b_tvalid),
    .s_axis_b_tlast(i_s_axis_b_tlast),
    .m_axis_tready(i_m_axis_tready),
    .s_axi_awready(i_s_axi_awready),
    .s_axi_wready(i_s_axi_wready),
    .s_axi_bresp(i_s_axi_bresp),
    .s_axi_bvalid(i_s_axi_bvalid),
    .s_axi_arready(i_s_axi_arready),
    .s_axi_rdata(i_s_axi_rdata),
    .s_axi_rresp(i_s_axi_rresp),
    .s_axi_rvalid(i_s_axi_rvalid),
    .s_axis_a_tready(i_s_axis_a_tready),
    .s_axis_b_tready(i_s_axis_b_tready),
    .m_axis_tdata(i_m_axis_tdata),
    .m_axis_tvalid(i_m_axis_tvalid),
    .m_axis_tlast(i_m_axis_tlast)
);
endmodule

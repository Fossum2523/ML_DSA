// ============================
// File: MLDSA_AXI_Top_tb.v
// Description: Testbench for MLDSA_AXI_Top with parameterized clock
// ============================

`timescale 1ns / 1ps

module MLDSA_AXI_Top_tb;

    parameter CLK_PERIOD = 10; // Clock cycle = 10ns => 100MHz

    reg clk;
    reg resetn;

    // AXI4-Lite
    reg  [3:0]  s_axi_awaddr;
    reg         s_axi_awvalid;
    wire        s_axi_awready;

    reg  [31:0] s_axi_wdata;
    reg  [3:0]  s_axi_wstrb;
    reg         s_axi_wvalid;
    wire        s_axi_wready;

    wire [1:0]  s_axi_bresp;
    wire        s_axi_bvalid;
    reg         s_axi_bready;

    reg  [3:0]  s_axi_araddr;
    reg         s_axi_arvalid;
    wire        s_axi_arready;

    wire [31:0] s_axi_rdata;
    wire [1:0]  s_axi_rresp;
    wire        s_axi_rvalid;
    reg         s_axi_rready;

    // AXI Stream A/B and Output
    reg  [63:0] s_axis_a_tdata, s_axis_b_tdata;
    reg         s_axis_a_tvalid, s_axis_a_tlast;
    wire        s_axis_a_tready;
    reg         s_axis_b_tvalid, s_axis_b_tlast;
    wire        s_axis_b_tready;

    wire [63:0] m_axis_tdata;
    wire        m_axis_tvalid;
    wire        m_axis_tlast;
    reg         m_axis_tready;

    // Clock generation
    initial clk = 0;
    always #(CLK_PERIOD/2) clk = ~clk;

    // Instantiate DUT
    MLDSA_AXI_Top dut (
        .clk                (clk),
        .resetn             (resetn),

        .s_axi_awaddr       (s_axi_awaddr),
        .s_axi_awvalid      (s_axi_awvalid),
        .s_axi_awready      (s_axi_awready),

        .s_axi_wdata        (s_axi_wdata),
        .s_axi_wstrb        (s_axi_wstrb),
        .s_axi_wvalid       (s_axi_wvalid),
        .s_axi_wready       (s_axi_wready),

        .s_axi_bresp        (s_axi_bresp),
        .s_axi_bvalid       (s_axi_bvalid),
        .s_axi_bready       (s_axi_bready),

        .s_axi_araddr       (s_axi_araddr),
        .s_axi_arvalid      (s_axi_arvalid),
        .s_axi_arready      (s_axi_arready),

        .s_axi_rdata        (s_axi_rdata),
        .s_axi_rresp        (s_axi_rresp),
        .s_axi_rvalid       (s_axi_rvalid),
        .s_axi_rready       (s_axi_rready),

        .s_axis_a_tdata     (s_axis_a_tdata),
        .s_axis_a_tvalid    (s_axis_a_tvalid),
        .s_axis_a_tlast     (s_axis_a_tlast),
        .s_axis_a_tready    (s_axis_a_tready),

        .s_axis_b_tdata     (s_axis_b_tdata),
        .s_axis_b_tvalid    (s_axis_b_tvalid),
        .s_axis_b_tlast     (s_axis_b_tlast),
        .s_axis_b_tready    (s_axis_b_tready),

        .m_axis_tdata       (m_axis_tdata),
        .m_axis_tvalid      (m_axis_tvalid),
        .m_axis_tlast       (m_axis_tlast),
        .m_axis_tready      (m_axis_tready)
    );

    // Reset
    initial begin
        resetn = 0;
        # (5*CLK_PERIOD);
        resetn = 1;
    end

    // Stimulus
    initial begin
        // AXI4-Lite default
        s_axi_awaddr  = 0;
        s_axi_awvalid = 0;
        s_axi_wdata   = 0;
        s_axi_wstrb   = 4'b1111;
        s_axi_wvalid  = 0;
        s_axi_bready  = 1;
        s_axi_araddr  = 0;
        s_axi_arvalid = 0;
        s_axi_rready  = 1;

        // AXI Stream default
        s_axis_a_tdata = 64'h0;
        s_axis_a_tvalid = 0;
        s_axis_a_tlast  = 0;
        s_axis_b_tdata = 64'h0;
        s_axis_b_tvalid = 0;
        s_axis_b_tlast  = 0;
        m_axis_tready = 1;

        wait (resetn);
        # (2 * CLK_PERIOD);

        // Write main_mode = 2 (SignGen)
        axi_write(4'h0, 32'd2);
        # (CLK_PERIOD);

        // Write start = 1
        axi_write(4'h4, 32'd1);

        // Feed AXIS A (1 packet)
        axis_send(s_axis_a_tdata, s_axis_a_tvalid, s_axis_a_tlast, s_axis_a_tready, 64'hAABBCCDD00112233);

        // Feed AXIS B (1 packet)
        axis_send(s_axis_b_tdata, s_axis_b_tvalid, s_axis_b_tlast, s_axis_b_tready, 64'h1122334455667788);

        # (50 * CLK_PERIOD);
        $finish;
    end

    // AXI-Lite write helper
    task axi_write;
        input [3:0] addr;
        input [31:0] data;
        begin
            @(posedge clk);
            s_axi_awaddr  <= addr;
            s_axi_awvalid <= 1;
            s_axi_wdata   <= data;
            s_axi_wvalid  <= 1;
            wait (s_axi_awready && s_axi_wready);
            @(posedge clk);
            s_axi_awvalid <= 0;
            s_axi_wvalid  <= 0;
        end
    endtask

    // AXIS send helper (1 word, with last)
    task axis_send;
        output reg [63:0] tdata;
        output reg        tvalid;
        output reg        tlast;
        input             tready;
        input [63:0]      value;
        begin
            @(posedge clk);
            tdata  <= value;
            tvalid <= 1;
            tlast  <= 1;
            wait (tready);
            @(posedge clk);
            tvalid <= 0;
            tlast  <= 0;
        end
    endtask

endmodule
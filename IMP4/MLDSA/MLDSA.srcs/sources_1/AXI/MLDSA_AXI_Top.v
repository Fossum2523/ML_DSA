module MLDSA_AXI_Top (
    input               clk,
    input               resetn,

    // AXI4-Lite Slave Interface
    input  wire [31:0]   s_axi_awaddr,
    input  wire         s_axi_awvalid,
    output wire         s_axi_awready,

    input  wire [31:0]  s_axi_wdata,
    input  wire [3:0]   s_axi_wstrb,
    input  wire         s_axi_wvalid,
    output wire         s_axi_wready,

    output wire [1:0]   s_axi_bresp,
    output wire         s_axi_bvalid,
    input  wire         s_axi_bready,

    input  wire [31:0]   s_axi_araddr,
    input  wire         s_axi_arvalid,
    output wire         s_axi_arready,

    output wire [31:0]  s_axi_rdata,
    output wire [1:0]   s_axi_rresp,
    output wire         s_axi_rvalid,
    input  wire         s_axi_rready,

    // AXI4-Stream Slave A
    input  wire [63:0]  s_axis_a_tdata,
    input  wire         s_axis_a_tvalid,
    input  wire         s_axis_a_tlast,
    output wire         s_axis_a_tready,

    // AXI4-Stream Slave B
    input  wire [63:0]  s_axis_b_tdata,
    input  wire         s_axis_b_tvalid,
    input  wire         s_axis_b_tlast,
    output wire         s_axis_b_tready,

    // AXI4-Stream Master Output
    output wire [63:0]  m_axis_tdata,
    output wire         m_axis_tvalid,
    output wire         m_axis_tlast,
    input  wire         m_axis_tready
);

    wire [1:0]  main_mode;
    wire        start_pulse;
    wire        done;

    wire [63:0] MLDSA_data_in_A, MLDSA_data_in_B;
    wire        MLDSA_i_valid_A, MLDSA_i_last_A, MLDSA_i_ready_A;
    wire        MLDSA_i_valid_B, MLDSA_i_last_B, MLDSA_i_ready_B;

    wire [63:0] MLDSA_data_out;
    wire        MLDSA_o_valid, MLDSA_o_last, MLDSA_o_ready;

    AXI4_Lite_Slave AXI4_Lite_Slave_ (
        .clk        (clk),
        .resetn     (resetn),

        .AWADDR     (s_axi_awaddr),
        .AWVALID    (s_axi_awvalid),
        .AWREADY    (s_axi_awready),

        .WDATA      (s_axi_wdata),
        .WSTRB      (s_axi_wstrb),
        .WVALID     (s_axi_wvalid),
        .WREADY     (s_axi_wready),

        .BRESP      (s_axi_bresp),
        .BVALID     (s_axi_bvalid),
        .BREADY     (s_axi_bready),

        .ARADDR     (s_axi_araddr),
        .ARVALID    (s_axi_arvalid),
        .ARREADY    (s_axi_arready),

        .RDATA      (s_axi_rdata),
        .RRESP      (s_axi_rresp),
        .RVALID     (s_axi_rvalid),
        .RREADY     (s_axi_rready),

        .main_mode  (main_mode),
        .start_pulse(start_pulse),
        .done       (done)
    );

    AXIS_MLDSA_Wrapper AXIS_MLDSA_Wrapper_ (
        .clk        (clk),
        .resetn     (resetn),

        .s_axis_a_tdata  (s_axis_a_tdata),
        .s_axis_a_tvalid (s_axis_a_tvalid),
        .s_axis_a_tlast  (s_axis_a_tlast),
        .s_axis_a_tready (s_axis_a_tready),

        .s_axis_b_tdata  (s_axis_b_tdata),
        .s_axis_b_tvalid (s_axis_b_tvalid),
        .s_axis_b_tlast  (s_axis_b_tlast),
        .s_axis_b_tready (s_axis_b_tready),

        .m_axis_tdata    (m_axis_tdata),
        .m_axis_tvalid   (m_axis_tvalid),
        .m_axis_tlast    (m_axis_tlast),
        .m_axis_tready   (m_axis_tready),

        .MLDSA_data_in_A    (MLDSA_data_in_A),
        .MLDSA_i_valid_A    (MLDSA_i_valid_A),
        .MLDSA_i_last_A     (MLDSA_i_last_A),
        .MLDSA_i_ready_A    (MLDSA_i_ready_A),

        .MLDSA_data_in_B    (MLDSA_data_in_B),
        .MLDSA_i_valid_B    (MLDSA_i_valid_B),
        .MLDSA_i_last_B     (MLDSA_i_last_B),
        .MLDSA_i_ready_B    (MLDSA_i_ready_B),

        .MLDSA_data_out     (MLDSA_data_out),
        .MLDSA_o_valid      (MLDSA_o_valid),
        .MLDSA_o_last       (MLDSA_o_last),
        .MLDSA_o_ready      (MLDSA_o_ready)
    );

    MLDSA MLDSA_ (
        .clk                (clk),
        .resetn             (resetn),
        .start              (start_pulse),
        .main_mode          (main_mode),
        .done               (done),

        .MLDSA_data_in_A    (MLDSA_data_in_A),
        .MLDSA_i_valid_A    (MLDSA_i_valid_A),
        .MLDSA_i_last_A     (MLDSA_i_last_A),
        .MLDSA_i_ready_A    (MLDSA_i_ready_A),

        .MLDSA_data_in_B    (MLDSA_data_in_B),
        .MLDSA_i_valid_B    (MLDSA_i_valid_B),
        .MLDSA_i_last_B     (MLDSA_i_last_B),
        .MLDSA_i_ready_B    (MLDSA_i_ready_B),

        .MLDSA_data_out     (MLDSA_data_out),
        .MLDSA_o_valid      (MLDSA_o_valid),
        .MLDSA_o_last       (MLDSA_o_last),
        .MLDSA_o_ready      (MLDSA_o_ready)
    );

endmodule

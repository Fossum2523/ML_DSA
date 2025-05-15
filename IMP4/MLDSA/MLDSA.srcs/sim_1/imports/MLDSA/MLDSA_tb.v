
`timescale 1ns / 1ps

module MLDSA_AXI_Top_tb;

    parameter CLK_PERIOD = 10; // 100MHz

    reg clk;
    reg resetn;

    // AXI4-Lite interface signals
    reg  [31:0] s_axi_awaddr;
    reg         s_axi_awvalid;
    wire        s_axi_awready;

    reg  [31:0] s_axi_wdata;
    reg  [3:0]  s_axi_wstrb;
    reg         s_axi_wvalid;
    wire        s_axi_wready;

    wire [1:0]  s_axi_bresp;
    wire        s_axi_bvalid;
    reg         s_axi_bready;

    reg  [31:0] s_axi_araddr;
    reg         s_axi_arvalid;
    wire        s_axi_arready;

    wire [31:0] s_axi_rdata;
    wire [1:0]  s_axi_rresp;
    wire        s_axi_rvalid;
    reg         s_axi_rready;

    // AXI4-Stream input A
    reg  [63:0] s_axis_a_tdata;
    reg         s_axis_a_tvalid;
    reg         s_axis_a_tlast;
    wire        s_axis_a_tready;

    // AXI4-Stream input B
    reg  [63:0] s_axis_b_tdata;
    reg         s_axis_b_tvalid;
    reg         s_axis_b_tlast;
    wire        s_axis_b_tready;

    // AXI4-Stream output
    wire [63:0] m_axis_tdata;
    wire        m_axis_tvalid;
    wire        m_axis_tlast;
    reg         m_axis_tready;

    //main mode
    localparam  [31:0]  KeyGen  = 32'd0,
                        SignGen = 32'd1,
                        SignVer = 32'd2;

    integer i;

    integer fd_SignGen;
    integer r_SignGen;
    integer fd_SignVer;
    integer r_SignVer;
    //Input Data
    /*---KeyGen---*/
    reg [63:0] xi_data [0:3];
    /*---SignGen---*/
    reg [63:0] sk_data [0:319];
    reg [63:0] rnd_data [0:3];
    reg [63:0] M_prime_SignGen_data [0:37];  //M_prime data max is 38th 64bit data
    reg [5:0]  M_prime_SignGen_len;
    /*---SignVer---*/
    reg [63:0] pk_data [0:163];
    reg [63:0] signature_data [0:302];
    reg [63:0] M_prime_SignVer_data [0:37];  //M_prime data max is 38th 64bit data
    reg [5:0]  M_prime_SignVer_len;

    //Golden Data
    /*---KeyGen---*/
    reg        pk_check = 0;
    reg        sk_check = 0;
    reg [63:0] pk_golden_data [0:163];
    reg [63:0] sk_golden_data [0:319];
    /*---SignGen---*/
    reg         signature_check = 0;
    reg [63:0]  signature_golden_data [0:302];
    /*---SignVer---*/
    reg [63:0]  verification_golden_data;

    //Input Data
    /*---KeyGen---*/
    initial begin
        $readmemh("../../../../Testbench_Input_File/KeyGen/MLDSA_KeyGen_testbench_test_input_data.txt", xi_data);
    end
    /*---SignGen---*/
    initial begin
        $readmemh("../../../../Testbench_Input_File/SignGen/MLDSA_SignGen_testbench_test_input_data_sk.txt", sk_data);
    end
    initial begin
        $readmemh("../../../../Testbench_Input_File/SignGen/MLDSA_SignGen_testbench_test_input_data_rnd.txt", rnd_data);
    end
    initial begin
        $readmemh("../../../../Testbench_Input_File/SignGen/MLDSA_SignGen_testbench_test_input_data_M_prime.txt", M_prime_SignGen_data);
    end
    initial begin
        fd_SignGen = $fopen("../../../../Testbench_Input_File/SignGen/MLDSA_SignGen_testbench_test_input_data_M_prime_len.txt", "r");
        r_SignGen = $fscanf(fd_SignGen, "%h", M_prime_SignGen_len);  //one time one num
        $fclose(fd_SignGen);
    end
    /*---SignVer---*/
    initial begin
        $readmemh("../../../../Testbench_Input_File/SignVer/MLDSA_SignVer_testbench_test_input_data_pk.txt", pk_data);
    end
    initial begin
        $readmemh("../../../../Testbench_Input_File/SignVer/MLDSA_SignVer_testbench_test_input_data_signature.txt", signature_data);
    end
    initial begin
        $readmemh("../../../../Testbench_Input_File/SignVer/MLDSA_SignVer_testbench_test_input_data_M_prime.txt", M_prime_SignVer_data);
    end
    initial begin
        fd_SignVer = $fopen("../../../../Testbench_Input_File/SignVer/MLDSA_SignVer_testbench_test_input_data_M_prime_len.txt", "r");
        r_SignVer = $fscanf(fd_SignVer, "%h", M_prime_SignVer_len);  //one time one num
        $fclose(fd_SignVer);
    end


    //Golden Data
    /*---KeyGen---*/
    initial begin
        $readmemh("../../../../Testbench_Golden_File/KeyGen/MLDSA_KeyGen_testbench_test_output_data_pk.txt", pk_golden_data);
    end
    initial begin
        $readmemh("../../../../Testbench_Golden_File/KeyGen/MLDSA_KeyGen_testbench_test_output_data_sk.txt", sk_golden_data);
    end
    /*---SignGen---*/
    initial begin
        $readmemh("../../../../Testbench_Golden_File/SignGen/MLDSA_SignGen_testbench_test_output_data_signature.txt", signature_golden_data);
    end
    // /*---SignVer---*/
    // initial begin
    //     $readmemh("../../../../Testbench_Golden_File/SignVer/MLDSA_SignVer_testbench_test_output_data_verification.txt", verification_golden_data);
    // end



    // Clock generator
    initial clk = 0;
    always #(CLK_PERIOD/2) clk = ~clk;

    // DUT
    MLDSA_AXI_Top DUT (
        .clk(clk),
        .resetn(resetn),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_awready(s_axi_awready),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wstrb(s_axi_wstrb),
        .s_axi_wvalid(s_axi_wvalid),
        .s_axi_wready(s_axi_wready),
        .s_axi_bresp(s_axi_bresp),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_arready(s_axi_arready),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rresp(s_axi_rresp),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_rready(s_axi_rready),
        .s_axis_a_tdata(s_axis_a_tdata),
        .s_axis_a_tvalid(s_axis_a_tvalid),
        .s_axis_a_tlast(s_axis_a_tlast),
        .s_axis_a_tready(s_axis_a_tready),
        .s_axis_b_tdata(s_axis_b_tdata),
        .s_axis_b_tvalid(s_axis_b_tvalid),
        .s_axis_b_tlast(s_axis_b_tlast),
        .s_axis_b_tready(s_axis_b_tready),
        .m_axis_tdata(m_axis_tdata),
        .m_axis_tvalid(m_axis_tvalid),
        .m_axis_tlast(m_axis_tlast),
        .m_axis_tready(m_axis_tready)
    );

    initial begin
        resetn = 0;
        s_axi_awaddr = 0;
        s_axi_awvalid = 0;
        s_axi_wdata = 0;
        s_axi_wstrb = 4'hF;
        s_axi_wvalid = 0;
        s_axi_bready = 1;
        s_axi_araddr = 0;
        s_axi_arvalid = 0;
        s_axi_rready = 1;

        s_axis_a_tdata = 0;
        s_axis_a_tvalid = 0;
        s_axis_a_tlast = 0;

        s_axis_b_tdata = 0;
        s_axis_b_tvalid = 0;
        s_axis_b_tlast = 0;

        m_axis_tready = 1;

        #100;
        resetn = 1;

        // AXI4-Lite write to start operation KEYGEN
        @(posedge clk);
        s_axi_awaddr <= 32'h0000_0000;
        s_axi_awvalid <= 1;
        s_axi_wdata <= KeyGen;
        s_axi_wvalid <= 1;
        @(posedge clk);
        while (!s_axi_awready || !s_axi_wready) @(posedge clk);
        s_axi_awvalid <= 0;
        s_axi_wvalid <= 0;

        // AXI4-Stream input A
        for(i=0;i<4;i=i+1)begin
            @(posedge clk);
            s_axis_a_tdata <= xi_data[i];
            s_axis_a_tvalid <= 1;
            s_axis_a_tlast <= 1;
            wait (s_axis_a_tready);
        end
        @(posedge clk);
        s_axis_a_tvalid <= 0;
        s_axis_a_tlast <= 0;

        // // AXI4-Stream input B
        // @(posedge clk);
        // s_axis_b_tdata <= 64'h5A5A5A5A5A5A5A5A;
        // s_axis_b_tvalid <= 1;
        // s_axis_b_tlast <= 1;
        // wait (s_axis_b_tready);
        // @(posedge clk);
        // s_axis_b_tvalid <= 0;
        // s_axis_b_tlast <= 0;

        // // Wait for some output
        // repeat (20) @(posedge clk);

        $finish;
    end

endmodule

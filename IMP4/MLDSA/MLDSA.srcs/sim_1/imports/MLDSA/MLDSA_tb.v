
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

    //test
    wire  [1343:0]    padder_out;
    wire              padder_out_ready;
    wire  [1599:0]    f_out;
    wire              f_out_ready;
    wire  [1343:0]    sha_out;
    wire              sha_out_ready;

    //main mode
    localparam  [31:0]  KeyGen  = 32'd0,
                        SignGen = 32'd1,
                        SignVer = 32'd2;

    integer           pk_index;
    integer           sk_index = 0;
    integer           signature_index = 0;
    integer           error_count = 0;
    integer           i;
    integer           j;


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
        .m_axis_tready(m_axis_tready),

        //test
        .padder_out(padder_out),
        .padder_out_ready(padder_out_ready),
        .f_out(f_out),
        .f_out_ready(f_out_ready),
        .sha_out(sha_out),
        .sha_out_ready(sha_out_ready)
    );

    // /*---------------------------------------------KeyGen---------------------------------------------*/
    // initial begin
    //     resetn = 0;
    //     s_axi_awaddr = 0;
    //     s_axi_awvalid = 0;
    //     s_axi_wdata = 0;
    //     s_axi_wstrb = 4'hF;
    //     s_axi_wvalid = 0;
    //     s_axi_bready = 1;
    //     s_axi_araddr = 0;
    //     s_axi_arvalid = 0;
    //     s_axi_rready = 1;

    //     s_axis_a_tdata = 0;
    //     s_axis_a_tvalid = 0;
    //     s_axis_a_tlast = 0;

    //     s_axis_b_tdata = 0;
    //     s_axis_b_tvalid = 0;
    //     s_axis_b_tlast = 0;

    //     m_axis_tready = 1;

    //     repeat (10) @(posedge clk);
    //     resetn = 1;

    //     // AXI4-Lite write to start operation KEYGEN
    //     /***------------------------------------start------------------------------------***/
    //     @(posedge clk);
    //     s_axi_awaddr <= 32'h0000_0000;
    //     s_axi_awvalid <= 1;
    //     s_axi_wdata <= KeyGen;
    //     s_axi_wvalid <= 1;
    //     @(posedge clk);
    //     while (!s_axi_awready || !s_axi_wready) @(posedge clk);
    //     s_axi_awvalid <= 0;
    //     s_axi_wvalid <= 0;
    //     /***------------------------------------start------------------------------------***/
        
    //     // AXI4-Stream input A
    //     /***------------------------------------input------------------------------------***/
    //     for(i=0;i<4;i=i+1)begin
    //         @(posedge clk);
    //         s_axis_a_tdata <= xi_data[i];
    //         s_axis_a_tvalid <= 1;
    //         if(i==3)begin
    //             s_axis_a_tlast <= 1;
    //         end
    //         wait (s_axis_a_tready);
    //     end
    //     @(posedge clk);
    //     s_axis_a_tvalid <= 0;
    //     s_axis_a_tlast <= 0;
    //     /***------------------------------------input------------------------------------***/

    //     /***------------------------------------output------------------------------------***/
    //     //pk, sk → "p"
    //     pk_index = 0;
    //     while(pk_index < 4)begin
    //         if(m_axis_tvalid)begin
    //             $display("pk, sk → 'p', Checking output %0d: DUT = %0h, Golden = %0h", pk_index, m_axis_tdata, pk_golden_data[pk_index]);
    //             pk_index = pk_index + 1;
    //         end
    //         @(posedge clk);
    //     end

    //     //sk → "K"
    //     sk_index = 4;
    //     while(sk_index < 8)begin
    //         if(m_axis_tvalid)begin
    //             $display("sk → 'K', Checking output %0d: DUT = %0h, Golden = %0h", sk_index, m_axis_tdata, sk_golden_data[sk_index]);
    //             sk_index = sk_index + 1;
    //         end
    //         @(posedge clk);
    //     end

    //     //sk → "s1"
    //     sk_index = 16;
    //     while(sk_index < 64)begin
    //         if(m_axis_tvalid)begin
    //             $display("sk → 's1', Checking output %0d: DUT = %0h, Golden = %0h", sk_index, m_axis_tdata, sk_golden_data[sk_index]);
    //             sk_index = sk_index + 1;
    //         end
    //         @(posedge clk);
    //     end

    //     //sk → "s2"
    //     sk_index = 64;
    //     while(sk_index < 112)begin
    //         if(m_axis_tvalid)begin
    //             $display("sk → 's2', Checking output %0d: DUT = %0h, Golden = %0h", sk_index, m_axis_tdata, sk_golden_data[sk_index]);
    //             sk_index = sk_index + 1;
    //         end
    //         @(posedge clk);
    //     end

    //     //pk → "t1"
    //     pk_index = 4;
    //     while(pk_index < 164)begin
    //         if(m_axis_tvalid)begin
    //             $display("pk → 't1', Checking output %0d: DUT = %0h, Golden = %0h", pk_index, m_axis_tdata, pk_golden_data[pk_index]);
    //             pk_index = pk_index + 1;
    //         end
    //         @(posedge clk);
    //     end

    //     //sk → "tr"
    //     sk_index = 8;
    //     while(sk_index < 16)begin
    //         if(m_axis_tvalid)begin
    //             $display("sk → 'tr', Checking output %0d: DUT = %0h, Golden = %0h", sk_index, m_axis_tdata, sk_golden_data[sk_index]);
    //             sk_index = sk_index + 1;
    //         end
    //         @(posedge clk);
    //     end

    //     //sk → "t0"
    //     sk_index = 112;
    //     while(sk_index < 320)begin
    //         if(m_axis_tvalid)begin
    //             $display("sk → 't0', Checking output %0d: DUT = %0h, Golden = %0h", sk_index, m_axis_tdata, sk_golden_data[sk_index]);
    //             sk_index = sk_index + 1;
    //         end
    //         @(posedge clk);
    //     end

    //     //finish
    //     $display("KeyGen Ouput Data: pk, sk All PASS");
    //     repeat (20) @(posedge clk);
    //     $finish;
    //     /***------------------------------------output------------------------------------***/
    // end
    // /*---------------------------------------------KeyGen---------------------------------------------*/

    // /*---------------------------------------------SignGen---------------------------------------------*/
    // /***------------------------------------start------------------------------------***/
    // initial begin
    //     resetn = 0;
    //     s_axi_awaddr = 0;
    //     s_axi_awvalid = 0;
    //     s_axi_wdata = 0;
    //     s_axi_wstrb = 4'hF;
    //     s_axi_wvalid = 0;
    //     s_axi_bready = 1;
    //     s_axi_araddr = 0;
    //     s_axi_arvalid = 0;
    //     s_axi_rready = 1;

    //     repeat (10) @(posedge clk);
    //     resetn = 1;

    //     // AXI4-Lite write to start operation KEYGEN
    //     @(posedge clk);
    //     s_axi_awaddr <= 32'h0000_0000;
    //     s_axi_awvalid <= 1;
    //     s_axi_wdata <= SignGen;
    //     s_axi_wvalid <= 1;
    //     @(posedge clk);
    //     while (!s_axi_awready || !s_axi_wready) @(posedge clk);
    //     s_axi_awvalid <= 0;
    //     s_axi_wvalid <= 0;
    // end
    // /***------------------------------------start------------------------------------***/
        
    // /***------------------------------------input------------------------------------***/
    // /***AXI4-Stream input A**/
    // initial begin 
    //     s_axis_a_tdata = 0;
    //     s_axis_a_tvalid = 0;
    //     s_axis_a_tlast = 0;

    //     while (!s_axi_awvalid || !s_axi_awready || !s_axi_wvalid || !s_axi_wready) @(posedge clk);

    //     //Send tr data
    //     for(i=8;i<16;i=i+1)begin
    //         @(posedge clk);
    //         s_axis_a_tdata <= sk_data[i];
    //         s_axis_a_tvalid <= 1;
    //         wait (s_axis_a_tready);
    //     end

    //     //Send M_prime data
    //     for(i=0;i<M_prime_SignGen_len;i=i+1)begin
    //         @(posedge clk);
    //         s_axis_a_tdata <= M_prime_SignGen_data[i];
    //         s_axis_a_tvalid <= 1;
    //         if(i==(M_prime_SignGen_len-1))begin
    //             s_axis_a_tlast <= 1;
    //         end
    //         wait (s_axis_a_tready);
    //     end
    //     @(posedge clk);
    //     s_axis_a_tvalid <= 0;
    //     s_axis_a_tlast <= 0;

    //     //Send K data
    //     for(i=4;i<8;i=i+1)begin
    //         @(posedge clk);
    //         s_axis_a_tdata <= sk_data[i];
    //         s_axis_a_tvalid <= 1;
    //         wait (s_axis_a_tready);
    //     end
    //     @(posedge clk);
    //     s_axis_a_tvalid <= 0;
    //     s_axis_a_tlast <= 0;

    //     //Send rnd data
    //     for(i=0;i<4;i=i+1)begin
    //         @(posedge clk);
    //         s_axis_a_tdata <= rnd_data[i];
    //         s_axis_a_tvalid <= 1;
    //         if(i==3)begin
    //             s_axis_a_tlast <= 1;
    //         end
    //         wait (s_axis_a_tready);
    //     end
    //     @(posedge clk);
    //     s_axis_a_tvalid <= 0;
    //     s_axis_a_tlast <= 0;

    //     s_axis_a_tdata <= 64'd0;
    // end
    // /**AXI4-Stream input A***/

    // /***AXI4-Stream input B***/
    // initial begin
    //     s_axis_b_tdata = 0;
    //     s_axis_b_tvalid = 0;
    //     s_axis_b_tlast = 0;

    //     while (!s_axi_awvalid || !s_axi_awready || !s_axi_wvalid || !s_axi_wready) @(posedge clk);

    //     //Send s1_pack data
    //     for(j=16;j<64;j=j+1)begin
    //         @(posedge clk);
    //         s_axis_b_tdata <= sk_data[j];
    //         s_axis_b_tvalid <= 1;
    //         if(j==63)begin
    //             s_axis_b_tlast <= 1;
    //         end
    //         @(posedge s_axis_b_tready);
    //         // wait (s_axis_b_tready);
    //     end
    //     @(posedge clk);
    //     s_axis_b_tvalid <= 0;
    //     s_axis_b_tlast <= 0;

    //     //Send s2_pack data
    //     for(j=64;j<112;j=j+1)begin
    //         @(posedge clk);
    //         s_axis_b_tdata <= sk_data[j];
    //         s_axis_b_tvalid <= 1;
    //         if(j==111)begin
    //             s_axis_b_tlast <= 1;
    //         end
    //         @(posedge s_axis_b_tready);
    //     end
    //     @(posedge clk);
    //     s_axis_b_tvalid <= 0;
    //     s_axis_b_tlast <= 0;

    //     //Send t0_pack data
    //     for(j=112;j<320;j=j+1)begin
    //         @(posedge clk);
    //         s_axis_b_tdata <= sk_data[j];
    //         s_axis_b_tvalid <= 1;
    //         if(j==319)begin
    //             s_axis_b_tlast <= 1;
    //         end
    //         @(posedge s_axis_b_tready);
    //     end
    //     @(posedge clk);
    //     s_axis_b_tvalid <= 0;
    //     s_axis_b_tlast <= 0;

    //     //Send p data
    //     for(j=0;j<4;j=j+1)begin
    //         @(posedge clk);
    //         s_axis_b_tdata <= sk_data[j];
    //         s_axis_b_tvalid <= 1;
    //         if(j==3)begin
    //             s_axis_b_tlast <= 1;
    //         end
    //         wait (s_axis_b_tready);
    //     end
    //     @(posedge clk);
    //     s_axis_b_tvalid <= 0;
    //     s_axis_b_tlast <= 0;

    //     s_axis_b_tdata  <= 64'd0;
    // end
    // /***AXI4-Stream input B***/
    // /***------------------------------------input------------------------------------***/

    // /***------------------------------------output------------------------------------***/
    // initial begin
    //     m_axis_tready = 1;

    //     //sig → "c_tilde"
    //     signature_index = 0;
    //     while(signature_index < 4)begin
    //         if(m_axis_tvalid)begin
    //             $display("sig → 'c_tilde', Checking output %0d: DUT = %0h, Golden = %0h", signature_index, m_axis_tdata, signature_golden_data[signature_index]);
    //             signature_index = signature_index + 1;
    //         end
    //         @(posedge clk);
    //     end

    //     //sig → "z"
    //     signature_index = 4;
    //     while(signature_index < 292)begin
    //         if(m_axis_tvalid)begin
    //             $display("sig → 'z', Checking output %0d: DUT = %0h, Golden = %0h", signature_index, m_axis_tdata, signature_golden_data[signature_index]);
    //             signature_index = signature_index + 1;
    //         end
    //         @(posedge clk);
    //     end

    //     //sig → "h"
    //     signature_index = 292;
    //     while(signature_index < 303)begin
    //         if(m_axis_tvalid)begin
    //             $display("sig → 'h', Checking output %0d: DUT = %0h, Golden = %0h", signature_index, m_axis_tdata, signature_golden_data[signature_index]);
    //             signature_index = signature_index + 1;
    //         end
    //         @(posedge clk);
    //     end

    //     //finish
    //     $display("SignGen Ouput Data: pk, sk All PASS");
    //     repeat (20) @(posedge clk);
    //     $finish;
    // end
    // /***------------------------------------output------------------------------------***/
    // /*---------------------------------------------SignGen---------------------------------------------*/

    /*---------------------------------------------SignVer---------------------------------------------*/
    /***------------------------------------start------------------------------------***/
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

        repeat (10) @(posedge clk);
        resetn = 1;

        // AXI4-Lite write to start operation KEYGEN
        @(posedge clk);
        s_axi_awaddr <= 32'h0000_0000;
        s_axi_awvalid <= 1;
        s_axi_wdata <= SignVer;
        s_axi_wvalid <= 1;
        @(posedge clk);
        while (!s_axi_awready || !s_axi_wready) @(posedge clk);
        s_axi_awvalid <= 0;
        s_axi_wvalid <= 0;
    end
    /***------------------------------------start------------------------------------***/

    /***------------------------------------input------------------------------------***/
    /***AXI4-Stream input A**/
    initial begin 
        s_axis_a_tdata <= 0;
        s_axis_a_tvalid <= 0;
        s_axis_a_tlast <= 0;

        while (!s_axi_awvalid || !s_axi_awready || !s_axi_wvalid || !s_axi_wready) @(posedge clk);

        #(CLK_PERIOD);

        //Send pk(p | t1) data
        for(i=0;i<164;i=i+1)begin
            s_axis_a_tvalid <= 1;
            s_axis_a_tdata <= pk_data[i];
            if(i == 163)begin
                s_axis_a_tlast <= 1'b1;
                #(CLK_PERIOD);
                while (!s_axis_a_tready) #(CLK_PERIOD);
            end
            else begin
                #(CLK_PERIOD);
                while (!s_axis_a_tready) #(CLK_PERIOD);
            end
        end
        s_axis_a_tlast <= 1'b0;
        #(CLK_PERIOD);

        //Send_c_tilde data
        for(i=0;i<4;i=i+1)begin
            s_axis_a_tvalid <= 1;
            s_axis_a_tdata <= signature_data[i];
            if(i == 3)begin
                s_axis_a_tlast <= 1'b1;
                #(CLK_PERIOD);
                while (!s_axis_a_tready) #(CLK_PERIOD);
            end
            else begin
                #(CLK_PERIOD);
                while (!s_axis_a_tready) #(CLK_PERIOD);
            end
        end
        s_axis_a_tlast <= 1'b0;
        #(CLK_PERIOD);

        //Send M_prime data
        for(i=0;i<M_prime_SignGen_len;i=i+1)begin
            s_axis_a_tvalid <= 1;
            s_axis_a_tdata <= M_prime_SignGen_data[i];
            if(i == (M_prime_SignGen_len-1))begin
                s_axis_a_tlast <= 1'b1;
                #(CLK_PERIOD);
                while (!s_axis_a_tready) #(CLK_PERIOD);
            end
            else begin
                #(CLK_PERIOD);
                while (!s_axis_a_tready) #(CLK_PERIOD);
            end
        end
        s_axis_a_tlast <= 1'b0;
        #(CLK_PERIOD);

        //Send hint data
        for(i=292;i<303;i=i+1)begin
            s_axis_a_tvalid <= 1;
            s_axis_a_tdata <= signature_data[i];
            if(i == 302)begin
                s_axis_a_tlast <= 1'b1;
                #(CLK_PERIOD);
                while (!s_axis_a_tready) #(CLK_PERIOD);
            end
            else begin
                #(CLK_PERIOD);
                while (!s_axis_a_tready) #(CLK_PERIOD);
            end
        end
        s_axis_a_tlast <= 1'b0;
        s_axis_a_tvalid <= 0;
        #(CLK_PERIOD);

        @(posedge clk);
        s_axis_a_tvalid <= 0;
        s_axis_a_tlast <= 0;

        s_axis_a_tdata <= 64'd0;
    end
    /**AXI4-Stream input A***/

    /***AXI4-Stream input B***/
    initial begin 
        s_axis_b_tdata  <= 0;
        s_axis_b_tvalid <= 0;                                               
        s_axis_b_tlast  <= 0;

        while (!s_axi_awvalid || !s_axi_awready || !s_axi_wvalid || !s_axi_wready) @(posedge clk);

        #(CLK_PERIOD);

        //Send t1_pack data
        for(j=4;j<164;j=j+1)begin
            s_axis_b_tvalid <= 1;
            s_axis_b_tdata <= pk_data[j];
            if(j==163)begin
                s_axis_b_tlast <= 1;
                #(CLK_PERIOD);
                while (!s_axis_b_tready) #(CLK_PERIOD);
            end
            else begin
                #(CLK_PERIOD);
                while (!s_axis_b_tready) #(CLK_PERIOD);
            end
        end
        s_axis_b_tlast <= 0;
        #(CLK_PERIOD);

        //Send z_pack data
        for(j=4;j<292;j=j+1)begin
            s_axis_b_tvalid <= 1;
            s_axis_b_tdata <= signature_data[j];
            if(j==291)begin
                s_axis_b_tlast <= 1;
                #(CLK_PERIOD);
                while (!s_axis_b_tready) #(CLK_PERIOD);
            end
            else begin
                #(CLK_PERIOD);
                while (!s_axis_b_tready) #(CLK_PERIOD);
            end
        end
        s_axis_b_tlast <= 0;
        #(CLK_PERIOD);


        @(posedge clk);
        s_axis_b_tvalid <= 0;
        s_axis_b_tlast <= 0;

        s_axis_b_tdata  <= 64'd0;
    end
    /***AXI4-Stream input B***/
    /***------------------------------------input------------------------------------***/

    /***------------------------------------output------------------------------------***/
    // initial begin
    //     m_axis_tready = 1;

    //     //sig → "c_tilde"
    //     signature_index = 0;
    //     while(signature_index < 4)begin
    //         if(m_axis_tvalid)begin
    //             $display("sig → 'c_tilde', Checking output %0d: DUT = %0h, Golden = %0h", signature_index, m_axis_tdata, signature_golden_data[signature_index]);
    //             signature_index = signature_index + 1;
    //         end
    //         @(posedge clk);
    //     end

    //     //sig → "z"
    //     signature_index = 4;
    //     while(signature_index < 292)begin
    //         if(m_axis_tvalid)begin
    //             $display("sig → 'z', Checking output %0d: DUT = %0h, Golden = %0h", signature_index, m_axis_tdata, signature_golden_data[signature_index]);
    //             signature_index = signature_index + 1;
    //         end
    //         @(posedge clk);
    //     end

    //     //sig → "h"
    //     signature_index = 292;
    //     while(signature_index < 303)begin
    //         if(m_axis_tvalid)begin
    //             $display("sig → 'h', Checking output %0d: DUT = %0h, Golden = %0h", signature_index, m_axis_tdata, signature_golden_data[signature_index]);
    //             signature_index = signature_index + 1;
    //         end
    //         @(posedge clk);
    //     end

    //     //finish
    //     $display("SignGen Ouput Data: pk, sk All PASS");
    //     repeat (20) @(posedge clk);
    //     $finish;
    // end
    /***------------------------------------output------------------------------------***/
    /*---------------------------------------------SignVer---------------------------------------------*/
    // reg [31:0]cnt = 0;
    // always @(posedge clk ) begin
    //     $display("cnt : %d, s_axis_a_tready: %h", cnt, s_axis_a_tready);
    //     cnt <= cnt + 1;
    // end

    always @(posedge clk ) begin
        if(padder_out_ready)$display("padder_out: %h.", padder_out);
    end
    always @(posedge clk ) begin
        if(f_out_ready)$display("fout: %h.", f_out);
    end 
    always @(posedge clk ) begin
        if(sha_out_ready)$display("sha_out: %h.", sha_out);
    end
    
endmodule

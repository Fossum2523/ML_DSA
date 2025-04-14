`timescale 1ns/1ps

module MLDSA_tb;

    // Testbench signals
    reg               clk;
    reg               reset;
    reg               start;
    reg               data_in_ready;
    reg   [1:0]       main_mode;
    reg   [2:0]       MLDSA_byte_num;
    reg   [63:0]      MLDSA_data_in;
    wire  [63:0]      MLDSA_data_out;
    wire              MLDSA_o_valid;
    
    //test
    wire  [1343:0]    padder_out;
    wire              padder_out_ready;
    wire  [1599:0]    f_out;
    wire              f_out_ready;
    wire  [1343:0]    sha_out;
    wire              sha_out_ready;
    integer           pk_index = 0;
    integer           sk_index = 0;
    integer           error_count = 0;
    integer           i;

    //main mode
    localparam  [1:0]   KeyGen  = 2'd0,
                        SignGen = 2'd1,
                        SignVer = 2'd2;

    //Input Data
    /*---KeyGen---*/
    reg [63:0] xi_data [0:3];
    /*---SignGen---*/
    reg [63:0] sk_data [0:319];
    reg [63:0] rnd_data [0:3];
    reg [63:0] M_prime_data [0:6];

    //Golden Data
    /*---KeyGen---*/
    reg        pk_check = 0;
    reg        sk_check = 0;
    reg [63:0] pk_golden_data [0:163];
    reg [63:0] sk_golden_data [0:319];

    /*---SignGen---*/
    reg [63:0] signature_golden_data [0:301];

    // Instantiate the MLDSA module
    MLDSA uut (
        .clk(clk),
        .reset(reset),
        .start(start),
        .data_in_ready(data_in_ready),
        .main_mode(main_mode),
        .MLDSA_byte_num(MLDSA_byte_num),
        .MLDSA_data_in(MLDSA_data_in),
        .MLDSA_data_out(MLDSA_data_out),
        .MLDSA_o_valid(MLDSA_o_valid),

        .padder_out(padder_out),
        .padder_out_ready(padder_out_ready),
        .f_out(f_out),
        .f_out_ready(f_out_ready),
        .sha_out(sha_out),
        .sha_out_ready(sha_out_ready)
    );

    // Clock generation
    initial clk = 1;
    always #5 clk = ~clk; // 100 MHz clock

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
        $readmemh("../../../../Testbench_Input_File/SignGen/MLDSA_SignGen_testbench_test_input_data_M_prime.txt", M_prime_data);
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

    

    // Test sequence
    initial begin
        // Initialize inputs
        reset = 1;
        start = 0;
        data_in_ready = 0;
        main_mode = 2'b00;
        MLDSA_byte_num = 3'd0;
        MLDSA_data_in = 64'h0;

        // Apply reset
        #100;
        #1;
        reset = 0;
        
        /*---------------------------------------KeyGen---------------------------------------*/
        //padder
        main_mode = 2'b00; //KeyGen
        start = 1;
        #10;
        start = 0;

        data_in_ready = 1;
        for(i=0;i<4;i=i+1)begin
            MLDSA_data_in = xi_data[i];
            #10;
        end
        data_in_ready = 0;
        /*---------------------------------------KeyGen---------------------------------------*/

        // Complete simulation
        #200;
        $stop;
    end
    
    /*---------------------------------------pk---------------------------------------*/
    always @(posedge clk) begin
        if(main_mode == KeyGen & pk_index <164 & pk_check == 0)begin
            if (MLDSA_o_valid) begin
                $display("Checking output %0d: DUT = %0h, Golden = %0h", pk_index, MLDSA_data_out, pk_golden_data[pk_index]);

                if (MLDSA_data_out !== pk_golden_data[pk_index]) begin
                    $display(">> MISMATCH at %0d: DUT = %0h, Golden = %0h", pk_index, MLDSA_data_out, pk_golden_data[pk_index]);
                    error_count = error_count + 1;
                end
                pk_index = pk_index + 1;
            end
        end
    end
    
    always @(posedge clk) begin
        if (pk_index == 164 & error_count == 0) begin
            pk_index = 0;
            pk_check <= 1;
        end
        else if(sk_check & pk_check)begin
            pk_check <= 0;
        end
    end
    /*---------------------------------------pk---------------------------------------*/

    /*---------------------------------------sk---------------------------------------*/
    always @(posedge clk) begin
        if(main_mode == KeyGen & sk_index <320 & sk_check == 0 & pk_check == 1)begin
            if (MLDSA_o_valid) begin
                $display("Checking output %0d: DUT = %0h, Golden = %0h", sk_index, MLDSA_data_out, sk_golden_data[sk_index]);

                if (MLDSA_data_out !== sk_golden_data[sk_index]) begin
                    $display(">> MISMATCH at %0d: DUT = %0h, Golden = %0h", sk_index, MLDSA_data_out, sk_golden_data[sk_index]);
                    error_count = error_count + 1;
                end
                sk_index = sk_index + 1;
            end
        end
    end

    always @(posedge clk) begin
        if (sk_index == 320 & error_count == 0) begin
            sk_index = 0;
            sk_check <= 1;
        end
        else if(sk_check & pk_check)begin
            sk_check <= 0;
        end
    end
    /*---------------------------------------sk---------------------------------------*/

    /*---------------------------------------KeyGen---------------------------------------*/
    always @(posedge clk) begin
        if(sk_check == 1 & pk_check == 1)begin
            $display("KeyGen Ouput Data: pk, sk All PASS");
        end
    end
    /*---------------------------------------KeyGen---------------------------------------*/

    


    

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

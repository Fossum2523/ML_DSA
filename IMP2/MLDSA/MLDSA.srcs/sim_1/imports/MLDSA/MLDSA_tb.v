`timescale 1ns/1ps

module MLDSA_tb;

    // Testbench signals
    reg               clk;
    reg               reset;
    reg               start;
    reg   [1:0]       main_mode;

    //AXI Stream input protocol A
    reg   [63:0]      MLDSA_data_in_A;
    reg               MLDSA_i_valid_A;
    reg               MLDSA_i_last_A;
    wire              MLDSA_i_ready_A;
    
    //AXI Stream input protocol B
    reg   [63:0]      MLDSA_data_in_B;
    reg               MLDSA_i_valid_B;
    reg               MLDSA_i_last_B;
    wire              MLDSA_i_ready_B;

    //AXI Stream output protocol
    reg               MLDSA_o_ready;
    wire  [63:0]      MLDSA_data_out;
    wire              MLDSA_o_valid;
    wire              MLDSA_o_last;
    
    //test
    wire  [1343:0]    padder_out;
    wire              padder_out_ready;
    wire  [1599:0]    f_out;
    wire              f_out_ready;
    wire  [1343:0]    sha_out;
    wire              sha_out_ready;

    integer           pk_index = 0;
    integer           sk_index = 0;
    integer           signature_index = 0;
    integer           error_count = 0;
    integer           i;
    integer           j;

    //main mode
    localparam  [1:0]   KeyGen  = 2'd0,
                        SignGen = 2'd1,
                        SignVer = 2'd2;

    integer fd;
    integer r;
    //Input Data
    /*---KeyGen---*/
    reg [63:0] xi_data [0:3];
    /*---SignGen---*/
    reg [63:0] sk_data [0:319];
    reg [63:0] rnd_data [0:3];
    reg [63:0] M_prime_data [0:37];  //M_prime data max is 38th 64bit data
    reg [5:0]  M_prime_len;

    //Golden Data
    /*---KeyGen---*/
    reg        pk_check = 0;
    reg        sk_check = 0;
    reg [63:0] pk_golden_data [0:163];
    reg [63:0] sk_golden_data [0:319];

    /*---SignGen---*/
    reg         signature_check = 0;
    reg [63:0] signature_golden_data [0:302];

    // Instantiate the MLDSA module
    MLDSA uut (
        .clk(clk),
        .reset(reset),
        .start(start),

        .main_mode(main_mode),

        //AXI Stream input protocol A
        .MLDSA_data_in_A(MLDSA_data_in_A),
        .MLDSA_i_valid_A(MLDSA_i_valid_A),
        .MLDSA_i_last_A(MLDSA_i_last_A),
        .MLDSA_i_ready_A(MLDSA_i_ready_A),
        
        //AXI Stream input protocol B
        .MLDSA_data_in_B(MLDSA_data_in_B),
        .MLDSA_i_valid_B(MLDSA_i_valid_B),
        .MLDSA_i_last_B(MLDSA_i_last_B),
        .MLDSA_i_ready_B(MLDSA_i_ready_B),

        //AXI Stream output protocol
        .MLDSA_o_ready(MLDSA_o_ready),
        .MLDSA_data_out(MLDSA_data_out),
        .MLDSA_o_valid(MLDSA_o_valid),
        .MLDSA_o_last(MLDSA_o_last),

        //test
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
    initial begin
        fd = $fopen("../../../../Testbench_Input_File/SignGen/MLDSA_SignGen_testbench_test_input_data_M_prime_len.txt", "r");
        r = $fscanf(fd, "%h", M_prime_len);  // 一次一個值
        $fclose(fd);
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
        reset = 1;
        start = 0;
        main_mode = 2'b00;

        // Apply reset
        #100;
        #1;
        reset = 0;

        /*-----KeyGen-----*/
        // main_mode = 2'b00;
        // start = 1;
        // #10;
        // start = 0;
        /*-----KeyGen-----*/

        /*-----SignGen-----*/
        main_mode = 2'b01;
        start = 1;
        #10;
        start = 0;
        /*-----SignGen-----*/
    end 

    initial begin 
        MLDSA_data_in_A = 64'd0;
        MLDSA_i_valid_A = 1'b0;
        MLDSA_i_last_A = 1'b0;
        wait(start);
        #10;
        /*---------------------------------------KeyGen---------------------------------------*/
        // MLDSA_i_valid_A = 1;
        // for(i=0;i<4;i=i+1)begin
        //     MLDSA_data_in_A = xi_data[i];
        //     #10;
        // end
        // MLDSA_i_valid_A = 0;
        /*---------------------------------------KeyGen---------------------------------------*/

        /*---------------------------------------SignGen---------------------------------------*/
        //keccak with protocol A
        MLDSA_i_valid_A = 1;
        //Send tr data
        i = 8;
        while(i<16)begin
            if(MLDSA_i_ready_A)begin
                MLDSA_data_in_A = sk_data[i];
                i = i + 1;
            end
            #10;
        end

        //Send M_prime data
        i = 0;
        while(i<M_prime_len)begin
            if(i == (M_prime_len-1))
                MLDSA_i_last_A = 1'b1;
            if(MLDSA_i_ready_A)begin
                MLDSA_data_in_A = M_prime_data[i];
                i = i + 1;
            end
            #10;
        end
        MLDSA_i_last_A = 1'b0;

        //Send K data
        i = 4;
        while(i<8)begin
            if(MLDSA_i_ready_A)begin
                MLDSA_data_in_A = sk_data[i];
                i = i + 1;
            end
            #10;
            
        end

        //Send rnd data
        i = 0;
        while(i<4)begin
            if(i == (4-1))
                MLDSA_i_last_A = 1'b1;
            if(MLDSA_i_ready_A)begin
                MLDSA_data_in_A = rnd_data[i];
                i = i + 1;
            end
            #10;
        end


        MLDSA_data_in_A = 64'd0;
        MLDSA_i_last_A  = 1'b0;
        MLDSA_i_valid_A = 0;

        
        /*---------------------------------------SignGen---------------------------------------*/
    end
    
    initial begin 
        //Encoder with protocol B
        MLDSA_data_in_B = 64'd0;
        MLDSA_i_valid_B = 1'b0;
        MLDSA_i_last_B = 1'b0;

        wait(start);
        #10;
        MLDSA_i_valid_B = 1;
        //Send s1_pack data
        j = 16;
        while(j < 64)begin
            if(j == 63)
                MLDSA_i_last_B = 1'b1;
            
            if(MLDSA_i_ready_B)begin
                MLDSA_data_in_B = sk_data[j];
                j = j + 1;
            end
            #10;
        end
        MLDSA_i_last_B  = 1'b0;

        //Send s2_pack data
        j = 64;
        while(j < 112)begin
            if(j == 111)
                MLDSA_i_last_B = 1'b1;
            
            if(MLDSA_i_ready_B)begin
                MLDSA_data_in_B = sk_data[j];
                j = j + 1;
            end
            #10;
        end
        MLDSA_i_last_B  = 1'b0;

        //Send t0_pack data
        j = 112;
        while(j < 320)begin
            if(j == 319)
                MLDSA_i_last_B = 1'b1;
            
            if(MLDSA_i_ready_B)begin
                MLDSA_data_in_B = sk_data[j];
                j = j + 1;
            end
            #10;
        end
        MLDSA_i_last_B  = 1'b0;

        //Send t0_pack data
        j = 0;
        while(j < 4)begin
            if(j == 3)
                MLDSA_i_last_B = 1'b1;
            
            if(MLDSA_i_ready_B)begin
                MLDSA_data_in_B = sk_data[j];
                j = j + 1;
            end
            #10;
        end

        MLDSA_data_in_B = 64'd0;
        MLDSA_i_last_B  = 1'b0;
        MLDSA_i_valid_B = 0;
        /*---------------------------------------SignGen---------------------------------------*/
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

    /*---------------------------------------signature---------------------------------------*/
    always @(posedge clk) begin
        if(main_mode == SignGen & signature_index <303)begin
            if (MLDSA_o_valid) begin
                $display("Checking output %0d: DUT = %0h, Golden = %0h", signature_index, MLDSA_data_out, signature_golden_data[signature_index]);

                if (MLDSA_data_out !== signature_golden_data[signature_index]) begin
                    $display(">> MISMATCH at %0d: DUT = %0h, Golden = %0h", signature_index, MLDSA_data_out, signature_golden_data[signature_index]);
                    error_count = error_count + 1;
                end
                signature_index = signature_index + 1;
            end
        end
    end

    always @(posedge clk) begin
        if (signature_index == 303 & error_count == 0) begin
            signature_index = 0;
            signature_check <= 1;
        end
        else if(signature_check)begin
            signature_check <= 0;
        end
    end

    always @(posedge clk) begin
        if(signature_check == 1)begin
            $display("SignGen Ouput Data: signature All PASS");
        end
    end
    /*---------------------------------------signature---------------------------------------*/


    

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

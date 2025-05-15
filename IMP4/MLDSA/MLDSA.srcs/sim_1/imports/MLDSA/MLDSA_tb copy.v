`timescale 1ns/1ps

module MLDSA_tb;

     parameter CLK_PERIOD = 10; // Clock cycle time in ns (e.g., 10ns for 100MHz)

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

    initial begin
        clk = 0;
        forever #(CLK_PERIOD / 2) clk = ~clk;
    end

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


    /*---------------------------------------------KeyGen---------------------------------------------*/
    initial begin
        reset = 1;
        start = 0;
        main_mode = 2'b00;
        i = 0;
        pk_index = 0;
        sk_index = 0;
        MLDSA_data_in_A = 64'd0;
        MLDSA_i_valid_A = 1'b0;
        MLDSA_i_last_A = 1'b0;
        MLDSA_data_in_B = 64'd0;
        MLDSA_i_valid_B = 1'b0;
        MLDSA_i_last_B = 1'b0;

        // Apply reset
        #(10 * CLK_PERIOD);
        reset = 0;

        /***------------------------------------start------------------------------------***/
        main_mode = 2'b00;
        start = 1;
        #(CLK_PERIOD);
        start = 0;
        /***------------------------------------start------------------------------------***/

        /***------------------------------------input------------------------------------***/
        MLDSA_i_valid_A = 1;
        for(i=0;i<4;i=i+1)begin
            MLDSA_data_in_A = xi_data[i];
            #10;
        end
        MLDSA_i_valid_A = 0;
        /***------------------------------------input------------------------------------***/

        /***------------------------------------output------------------------------------***/
        //pk, sk → "p"
        pk_index = 0;
        while(pk_index < 4)begin
            if(MLDSA_o_valid)begin
                $display("pk, sk → 'p', Checking output %0d: DUT = %0h, Golden = %0h", pk_index, MLDSA_data_out, pk_golden_data[pk_index]);
                pk_index = pk_index + 1;
            end
            #(CLK_PERIOD);
        end

        //sk → "K"
        sk_index = 4;
        while(sk_index < 8)begin
            if(MLDSA_o_valid)begin
                $display("sk → 'K', Checking output %0d: DUT = %0h, Golden = %0h", sk_index, MLDSA_data_out, sk_golden_data[sk_index]);
                sk_index = sk_index + 1;
            end
            #(CLK_PERIOD);
        end

        //sk → "s1"
        sk_index = 16;
        while(sk_index < 64)begin
            if(MLDSA_o_valid)begin
                $display("sk → 's1', Checking output %0d: DUT = %0h, Golden = %0h", sk_index, MLDSA_data_out, sk_golden_data[sk_index]);
                sk_index = sk_index + 1;
            end
            #(CLK_PERIOD);
        end

        //sk → "s2"
        sk_index = 64;
        while(sk_index < 112)begin
            if(MLDSA_o_valid)begin
                $display("sk → 's2', Checking output %0d: DUT = %0h, Golden = %0h", sk_index, MLDSA_data_out, sk_golden_data[sk_index]);
                sk_index = sk_index + 1;
            end
            #(CLK_PERIOD);
        end

        //pk → "t1"
        pk_index = 4;
        while(pk_index < 164)begin
            if(MLDSA_o_valid)begin
                $display("pk → 't1', Checking output %0d: DUT = %0h, Golden = %0h", pk_index, MLDSA_data_out, pk_golden_data[pk_index]);
                pk_index = pk_index + 1;
            end
            #(CLK_PERIOD);
        end

        //sk → "tr"
        sk_index = 8;
        while(sk_index < 16)begin
            if(MLDSA_o_valid)begin
                $display("sk → 'tr', Checking output %0d: DUT = %0h, Golden = %0h", sk_index, MLDSA_data_out, sk_golden_data[sk_index]);
                sk_index = sk_index + 1;
            end
            #(CLK_PERIOD);
        end

        //sk → "t0"
        sk_index = 112;
        while(sk_index < 320)begin
            if(MLDSA_o_valid)begin
                $display("sk → 't0', Checking output %0d: DUT = %0h, Golden = %0h", sk_index, MLDSA_data_out, sk_golden_data[sk_index]);
                sk_index = sk_index + 1;
            end
            #(CLK_PERIOD);
        end

        //finish
        $display("KeyGen Ouput Data: pk, sk All PASS");
        #(20*CLK_PERIOD);
        $finish;
        /***------------------------------------output------------------------------------***/
    end
    /*---------------------------------------------KeyGen---------------------------------------------*/




    // /*---------------------------------------------signGen---------------------------------------------*/
    // /***------------------------------------start------------------------------------***/
    // initial begin
    //     reset = 1;
    //     start = 0;
    //     main_mode = 2'b00;
    //     i = 0;
    //     pk_index = 0;
    //     sk_index = 0;
        
    //     // Apply reset
    //     #(10 * CLK_PERIOD);
    //     reset = 0;

    //     main_mode = 2'b01;
    //     start = 1;
    //     #(CLK_PERIOD);
    //     start = 0;
    // end
    // /***------------------------------------start------------------------------------***/

    // /***------------------------------------protocol A------------------------------------***/
    //  initial begin 
    //     MLDSA_data_in_A = 64'd0;
    //     MLDSA_i_valid_A = 1'b0;
    //     MLDSA_i_last_A = 1'b0;

    //     wait(start);
    //     #(CLK_PERIOD);

    //     MLDSA_i_valid_A = 1;
    //     //Send tr data
    //     i = 8;
    //     while(i<16)begin
    //         if(MLDSA_i_ready_A)begin
    //             MLDSA_data_in_A = sk_data[i];
    //             i = i + 1;
    //         end
    //         #(CLK_PERIOD);
    //     end

    //     //Send M_prime data
    //     i = 0;
    //     while(i<M_prime_SignGen_len)begin
    //         if(i == (M_prime_SignGen_len-1))
    //             MLDSA_i_last_A = 1'b1;
    //         if(MLDSA_i_ready_A)begin
    //             MLDSA_data_in_A = M_prime_SignGen_data[i];
    //             i = i + 1;
    //         end
    //         #(CLK_PERIOD);
    //     end
    //     MLDSA_i_last_A = 1'b0;

    //     //Send K data
    //     i = 4;
    //     while(i<8)begin
    //         if(MLDSA_i_ready_A)begin
    //             MLDSA_data_in_A = sk_data[i];
    //             i = i + 1;
    //         end
    //         #(CLK_PERIOD); 
    //     end

    //     //Send rnd data
    //     i = 0;
    //     while(i<4)begin
    //         if(i == (4-1))
    //             MLDSA_i_last_A = 1'b1;
    //         if(MLDSA_i_ready_A)begin
    //             MLDSA_data_in_A = rnd_data[i];
    //             i = i + 1;
    //         end
    //         #(CLK_PERIOD);
    //     end


    //     MLDSA_data_in_A = 64'd0;
    //     MLDSA_i_last_A  = 1'b0;
    //     MLDSA_i_valid_A = 0;
    // end
    // /***------------------------------------protocol A------------------------------------***/

    // /***------------------------------------protocol B------------------------------------***/
    // initial begin
    //     MLDSA_data_in_B = 64'd0;
    //     MLDSA_i_valid_B = 1'b0;
    //     MLDSA_i_last_B = 1'b0;

    //     wait(start);
    //     #(CLK_PERIOD);

    //     MLDSA_i_valid_B = 1;
    //     //Send s1_pack data
    //     j = 16;
    //     while(j < 64)begin
    //         if(j == 63)
    //             MLDSA_i_last_B = 1'b1;
            
    //         if(MLDSA_i_ready_B)begin
    //             MLDSA_data_in_B = sk_data[j];
    //             j = j + 1;
    //         end
    //         #(CLK_PERIOD);
    //     end
    //     MLDSA_i_last_B  = 1'b0;

    //     //Send s2_pack data
    //     j = 64;
    //     while(j < 112)begin
    //         if(j == 111)
    //             MLDSA_i_last_B = 1'b1;
            
    //         if(MLDSA_i_ready_B)begin
    //             MLDSA_data_in_B = sk_data[j];
    //             j = j + 1;
    //         end
    //         #(CLK_PERIOD);
    //     end
    //     MLDSA_i_last_B  = 1'b0;

    //     //Send t0_pack data
    //     j = 112;
    //     while(j < 320)begin
    //         if(j == 319)
    //             MLDSA_i_last_B = 1'b1;
            
    //         if(MLDSA_i_ready_B)begin
    //             MLDSA_data_in_B = sk_data[j];
    //             j = j + 1;
    //         end
    //         #(CLK_PERIOD);
    //     end
    //     MLDSA_i_last_B  = 1'b0;

    //     //Send p data
    //     j = 0;
    //     wait(MLDSA_i_ready_B);
    //     MLDSA_data_in_B = sk_data[0];
    //     #(CLK_PERIOD);
    //     MLDSA_data_in_B = sk_data[1];
    //     #(CLK_PERIOD);
    //     MLDSA_data_in_B = sk_data[2];
    //     #(CLK_PERIOD);
    //     MLDSA_data_in_B = sk_data[3];
    //     // MLDSA_i_last_B = 1'b1;
    //     #(CLK_PERIOD);
    //     // while(j < 4)begin
    //     //     if(j == 3)
    //     //         MLDSA_i_last_B = 1'b1;
            
    //     //     if(MLDSA_i_ready_B)begin
    //     //         MLDSA_data_in_B = sk_data[j];
    //     //         j = j + 1;
    //     //     end
    //     //     #(CLK_PERIOD);
    //     // end

    //     MLDSA_data_in_B = 64'd0;
    //     MLDSA_i_last_B  = 1'b0;
    //     MLDSA_i_valid_B = 0;
    // end
    // /***------------------------------------protocol B------------------------------------***/
    
    // /***------------------------------------output------------------------------------***/
    // initial begin
    //     MLDSA_o_ready = 1;

    //     //sig → "c_tilde"
    //     signature_index = 0;
    //     while(signature_index < 4)begin
    //         if(MLDSA_o_valid)begin
    //             $display("sig → 'c_tilde', Checking output %0d: DUT = %0h, Golden = %0h", signature_index, MLDSA_data_out, signature_golden_data[signature_index]);
    //             signature_index = signature_index + 1;
    //         end
    //         #(CLK_PERIOD);
    //     end

    //     //sig → "z"
    //     signature_index = 4;
    //     while(signature_index < 292)begin
    //         if(MLDSA_o_valid)begin
    //             $display("sig → 'z', Checking output %0d: DUT = %0h, Golden = %0h", signature_index, MLDSA_data_out, signature_golden_data[signature_index]);
    //             signature_index = signature_index + 1;
    //         end
    //         #(CLK_PERIOD);
    //     end

    //     //sig → "h"
    //     signature_index = 292;
    //     while(signature_index < 303)begin
    //         if(MLDSA_o_valid)begin
    //             $display("sig → 'h', Checking output %0d: DUT = %0h, Golden = %0h", signature_index, MLDSA_data_out, signature_golden_data[signature_index]);
    //             signature_index = signature_index + 1;
    //         end
    //         #(CLK_PERIOD);
    //     end
        
    //     MLDSA_o_ready = 0;
    //     #(CLK_PERIOD);


    //     //finish
    //     $display("signGen Ouput Data: pk, sk All PASS");
    //     #(20*CLK_PERIOD);
    //     $finish;
    //     /***------------------------------------output------------------------------------***/
    // end
    // /*---------------------------------------------signGen---------------------------------------------*/
    


    // /*---------------------------------------------signVer---------------------------------------------*/
    // /***------------------------------------start------------------------------------***/
    // initial begin
    //     reset = 1;
    //     start = 0;
    //     main_mode = 2'b00;
    //     i = 0;
    //     pk_index = 0;
    //     sk_index = 0;
        
    //     // Apply reset
    //     #(10 * CLK_PERIOD);
    //     reset = 0;

    //     main_mode = 2'b10;
    //     start = 1;
    //     #(CLK_PERIOD);
    //     start = 0;
    // end
    // /***------------------------------------start------------------------------------***/

    // /***------------------------------------protocol A------------------------------------***/
    // reg pk_data_send_out;

    // always @(*) begin
    //     if(~pk_data_send_out)   //Send pk(p | t1) data
    //         MLDSA_data_in_A = pk_data[i];
    //     else
    //         MLDSA_data_in_A = 64'd0;
    // end
    // initial begin 
    //     MLDSA_data_in_A = 64'd0;
    //     MLDSA_i_valid_A = 1'b0;
    //     MLDSA_i_last_A = 1'b0;
    //     MLDSA_data_in_A = 0;

    //     pk_data_send_out = 1'b0;

    //     wait(start);
    //     #(CLK_PERIOD);

    //     MLDSA_i_valid_A = 1;
    //     //Send pk(p | t1) data
    //     i = 0;
    //     while(i<164)begin
    //         #(CLK_PERIOD);
    //         if(MLDSA_i_ready_A)begin
    //             if(i == 163)
    //                 MLDSA_i_last_A = 1'b1;
    //             i = i + 1;
    //         end  
    //     end
    //     pk_data_send_out = 1'b1;
    //     MLDSA_i_last_A = 1'b0;


    //     // //Send c_tilde data
    //     // i = 0;
    //     // while(i<4)begin
    //     //     if(MLDSA_i_ready_A)begin
    //     //         MLDSA_data_in_A = signature_data[i];
    //     //         i = i + 1;
    //     //     end
    //     //     #(CLK_PERIOD);
    //     // end

    //     // //Send M_prime data
    //     // i = 0;
    //     // while(i<M_prime_SignVer_len)begin
    //     //     if(i == (M_prime_SignVer_len-1))
    //     //         MLDSA_i_last_A = 1'b1;
    //     //     if(MLDSA_i_ready_A)begin
    //     //         MLDSA_data_in_A = M_prime_SignVer_data[i];
    //     //         i = i + 1;
    //     //     end
    //     //     #(CLK_PERIOD);
    //     // end
    //     // MLDSA_i_last_A = 1'b0;

    //     // //Send hint data
    //     // i = 292;
    //     // while(i<303)begin
    //     //     if(MLDSA_i_ready_A)begin
    //     //         MLDSA_data_in_A = signature_data[i];
    //     //         i = i + 1;
    //     //     end
    //     //     #(CLK_PERIOD);
    //     // end

    //     MLDSA_data_in_A = 64'd0;
    //     MLDSA_i_last_A  = 1'b0;
    //     MLDSA_i_valid_A = 0;
    // end
    // /***------------------------------------protocol A------------------------------------***/

    // /***------------------------------------protocol B------------------------------------***/
    // reg t1_data_send_out;

    // always @(*) begin
    //     if(~t1_data_send_out)   //Send pk(p | t1) data
    //         MLDSA_data_in_B = pk_data[j];
    //     else
    //         MLDSA_data_in_B = 64'd0;
    // end

    // initial begin 
    //     MLDSA_data_in_B = 64'd0;
    //     MLDSA_i_valid_B = 1'b0;
    //     MLDSA_i_last_B = 1'b0;
    //     MLDSA_data_in_B = 0;

    //     t1_data_send_out = 1'b0;

    //     wait(start);
    //     #(CLK_PERIOD);

    //     MLDSA_i_valid_B = 1;
    //     //Send t1 data
    //     j = 4;
    //     while(j<164)begin
    //         #(CLK_PERIOD);
    //         if(MLDSA_i_ready_B)begin
    //             if(j == 163)
    //                 MLDSA_i_last_B = 1'b1;
    //             j = j + 1;
    //         end  
    //     end
    //     t1_data_send_out = 1'b1;
    //     MLDSA_i_last_B = 1'b0;

    //     MLDSA_data_in_B = 64'd0;
    //     MLDSA_i_last_B  = 1'b0;
    //     MLDSA_i_valid_B = 0;
    // end

        
    // // initial begin
    // //     MLDSA_data_in_B = 64'd0;
    // //     MLDSA_i_valid_B = 1'b0;
    // //     MLDSA_i_last_B = 1'b0;

    // //     wait(start);
    // //     #(CLK_PERIOD);

    // //     MLDSA_i_valid_B = 1;
    // //     //Send t1 data
    // //     j = 4;
    // //     while(i<164)begin
    // //         if(MLDSA_i_ready_B)begin
    // //             MLDSA_data_in_B = pk_data[j];
    // //             j = j + 1;
    // //         end
    // //         #(CLK_PERIOD);
    // //     end


    // //     //Send z data
    // //     j = 4;
    // //     while(j < 292)begin
    // //         if(MLDSA_i_ready_B)begin
    // //             MLDSA_data_in_B = signature_data[j];
    // //             j = j + 1;
    // //         end
    // //         #(CLK_PERIOD);
    // //     end
    // //     MLDSA_i_last_B  = 1'b0;



       
    // //     MLDSA_data_in_B = 64'd0;
    // //     MLDSA_i_last_B  = 1'b0;
    // //     MLDSA_i_valid_B = 0;
    // // end
    // /***------------------------------------protocol B------------------------------------***/
    
    // /***------------------------------------output------------------------------------***/
    // initial begin
    //     MLDSA_o_ready = 1;

    //     //"Compare"
    //     wait(MLDSA_o_valid);
    //     if(MLDSA_data_out)begin
    //         $display("signVer Verification Pass");
    //     end
    //     else begin
    //         $display("signVer Verification Fail");
    //     end
    //     #(CLK_PERIOD);

        
    //     MLDSA_o_ready = 0;
    //     #(CLK_PERIOD);


    //     //finish
    //     $display("signGen Ouput Data: pk, sk All PASS");
    //     #(20*CLK_PERIOD);
    //     $finish;
    //     /***------------------------------------output------------------------------------***/
    // end
    // /*---------------------------------------------signVer---------------------------------------------*/


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

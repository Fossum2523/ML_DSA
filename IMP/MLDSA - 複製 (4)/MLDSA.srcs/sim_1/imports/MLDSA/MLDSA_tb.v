`timescale 1ns/1ps

module MLDSA_tb;

    // Testbench signals
    reg               clk;
    reg               reset;
    reg               start;
    reg               data_in_ready;
    reg   [1:0]       main_mode;
    reg   [63:0]      data_in;
    wire  [63:0]      data_out;
    
    //test
    wire  [1343:0]    padder_out;
    wire              padder_out_ready;
    wire  [1599:0]    f_out;
    wire              f_out_ready;
    wire  [1343:0]    sha_out;
    wire              sha_out_ready;
    
    // Clock generation
    initial clk = 1;
    always #5 clk = ~clk; // 100 MHz clock

    // Instantiate the MLDSA module
    MLDSA uut (
        .clk(clk),
        .reset(reset),
        .start(start),
        .data_in_ready(data_in_ready),
        .main_mode(main_mode),
        .data_in(data_in),
        .data_out(data_out),
        .padder_out(padder_out),
        .padder_out_ready(padder_out_ready),
        .f_out(f_out),
        .f_out_ready(f_out_ready),
        .sha_out(sha_out),
        .sha_out_ready(sha_out_ready)
    );

    // Test sequence
    initial begin
        // Initialize inputs
        reset = 1;
        start = 0;
        data_in_ready = 0;
        main_mode = 2'b00;
        data_in = 64'h0;

        // Apply reset
        #100;
        #1;
        reset = 0;
        
        //padder
        start = 1;
        data_in_ready = 1;
        //in =  64'b1101011111110100101000100011001001100101101111001110110010100101;
        data_in = 64'hFFFFFFFFFFFFFFFF;
        #10;
        start = 0;
        //in =  64'b0011010011011100011010100110110110000001110000010100101001100000;
        data_in = 64'hFFFFFFFFFFFFFFFF;
        #10;
        //in =  64'b0110100000011101010100001011010111110110101010010101111011111101;
        data_in = 64'hFFFFFFFFFFFFFFFF;
        #10;
        //in =  64'b1101001100000010101011000000101110000100100011101000010101110001;
        data_in = 64'hFFFFFFFFFFFFFFFF;
        #10;
        //
        #10;
        #10;
        data_in_ready = 0;
        

        // Complete simulation
        #200;
        $stop;
    end
    
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

`timescale 1ns / 1ps

module tb_bit_converter;
    reg clk;
    reg reset;
    reg start;
    reg [12:0] in;
    wire in_en;
    wire [7:0] in_addr;
    wire [63:0] out;
    wire out_en;
    wire [5:0] out_addr;  // log2(52) = 6
    wire done;

    // �Ҥ� DUT (Device Under Test)
    Bit_Converter uut (
        .clk(clk),
        .reset(reset),
        .start(start),
        .in(in),
        .in_en(in_en),
        .in_addr(in_addr),
        .out(out),
        .out_en(out_en),
        .out_addr(out_addr),
        .done(done)
    );


    always #10 clk = ~clk;


    reg [12:0] test_data [0:255]; 
    integer i;

    initial begin
        clk = 1;
        reset = 1;
        start = 0;
        in = 13'd0;

        for (i = 0; i < 256; i = i + 1) begin
            test_data[i] = $random & 13'h1FFF;
        end

        // Reset
        #50 reset = 0; 
        #50 reset = 1; 
        #50 reset = 0; 
  
        #50 start = 1; 
        #20 start = 0; 

        for (i = 0; i < 256; i = i + 1) begin
            if (in_en) begin
                in = test_data[i];
                #20;
            end
        end


        wait(done);


        #100;
        $display("Test Completed Successfully!");
        $finish;
    end

    initial begin
        $dumpfile("bit_converter.vcd");
        $dumpvars(0, tb_bit_converter);
    end
endmodule

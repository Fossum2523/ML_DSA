`timescale 1ns / 1ps

module Modular_Reduction(
    input               clk,
    input               reset,
    input       [45:0]  in,
    output reg  [22:0]  out
    );

    wire    [22:0]  x;
    wire    [1:0]   adder_0;
    wire    [34:0]  adder_1;
    wire    [23:0]  y;
    wire    [1:0]   z;
    wire    [26:0]  adder_2;
    wire    [22:0]  temp_0;
    wire    [14:0]  temp_1;
    wire    [26:0]  adder_3;
    wire    [23:0]  adjust;
    wire    [23:0]  adder_4;


    reg     [26:0]  adder_2_temp;
    reg     [11:0]  concatenate_temp;
    

    //stage 1 ------------------------------------------------str
    assign adder_0 = in[23] + in[33] + in[43];

    assign adder_1 = {in[45:43],9'd0,in[45:44]} + {in[45:33],2'd0,in[42:34]} + {in[45:23],2'd0,in[32:24]} + adder_0[1];
    //stage 1 ------------------------------------------------end


    //stage 2 ------------------------------------------------str
    assign adder_2 =  in[22:0] - adder_1[34:11] - adder_1[10:9];

    always @(posedge clk) begin
        if(reset)
            adder_2_temp <= 27'd0;
        else
            adder_2_temp <= adder_2;
    end

    always @(posedge clk) begin
        if(reset)
            concatenate_temp <= 12'd0;
        else
            concatenate_temp <= {adder_1[10:9],adder_1[8:0],adder_0[0]};
    end

    //stage 2 ------------------------------------------------end




    //stage 3 ------------------------------------------------str
    assign temp_0 = concatenate_temp[9:0] << 13;

    assign temp_1 = concatenate_temp[11:10] << 13;

    assign adder_3 = adder_2_temp + temp_0 + temp_1; 
    //stage 3 ------------------------------------------------end


    //stage 4 ------------------------------------------------str
    assign adjust = adder_3 >= 16760834 ? 24'd8380417 : 24'd8396799;

    assign adder_4 = adder_3[23:0] + adjust;

    always @(posedge clk) begin
        if(reset)
            out <= 23'd0;
        else
            out <= adder_4[23] ?  adder_3[22:0] : adder_4[22:0];
    end
    //stage 4 ------------------------------------------------end
endmodule

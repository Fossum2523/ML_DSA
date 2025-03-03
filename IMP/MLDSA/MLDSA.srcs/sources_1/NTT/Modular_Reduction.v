module Modular_Reduction(
    input       [45:0]  in,
    output      [22:0]  out
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

    assign x = in[22:0];

    assign adder_0 = in[23] + in[33] + in[43];

    assign adder_1 = {in[45:43],9'd0,in[45:44]} + {in[45:33],2'd0,in[42:34]} + {in[45:23],2'd0,in[32:24]} + adder_0[1];

    assign y = adder_1[34:11];

    assign z = adder_1[10:9];

    assign adder_2 =  x - y - z;

    assign temp_0 = ({adder_1[8:0],adder_0[0]}) << 13;

    assign temp_1 = z << 13;

    assign adder_3 = adder_2 + temp_0 + temp_1; 
 
    // assign adjust = adder_3[26] ? 24'd8380417 : 24'd8396799;
    assign adjust = adder_3 >= 16760834 ? 24'd8380417 : 24'd8396799;
    // assign adjust = 24'd8380417;

    assign adder_4 = adder_3[23:0] + adjust;
    // assign adder_4 = adder_3 >= 16760834 ? adder_3 + 24'd8380417 : adder_3 - 24'd8380417;
    
    assign out = adder_4[23] ?  adder_3[22:0] : adder_4[22:0];
endmodule

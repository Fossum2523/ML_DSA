module ExpandS(   
    input               clk,
    input               reset,

    /*---Control Signal---"*/
    input               sampler_in_ready,
    input   [7:0]       sampler_in,
    input   [8:0]       j,

    output  [8:0]       j_next,     // Increment value for j

    /*---S1 Mem---"*/
    output  [22:0]      z0,               // Write data z0_tmp to Mem
    output  [22:0]      z1,               // Write data z1_tmp to Mem
    output  [7:0]       addr_z0,          // Write addresses for z0_tmp
    output  [7:0]       addr_z1,          // Write addresses for z1_tmp
    output              en_z0,            // Write enable for z0 values
    output              we_z0,            // Write enable for z0 values
    output              en_z1,            // Write enable for z1 values
    output              we_z1             // Write enable for z1 values
    );  

    wire [1:0]  j_plus_num;
    // Outputs from CoeffFromHalfByte instances
    wire [2:0]  CFHB_0_out;
    wire [2:0]  CFHB_1_out;

    // Intermediate data wires
    wire        a;          // Comparison flags
    wire        b;          // Comparison flags

    wire [2:0]  z0_tmp;
    wire [2:0]  z1_tmp;

    assign a = sampler_in[3:0] == 4'd15;
    assign b = sampler_in[7:4] == 4'd15;

    CoeffFromHalfByte CFHB_0 (.in(sampler_in[3:0]), .out(CFHB_0_out));
    CoeffFromHalfByte CFHB_1 (.in(sampler_in[7:4]), .out(CFHB_1_out));

    assign z0_tmp = a ? CFHB_1_out : CFHB_0_out;
    assign z1_tmp = CFHB_1_out;

    assign z0 = z0_tmp[2] ?  {{20{1'b1}}, z0_tmp} + 23'd8380417 : {20'd0, z0_tmp}; //Width_Expansion 
    assign z1 = z1_tmp[2] ?  {{20{1'b1}}, z1_tmp} + 23'd8380417 : {20'd0, z1_tmp}; //Width_Expansion

    assign addr_z0 = j[7:0];
    assign addr_z1 = j[7:0] + 1'b1;

    assign en_z0 = (~a | ~b) && sampler_in_ready;
    assign we_z0 = en_z0;
    assign en_z1 = j != 255 && (~a & ~b) && sampler_in_ready;
    assign we_z1 = en_z1;
    
    assign j_plus_num = (~a) + (~b); // Increment logic

    assign j_next = j + j_plus_num;
endmodule
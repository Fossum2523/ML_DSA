module ExpandA(   
    input               clk,
    input               resetn,

    /*---Control Signal---"*/
    input               sampler_in_ready,
    input   [47:0]      sampler_in,
    input   [8:0]       j,
    output  [8:0]       j_next,     // Increment value for j

    /*---A Mem---"*/
    output  [22:0]      A0,             // Write data A0 to Mem
    output  [22:0]      A1,             // Write data A1 to Mem
    output  [7:0]       addr_A0,        // Write addresses for A0
    output  [7:0]       addr_A1,        // Write addresses for A1
    output              en_A0,          // enable for A0 values
    output              we_A0,          // Write enable for A0 values
    output              en_A1,          // enable for A1 values
    output              we_A1           // Write enable for A1 values
    );  
    

    wire [1:0]   j_plus_num; // Increment value for j

    wire         rej0;
    wire         rej1;


    assign rej0 = sampler_in[23 - 1:0] >= 8380417;
    assign rej1 = sampler_in[47 - 1:24] >= 8380417;

    assign A0 = rej0 ? sampler_in[47 - 1:24] : sampler_in[23 - 1:0];
    assign A1 = sampler_in[47 - 1:24];

    assign addr_A0 = j[7:0];
    assign addr_A1 = j[7:0] + 1'b1;

    assign en_A0 = sampler_in_ready && ~j[8];
    assign we_A0 = en_A0;
    assign en_A1 = sampler_in_ready && j != 255 && ~j[8];
    assign we_A1 = en_A1;
    
    assign j_plus_num = (~rej0) + (~rej1); // Increment logic

    assign j_next = j + j_plus_num;
endmodule
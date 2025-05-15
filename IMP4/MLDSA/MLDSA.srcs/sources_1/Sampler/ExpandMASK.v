module ExpandMASK(   
    input               clk,
    input               reset,

    /*---Control Signal---"*/
    input               sampler_in_ready,
    input   [35:0]      sampler_in,
    input   [8:0]       j,
    output  [8:0]       j_next,     // Increment value for j

    /*---y Mem---"*/
    output  [22:0]      y0,               // Write data z0_tmp to Mem
    output  [22:0]      y1,               // Write data z1_tmp to Mem
    output  [7:0]       addr_y0,          // Write addresses for z0_tmp
    output  [7:0]       addr_y1,          // Write addresses for z1_tmp
    output              en_y,             // Write enable for z values
    output              we_y              // Write enable for z values
    );  

    wire [17:0]  H0;            // Split mux output
    wire [17:0]  H1;            // Split mux output
    wire         larger_0;      // Flags for larger comparisons
    wire         larger_1;      // Flags for larger comparisons
    wire [22:0]  y_minuend_0;   // Minuends for subtraction
    wire [22:0]  y_minuend_1;   // Minuends for subtraction
    wire [17:0]  y_subtrahend_0;// Subtrahends for subtraction
    wire [17:0]  y_subtrahend_1;// Subtrahends for subtraction

    assign H0 = sampler_in[17:0];
    assign H1 = sampler_in[35:18];

    assign larger_0 = H0 > 131072;
    assign larger_1 = H1 > 131072;

    assign y_minuend_0 = larger_0 ? 23'd8380417 : 23'd131072;
    assign y_minuend_1 = larger_1 ? 23'd8380417 : 23'd131072;

    assign y_subtrahend_0 = larger_0 ? {1'b0,H0[16:0]} : H0;
    assign y_subtrahend_1 = larger_1 ? {1'b0,H1[16:0]} : H1;

    assign y0 = y_minuend_0 - {6'd0, y_subtrahend_0};
    assign y1 = y_minuend_1 - {6'd0, y_subtrahend_1};

    assign addr_y0 = j[7:0];
    assign addr_y1 = j[7:0] + 1'b1;

    assign en_y = sampler_in_ready && ~j[8];

    assign we_y = sampler_in_ready && ~j[8];

    assign j_next = j + 2'd2;
endmodule
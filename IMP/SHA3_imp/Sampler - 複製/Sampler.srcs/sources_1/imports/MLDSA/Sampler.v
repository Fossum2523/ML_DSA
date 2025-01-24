module Sampler(
    input                   clk,
    input                   reset,
    input       [1:0]       mode,
    input                   sampler_in_ready,
    input       [1343:0]    sampler_in,

    //*---ExpandS---"*/
    output              sampler_squeeze,  // Flag for squeezing condition
    output              next_element,   // Flag for memory full condition

    /*---S---"*/
    output  [22:0]      z0,             // Write data z0 to Mem
    output  [22:0]      z1,             // Write data z1 to Mem
    output  [7:0]       addr_z0,        // Write addresses for z0
    output  [7:0]       addr_z1,        // Write addresses for z1
    output              en_z0,           // enable for z values
    output              we_z0,           // Write enable for z values
    output              en_z1,           // enable for z values
    output              we_z1,           // Write enable for z values

    /*---A---"*/
    output  [22:0]      A0,             // Write data A0 to Mem
    output  [22:0]      A1,             // Write data A1 to Mem
    output  [7:0]      addr_A0,        // Write addresses for A0
    output  [7:0]      addr_A1,        // Write addresses for A1
    output              en_A0,           // enable for A values
    output              we_A0,           // Write enable for A values
    output              en_A1,           // enable for A values
    output              we_A1,           // Write enable for A values

    /*---y---"*/
    output  [22:0]      y0,             // Write data z0 to Mem
    output  [22:0]      y1,             // Write data z1 to Mem
    output  [7:0]       addr_y0,        // Write addresses for z0
    output  [7:0]       addr_y1,        // Write addresses for z1
    output              en_y,           // enable for z values
    output              we_y,           // Write enable for z values

    /*---c---"*/
    output  [22:0]      ci,             // Write data ci to Mem
    output  [22:0]      cj,             // Write data cj to Mem
    output  [7:0]       addr_ci,        // Write addresses for ci
    output  [7:0]       addr_cj,        // Write addresses for cj
    output              en_ci,          // enable for ci values
    output              en_cj,          // enable for cj values
    output              we_ci,          // Write enable for ci values
    output              we_cj           // Write enable for cj values
    );
    
    reg              sampler_in_ready_buffer;
    reg  [1343:0]    sampler_in_buffer;

    localparam [1:0] S_mode = 2'd0,
                     A_mode = 2'd1,
                     MASK_mode = 2'd2,
                     SIB_mode = 2'd3;

    wire sampler_in_ready_S;
    wire sampler_in_ready_A;    
    wire sampler_in_ready_MASK;    
    wire sampler_in_ready_SIB;        

    wire sampler_squeeze_S;
    wire sampler_squeeze_A;
    wire sampler_squeeze_MASK;
    wire sampler_squeeze_SIB;

    wire next_element_S;
    wire next_element_A;
    wire next_element_MASK;
    wire next_element_SIB;


    assign sampler_in_ready_S       = mode == S_mode    ?  sampler_in_ready_buffer : 1'b0;
    assign sampler_in_ready_A       = mode == A_mode    ?  sampler_in_ready_buffer : 1'b0;
    assign sampler_in_ready_MASK    = mode == MASK_mode ?  sampler_in_ready_buffer : 1'b0;
    assign sampler_in_ready_SIB     = mode == SIB_mode  ?  sampler_in_ready_buffer : 1'b0;

    assign sampler_squeeze = mode == S_mode    ? sampler_squeeze_S    :
                             mode == A_mode    ? sampler_squeeze_A    :
                             mode == MASK_mode ? sampler_squeeze_MASK :
                             mode == SIB_mode  ? sampler_squeeze_SIB  : 1'b0;

    assign next_element = mode == S_mode    ? next_element_S    :
                          mode == A_mode    ? next_element_A    :
                          mode == MASK_mode ? next_element_MASK :
                          mode == SIB_mode  ? next_element_SIB  : 1'b0;

    ExpandS ExpandS_(
        .clk(clk),
        .reset(reset),
        .sampler_in_ready(sampler_in_ready_S),
        .sampler_in(sampler_in_buffer),
        .sampler_squeeze(sampler_squeeze_S),
        .next_element(next_element_S),
        .z0(z0),
        .z1(z1),
        .addr_z0(addr_z0),
        .addr_z1(addr_z1),
        .en_z0(en_z0),
        .we_z0(we_z0),
        .en_z1(en_z1),
        .we_z1(we_z1)
    );   

    ExpandA ExpandA_(
        .clk(clk),
        .reset(reset),
        .sampler_in_ready(sampler_in_ready_A),
        .sampler_in(sampler_in_buffer),
        .sampler_squeeze(sampler_squeeze_A),
        .next_element(next_element_A),
        .A0(A0),
        .A1(A1),
        .addr_A0(addr_A0),
        .addr_A1(addr_A1),
        .en_A0(en_A0),
        .we_A0(we_A0),
        .en_A1(en_A1),
        .we_A1(we_A1)
    );

    ExpandMASK ExpandMASK_(
        .clk(clk),
        .reset(reset),
        .sampler_in_ready(sampler_in_ready_MASK),
        .sampler_in(sampler_in),
        .sampler_squeeze(sampler_squeeze_MASK),
        .next_element(next_element_MASK),
        .y0(y0),
        .y1(y1),
        .addr_y0(addr_y0),
        .addr_y1(addr_y1),
        .en_y(en_y),
        .we_y(we_y)
    );

    SampleInBall SampleInBall_(
        .clk(clk),
        .reset(reset),
        .sampler_in_ready(sampler_in_ready_SIB),
        .sampler_in(sampler_in_buffer),
        .sampler_squeeze(sampler_squeeze_SIB),
        .next_element(next_element_SIB),
        .ci(ci),
        .cj(cj),
        .addr_ci(addr_ci),
        .addr_cj(addr_cj),
        .en_ci(en_ci),
        .en_cj(en_cj),
        .we_ci(we_ci),
        .we_cj(we_cj)
    );

    always @(posedge clk) begin
        if(reset)
            sampler_in_buffer <= 1344'd0;
        else if(sampler_in_ready)
            sampler_in_buffer <= sampler_in; 
    end

    always @(posedge clk) begin
        if(reset)
            sampler_in_ready_buffer <= 1'd0;
        else if(sampler_in_ready)
            sampler_in_ready_buffer <= sampler_in_ready; 
        else
            sampler_in_ready_buffer <= 1'd0;
    end
endmodule
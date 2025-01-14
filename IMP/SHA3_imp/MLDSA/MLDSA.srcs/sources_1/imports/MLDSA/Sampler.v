module Sampler(
    input                   clk,
    input                   reset,
    input                   sampler_in_ready,
    input       [1343:0]    sampler_in,

    //*---ExpandS---"*/
    output              sampler_squeeze,  // Flag for squeezing condition
    output              next_element,   // Flag for memory full condition

    /*---S1 Mem---"*/
    output  [22:0]      z0,             // Write data z0 to Mem
    output  [22:0]      z1,             // Write data z1 to Mem
    output  [9:0]       waddr_z0,       // Write addresses for z0
    output  [9:0]       waddr_z1,       // Write addresses for z1
    output              wen_z           // Write enable for z values
    );
    
    reg              sampler_in_ready_buffer;
    reg  [1343:0]    sampler_in_buffer;

    ExpandS ExpandS_(
        .clk(clk),
        .reset(reset),
        .sampler_in_ready(sampler_in_ready_buffer),
        .sampler_in(sampler_in_buffer),
        .sampler_squeeze(sampler_squeeze),
        .next_element(next_element),
        .z0(z0),
        .z1(z1),
        .waddr_z0(waddr_z0),
        .waddr_z1(waddr_z1),
        .wen_z(wen_z)
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
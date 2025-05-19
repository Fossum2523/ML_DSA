module SampleInBall(   
    input                   clk,
    input                   resetn,

    /*---Control Signal---"*/
    input               sampler_in_ready,
    input   [63:0]      sampler_in,
    input   [8:0]       j,
    output  [8:0]       j_next,     // Increment value for j
    output reg          load_H,

    /*---c Mem---"*/
    output      [22:0]      ci,                 // Write data c to Mem
    output      [7:0]       addr_ci,            // Write addresses for c
    output reg  [7:0]       addr_cj,            // Write addresses for c
    output                  en_ci,              // enable for c values
    output                  en_cj,              // enable for c values
    output                  we_ci,              // Write enable for c values
    output                  we_cj               // Write enable for c values
    );  
    
    // Intermediate registers and wires
    reg  [63:0]  H;
    wire [7:0]   i;             // Sampler for element addressing

    wire            rej;
    wire            j_plus_num; // Increment value for j
    wire    [8:0]   j_bios;
    reg             en_cj_temp;  

    assign i = sampler_in[7:0];

    assign j_bios = (j + 9'd217);

    assign rej = i > j_bios;

    assign ci = H[0] ? 23'd8380416 : 23'd1;

    assign addr_ci = i;

    assign en_ci = sampler_in_ready && ~rej && load_H;

    assign we_ci = en_ci;
    
    assign en_cj = en_cj_temp & (addr_ci!=addr_cj);

    assign we_cj = en_cj;

    assign j_plus_num = ~rej && load_H; // Increment logic

    assign j_next = j + j_plus_num;


    always @(posedge clk or negedge resetn) begin
        if (!resetn)
            addr_cj <=  8'd0;
        else
            addr_cj <= j_bios;  
    end

    always @(posedge clk or negedge resetn) begin
        if (!resetn)
            en_cj_temp <=  1'b0;
        else
            en_cj_temp <= en_ci && load_H;  
    end
    
    always @(posedge clk or negedge resetn) begin
        if (!resetn) 
            load_H <= 1'b0;
        else if(j[8])
            load_H <= 1'b0;
        else if (sampler_in_ready)
            load_H <= 1'b1; 
    end

    always @(posedge clk or negedge resetn) begin
        if(!resetn)
            H = 64'd0;
        else if(sampler_in_ready && ~load_H)
            H = sampler_in[63:0];
        else if(sampler_in_ready && ~rej)
            H = {1'b0,H[63:1]};
    end
endmodule
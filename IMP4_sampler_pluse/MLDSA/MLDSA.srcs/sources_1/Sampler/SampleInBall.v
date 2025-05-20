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
    input       [22:0]      ci_previous,
    output      [22:0]      ci,                 // Write data c to Mem
    output      [22:0]      cj,                 // Write data c to Mem
    output      [7:0]       addr_ci,            // Write addresses for c
    output      [7:0]       addr_cj,            // Write addresses for c
    output reg              en_ci,              // enable for c values
    output reg              en_cj,              // enable for c values
    output reg              we_ci,              // Write enable for c values
    output reg              we_cj,              // Write enable for c values
    output                  o_done
    );  
    
    // Intermediate registers and wires
    reg  [63:0]  H;
    wire [7:0]   i;             // Sampler for element addressing

    wire            rej;
    wire            j_plus_num; // Increment value for j
    wire    [8:0]   j_bios;
    reg             en_cj_temp;  

    localparam S_SAMPLE = 1'b0,
               S_WMEM   = 1'b1;

    reg curr_state;
    reg next_state;

    assign i = sampler_in[7:0];

    assign j_bios = (j + 9'd217);

    assign rej = i > j_bios;

    assign ci = H[0] ? 23'd8380416 : 23'd1;

    assign cj = ci_previous;

    assign addr_ci = i;

    assign addr_cj = j_bios;

    assign j_plus_num = curr_state == S_WMEM ? ~rej && load_H : 1'b0; // Increment logic

    assign j_next = j + j_plus_num;

    assign o_done = curr_state == S_WMEM ? 1'b1 : rej;


    // always @(posedge clk or negedge resetn) begin
    //     if (!resetn)
    //         addr_cj <=  8'd0;
    //     else
    //         addr_cj <= j_bios;  
    // end

    // always @(posedge clk or negedge resetn) begin
    //     if (!resetn)
    //         en_cj_temp <=  1'b0;
    //     else
    //         en_cj_temp <= en_ci && load_H;  
    // end
    
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
        else if(sampler_in_ready && ~rej && curr_state == S_WMEM)
            H = {1'b0,H[63:1]};
    end

    always @(posedge clk or negedge resetn) begin
        if(!resetn)
            curr_state <= S_SAMPLE;
        else
            curr_state <= next_state;
    end

    always @(*) begin
        case (curr_state)
            S_SAMPLE:begin
                if(sampler_in_ready && ~rej && load_H)
                    next_state <= S_WMEM;
                else   
                    next_state <= S_SAMPLE;
            end
            S_WMEM:begin
                next_state <= S_SAMPLE;
            end
        endcase
    end
    // assign en_ci = sampler_in_ready && ~rej && load_H;

    // assign we_ci = en_ci;
    
    // assign en_cj = en_cj_temp & (addr_ci!=addr_cj);

    // assign we_cj = en_cj;

    always @(*) begin
        en_ci = 1'b0;
        en_cj = 1'b0;
        we_ci = 1'b0;
        we_cj = 1'b0;
        case (curr_state)
            S_SAMPLE:begin
                en_ci = sampler_in_ready && ~rej && load_H;
                en_cj = 1'b0;
                we_ci = 1'b0;
                we_cj = 1'b0;
            end
            S_WMEM:begin
                en_ci = 1'b1;
                en_cj = 1'b1;
                we_ci = (addr_ci!=addr_cj);
                we_cj = (addr_ci!=addr_cj);
            end
        endcase
    end
endmodule
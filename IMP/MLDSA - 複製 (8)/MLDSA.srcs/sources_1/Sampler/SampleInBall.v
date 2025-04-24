module SampleInBall(   
    input                   clk,
    input                   reset,

    /*---Control Signal---"*/
    input                   sampler_in_ready,
    input       [1343:0]    sampler_in,
    output                  sampler_squeeze,    // Flag for squeezing condition
    output                  next_element,

    /*---c Mem---"*/
    output      [22:0]      ci,                 // Write data c to Mem
    output      [7:0]       addr_ci,            // Write addresses for c
    output reg  [7:0]       addr_cj,            // Write addresses for c
    output                  en_ci,              // enable for c values
    output                  en_cj,              // enable for c values
    output                  we_ci,              // Write enable for c values
    output                  we_cj               // Write enable for c values
    );  

    /*---FSM---"*/
    localparam  SAMPLE_WAIT     = 1'd0,
                SAMPLE_PROCESS  = 1'd1;

    // State variables
    reg curr_state;
    reg next_state;
    

    // Intermediate registers and wires
    reg          load_H;
    reg  [63:0]  H;
    wire [7:0]   mux_data_out;
    wire [7:0]   i;             // Sampler for element addressing
    // reg  [7:0]   j;             // Counter for element addressing
    // wire         j_plus_num;    // Increment value for j
    wire         rej;
    // reg  [7:0]   shake_cnt;     // Counter for shake operations
    reg  [7:0]   shake_cnt; // Counter for shake operations
    reg  [8:0]   j; // Counter for element addressing
    wire [8:0]   j_next;
    wire         j_plus_num; // Increment value for j
    wire         last_C;
    reg          en_cj_temp;  

    mux_gen #( 
        .param_in(1088),
        .param_m(8)
    ) mux_(
        .in(sampler_in[1087:0]),
        .sel(shake_cnt),
        .out(mux_data_out)
    );

    assign i = mux_data_out;

    assign rej = i > j;

    assign ci = H[0] ? 23'd8380416 : 23'd1;

    assign addr_ci = i;

    assign en_ci = curr_state == SAMPLE_PROCESS && ~rej;

    assign we_ci = curr_state == SAMPLE_PROCESS && ~rej;
    
    assign we_cj = en_cj;

    assign j_plus_num = ~rej; // Increment logic

    assign j_next = j + j_plus_num;

    assign last_c = j_next[8];

    assign sampler_squeeze = shake_cnt == 8'd135; // Shake condition

    assign next_element = j[8];

    always @(posedge clk) begin
        if (reset)
            addr_cj <=  8'd0;
        else
            addr_cj <= j;  
    end

    always @(posedge clk) begin
        if (reset)
            en_cj_temp <=  1'b0;
        else
            en_cj_temp <= en_ci;  
    end

    assign en_cj = en_cj_temp & (addr_ci!=addr_cj);
    assign we_cj = en_cj;
    
    always @ (posedge clk) begin
        if (reset)
            shake_cnt <= 8'd0;
        else if(~load_H)
            shake_cnt <= 8'd8;
        else if (curr_state == SAMPLE_PROCESS)
            shake_cnt <= shake_cnt == 135 ? 8'd0 : shake_cnt + 1'b1; // Reset or increment
        else if (curr_state == SAMPLE_WAIT)
            shake_cnt <= 8'd0;
    end

    always @ (posedge clk) begin
        if (reset)
            j <=  8'd217;
        else if (next_element)
            j <=  8'd217;
        else if (curr_state == SAMPLE_PROCESS)
            j <= j_next;  
    end
    
    always @(posedge clk) begin
        if (reset) 
            load_H <= 1'b0;
        else if (sampler_in_ready)
            load_H <= 1'b1; 
    end

    always @(posedge clk) begin
        if(reset)
            H = 64'd0;
        else if(sampler_in_ready && ~load_H)
            H = sampler_in[63:0];
        else if((curr_state == SAMPLE_PROCESS) && ~rej)
            H = {1'b0,H[63:1]};
    end

    always @ (posedge clk) begin
        if (reset)
            curr_state <= SAMPLE_WAIT;
        else 
            curr_state <= next_state;
    end

    always @(*) begin
        case (curr_state)
            SAMPLE_WAIT: begin
                if(sampler_in_ready) next_state = SAMPLE_PROCESS;
                else next_state = SAMPLE_WAIT;
            end 
            SAMPLE_PROCESS: begin
                if(last_c || next_element) next_state = SAMPLE_WAIT;
                else next_state = SAMPLE_PROCESS;
            end
            default: next_state = SAMPLE_WAIT;
        endcase
    end

endmodule
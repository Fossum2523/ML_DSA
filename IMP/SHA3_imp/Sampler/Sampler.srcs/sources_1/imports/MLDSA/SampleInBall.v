module SampleInBall(   
    input                   clk,
    input                   reset,

    /*---Control Signal---"*/
    input                   sampler_in_ready,
    input       [1343:0]    sampler_in,
    output                  sampler_squeeze,    // Flag for squeezing condition

    /*---c Mem---"*/
    output      [22:0]      ci,                 // Write data c to Mem
    output      [22:0]      cj,                 // Write data c to Mem
    output      [7:0]       addr_ci,            // Write addresses for c
    output reg  [7:0]       addr_cj,            // Write addresses for c
    output                  en_ci,              // enable for c values
    output reg              en_cj,              // enable for c values
    output                  we_ci,              // Write enable for c values
    output reg              we_cj,              // Write enable for c values

    output                  done_SIB
    );  

    /*---FSM---"*/
    localparam  [2:0]   SAMPLE_WAIT     = 3'd0,
                        SQUEEZE         = 3'd1,
                        SAMPLE_PROCESS  = 3'd2;

    // State variables
    reg [2:0]    curr_state;
    reg [2:0]    next_state;
    

    // Intermediate registers and wires
    reg          load_H;
    reg  [63:0]  H;
    wire [7:0]   mux_data_out;
    wire [7:0]   i;             // Sampler for element addressing
    reg  [7:0]   j;             // Counter for element addressing
    wire         j_plus_num;    // Increment value for j
    wire         rej;
    reg  [7:0]   shake_cnt;     // Counter for shake operations


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
    // assign addr_cj = j;

    assign en_ci = curr_state == SAMPLE_PROCESS && ~rej;

    assign we_ci = curr_state == SAMPLE_PROCESS && ~rej;
    
    assign j_plus_num = rej ? 1'd0 : 1'b1; // Increment logic

    assign sampler_squeeze = shake_cnt == 8'd135; // Shake condition

    assign done_SIB = j == 0;

    always @(posedge clk) begin
        if (reset)
            addr_cj <=  8'd0;
        else
            addr_cj <= j;  
    end

    always @(posedge clk) begin
        if (reset)
            en_cj <=  1'b0;
        else
            en_cj <= en_ci;  
    end

    always @(posedge clk) begin
        if (reset)
            we_cj <=  1'b0;
        else
            we_cj <= we_ci;  
    end

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
        else if ((curr_state == SAMPLE_PROCESS))
            j <= j + j_plus_num;  
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
        else if(~rej)//有可能在squeeze的時候誤觸
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
                if(sampler_squeeze || done_SIB) next_state = SAMPLE_WAIT;
                else next_state = SAMPLE_PROCESS;
            end
            default: next_state = SAMPLE_WAIT;
        endcase
    end

endmodule
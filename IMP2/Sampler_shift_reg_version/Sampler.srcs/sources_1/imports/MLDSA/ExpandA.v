module ExpandA(   
    input               clk,
    input               reset,

    /*---Control Signal---"*/
    input               sampler_in_ready,
    input   [1343:0]    sampler_in,
    input   [8:0]       j,
    output              sampler_squeeze,// Flag for squeezing condition
    output              next_element,   // Flag for memory full condition
    output  [8:0]       j_next,

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

    /*---FSM---"*/
    localparam  SAMPLE_WAIT     = 1'd0,
                SAMPLE_PROCESS  = 1'd1;

    // State variables
    reg     curr_state;
    reg     next_state;
    

    // Intermediate registers and wires
    reg  [7:0]   shake_cnt; // Counter for shake operations
    
    wire [8:0]   j_next;
    wire [1:0]   j_plus_num; // Increment value for j
    wire         last_A;

    wire         rej0;
    wire         rej1;
    wire [47:0]  mux_data_out;

    mux_gen #(
        .param_in(1344),
        .param_m(48)
    ) mux_(
        .in(sampler_in[1343:0]),
        .sel(shake_cnt),
        .out(mux_data_out)
    );

    assign rej0 = mux_data_out[23 - 1:0] >= 8380417;
    assign rej1 = mux_data_out[47 - 1:24] >= 8380417;

    assign A0 = rej0 ? mux_data_out[47 - 1:24] : mux_data_out[23 - 1:0];
    // assign A0 = 1'b1 ? mux_data_out[47 - 1:24] : mux_data_out[23 - 1:0];
    assign A1 = mux_data_out[47 - 1:24];

    assign addr_A0 = j[7:0];
    assign addr_A1 = j[7:0] + 1'b1;

    assign en_A0 = curr_state == SAMPLE_PROCESS && ~j[8];
    assign we_A0 = en_A0;
    assign en_A1 = curr_state == SAMPLE_PROCESS && j != 255 && ~j[8];
    assign we_A1 = en_A1;
    
    assign j_plus_num = (~rej0) + (~rej1); // Increment logic

    assign j_next = j + j_plus_num;

    assign last_A = j_next[8];

    assign sampler_squeeze = shake_cnt == 8'd27 && ~last_A; // Shake condition

    assign next_element = j[8]; // Memory full condition

    always @ (posedge clk) begin
        if (reset)
            shake_cnt <= 8'd0;
        else if (curr_state == SAMPLE_PROCESS)
            shake_cnt <= shake_cnt == 27 ? 8'd0 : shake_cnt + 1'b1; // Reset or increment
        else if (curr_state == SAMPLE_WAIT)
            shake_cnt <= 8'd0;
    end

    always @ (posedge clk) begin
        if (reset)
            j <=  9'd0;
        else if (next_element)
            j <=  9'd0; 
        else if (curr_state == SAMPLE_PROCESS)
            j <= j_next;  
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
                if(last_A || sampler_squeeze) next_state = SAMPLE_WAIT;
                else next_state = SAMPLE_PROCESS;
            end
            default: next_state = SAMPLE_WAIT;
        endcase
    end

endmodule
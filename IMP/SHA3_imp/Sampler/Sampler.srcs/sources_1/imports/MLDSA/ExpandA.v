module ExpandA(   
    input               clk,
    input               reset,

    /*---Control Signal---"*/
    input               sampler_in_ready,
    input   [1343:0]    sampler_in,
    output              sampler_squeeze,// Flag for squeezing condition
    output              next_element,   // Flag for memory full condition

    /*---A Mem---"*/
    output  [22:0]      A0,             // Write data A0 to Mem
    output  [22:0]      A1,             // Write data A1 to Mem
    output  [11:0]      addr_A0,        // Write addresses for A0
    output  [11:0]      addr_A1,        // Write addresses for A1
    output              en_A,           // Write enable for A values
    output              we_A            // Write enable for A values
    );  

    /*---FSM---"*/
    localparam  [2:0]   SAMPLE_WAIT     = 3'd0,
                        SQUEEZE         = 3'd1,
                        SAMPLE_PROCESS  = 3'd2;

    // State variables
    reg [2:0]   curr_state;
    reg [2:0]   next_state;
    

    // Intermediate registers and wires
    reg [3:0]   element_choose; // For selecting elements
    reg [8:0]   j; // Counter for element addressing
    reg [7:0]   shake_cnt; // Counter for shake operations

    wire [1:0]  j_plus_num; // Increment value for j

    // Intermediate data wires
    wire   rej;

    wire [47:0] mux_data_out;

    mux_gen #(
        .param_in(1344),
        .param_m(48)
    ) mux_(
        .in(sampler_in[1343:0]),
        .sel(shake_cnt),
        .out(mux_data_out)
    );

    assign A0 = mux_data_out[23 - 1:0];
    assign A1 = mux_data_out[47 - 1:24];

    assign rej0 = A0 >= 8380417;
    assign rej1 = A1 >= 8380417;

    assign addr_A0 = {element_choose, j[7:0]};
    assign addr_A1 = {element_choose, (j[7:0] + 1'b1)};

    assign we_A = curr_state == SAMPLE_PROCESS && ~j[8];
    
    assign j_plus_num = (j[7:0] == 255 && ~rej0 && ~rej1) ? 2'd1 : ((~rej0) + (~rej1)); // Increment logic

    assign sampler_squeeze = shake_cnt == 8'd27 && ~j[8]; // Shake condition

    assign next_element = j[8]; // Memory full condition

    always @(posedge clk) begin
        if (reset)
            element_choose <= 4'd0; 
        else if((curr_state == SAMPLE_PROCESS) && j[8])
            element_choose <= element_choose + 1'b1;
    end

    always @ (posedge clk) begin
        if (reset)
            shake_cnt <= 8'd0;
        else if (curr_state == SAMPLE_PROCESS)
            shake_cnt <= shake_cnt == 27 ? 8'd0 : shake_cnt + 1'b1; // Reset or increment
        else if (curr_state == SAMPLE_WAIT && next_element)
            shake_cnt <= 8'd0;
    end

    always @ (posedge clk) begin
        if (reset)
            j <=  9'd0;
        else if ((curr_state == SAMPLE_PROCESS) && (~next_element))
            j <= j + j_plus_num; 
        else if (curr_state == SAMPLE_WAIT && next_element)
            j <=  9'd0; 
        
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
                if(next_element || sampler_squeeze) next_state = SAMPLE_WAIT;
                else next_state = SAMPLE_PROCESS;
            end
            default: next_state = SAMPLE_WAIT;
        endcase
    end

endmodule
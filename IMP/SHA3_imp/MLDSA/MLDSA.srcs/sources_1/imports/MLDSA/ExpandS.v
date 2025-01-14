module ExpandS(   
    input               clk,
    input               reset,

    /*---Control Signal---"*/
    input               sampler_in_ready,
    input   [1343:0]    sampler_in,
    output              sampler_squeeze,  // Flag for squeezing condition
    output              next_element,   // Flag for memory full condition

    /*---S1 Mem---"*/
    output  [22:0]      z0,             // Write data z0_tmp to Mem
    output  [22:0]      z1,             // Write data z1_tmp to Mem
    output  [9:0]       waddr_z0,       // Write addresses for z0_tmp
    output  [9:0]       waddr_z1,       // Write addresses for z1_tmp
    output              wen_z           // Write enable for z values
    );  

    /*---FSM---"*/
    localparam  [2:0]   SAMPLE_WAIT     = 3'd0,
                        SQUEEZE         = 3'd1,
                        SAMPLE_PROCESS  = 3'd2, 
                        SAMPLE_OVER     = 3'd3;

    // State variables
    reg [2:0]   curr_state;
    reg [2:0]   next_state;
    

    // Intermediate registers and wires
    reg [1:0]   element_choose; // For selecting elements
    reg [8:0]   j; // Counter for element addressing
    reg [7:0]   shake_cnt; // Counter for shake operations

    wire [1:0]  j_plus_num; // Increment value for j
    
    // Outputs from CoeffFromHalfByte instances
    wire [2:0]  CFHB_0_out;
    wire [2:0]  CFHB_1_out;

    // Intermediate data wires
    wire        a; // Comparison flags
    wire        b; // Comparison flags

    wire [2:0]  z0_tmp;
    wire [2:0]  z1_tmp;

    wire [7:0] mux_data_out;

    mux_gen #(
        .param_in(1088),
        .param_m(8)
    ) mux_(
        .in(sampler_in[1087:0]),
        .sel(shake_cnt),
        .out(mux_data_out)
    );

    assign a = mux_data_out[7:4] == 4'd15;
    assign b = mux_data_out[3:0] == 4'd15;

    CoeffFromHalfByte CFHB_0 (.in(mux_data_out[7:4]), .out(CFHB_0_out));
    CoeffFromHalfByte CFHB_1 (.in(mux_data_out[3:0]), .out(CFHB_1_out));

    assign z0_tmp = a ? CFHB_1_out : CFHB_0_out;
    assign z1_tmp = CFHB_1_out;

    assign z0 = z0_tmp[2] ?  {{20{1'b1}}, z0_tmp} + 23'd8380417 : {20'd0, z0_tmp};
    assign z1 = z1_tmp[2] ?  {{20{1'b1}}, z1_tmp} + 23'd8380417 : {20'd0, z1_tmp};

    assign waddr_z0 = {element_choose, j[7:0]};
    assign waddr_z1 = {element_choose, (j[7:0] + 1'b1)};

    assign wen_z = curr_state == SAMPLE_PROCESS && ~j[8];
    
    assign j_plus_num = (j[7:0] == 255 && ~a && ~b) ? 2'd1 : ((~a) + (~b)); // Increment logic

    assign sampler_squeeze = shake_cnt == 8'd135 && ~j[8]; // Shake condition

    assign next_element = j[8]; // Memory full condition

    always @(posedge clk) begin
        if (reset)
            element_choose <= 2'd0; 
        else if((curr_state == SAMPLE_PROCESS) && j[8])
            element_choose <= element_choose + 1'b1;
    end

    always @ (posedge clk) begin
        if (reset)
            shake_cnt <= 8'd0;
        else if (curr_state == SAMPLE_PROCESS)
            shake_cnt <= shake_cnt == 135 ? 8'd0 : shake_cnt + 1'b1; // Reset or increment
        else if (curr_state == SAMPLE_WAIT || curr_state == SAMPLE_OVER)
            shake_cnt <= 8'd0;
    end

    always @ (posedge clk) begin
        if (reset)
            j <=  9'd0;
        else if ((curr_state == SAMPLE_PROCESS) && (~next_element))
            j <= j + j_plus_num; 
        else if (curr_state == SAMPLE_WAIT || curr_state == SAMPLE_OVER)
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
                if(sampler_squeeze) next_state = SQUEEZE;
                else if(next_element && element_choose == 2'd3) next_state = SAMPLE_OVER;
                else if(next_element) next_state = SAMPLE_WAIT;
                else next_state = SAMPLE_PROCESS;
            end
            SQUEEZE: begin
                if(sampler_in_ready) next_state = SAMPLE_PROCESS;
                else next_state = SQUEEZE;
            end
            SAMPLE_OVER: begin
                next_state = SAMPLE_OVER;
            end
            default: next_state = SAMPLE_WAIT;
        endcase
    end

endmodule
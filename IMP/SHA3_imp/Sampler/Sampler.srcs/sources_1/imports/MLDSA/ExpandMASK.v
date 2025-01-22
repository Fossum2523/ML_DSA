module ExpandMASK(   
    input               clk,
    input               reset,

    /*---Control Signal---"*/
    input               sampler_in_ready,
    input   [1343:0]    sampler_in,
    output              sampler_squeeze,  // Flag for squeezing condition
    output              next_element,     // Flag for memory full condition

    /*---y Mem---"*/
    output  [22:0]      y0,               // Write data z0_tmp to Mem
    output  [22:0]      y1,               // Write data z1_tmp to Mem
    output  [7:0]       addr_y0,          // Write addresses for z0_tmp
    output  [7:0]       addr_y1,          // Write addresses for z1_tmp
    output              en_y,             // Write enable for z values
    output              we_y              // Write enable for z values
    );  

    /*---FSM---"*/
    localparam  SAMPLE_WAIT     = 1'd0,
                SAMPLE_PROCESS  = 1'd1;

    /*---round sampler_temp size---"*/
    localparam round_0 = 8;
    localparam round_1 = 16;
    localparam round_2 = 24;
    localparam round_3 = 32;

    // State variables
    reg  [2:0]   curr_state;
    reg  [2:0]   next_state;
    

    // Intermediate registers and wires
    // reg  [8:0]   j;             // Counter for element addressing
    // reg  [7:0]   shake_cnt;     // Counter for shake operations

    reg  [7:0]  shake_cnt; // Counter for shake operations
    reg  [8:0]  j; // Counter for element addressing
    wire [8:0]  j_next;
    wire [1:0]  j_plus_num; // Increment value for j
    wire        last_y;

    reg  [3:0]   round_cnt;
    reg  [31:0]  sampler_temp;
    // wire [1:0]   j_plus_num;    // Increment value for j
    wire [17:0]  H0;            // Split mux output
    wire [17:0]  H1;            // Split mux output
    wire         larger_0;      // Flags for larger comparisons
    wire         larger_1;      // Flags for larger comparisons
    wire [22:0]  y_minuend_0;   // Minuends for subtraction
    wire [22:0]  y_minuend_1;   // Minuends for subtraction
    wire [17:0]  y_subtrahend_0;// Subtrahends for subtraction
    wire [17:0]  y_subtrahend_1;// Subtrahends for subtraction
    wire [35:0]   mux_data_out;
    wire [1079:0]mux_in;

    assign mux_in = round_cnt == 4 ? {792'd0, sampler_in[255:0], sampler_temp[round_3-1:0]}: 
                    round_cnt == 3 ? {sampler_in[1079 - round_2:0], sampler_temp[round_2-1:0]}:
                    round_cnt == 2 ? {sampler_in[1079 - round_1:0], sampler_temp[round_1-1:0]}:
                    round_cnt == 1 ? {sampler_in[1079 - round_0:0], sampler_temp[round_0-1:0]}:
                    /*round_cnt == 0*/sampler_in[1079:0];

    mux_gen #(
        .param_in(1080),
        .param_m(36)
    ) mux_(
        .in(mux_in),
        .sel(shake_cnt),
        .out(mux_data_out)
    );

    assign H0 = mux_data_out[17:0];
    assign H1 = mux_data_out[35:18];

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

    assign en_y = curr_state == SAMPLE_PROCESS && ~j[8];

    assign we_y = curr_state == SAMPLE_PROCESS && ~j[8];
    
    assign j_plus_num = 2'd2; // Increment logic

    assign j_next = j + j_plus_num;

    assign last_y = j_next[8];

    assign sampler_squeeze = shake_cnt == 5'd29 && ~last_y; // Shake condition

    assign next_element = j[8]; // Memory full condition

    always @(posedge clk) begin
        if (reset)
            sampler_temp <= 32'd0; 
        else if(sampler_squeeze)
            case (round_cnt)
                0: sampler_temp <= {{(32 - round_0){1'b0}}, sampler_in[1088 - 1: 1088 - round_0]};
                1: sampler_temp <= {{(32 - round_1){1'b0}}, sampler_in[1088 - 1: 1088 - round_1]};
                2: sampler_temp <= {{(32 - round_2){1'b0}}, sampler_in[1088 - 1: 1088 - round_2]};
                3: sampler_temp <= {{(32 - round_3){1'b0}}, sampler_in[1088 - 1: 1088 - round_3]};
                default: sampler_temp <= 32'd0;
            endcase
    end

    always @ (posedge clk) begin
        if (reset)
            round_cnt <= 5'd0;
        else if (sampler_squeeze)
            round_cnt <= round_cnt + 1'b1;
        else if (next_element)
            round_cnt <= 5'd0;
    end

    always @ (posedge clk) begin
        if (reset)
            shake_cnt <= 5'd0;
        else if (curr_state == SAMPLE_PROCESS)
            shake_cnt <= shake_cnt == 30 ? 8'd0 : shake_cnt + 1'b1; // Reset or increment
        else if (curr_state == SAMPLE_WAIT)
            shake_cnt <= 5'd0;
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
                if(last_y || sampler_squeeze) next_state = SAMPLE_WAIT;
                else next_state = SAMPLE_PROCESS;
            end
            default: next_state = SAMPLE_WAIT;
        endcase
    end

endmodule
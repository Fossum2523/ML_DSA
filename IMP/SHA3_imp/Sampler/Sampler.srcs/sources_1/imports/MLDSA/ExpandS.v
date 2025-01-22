module ExpandS(   
    input               clk,
    input               reset,

    /*---Control Signal---"*/
    input               sampler_in_ready,
    input   [1343:0]    sampler_in,
    output              sampler_squeeze,  // Flag for squeezing condition
    output              next_element,     // Flag for memory full condition

    /*---S1 Mem---"*/
    output  [22:0]      z0,               // Write data z0_tmp to Mem
    output  [22:0]      z1,               // Write data z1_tmp to Mem
    output  [7:0]       addr_z0,          // Write addresses for z0_tmp
    output  [7:0]       addr_z1,          // Write addresses for z1_tmp
    output              en_z0,            // Write enable for z0 values
    output              we_z0,            // Write enable for z0 values
    output              en_z1,            // Write enable for z1 values
    output              we_z1             // Write enable for z1 values
    );  

    /*---FSM---"*/
    localparam  SAMPLE_WAIT     = 1'd0,
                SAMPLE_PROCESS  = 1'd1;

    // State variables
    reg     curr_state;
    reg     next_state;
    

    // Intermediate registers and wires
    reg  [7:0]   shake_cnt; // Counter for shake operations
    reg  [8:0]   j; // Counter for element addressing
    wire [8:0]  j_next;
    wire [1:0]  j_plus_num; // Increment value for j
    wire        last_z;
    
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

    assign a = mux_data_out[3:0] == 4'd15;
    assign b = mux_data_out[7:4] == 4'd15;

    CoeffFromHalfByte CFHB_0 (.in(mux_data_out[3:0]), .out(CFHB_0_out));
    CoeffFromHalfByte CFHB_1 (.in(mux_data_out[7:4]), .out(CFHB_1_out));

    assign z0_tmp = a ? CFHB_1_out : CFHB_0_out;
    assign z1_tmp = CFHB_1_out;

    assign z0 = z0_tmp[2] ?  {{20{1'b1}}, z0_tmp} + 23'd8380417 : {20'd0, z0_tmp};
    assign z1 = z1_tmp[2] ?  {{20{1'b1}}, z1_tmp} + 23'd8380417 : {20'd0, z1_tmp};

    assign addr_z0 = j[7:0];
    assign addr_z1 = j[7:0] + 1'b1;

    assign en_z0 = curr_state == SAMPLE_PROCESS && (~a | ~b);
    assign we_z0 = en_z0;
    assign en_z1 = curr_state == SAMPLE_PROCESS && j != 255 && (~a & ~b);
    assign we_z1 = en_z1;
    
    assign j_plus_num = (~a) + (~b); // Increment logic

    assign j_next = j + j_plus_num;

    assign last_z = j_next[8];

    assign sampler_squeeze = shake_cnt == 8'd135 & ~last_z; // Shake condition

    assign next_element = j[8]; // Memory full condition

    always @ (posedge clk) begin
        if (reset)
            shake_cnt <= 8'd0;
        else if (curr_state == SAMPLE_PROCESS)
            shake_cnt <= shake_cnt == 135 ? 8'd0 : shake_cnt + 1'b1; // Reset or increment
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
                if(last_z || sampler_squeeze) next_state = SAMPLE_WAIT;
                else next_state = SAMPLE_PROCESS;
            end
            default: next_state = SAMPLE_WAIT;
        endcase
    end

endmodule
`define pos(i)        shake_in[ (i + 1) * 8 - 1 : i * 8]

module ExpandS
    #(parameter DLEN = 64, HLEN = 3)(   
    input               clk,
    input               reset,

    /*---Control Signal---"*/
    input               sample_in_ready,
    input   [1343:0]    shake_in,
    output              shake_squeeze;  // Flag for squeezing condition
    output              counter_full,
    output              next_element,   // Flag for memory full condition

    /*---S1 Mem---"*/
    output  [22:0]      z0,             // Write data z0 to Mem
    output  [22:0]      z1,             // Write data z1 to Mem
    output  [9:0]       waddr_z0,       // Write addresses for z0
    output  [9:0]       waddr_z1,       // Write addresses for z1
    output              wen_z;          // Write enable for z values
    );  

    /*---FSM---"*/
    localparam  IDLE            = 2'd0, 
                SAMPLE_PROCESS  = 2'd1, 
                SAMPLE_WAIT     = 2'd2, 
                SAMPLE_WAIT     = 2'd3;

    // State variables
    reg [1:0]   curr_state;
    reg [1:0]   next_state;
    

    // Intermediate registers and wires
    reg [1:0]   element_choose; // For selecting elements
    reg [8:0]   j; // Counter for element addressing
    reg [7:0]   shake_cnt; // Counter for shake operations

    wire [8:0]  j_plus_num; // Increment value for j
    
    // Outputs from CoeffFromHalfByte instances
    wire [3:0]  CFHB_0_out;
    wire [3:0]  CFHB_1_out;
    wire [22:0] CFHB_0_out_expand;
    wire [22:0] CFHB_1_out_expand;

    // Intermediate data wires
    wire        a; // Comparison flags
    wire        b; // Comparison flags

    /*--Mux start--*/
    localparam  param_m = 8;
    localparam  param_n = 136;

    wire [param_m - 1 : 0] mux_data_in [param_n - 1 : 0];
    wire [param_m - 1 : 0] mux_data_tmp [param_n - 1 : 0];
    wire [param_m - 1 : 0] mux_data_tmp2 [param_n - 1 : 0];
    wire [param_m - 1 : 0] mux_data_out;
    wire [param_n - 1 : 0] sel;

    genvar i;
    generate
      for (i = 0; i < param_n; i = i + 1) begin : data_mux_in
            assign mux_data_in[i] = pos(i);
        end
    endgenerate

    generate
        for (i = 0; i < param_n; i = i + 1) begin : data_mux
            if (i == 0) begin
                assign mux_data_tmp2[0] = (sel == 0) ? mux_data_in[0] : 'h0;
                assign mux_data_tmp[0] = mux_data_tmp2[0]; // Optional
            end 
            else begin
                assign mux_data_tmp2[i] = (sel == i) ? mux_data_in[i] : 'h0;
                assign mux_data_tmp[i] = mux_data_in[i] | mux_data_tmp2[i - 1];
            end
        end
    endgenerate

    assign mux_data_out = mux_data_tmp[param_n - 1];
    /*--Mux end--*/

    assign a = mux_data_out[7:4] == 4'd15;
    assign b = mux_data_out[3:0] == 4'd15;

    CoeffFromHalfByte CFHB_0 (.in(mux_data_out[7:4]), .out(CFHB_0_out));
    CoeffFromHalfByte CFHB_1 (.in(mux_data_out[3:0]), .out(CFHB_1_out));

    assign CFHB_0_out_expand = CFHB_0_out[2] ? {20'd0, CFHB_0_out} : {20'd1, CFHB_0_out} + 23'd8380417;
    assign CFHB_1_out_expand = CFHB_1_out[2] ? {20'd0, CFHB_1_out} : {20'd1, CFHB_1_out} + 23'd8380417;

    assign z0 = a ? CFHB_0_out_expand : CFHB_1_out_expand;
    assign z1 = CFHB_0_out_expand;

    assign waddr_z0 = {element_choose, j[7:0]};
    assign waddr_z1 = {element_choose, (j[7:0] + 1'b1)};

    assign wen_z = curr_state == SAMPLE_PROCESS;
    
    assign j_plus_num = (j[7:0] == 255 & ~a & ~b) ? 2'd1 : ~a + ~b; // Increment logic

    assign shake_squeeze = shake_cnt == 8'd135; // Shake condition

    assign next_element = j[8]; // Memory full condition

    assign counter_full = shake_cnt == 135;

    always @(posedge clk) begin
        if (reset)
            element_choose <= 2'd0; 
        else if(curr_state == SAMPLE_WAIT)
            element_choose <= element_choose + 1'b1;
    end

    always @ (posedge clk) begin
        if (reset)
            shake_cnt <= 8'd0;
        else if (curr_state == SAMPLE_PROCESS)
            shake_cnt <= shake_cnt == 135 ? 8'd0 : shake_cnt + 1'b1; // Reset or increment
    end

    always @ (posedge clk) begin
        if (reset)
            j <=  9'd0;
        else if ((curr_state == SAMPLE_PROCESS) && (~next_element))
            j <= j + j_plus_num; 
        else if (curr_state == SAMPLE_WAIT)
            j <=  9'd0; 
    end
    
    always @ (posedge clk) begin
        if (reset)
            curr_state <= IDLE;
        else 
            curr_state <= next_state;
    end

    always @(*) begin
        case (curr_state)
            IDLE: begin
                if(sample_in_ready) next_state = SAMPLE_PROCESS;
                else next_state = IDLE;
            end 
            SAMPLE_PROCESS: begin
                if(next_element && element_choose==2'd3) next_state = SAMPLE_OVER;
                else if(next_element) next_state = SAMPLE_WAIT;
                else next_state = SAMPLE_PROCESS;
            end
            SAMPLE_WAIT: begin
                if(sample_in_ready) next_state = SAMPLE_PROCESS;
                else next_state = SAMPLE_WAIT;
            end
            SAMPLE_OVER: begin
                next_state = SAMPLE_OVER;
            end
            default: next_state = IDLE;
        endcase
    end

endmodule

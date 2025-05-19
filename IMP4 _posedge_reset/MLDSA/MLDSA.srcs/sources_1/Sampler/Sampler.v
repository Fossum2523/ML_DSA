module Sampler(
    input                   clk,
    input                   reset,
    input       [1:0]       mode,
    input                   sampler_in_ready,
    input       [1343:0]    sampler_in,

    //*---ExpandS---"*/
    output              sampler_squeeze,  // Flag for squeezing condition
    output              next_element,   // Flag for memory full condition

    /*---S---"*/
    output  [22:0]      z0,             // Write data z0 to Mem
    output  [22:0]      z1,             // Write data z1 to Mem
    output  [7:0]       addr_z0,        // Write addresses for z0
    output  [7:0]       addr_z1,        // Write addresses for z1
    output              en_z0,           // enable for z values
    output              we_z0,           // Write enable for z values
    output              en_z1,           // enable for z values
    output              we_z1,           // Write enable for z values

    /*---A---"*/
    output  [22:0]      A0,             // Write data A0 to Mem
    output  [22:0]      A1,             // Write data A1 to Mem
    output  [7:0]       addr_A0,        // Write addresses for A0
    output  [7:0]       addr_A1,        // Write addresses for A1
    output              en_A0,           // enable for A values
    output              we_A0,           // Write enable for A values
    output              en_A1,           // enable for A values
    output              we_A1,           // Write enable for A values

    /*---y---"*/
    output  [22:0]      y0,             // Write data z0 to Mem
    output  [22:0]      y1,             // Write data z1 to Mem
    output  [7:0]       addr_y0,        // Write addresses for z0
    output  [7:0]       addr_y1,        // Write addresses for z1
    output              en_y,           // enable for z values
    output              we_y,           // Write enable for z values

    /*---c---"*/
    output  [22:0]      ci,             // Write data ci to Mem
    output  [7:0]       addr_ci,        // Write addresses for ci
    output  [7:0]       addr_cj,        // Write addresses for cj
    output              en_ci,          // enable for ci values
    output              en_cj,          // enable for cj values
    output              we_ci,          // Write enable for ci values
    output              we_cj           // Write enable for cj values
    );

    //***---MASK only---***//
    reg  [3:0]   round_cnt;
    /*---round sampler_temp size---"*/
    localparam round_0 = 0;
    localparam round_1 = 8;
    localparam round_2 = 16;
    localparam round_3 = 24;
    localparam round_4 = 32;
    //***---MASK only---***//

    //***---SIB only---***//
    wire            SIB_load_H;
    //***---SIB only---***//

    localparam [1:0] S_mode     = 2'd0,
                     A_mode     = 2'd1,
                     MASK_mode  = 2'd2,
                     SIB_mode   = 2'd3;

    /*---FSM---"*/
    localparam  SAMPLE_WAIT     = 1'd0,
                SAMPLE_PROCESS  = 1'd1;

    // State variables
    reg         curr_state;
    reg         next_state;

    reg              sampler_in_ready_buffer;
    reg  [1343:0]    sampler_buffer;

    wire sampler_in_ready_S;
    wire sampler_in_ready_A;    
    wire sampler_in_ready_MASK;    
    wire sampler_in_ready_SIB;        

    reg  [8:0]  j; // Counter for element addressing
    wire [8:0]  j_next;
    wire [8:0]  j_next_s;
    wire [8:0]  j_next_A;
    wire [8:0]  j_next_MASK;
    wire [8:0]  j_next_SIB;

    reg  [7:0]  shake_cnt;  // Counter for shake operations
    wire        shake_triger;
    wire        last_sample;

    

    assign sampler_in_ready_S    = mode == S_mode    & curr_state == SAMPLE_PROCESS;
    assign sampler_in_ready_A    = mode == A_mode    & curr_state == SAMPLE_PROCESS;
    assign sampler_in_ready_MASK = mode == MASK_mode & curr_state == SAMPLE_PROCESS;
    assign sampler_in_ready_SIB  = mode == SIB_mode  & curr_state == SAMPLE_PROCESS;

    assign j_next = mode == S_mode    ? j_next_s    :
                    mode == A_mode    ? j_next_A    :
                    mode == MASK_mode ? j_next_MASK :
                    mode == SIB_mode  ? j_next_SIB  : 9'd0;
    
    assign shake_triger = mode == S_mode ?      shake_cnt == 8'd135 :
                          mode == A_mode ?      shake_cnt == 8'd27  :
                          mode == MASK_mode ?   shake_cnt == 8'd29  :
                          mode == SIB_mode ?    shake_cnt == 8'd135 : 1'b0;

    assign sampler_squeeze = shake_triger & ~last_sample; // Shake condition
    
    assign next_element = mode == SIB_mode ? j == 9'd39 :j[8];

    assign last_sample  = mode == SIB_mode ? j_next == 9'd39 : j_next[8];

    ExpandS ExpandS_(
        .clk(clk),
        .reset(reset),
        .sampler_in_ready(sampler_in_ready_S),
        .sampler_in(sampler_buffer[7:0]),
        .j(j),
        .j_next(j_next_s),
        .z0(z0),
        .z1(z1),
        .addr_z0(addr_z0),
        .addr_z1(addr_z1),
        .en_z0(en_z0),
        .we_z0(we_z0),
        .en_z1(en_z1),
        .we_z1(we_z1)
    );   

    ExpandA ExpandA_(
        .clk(clk),
        .reset(reset),
        .sampler_in_ready(sampler_in_ready_A),
        .sampler_in(sampler_buffer[47:0]),
        .j(j),
        .j_next(j_next_A),
        .A0(A0),
        .A1(A1),
        .addr_A0(addr_A0),
        .addr_A1(addr_A1),
        .en_A0(en_A0),
        .we_A0(we_A0),
        .en_A1(en_A1),
        .we_A1(we_A1)
    );

    ExpandMASK ExpandMASK_(
        .clk(clk),
        .reset(reset),
        .sampler_in_ready(sampler_in_ready_MASK),
        .sampler_in(sampler_buffer[35:0]),
        .j(j),
        .j_next(j_next_MASK),
        .y0(y0),
        .y1(y1),
        .addr_y0(addr_y0),
        .addr_y1(addr_y1),
        .en_y(en_y),
        .we_y(we_y)
    );

    SampleInBall SampleInBall_(
        .clk(clk),
        .reset(reset),
        .sampler_in_ready(sampler_in_ready_SIB),
        .sampler_in(sampler_buffer[63:0]),
        .j(j),
        .j_next(j_next_SIB),
        .load_H(SIB_load_H),
        .ci(ci),
        .addr_ci(addr_ci),
        .addr_cj(addr_cj),
        .en_ci(en_ci),
        .en_cj(en_cj),
        .we_ci(we_ci),
        .we_cj(we_cj)
    );

    wire [5:0]  MASK_remain;
    wire [1343:0]  reamin_data_MASK;
    wire [1343:0]  valid_bit_MASK;

    assign valid_bit_MASK = ({(1344){1'b1}} >> (1344-MASK_remain));
    assign reamin_data_MASK = (sampler_buffer & valid_bit_MASK);

    assign MASK_remain = round_cnt == 5'd0 ? round_0:
                         round_cnt == 5'd1 ? round_1:
                         round_cnt == 5'd2 ? round_2:
                         round_cnt == 5'd3 ? round_3:
                         round_4;


    always @(posedge clk) begin
        if(reset)
            sampler_buffer <= 1344'd0;
        else if(curr_state == SAMPLE_WAIT && sampler_in_ready)
            sampler_buffer <= mode == MASK_mode ? ((sampler_in[1087:0] << MASK_remain) | reamin_data_MASK) : 
                              mode == A_mode    ? sampler_in :
                             /*mode == S_mode & SIB_mode*/{256'd0,sampler_in[1087:0]};  
        else if (curr_state == SAMPLE_PROCESS)
            sampler_buffer <= mode == S_mode    ? {256'd0,8'd0,sampler_buffer[1087:8]}:
                              mode == A_mode    ? {48'd0,sampler_buffer[1343:48]}:
                              mode == MASK_mode ? sampler_buffer >> 36:
                              mode == SIB_mode & ~SIB_load_H  ? {256'd0,64'd0,sampler_buffer[1087:64]}:
                              mode == SIB_mode & SIB_load_H ? {256'd0,8'd0,sampler_buffer[1087:8]}:1344'd0;
    end


     always @ (posedge clk) begin
        if (reset)
            shake_cnt <= 8'd0;
        else if (curr_state == SAMPLE_PROCESS)
            if(mode == SIB_mode & ~SIB_load_H)
                shake_cnt <= shake_cnt + 8'd8; // Reset or increment
            else
                shake_cnt <= shake_cnt + 1'b1; // Reset or increment
        else if (curr_state == SAMPLE_WAIT)
            shake_cnt <= 8'd0;
    end

    always @ (posedge clk) begin
        if (reset)
            j <=  9'd0;
        else if (next_element)
            j <=  9'd0; 
        else if (curr_state == SAMPLE_PROCESS)
            j <=    mode == S_mode ?    j_next_s :
                    mode == A_mode ?    j_next_A :
                    mode == MASK_mode ? j_next_MASK :
                    mode == SIB_mode ?  j_next_SIB : 9'd0; 
    end
    
    //***---MASK only---***//
    always @ (posedge clk) begin
        if (reset)
            round_cnt <= 5'd0;
        else if (sampler_squeeze)
            round_cnt <= round_cnt + 5'd1;
        else if (next_element)
            round_cnt <= 5'd0;
    end
    //***---MASK only---***//

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
                if(last_sample || sampler_squeeze) next_state = SAMPLE_WAIT;
                else next_state = SAMPLE_PROCESS;
            end
            default: next_state = SAMPLE_WAIT;
        endcase
    end
endmodule
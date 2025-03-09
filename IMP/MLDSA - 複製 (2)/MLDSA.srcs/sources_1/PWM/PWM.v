module PWM
#(
    parameter BIT_LEN = 23, HLEN = 8
)(  
    input                   clk,
    input                   reset,
    input                   start,
    output                  done,
    //---Path 1
    input   [BIT_LEN - 1:0] in_a0,
    input   [BIT_LEN - 1:0] in_a1,
    output                  in_a_en,
    output  [HLEN - 1:0]    in_addr_a,
    output  [BIT_LEN - 1:0] out_a,
    output                  out_a_en,
    output  [HLEN - 1:0]    out_addr_a,
    //---Path 2
    input   [BIT_LEN - 1:0] in_b0,
    input   [BIT_LEN - 1:0] in_b1,
    output                  in_b_en,
    output  [HLEN - 1:0]    in_addr_b,
    output  [BIT_LEN - 1:0] out_b,
    output                  out_b_en,
    output  [HLEN - 1:0]    out_addr_b
);

    localparam  IDLE         = 1'd0,
                PROCESS      = 1'd1;

    wire [BIT_LEN * 2 - 1:0] mul_a;
    wire [BIT_LEN * 2 - 1:0] mul_b;
    wire done;

    reg [8:0] cnt;
    reg curr_state;
    reg next_state;

    assign done = cnt == 128;
    assign mul_a = in_a0 * in_a1;
    assign mul_b = in_b0 * in_b1;
    assign in_a_en = curr_state == PROCESS && cnt < 128;
    assign in_b_en = curr_state == PROCESS && cnt < 128;
    assign out_a_en = curr_state == PROCESS && cnt >= 1;
    assign out_b_en = curr_state == PROCESS && cnt >= 1;
    assign in_addr_a = cnt[7:0];
    assign in_addr_b = in_addr_a + 8'd128;
    assign out_addr_a = cnt - 8'd1;
    assign out_addr_b = out_addr_a + 8'd128;

    Modular_Reduction MR0(mul_a, out_a);
    Modular_Reduction MR1(mul_b, out_b);

    always @(posedge clk) begin
        if(reset)
            cnt <= 9'd0;
        else if(done) 
            cnt <= 9'd0;
        else if(curr_state == PROCESS) 
            cnt <= cnt + 1'b1;
    end

    always @(posedge clk) begin
        if(reset)
            curr_state <= IDLE;
        else 
            curr_state <= next_state;
    end

    always @(*) begin
        case(curr_state)
            IDLE:begin
                if(start) 
                    next_state = PROCESS;
                else 
                    next_state = IDLE;
            end
            PROCESS:begin
                if(done) 
                    next_state = IDLE;
                else 
                    next_state = PROCESS;
            end
            default: next_state = IDLE;
        endcase
    end

endmodule
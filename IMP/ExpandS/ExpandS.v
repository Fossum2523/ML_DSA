
`define pos(i)        shake_in[ (i + 1) * 8 - 1 : i * 8]

module ExpandS
    #(parameter DLEN = 64, HLEN = 3)(   
    input clk,
    input reset,

    output Rho_prime_wen,
    output reg [HLEN-1:0]Rho_prime_waddr,
    output reg [DLEN-1:0]Rho_prime_din,
    output reg [HLEN-1:0]Rho_prime_raddr,
    input  reg [DLEN-1:0]Rho_prime_dout,

    output [DLEN-1:0]sample_out,
    input sample_in_ready,
    input    [1343:0]   shake_in,
    );  

    reg        [11:0] sample_addr;

    
    /*--Mux start--*/
    localparam param_m = 8;
    localparam param_n = 136;

    wire [param_m - 1 : 0] mux_data_in [param_n - 1 : 0];
    wire [param_m - 1 : 0] mux_data_tmp [param_n - 1 : 0];
    wire [param_m - 1 : 0] mux_data_tmp2 [param_n - 1 : 0];
    wire [param_m - 1 : 0] mux_data_out;
    wire [param_n : 0] sel;

    genvar i;
    generate
      for (i = 0; i < param_n; i = i + 1) begin : data_mux_in
            assign mux_data_in[i] = pos(i)
        end
    endgenerate

    generate
        for (i = 0; i < param_n; i = i + 1) begin : data_mux
            if (i == 0) begin
                assign mux_data_tmp2[0] = (sel == 0) ? mux_data_in[0] : 'h0;
                assign mux_data_tmp[0] = mux_data_tmp2[0]; // 可省略
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

    assign j_plus_num = (j[7:0] == 255 & a & b) ? 2'd1 : ~a + ~b;//If a and b are equal to 1 and j is equal to 255, 
                                                                 //then increment j by 1 to prevent writing to an incorrect memory address.

    assign shake_squeeze = shake_cnt == 8'd135; //shake_cnt == 8'd135 need to squeeze 

    assign next_element = j[7:0] == 256;
    always @ (posedge clk) begin
        if (reset)
            shake_cnt <= 8'd0;
        else if (curr_state = SAMPLE_PROCESS)
            shake_cnt <= shake_cnt == 135 ? 8'd0 : shake_cnt + 1'b1; //shake_cnt == 135 need to squeeze and restart count
    end

    always @ (posedge clk) begin
        if (reset)
            j <=  10'd0; // j[9:8] indicates different elements.
        else if ((curr_state = SAMPLE_PROCESS) && (~next_element))
            j <= j + j_plus_num; 
    end

    
    always @ (posedge clk) begin
        if (reset)
            curr_state <= IDLE;
        else 
            curr_state <= next_state;
    end

    always @(*) begin
        case (curr_state)
            IDLE:begin
                if(sample_in_ready) next_state = SAMPLE_PROCESS;
                else next_state = IDLE;
            end 
            SAMPLE_PROCESS:begin
                if(next_element) next_state = SAMPLE_WAIT;
                else next_state = SAMPLE_PROCESS;
            end
            SAMPLE_WAIT:begin
                if(sample_in_ready) next_state = SAMPLE_PROCESS;
                else next_state = SAMPLE_WAIT;
            end
            default: 
        endcase
    end

    
endmodule

`timescale 1ns / 1ps

module coeff_decomposer(
        input  reset,
        input  clk,
        input  valid_i,
        output ready_i,
        input      [22:0] di,
        output reg [22:0] doa = 0,
        output reg [22:0] dob = 0,
        output reg        valid_o = 0,
        input ready_o
    );
    
    
    
    localparam  Q = 23'd8380417;
    
    reg [4:0] valid_sr;
    reg [22:0] di_buffer;
    reg signed [55:0] a1_0;
    reg signed [55:0] a1_1;
    reg signed [55:0] a1_2;
    reg signed [55:0] a0_0;
    reg signed [55:0] a0_1;
    reg signed [55:0] a0_2;

    wire [23:0] sub_val;
    wire [5:0] map1_out;

    decomp_map1 MAP1 (di_buffer, map1_out);

    assign ready_i = ready_o;
    assign sub_val = ((((Q-1)/2 - a0_1) >> 31) & Q);

    
    always @(*) begin
        valid_o = valid_sr[4];
    end
    
    always @(posedge clk) begin
        if(reset)
            valid_sr <= 5'd0;
        else if (ready_o)
            valid_sr <= {valid_sr[3:0], valid_i}; 
    end

    always @(posedge clk) begin
        if(reset)
            di_buffer <= 23'd0;
        else if (ready_o)
            di_buffer <= di;  
    end

    always @(posedge clk) begin
        if(reset)begin
            a1_0 <= 56'd0;
            a1_1 <= 56'd0;
            a1_2 <= 56'd0;
            dob  <= 23'd0;
        end
        else if (ready_o)begin
            a1_0 <= map1_out;
            a1_1 <= a1_0;
            a1_2 <= a1_1;
            dob  <= a1_2; 
        end
    end

    always @(posedge clk) begin
        if(reset)begin
            a0_0 <= 56'd0;
            a0_1 <= 56'd0;
            a0_2 <= 56'd0;
            doa  <= 23'd0;
        end
        else if (ready_o)begin
            a0_0 <= di_buffer;
            a0_1 <= a0_0 - ((a1_0 << 17) + (a1_0 << 16) - (a1_0 << 12) - (a1_0 << 11));
            a0_2 <= a0_1 - sub_val;
            doa  <= (a0_2 < 0) ? a0_2 + Q : a0_2;
        end
    end
endmodule

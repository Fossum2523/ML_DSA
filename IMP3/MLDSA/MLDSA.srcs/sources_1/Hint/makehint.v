`timescale 1ns / 1ps

module makehint #(
        parameter OUTPUT_W = 2,
        parameter COEFF_W  = 23,
        parameter W        = 64
    ) (
        input reset,
        input clk,
        output reg    reject_hint,
        input [OUTPUT_W*COEFF_W-1:0] poly0_ie,
        input [OUTPUT_W*COEFF_W-1:0] poly1_ie,
        input      poly_valid_ie,
        output reg poly_ready_i,
        output reg [W-1:0] hint_o,
        output reg hint_valid_o,
        input      hint_ready_o
    );
    
    reg [OUTPUT_W*COEFF_W-1:0] poly0_i;
    reg [OUTPUT_W*COEFF_W-1:0] poly1_i;
    reg      poly_valid_i;
     
    localparam K = 4;
    localparam omega = 7'd80;
    
    localparam
        S_MAKEHINT   = 0,
        S_UNLOADHINT = 1;
    
    localparam GAMMA2  = 18'd95232;
    localparam Q       = 23'd8380417;

    reg state;
    reg [2:0] poly_num;
    reg [7:0] hint_addr [79:0];
    reg [7:0] poly_hint_cnt [7:0];
    reg [7:0] num_hints;
    reg [7:0] ctr;
    reg rej;
    
    reg [OUTPUT_W -1 :0] hint_needed;
    
    integer i, k;

    always @(*) begin
        poly_ready_i = 1;
        reject_hint  = 0;
        hint_o       = 0;
        hint_valid_o = 0;
        
        
        for (i = 0; i < OUTPUT_W; i = i + 1)
            hint_needed[i] = poly0_i[COEFF_W*i+:COEFF_W] != poly1_i[COEFF_W*i+:COEFF_W];
            // hint_needed[i] = !(poly0_i[24*i+:24] <= GAMMA2 || poly0_i[24*i+:24] > Q-GAMMA2) || (poly0_i[24*i+:24] == Q-GAMMA2 && poly1_i[24*i+:24] != 0);
        
        if (rej) begin
            reject_hint = 1;
        end else begin
            case(state)
            S_MAKEHINT: begin
                poly_ready_i = 1;
            end
            S_UNLOADHINT: begin
                hint_valid_o = 1;
                if (8*ctr < omega) begin
                    for (k = 0; k < 8; k = k + 1)
                        hint_o[k*8+:8] = hint_addr[ctr*8+k];
                end else begin
                    for (k = 0; k < 8; k = k + 1)
                        hint_o[k*8+:8] = poly_hint_cnt[k];
                end
            end
            endcase
        end

    end
    
    always @(posedge clk) begin
        poly0_i <= poly0_ie;
        poly1_i <= poly1_ie;
        poly_valid_i <= (reset) ? 0 : poly_valid_ie;
    
        if (reset) begin
            state    <= 0;
            poly_num <= 0;
            ctr      <= 0;
            rej      <= 0;
            num_hints <= 0;
            
            for (k = 0; k < 80; k = k + 1)
                hint_addr[k] <= 0;
                
            for (k = 0; k < 8; k = k + 1)
                poly_hint_cnt[k] <= 0;
        end 
        else if (rej)begin
            rej <= 1;
        end 
        else begin
            if (num_hints > omega) 
                rej <= 1;
        
            case(state)
                S_MAKEHINT: begin
                    if (poly_valid_i) begin
                        ctr <= ctr + OUTPUT_W;
                        if (ctr == 254) begin
                            ctr      <= 0;
                            poly_num <= poly_num + 1;
                            // hint_addr[omega - K + poly_num] <= num_hints + hint_needed[0] + hint_needed[1];
                            poly_hint_cnt[poly_num] <= num_hints + hint_needed[0] + hint_needed[1];
                            
                            if (poly_num == K-1) begin
                                state <= S_UNLOADHINT;
                                poly_num <= 0;
                            end
                        end
                        
                        if (hint_needed[0]) begin
                            hint_addr[num_hints] <= ctr + 0;
                        end
                        if (hint_needed[1]) begin
                            hint_addr[num_hints + hint_needed[0]] <= ctr + 1;
                        end
                        num_hints <= num_hints + hint_needed[0] + hint_needed[1];
                    end
                end
                S_UNLOADHINT: begin
                    ctr <= (hint_ready_o && hint_valid_o) ? ctr + 1 : ctr;
                    if(8*ctr >= omega)
                        state <= S_MAKEHINT;
                end
            endcase
        end
    end
endmodule

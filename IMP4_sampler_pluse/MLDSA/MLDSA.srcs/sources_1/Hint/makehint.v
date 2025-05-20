`timescale 1ns / 1ps

module makehint #(
        parameter OUTPUT_W = 2,
        parameter COEFF_W  = 23,
        parameter W        = 64
    ) (
        input           resetn,
        input           clk,
        output          reject_hint,
        input [OUTPUT_W*COEFF_W-1:0] poly0_ie,
        input [OUTPUT_W*COEFF_W-1:0] poly1_ie,
        input           poly_valid_ie,
        output          poly_ready_i,
        output reg [W-1:0] hint_o,
        output          hint_valid_o,
        input           hint_ready_o
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

    reg         state;
    reg [2:0]   poly_num;
    reg [7:0]   hint_addr     [79:0];
    reg [7:0]   poly_hint_cnt [7:0];
    reg [7:0]   num_hints;
    reg [7:0]   ctr;
    reg         rej;
    reg [OUTPUT_W -1 :0]    hint_needed;
    
    integer i, k;

    assign reject_hint = rej ? 1'b1 : 1'b0;
    assign poly_ready_i = state == S_MAKEHINT && (!rej) ? 1'b1 : 1'b0;
    assign hint_valid_o = state == S_UNLOADHINT && (!rej) ? 1'b1 : 1'b0;

    always @(*) begin
        hint_o  = 0;
        if(!rej && state == S_UNLOADHINT)begin
            if (8*ctr < omega) begin
                for (k = 0; k < 8; k = k + 1)
                    hint_o[k*8+:8] = hint_addr[ctr*8+k];
            end else begin
                for (k = 0; k < 8; k = k + 1)
                    hint_o[k*8+:8] = poly_hint_cnt[k];
            end
        end
    end
    
    always @(*) begin
        for (i = 0; i < OUTPUT_W; i = i + 1)
            hint_needed[i] = poly0_i[COEFF_W*i+:COEFF_W] != poly1_i[COEFF_W*i+:COEFF_W];
    end

    always @(posedge clk or negedge resetn) begin
        if (!resetn)
            rej <= 0;
        else if (rej)
            rej <= 1;
        else if (num_hints > omega) 
            rej <= 1;
    end

    always @(posedge clk or negedge resetn) begin
        if (!resetn)
            poly0_i <= {(OUTPUT_W*COEFF_W){1'b0}};
        else 
            poly0_i <= poly0_ie;
    end

    always @(posedge clk or negedge resetn) begin
        if (!resetn)
            poly1_i <= {(OUTPUT_W*COEFF_W){1'b0}};
        else 
            poly1_i <= poly1_ie;
    end

    always @(posedge clk or negedge resetn) begin
        if (!resetn)
            poly_valid_i <= 1'b0;
        else 
            poly_valid_i <= poly_valid_ie;
    end


    always @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            ctr      <= 0;
        end 
        else if (!rej)begin
            case(state)
                S_MAKEHINT: begin
                    if (poly_valid_i) begin
                        ctr <= ctr == 254  ? 0 : ctr + OUTPUT_W;
                    end
                end
                S_UNLOADHINT: begin
                    ctr <= (hint_ready_o && hint_valid_o) ? ctr + 1 : ctr;
                end
            endcase
        end
    end

    always @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            poly_num <= 0;
        end 
        else if (!rej & state == S_MAKEHINT)begin
            if (poly_valid_i & ctr == 254) begin
                poly_num <= poly_num == K-1 ? 0 : poly_num + 1;
            end
        end
    end

     always @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            num_hints <= 0;
        end 
        else if (!rej && state == S_MAKEHINT)begin
            if (poly_valid_i) begin
                num_hints <= num_hints + hint_needed[0] + hint_needed[1];
            end
        end
    end

     always @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            state    <= 0;
        end 
        else if (!rej)begin
            case(state)
                S_MAKEHINT: begin
                    if (poly_valid_i && ctr == 254 && poly_num == K-1)
                        state <= S_UNLOADHINT;
                end
                S_UNLOADHINT: begin
                    if(8*ctr >= omega)
                        state <= S_MAKEHINT;
                end
            endcase
        end
    end

    always @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            for (k = 0; k < 80; k = k + 1)
                hint_addr[k] <= 0;
        end 
        else if (!rej && state == S_MAKEHINT)begin
            if (poly_valid_i) begin
                if (hint_needed[0]) begin
                    hint_addr[num_hints] <= ctr + 0;
                end
                if (hint_needed[1]) begin
                    hint_addr[num_hints + hint_needed[0]] <= ctr + 1;
                end
            end
        end
    end

    always @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            for (k = 0; k < 8; k = k + 1)
                poly_hint_cnt[k] <= 0;
        end 
        else if (!rej && state == S_MAKEHINT)begin
            if (poly_valid_i && ctr == 254) begin
                poly_hint_cnt[poly_num] <= num_hints + hint_needed[0] + hint_needed[1];
            end
        end
    end
endmodule

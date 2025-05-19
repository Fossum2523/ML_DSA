`timescale 1ns / 1ps

module usehint #(
        parameter OUTPUT_W = 2,
        parameter COEFF_W  = 23,
        parameter W        = 64
    ) (
        input           resetn,
        input           clk,
        input           start,
        input [W-1:0]   di,
        input           valid_i,
        output          ready_i,
        input [OUTPUT_W*COEFF_W-1:0] poly0_i,
        input [OUTPUT_W*COEFF_W-1:0] poly1_i,
        input           poly_valid_i,
        output          poly_ready_i,
        output reg [OUTPUT_W*COEFF_W-1:0] poly_o,
        output          poly_valid_o,
        input           poly_ready_o
    );
    
    localparam [1:0]
        INIT         = 2'd0,
        RECEIVE_HINT = 2'd1,
        EXPAND_HINT  = 2'd2,
        APPLY_HINT   = 2'd3;
    
    localparam K            = 4;
    localparam hint_len     = 671;
    localparam hint_addrlen = 80;
    localparam num_hints    = 2; // Number of addresses in hint

    reg  [7:0]       hint_cnt [3:0];
    reg  [671:0]     hint_addr;
    reg  [10:0]      ctr;
    reg  [10:0]      ctr_next;
    reg  [9:0]       pos;
    reg  [9:0]       pos_next;
    reg  [256*8-1:0] hint_poly;
    reg  [1:0]       curr_state;
    reg  [1:0]       next_state;
    
    wire [7:0]       next_hint;
    wire [10:0]      hint_offset;
    wire [5:0]       FINAL_SHIFT;
    
    integer i;

    assign next_hint = hint_addr[pos*8+:8];
    assign hint_offset = ctr >= hint_cnt[3] ? 256*(3+1) :
                         ctr >= hint_cnt[2] ? 256*(2+1) :
                         ctr >= hint_cnt[1] ? 256*(1+1) :
                         ctr >= hint_cnt[0] ? 256*(0+1) : 11'd0;
    
    assign ready_i = curr_state == RECEIVE_HINT ? valid_i : 1'b0;
    assign poly_ready_i = curr_state == APPLY_HINT ? 1'b1 : 1'b0;
    assign poly_valid_o = curr_state == APPLY_HINT ? poly_valid_i : 1'b0;
    assign FINAL_SHIFT = 8*((ctr+1)*8 - hint_addrlen-num_hints);

    always @(*) begin
        case(curr_state)
            INIT: begin
                ctr_next = 0;
            end
            RECEIVE_HINT: begin
                ctr_next =  (valid_i && (ctr+1)*8 > hint_addrlen+num_hints) ?  0 :
                            (valid_i) ? ctr + 1 : ctr;
            end
            EXPAND_HINT: begin
                ctr_next = (ctr+1 >= hint_cnt[K-1]) ?  0 : ctr + 1;
            end
            APPLY_HINT: begin
                ctr_next = (poly_valid_o && poly_ready_o) ? ctr + OUTPUT_W : ctr;
            end
        endcase
    end


    always @(*) begin
        case(curr_state)
            INIT: begin
                pos_next = 0;
            end
            RECEIVE_HINT: begin
                pos_next = 0;
            end
            EXPAND_HINT: begin
                pos_next = pos + 1;
            end
            APPLY_HINT: begin
                pos_next = pos;
            end
        endcase
    end

    always @(*) begin
        poly_o = poly1_i;
        for (i = 0; i < OUTPUT_W; i = i + 1) begin
            if (hint_poly[ctr+i] == 1) begin
                if (poly0_i[i*COEFF_W+:COEFF_W] > (8380417-1)/88 || poly0_i[i*COEFF_W+:COEFF_W] == 0)
                    poly_o[i*COEFF_W+:COEFF_W] = (poly1_i[i*COEFF_W+:COEFF_W] == 0) ? 43 : poly1_i[i*COEFF_W+:COEFF_W] - 1;
                else
                    poly_o[i*COEFF_W+:COEFF_W] = (poly1_i[i*COEFF_W+:COEFF_W] == 43) ? 0 : poly1_i[i*COEFF_W+:COEFF_W] + 1;
            end 
        end
    end
    
    
    always @(posedge clk or negedge resetn) begin
        if (!resetn)
            curr_state <= INIT;
        else
            curr_state <= next_state;    
    end

    always @(*) begin
        next_state = 2'd0;
        case(curr_state)
            INIT: begin
                if(start)
                    next_state = RECEIVE_HINT;
                else
                    next_state = INIT;
            end
            RECEIVE_HINT: begin
                if(valid_i && (ctr+1)*8 > hint_addrlen+num_hints)
                    next_state = EXPAND_HINT;
                else
                    next_state = RECEIVE_HINT;
            end
            EXPAND_HINT: begin
                if(ctr+1 >= hint_cnt[K-1])
                    next_state = APPLY_HINT;
                else
                    next_state = EXPAND_HINT;
            end
            APPLY_HINT: begin
                if(ctr == K*256) 
                    next_state = INIT;
                else
                    next_state = APPLY_HINT;
            end
        endcase
    end

    always @(posedge clk or negedge resetn) begin
        if (!resetn)
            ctr   <= 11'd0;
        else 
            ctr <= ctr_next;  
    end

    always @(posedge clk or negedge resetn) begin
        if (!resetn)
            pos   <= 10'd0;
        else 
            pos <= pos_next;  
    end

    always @(posedge clk or negedge resetn) begin
        if (!resetn)
            for (i = 0; i < 4; i = i + 1)
                hint_cnt[i] <= 0;
        else if(valid_i && (ctr+1)*8 > hint_addrlen+num_hints)
            for (i = 0; i < 4; i = i + 1)
                hint_cnt[i] <= di[8*i+:8];
    end

    always @(posedge clk or negedge resetn) begin
        if (!resetn)
            hint_addr  <= 0;
        else if(curr_state == RECEIVE_HINT)
            if ((ctr+1)*8 > hint_addrlen+num_hints) 
                hint_addr <= (hint_addr >> 32) | (di << 640);
            else
                hint_addr <= (valid_i) ? {di,hint_addr[671:64]} : hint_addr;
    end

    always @(posedge clk or negedge resetn) begin
        if (!resetn)
            hint_poly  <= 0;
        else if(curr_state == EXPAND_HINT)
            hint_poly[next_hint+hint_offset] <= 1;
    end
endmodule
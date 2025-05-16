`timescale 1ns / 1ps

module usehint #(
        parameter OUTPUT_W = 2,
        parameter COEFF_W  = 24,
        parameter W        = 64
    ) (
        input           reset,
        input           clk,
        input           start,
        input [W-1:0]   di,
        input           valid_i,
        output reg      ready_i,
        input [OUTPUT_W*COEFF_W-1:0] poly0_i,
        input [OUTPUT_W*COEFF_W-1:0] poly1_i,
        input           poly_valid_i,
        output reg      poly_ready_i,
        output reg [OUTPUT_W*COEFF_W-1:0] poly_o,
        output reg      poly_valid_o,
        input           poly_ready_o
    );
    
    reg [7:0]       hint_cnt [7:0];
    reg [671:0]     hint_addr;
    reg [10:0]      ctr;
    reg [10:0]      ctr_next;
    reg [9:0]       pos;
    reg [9:0]       pos_next;
    reg [256*8-1:0] hint_poly;
    reg [7:0]       next_hint;
    reg [10:0]      hint_offset;
    
    localparam [1:0]
        INIT         = 2'd0,
        RECEIVE_HINT = 2'd1,
        EXPAND_HINT  = 2'd2,
        APPLY_HINT   = 2'd3;
    
    localparam K            = 4;
    localparam hint_len     = 671;
    localparam hint_addrlen = 80;
    localparam num_hints    = 2; // Number of addresses in hint

    reg [1:0] curr_state;
    reg [1:0] next_state;

    reg [5:0] FINAL_SHIFT;

    wire test1;
    wire test2;

    assign test1 = hint_poly[ctr];
    assign test2 = hint_poly[ctr+1];
    
    integer i;
    always @(*) begin
        
    
        next_hint = hint_addr[pos*8+:8];
        // next_hint = hint_addr[hint_len-pos*8-:8];
 
        hint_offset = 0; 
       
        if (ctr >= hint_cnt[0])
           hint_offset = 256*(0+1);
        if (ctr >= hint_cnt[1])
           hint_offset = 256*(1+1);
        if (ctr >= hint_cnt[2])
           hint_offset = 256*(2+1);
        if (ctr >= hint_cnt[3])
           hint_offset = 256*(3+1);
    
        ready_i      = 0;
        // poly_ready_i = poly_ready_o;
        poly_ready_i = curr_state == APPLY_HINT;
        poly_o       = 0;
        poly_valid_o = 0;
        ctr_next     = ctr;
    
        FINAL_SHIFT = 8*((ctr+1)*8 - hint_addrlen-num_hints);
    
    
        poly_o = poly1_i;
        for (i = 0; i < OUTPUT_W; i = i + 1) begin
            if (hint_poly[ctr+i] == 1) begin
                if (poly0_i[i*24+:24] > (8380417-1)/88 || poly0_i[i*24+:24] == 0)
                    poly_o[i*24+:24] = (poly1_i[i*24+:24] == 0) ? 43 : poly1_i[i*24+:24] - 1;
                else
                    poly_o[i*24+:24] = (poly1_i[i*24+:24] == 43) ? 0 : poly1_i[i*24+:24] + 1;
            end 
        end
        pos_next = pos;
    
        case(curr_state)
        INIT: begin
            ctr_next = 0;
            pos_next = 0;
        end
        RECEIVE_HINT: begin
            ctr_next =  (valid_i && (ctr+1)*8 > hint_addrlen+num_hints) ?  0 :
                        (valid_i) ? ctr + 1 : ctr;
            ready_i  = valid_i;
            pos_next = 0;
        end
        EXPAND_HINT: begin
            ctr_next = (ctr+1 >= hint_cnt[K-1]) ?  0 : ctr + 1;
            pos_next = pos + 1;
        end
        APPLY_HINT: begin
            poly_valid_o = poly_valid_i;
            ctr_next = (poly_valid_o && poly_ready_o) ? ctr + OUTPUT_W : ctr;
        end
        endcase
    end
    
    
    always @(posedge clk) begin
        if (reset)
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

    always @(posedge clk) begin
        if (reset)
            ctr   <= 11'd0;
        else 
            ctr <= ctr_next;  
    end

    always @(posedge clk) begin
        if (reset)
            pos   <= 10'd0;
        else 
            pos <= pos_next;  
    end

    always @(posedge clk) begin
        if (reset)
            for (i = 0; i < 8; i = i + 1)
                hint_cnt[i] <= 0;
        else if(valid_i && (ctr+1)*8 > hint_addrlen+num_hints)
            for (i = 0; i < 8; i = i + 1)
                hint_cnt[i] <= di[8*i+:8];
    end

    always @(posedge clk) begin
        if (reset)
            hint_addr  <= 0;
        else if(curr_state == RECEIVE_HINT)
            if ((ctr+1)*8 > hint_addrlen+num_hints) 
                hint_addr <= (hint_addr >> 32) | (di << 640);
            else
                hint_addr <= (valid_i) ? {di,hint_addr[671:64]} : hint_addr;
    end

    always @(posedge clk) begin
        if (reset)
            hint_poly  <= 0;
        else if(curr_state == EXPAND_HINT)
            hint_poly[next_hint+hint_offset] <= 1;
    end
endmodule


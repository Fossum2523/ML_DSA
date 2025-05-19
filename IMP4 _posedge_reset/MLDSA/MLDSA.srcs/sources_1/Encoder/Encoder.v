module Encoder #(
    parameter OUTPUT_W    = 2,
    parameter COEFF_W     = 23,
    parameter MAX_LVL     = 20,
    parameter W           = 64
    )(
    input                           reset,
    input                           clk,
    input [2:0]                     encode_mode,
    input                           valid_i,
    output reg                      ready_i,
    input [OUTPUT_W*COEFF_W-1:0]    di,
    output reg [W-1:0]              dout,
    output reg                      valid_o,
    input                           ready_o
    );
    
    reg [4:0] ENCODE_LVL;
    reg [2:0] mode;
    
    localparam
        MLDSA_Q     = 23'd8380417,
        ENCODE_T0   = 3'd0,
        ENCODE_T1   = 3'd1,
        ENCODE_S1   = 3'd2,
        ENCODE_S2   = 3'd3,
        ENCODE_W1   = 3'd4,
        ENCODE_Z    = 3'd5;
    
    localparam
        NONE   = 3'd0,
        ETA    = 3'd1,
        T0     = 3'd2,
        T1     = 3'd3,
        GAMMA1 = 3'd4;
    
    wire [OUTPUT_W*COEFF_W-1:0] di_uncentered;
    reg  [OUTPUT_W*COEFF_W-1:0] di_uncentered_buffer;
    wire [MAX_LVL*OUTPUT_W-1:0]  stripped;
    
    reg [OUTPUT_W*COEFF_W-1:0] di_buffer;

    reg [1:0] valid_buffer;

    genvar i;
    generate
        for (i = 0; i < OUTPUT_W; i = i + 1) begin
            uncenter_coeff UNCENTER (mode, di_buffer[23*i+:23], di_uncentered[23*i+:23]);
        end
    endgenerate

    zero_strip Z_STRIP(ENCODE_LVL, di_uncentered_buffer, stripped);
    
    reg [255:0] PISO;
    reg [9:0]  piso_len, piso_len_next;
    reg [9:0] buffer_len [1:0];
    
    
    always @(*) begin
        ENCODE_LVL = 0;
        mode = NONE;
        case(encode_mode)
            {ENCODE_T0}: begin
                ENCODE_LVL = 13;
                mode = T0;
            end
            {ENCODE_T1}: begin
                ENCODE_LVL = 10;
                mode = T1;
            end
            {ENCODE_S2},
            {ENCODE_S1}: begin
                ENCODE_LVL = 3;
                mode = ETA;
            end
            {ENCODE_W1}: begin
                ENCODE_LVL = 6;
            end
            {ENCODE_Z}: begin
                ENCODE_LVL = 18;
                mode = GAMMA1;
            end
            default:begin
                ENCODE_LVL = 0;
                mode = NONE;
            end
        endcase
    
        
        valid_o = (piso_len >= W) ? 1 : 0; 
        piso_len_next = (valid_o && ready_o) ? piso_len - W: piso_len;   
        ready_i = 1;
        
        dout = PISO[W-1:0];
    end
    
    always @(posedge clk) begin
        if (reset) begin
            PISO     <= 0;
        end 
        else begin
            if (valid_buffer[1]) begin
                if (valid_o && ready_o) begin
                    PISO <= (PISO >> W) | ({192'd0, stripped} << piso_len_next);
                end 
                else begin
                    PISO <= PISO | ({192'd0, stripped} << piso_len_next);    
                end
            end 
            else if (valid_o && ready_o) begin
                PISO <= (PISO >> W);
            end
        end
    end
    
    always @(posedge clk) begin
        if (reset)
            piso_len <= 0;
        else
            piso_len <= piso_len_next + buffer_len[1];
    end

    always @(posedge clk) begin
        if (reset) begin
            valid_buffer <= 2'd0;
        end 
        else begin
            valid_buffer[0] <= ready_i && valid_i;
            valid_buffer[1] <= valid_buffer[0];
        end
    end

    always @(posedge clk) begin
        if (reset)
            di_uncentered_buffer <= {(OUTPUT_W*COEFF_W){1'b0}};
        else
            di_uncentered_buffer <= di_uncentered;
    end

    always @(posedge clk) begin
        if (reset)begin
            buffer_len[0] <= 10'd0;
            buffer_len[1] <= 10'd0;
        end
        else begin
            buffer_len[0] <= (ready_i && valid_i) ? OUTPUT_W*ENCODE_LVL : 0;
            buffer_len[1] <= buffer_len[0];
        end
    end

    always @(posedge clk) begin
        if (reset)
            di_buffer <= {(OUTPUT_W*COEFF_W){1'b0}};
        else
            di_buffer <= di;
    end
endmodule

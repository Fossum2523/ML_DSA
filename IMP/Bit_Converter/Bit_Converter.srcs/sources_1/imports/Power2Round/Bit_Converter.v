module Bit_Converter(
    input                   clk,
    input                   reset,
    input                   start,
    input       [12:0]      in,
    output                  in_en,
    output      [8-1:0]     in_addr,
    output  reg [63:0]      out,
    output                  out_en,
    output  reg [6-1:0]     out_addr,  //log2(52) = 6
    output                  done
);
    localparam  IDLE         = 2'd0,
                MEM_TRIGER   = 2'd1,
                PROCESS      = 2'd2;
                
    reg [8:0]   cnt;
    reg [1:0]   curr_state;
    reg [1:0]   next_state;

    reg [3:0]   round_cnt;
    reg [2:0]   full_cnt;
    reg [77:0]  shift_reg;
    reg [12:0]  buffer;
    
    wire [63:0] round_out[12:0];
    wire full;
    wire round_clean;
    
    assign full         = full_cnt == 5;
    assign round_clean  = round_cnt == 11;
    assign done         = cnt == 128;
    assign in_en        = (curr_state == PROCESS | curr_state == MEM_TRIGER) && cnt < 128;
    assign out_en       = curr_state == PROCESS && full;
    assign in_addr      = cnt[7:0];

    genvar i;
    generate
        for (i = 0; i < 13; i = i + 1) begin : data_mux
            if (i == 0) begin
                assign round_out[i] = shift_reg[76:13];
            end 
            else begin
                assign round_out[i] = shift_reg[76-i:13-i];
            end
        end
    endgenerate

    always @(posedge clk) begin
        if(reset)
            shift_reg <= 78'd0;
        else if(curr_state == PROCESS) 
            shift_reg <= {in, shift_reg[77:13]};
    end
    
    always @(posedge clk) begin
        if(reset)
            out <= 64'd0;
        else begin
            case (round_cnt)
                0:  out <= round_out[0];
                1:  out <= round_out[1];
                2:  out <= round_out[2];
                3:  out <= round_out[3];
                4:  out <= round_out[4];
                5:  out <= round_out[5];
                6:  out <= round_out[6];
                7:  out <= round_out[7];
                8:  out <= round_out[8];
                9:  out <= round_out[9];
                10: out <= round_out[10];
                11: out <= round_out[11];
                12: out <= round_out[12];
                default: out <= 64'd0;
            endcase
        end
    end

    always @(posedge clk) begin
        if(reset)
            round_cnt <= 4'd0;
        else if(round_clean && full) 
            round_cnt <= 4'd0;
        else if(curr_state == PROCESS && full) 
            round_cnt <= round_cnt + 1'b1;
    end

    always @(posedge clk) begin
        if(reset)
            full_cnt <= 3'd0;
        else if(full) 
            full_cnt <= 3'd0;
        else if(curr_state == PROCESS) 
            full_cnt <= full_cnt + 1'b1;
    end

    
    always @(posedge clk) begin
        if(reset)
            cnt <= 9'd0;
        else if(done) 
            cnt <= 9'd0;
        else if(curr_state == PROCESS || curr_state == MEM_TRIGER) 
            cnt <= cnt + 1'b1;
    end

    always @(posedge clk) begin
        if(reset)
            out_addr <= 6'd0;
        else if(curr_state == IDLE) 
            out_addr <= 6'd0;
        else if(curr_state == PROCESS && full) 
            out_addr <= out_addr + 1'b1;
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
                    next_state = MEM_TRIGER;
                else 
                    next_state = IDLE;
            end
            MEM_TRIGER:begin
                    next_state = PROCESS;
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


// genvar j;
    // generate
    //     for (i = 0; i < param_n; i = i + 1) begin : data_mux
    //         assign buf_round_out[i] = {{(12 - i){1'd0}}, shift_reg[64:64-i]};
    //     end
    // endgenerate
    // always @(posedge clk) begin
    //     if(reset)
    //         buffer <= 13'd0;
    //     else begin
    //         case (round_cnt)
    //             0:  buffer <= buf_round_out[0];
    //             1:  buffer <= buf_round_out[1];
    //             2:  buffer <= buf_round_out[2];
    //             3:  buffer <= buf_round_out[3];
    //             4:  buffer <= buf_round_out[4];
    //             5:  buffer <= buf_round_out[5];
    //             6:  buffer <= buf_round_out[6];
    //             7:  buffer <= buf_round_out[7];
    //             8:  buffer <= buf_round_out[8];
    //             9:  buffer <= buf_round_out[9];
    //             10: buffer <= buf_round_out[10];
    //             11: buffer <= buf_round_out[11];
    //             12: buffer <= buf_round_out[12];
    //             default: buffer <= 13'd0;
    //         endcase
    //     end
    // end


module Controller
    (   
    input               clk,
    input               reset,

    input               start,
    input               data_in_ready,
    // from Controller //
    output   [1:0]      main_mode, //KeyGen, SignGen, SignVer

    /*---Sha---*/
    output              sha_in_ready, 
    output              sha_is_last,
    output              sha_squeeze, // when squeeze = 0, output once; otherwise, keep squeezing
    output              sha_mode,
    output              sha_hold,
    output      [2:0]   sha_byte_num,
    input               sha_out_ready,
    output              sha_clean,
    /*---Seed---*/
    output              Rho_prime_en,
    output              Rho_en,
    output              Kata_en,
    output              Rho_prime_mode,
    output              Rho_mode,
    output              Kata_mode,
    /*---Sample---*/
    output reg  [2:0]   index,
    output [1:0] sha_in_sel,
    output [1:0] seed_in_sel,

    /*---Sampler---*/
    output  sampler_in_ready,
    input   next_element
    );  

    localparam  [2:0]   IDLE            = 3'd0,
                        SEED_PRODUCE    = 3'd1,
                        SHA_CLEAR       = 3'd2,
                        SAMPLE_S        = 3'd3,
                        REJECTION_S     = 3'd4,
                        SAMPLE_WAIT     = 3'd5;         
    
    //seed_in_sel
    localparam  [1:0]   RHO         = 2'b00,
                        RHO_PRIME   = 2'b01,
                        KATA        = 2'B10;

    //sha_in_sel
    localparam  [1:0]   OUSIDE  = 2'b00,
                        SAMPLE  = 2'b01;
                        
    reg [24:0] i;
    reg i_sti_buf;
    reg [2:0]curr_state;
    reg [2:0]next_state;

    // reg [3:0]cnt_seed;
    assign sha_clean    =   (curr_state == SHA_CLEAR);
    assign sha_in_sel   =   (curr_state == SEED_PRODUCE)   ? 2'd0 : 
                            (curr_state == SAMPLE_S ) ? 2'd1 : 2'd0;

    assign seed_in_sel  =   (curr_state == SAMPLE_S)     ? 2'd1 : 2'd0;

    assign sha_in_ready =   (curr_state == SEED_PRODUCE && data_in_ready) ? 1'b1 : 
                            (curr_state == SAMPLE_S) ? 1'b1 : 1'b0;
    
    assign sha_is_last  =   (curr_state == SEED_PRODUCE && i[3]) ? 1'b1 : 
                            (curr_state == SAMPLE_S && i[7])     ? 1'b1 : 1'b0;
    
    assign sha_squeeze  =   1'b0;

    assign sha_mode     =   1'b1;
    assign sha_hold     =   1'b0;

    // assign sha_byte_num =   (curr_state == SEED_PRODUCE ) ? 3'b010 : 
    //                         (curr_state == SAMPLE_S     ) ? 3'b010 :
    //                         (curr_state == SAMPLE_S_INDEX)? 3'b010 : 3'b000;
    assign sha_byte_num =   3'b010;
    // assign sha_byte_num = 3'b010;
    assign Rho_en       =   (curr_state == SEED_PRODUCE) && sha_out_ready;
    assign Rho_mode       = (curr_state == SEED_PRODUCE) ? 1'b0 : 1'b1;
    assign Rho_prime_en =   ((curr_state == SEED_PRODUCE) && sha_out_ready) ? 1'b1 :
                            ((curr_state == SAMPLE_S)     && ~i[7])         ? 1'b1 : 1'b0;
    assign Rho_prime_mode = (curr_state == SEED_PRODUCE) ? 1'b0 :
                            (curr_state == SAMPLE_S) ? 1'b1 : 1'b0;
    assign Kata_en      =   (curr_state == SEED_PRODUCE) && sha_out_ready;
    assign Kata_mode      = (curr_state == SEED_PRODUCE) ? 1'b0 : 1'b1;

    assign sampler_in_ready = (curr_state == REJECTION_S);
    always @ (posedge clk) begin 
        if (reset)                                                                                                                                                   
            i <= 25'd0;
        else if(curr_state!=next_state)
            i <= 25'd0;
        else
            i <= {i[23:0], i_sti_buf};
        // else 
        //     i <= 25'd0;
    end

    always @ (posedge clk) begin 
        if (reset)                                                                                                                                                   
            i <= 25'd0;
        else if(curr_state!=next_state)
            i <= 25'd0;
        else
            i <= {i[23:0], 1'b1};
        // else 
        //     i <= 25'd0;
    end

    always @ (posedge clk)
      if (reset) i_sti_buf <= 0;
      else  begin
        i_sti_buf <= (curr_state!=next_state);
      end

    // always @ (posedge clk) begin 
    //     if (reset)                                                                                                                                                   
    //         cnt_seed <= 4'd0;
    //     else if(curr_state == SAMPLE_S)
    //         cnt_seed <= cnt_seed + 1'b1;
    //     else 
    //         cnt_seed <= 4'd0;
    // end

    always @ (posedge clk) begin 
        if (reset)                                                                                                                                                   
            index <= 3'd0;
        else if(curr_state == SAMPLE_S && i ==8'b11111111)
            index <= index + 1'b1;
    end


    always @ (posedge clk) begin
        if (reset)
            curr_state <= IDLE;
        else 
            curr_state <= next_state;
    end

    always @(*) begin
        case (curr_state)
            IDLE: begin
                if(start)   
                    next_state = SEED_PRODUCE;
                else        
                    next_state = IDLE;
            end 
            SEED_PRODUCE: begin
                if(sha_out_ready)   
                    next_state = SHA_CLEAR;//SHA_CLEAR
                else                
                    next_state = SEED_PRODUCE;
            end
            SHA_CLEAR: begin
                if(index == 4)
                    next_state = SAMPLE_WAIT;
                else
                    next_state = SAMPLE_S;
            end
            SAMPLE_S: begin
                if(sha_out_ready)
                    next_state = REJECTION_S;
                else
                    next_state = SAMPLE_S;
            end
            REJECTION_S: begin
                if(next_element)
                    next_state = SHA_CLEAR;
                else 
                    next_state = REJECTION_S;
            end
            SAMPLE_WAIT: begin
                next_state = SAMPLE_WAIT;
            end
            default: next_state = IDLE;
        endcase
    end


endmodule

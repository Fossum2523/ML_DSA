

module Controller
    (   
    input               clk,
    input               reset,

    input               start,
    
    // from Controller //
    output   [1:0]      main_mode, //KeyGen, SignGen, SignVer

    /*---Sha---*/
    output              sha_in_ready, 
    output              sha_is_last,
    output              sha_squeeze, // when squeeze = 0, output once; otherwise, keep squeezing
    output              sha_mode,
    output              sha_sha_hold,
    output      [1:0]   sha_byte_num,
    input               sha_out_ready,
    /*---Seed---*/
    output              Rho_prime_en,
    output              Rho_en,
    output              Kata_en
    );  

    localparam  IDLE            = 3'd0,
                SEED_PRODUCE    = 3'd1,
                SAMPLE          = 3'd2;         
    
    assign sha_in_ready = (curr_state == SEED_PRODUCE) ? 1'b1 : 1'b0;
    assign sha_is_last  = (curr_state == SEED_PRODUCE) ? i[5] : 1'b0;
    assign Rho_en       = (curr_state == SEED_PRODUCE) && sha_out_ready;
    assign Rho_prime_en = (curr_state == SEED_PRODUCE) && sha_out_ready;
    assign Kata_en      = (curr_state == SEED_PRODUCE) && sha_out_ready;

    always @ (posedge clk) begin 
        if (reset)                                                                                                                                                   
            i <= 25'd0;
        else if(curr_state == SEED_PRODUCE)
            i <= {i[23:0], 1};
        else 
            i <= 25'd0;
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
                    next_state = SAMPLE_OVER;
                else                
                    next_state = SEED_PRODUCE;
            end
            SAMPLE: begin
                next_state = SAMPLE;
            end
            default: next_state = IDLE;
        endcase
    end


endmodule

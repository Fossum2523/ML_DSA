

module Controller
    (   
    input               clk,
    input               reset,

    /*---from outside---*/
    input               start,
    input               data_in_ready,
    input   [1:0]       main_mode, //KeyGen, SignGen, SignVer

    /*---Keack---*/
    output              sha_in_ready, 
    output              sha_is_last,
    output              sha_squeeze, // when squeeze = 0, output once; otherwise, keep squeezing
    output              sha_mode,
    output              sha_hold,
    output      [2:0]   sha_byte_num,
    input               sha_out_ready,
    output              sha_clean,

    /*---Data_Mem---*/
    output              mem_sel,
    output              Rho_en,
    output              Rho_prime_en,
    output              Kata_en,
    output              Rho_mode,
    output              Rho_prime_mode,
    output              Kata_mode,

    /*---Sampler---*/
    output [1:0]        sampler_mode,
    output [3:0]        index,
    output              sampler_in_ready,
    input               next_element,
    output [1:0]        sha_in_sel,
    output [1:0]        seed_in_sel,

    /*---NTT---*/
    output              NTT_mode,
	output              NTT_in_ready,
    input               NTT_done
    );  

    //main mode
    localparam  [1:0]   KeyGen  = 2'd0,
                        SignGen = 2'd1,
                        SignVer = 2'd2;

    //Sampler mode
    localparam [1:0]    S_mode    = 2'd0,
                        A_mode    = 2'd1,
                        MASK_mode = 2'd2,
                        SIB_mode  = 2'd3;
    //Keccak mode
    parameter           G = 1'b0,
                        H = 1'b1;

    //KeyGen FSM
    localparam  [3:0]   IDLE         = 4'd0,
                        SEED_PRODUCE = 4'd1,
                        SHA_CLEAR    = 4'd2,
                        SAMPLE_S     = 4'd3,
                        REJECTION_S  = 4'd4,
                        SAMPLE_A     = 4'd5,
                        REJECTION_A  = 4'd6,
                        NTT_S1       = 4'd7,
                        SAMPLE_WAIT  = 4'd8;         
    
    //seed_in_sel
    localparam  [1:0]   RHO       = 2'b00,
                        RHO_PRIME = 2'b01,
                        KATA      = 2'B10;

    //sha_in_sel
    localparam  [1:0]   OUSIDE  = 2'b00,
                        SAMPLE  = 2'b01;
                        
    
    reg [24:0]  i;
    reg         i_sti_buf;
    reg [3:0]   curr_state;
    reg [3:0]   next_state;
    // reg [3:0]cnt_seed;

    reg [3:0]   s_mem_cnt;
    reg [4:0]   A_mem_cnt;


    /*---Keack---*/
    //---choose which seed to be keack
    assign seed_in_sel  =   (curr_state == SAMPLE_S) ? RHO_PRIME :
                            (curr_state == SAMPLE_A) ? RHO       : 2'd0;
    assign sha_in_sel   =   (curr_state == SEED_PRODUCE) ? OUSIDE: 
                            (curr_state == SAMPLE_S || curr_state == SAMPLE_A)  ? SAMPLE : 2'd0;
    assign sha_in_ready =   (curr_state == SEED_PRODUCE && data_in_ready) ? 1'b1 : 
                            (curr_state == SAMPLE_S || curr_state == SAMPLE_A) ? 1'b1 : 1'b0;
    assign sha_is_last  =   (curr_state == SEED_PRODUCE && i[3]) ? 1'b1 : 
                            (curr_state == SAMPLE_S && i[7])     ? 1'b1 :
                            (curr_state == SAMPLE_A && i[3])     ? 1'b1 : 1'b0;
    assign sha_squeeze  =   1'b0;
    assign sha_mode     =   (curr_state == SEED_PRODUCE) ? H : 
                            (curr_state == SAMPLE_S || curr_state == REJECTION_S)     ? H :
                            (curr_state == SAMPLE_A || curr_state == REJECTION_A)     ? G : 1'b0;
    assign sha_hold     =   1'b0;
    // assign sha_byte_num =   (curr_state == SEED_PRODUCE ) ? 3'b010 : 
    //                         (curr_state == SAMPLE_S     ) ? 3'b010 :
    //                         (curr_state == SAMPLE_S_INDEX)? 3'b010 : 3'b000;
    assign sha_byte_num =   3'b010;
    assign sha_clean    =   (curr_state == SHA_CLEAR);

    /*---Data_Mem---*/
    assign mem_sel        = (curr_state == NTT_S1) ? 1'b1 : 1'b0;
    assign Rho_en         = (curr_state == SEED_PRODUCE) && sha_out_ready   ? 1'b1 :
                            ((curr_state == SAMPLE_A)    && ~i[3])          ? 1'b1 : 1'b0;
    assign Rho_prime_en   = ((curr_state == SEED_PRODUCE) && sha_out_ready) ? 1'b1 :
                            ((curr_state == SAMPLE_S)    && ~i[7])          ? 1'b1 : 1'b0;
    assign Kata_en        = (curr_state == SEED_PRODUCE) && sha_out_ready;
    assign Rho_mode       = (curr_state == SEED_PRODUCE) ? 1'b0 :
                            (curr_state == SAMPLE_A)     ? 1'b1 : 1'b0;
    assign Rho_prime_mode = (curr_state == SEED_PRODUCE) ? 1'b0 :
                            (curr_state == SAMPLE_S)     ? 1'b1 : 1'b0;
    assign Kata_mode      = (curr_state == SEED_PRODUCE) ? 1'b0 : 1'b1;

    /*---Sampler---*/
    assign sampler_mode = (curr_state == SAMPLE_S || curr_state == REJECTION_S) ? S_mode :
                          (curr_state == SAMPLE_A || curr_state == REJECTION_A) ? A_mode : 2'b0;
    assign index        = (curr_state == SAMPLE_S || curr_state == REJECTION_S) ? s_mem_cnt[2:0] :
                          (curr_state == SAMPLE_A || curr_state == REJECTION_A) ? A_mem_cnt      : 4'd0;
    assign sampler_in_ready = ((curr_state == SAMPLE_S || curr_state == REJECTION_S || curr_state == SAMPLE_A || curr_state == REJECTION_A) && sha_out_ready);

    /*---NTT---*/
    assign NTT_mode     = 1'b0;
    assign NTT_in_ready = (curr_state == NTT_S1);


    /*---Sampler---*/
    //---s mem addr control
    always @ (posedge clk) begin 
        if (reset)                                                                                                                                                   
            s_mem_cnt <= 4'd0;
        else if(curr_state == REJECTION_S && next_element)
            s_mem_cnt <= s_mem_cnt + 1'b1;
    end
    //---s mem addr control
    always @ (posedge clk) begin 
        if (reset)                                                                                                                                                   
            A_mem_cnt <= 4'd0;
        else if(curr_state == REJECTION_A && next_element)
            A_mem_cnt <= A_mem_cnt + 1'b1;
    end


    /*---Keack---*/
    always @ (posedge clk) begin 
        if (reset)                                                                                                                                                   
            i <= 25'd0;
        else if(curr_state != next_state)
            i <= 25'd0;
        else
            i <= {i[23:0], 1'b1};
    end

    always @ (posedge clk)
      if (reset) i_sti_buf <= 0;
      else  begin
        i_sti_buf <= (curr_state != next_state);
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
                if(A_mem_cnt == 16)
                    next_state = NTT_S1;
                else if(s_mem_cnt == 8)
                    next_state = SAMPLE_A;
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
            SAMPLE_A: begin
                if(sha_out_ready)
                    next_state = REJECTION_A;
                else
                    next_state = SAMPLE_A;
            end
            REJECTION_A: begin
                if(next_element)
                    next_state = SHA_CLEAR;
                else 
                    next_state = REJECTION_A;
            end
            NTT_S1: begin
                next_state = NTT_S1;
            end
            SAMPLE_WAIT: begin
                next_state = SAMPLE_WAIT;
            end
            default: next_state = IDLE;
        endcase
    end


endmodule

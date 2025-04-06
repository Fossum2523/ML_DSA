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
    output  [2:0]       sha_byte_num,
    input               sha_out_ready,
    output              sha_clean,

    /*---Data_Mem---*/
    output              mem_sel,
    output              A_mem_sel,
    output              t_mem_sel,
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
    output reg [1:0]    NTT_index,
    input               NTT_done,

    /*---PWM---*/
    output              PWM_start,
    output reg [3:0]    PWM_index,
    input               PWM_done
    );  

    //KeyGen FSM
    localparam  [3:0]   IDLE     = 4'd0,
                        STAGE_1  = 4'd1,        
                        STAGE_T  = 4'd15;        

    /*---KeyGen Main---*/
    always @ (posedge clk or posedge reset) begin
        if (reset)
            curr_state_KEYGEN <= IDLE;
        else 
            curr_state_KEYGEN <= next_state_KEYGEN;
    end

    always @(*) begin
        case (curr_state_KEYGEN)
            IDLE: begin
                if(start)   
                    next_state_KEYGEN = STAGE_1;
                else        
                    next_state_KEYGEN = IDLE;
            end
            STAGE_1: begin
                if(sha_out_ready)   
                    next_state = STAGE_T;
                else                
                    next_state = STAGE_1;
            end 
            STAGE_T: begin
                next_state = STAGE_T;
            end
            default: next_state_KEYGEN = IDLE;
        endcase
    end

    always @ (posedge clk) begin 
        if (reset)                                                                                                                                                   
            s_mem_cnt <= 4'd0;
        else if(ctrl_sign == {KeyGen,6'd2} && next_element)
            s_mem_cnt <= s_mem_cnt + 1'b1;
    end
endmodule






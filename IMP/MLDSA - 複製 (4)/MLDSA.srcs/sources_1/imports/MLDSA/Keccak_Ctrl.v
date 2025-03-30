module Keccak_Ctrl
    (   
    input               clk,
    input               reset,
    input               sha_en,
    input               sha_type,
    input  [2:0]        MLSDA_in_byte_num,
    input               next_element,
    output              sha_in_ready, 
    output              sha_is_last,
    output              sha_squeeze, // when squeeze = 0, output once; otherwise, keep squeezing
    output              sha_mode,
    output              sha_hold,
    output  [2:0]       sha_byte_num,
    input               sha_out_ready,//交由主Controller控制，將sha_en拉掉
    output              sha_clean,
    output [1:0]        sha_in_sel,
    output [1:0]        seed_in_sel
    );  

    parameter   Gen_Seed    = 4'd0,
                Gen_A       = 4'd1,
                Gen_s1      = 4'd2,
                Gen_s2      = 4'd3,
                Gen_y       = 4'd4,
                H_u_w1      = 4'd5,
                H_pk_1      = 4'd6,
                H_pk_2      = 4'd7,
                Gen_c_1     = 4'd8,
                Gen_c_2     = 4'd9,
                H_K_rnd_u   = 4'd10,
                H_tr_M_1    = 4'd11,
                H_tr_M_2    = 4'd12;


    reg     padder_cnt;//用來計數padder的次數，最後會送一筆last訊號
    reg     state;      

    assign  sha_in_ready =  sha_en;                          
    assign  sha_is_last  =         
    assign  sha_squeeze  =  1'b0;//交由其他module來送，可以不用
    assign  sha_mode     =    
    assign  sha_hold     =   
    
    assign  sha_clean    =  next_element;
    assign  sha_in_sel   = 
    assign  seed_in_sel  =                       
   

    assign  sha_byte_num = sha_type <= 4'd5  ? 3'b010 :
                           sha_type >= 4'd11 ? MLSDA_in_byte_num : 3'b000;
                    
endmodule





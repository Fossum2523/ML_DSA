module Keccak_Ctrl
    (   
    input               clk,
    input               reset,
    input               sha_en,
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

    reg     padder_cnt;//用來計數padder的次數，最後會送一筆last訊號
    reg     state;           
    assign  sha_in_ready =  sha_en;                          
    assign  sha_is_last  =         
    assign  sha_squeeze  =  1'b0;//交由其他module來送，可以不用
    assign  sha_mode     =    
    assign  sha_hold     =   
    assign  sha_byte_num = 
    assign  sha_clean    =  next_element;
    assign  sha_in_sel   = 
    assign  seed_in_sel  =                       
    
endmodule





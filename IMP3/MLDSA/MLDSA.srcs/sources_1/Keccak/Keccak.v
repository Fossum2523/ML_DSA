module Keccak(         
    input              clk,
    input              reset,
    input      [63:0]  in,
    input              in_ready, 
    input              is_last,
    input              squeeze,
    input              mode,
    input              sha_hold,
    input      [2:0]   byte_num,
    output             buffer_full,
    output             buffer_last,
    output     [1343:0]out,
    output             out_ready,
    //test
    output       [1343:0]padder_out,
    output               padder_out_ready,
    output       [1599:0]f_out,
    output               f_out_ready
    );
    
//     wire       [1343:0]padder_out;
//     wire               padder_out_ready;
//    wire               f_ack;
//     wire       [1599:0]f_out;
    wire               f_out_ready;
    wire               buffer_un_empty;
    wire               i_last;
    
    parameter   G     = 1'b0,
                H     = 1'b1;

    assign buffer_last = i_last & ( ~ buffer_full ) & in_ready;
    assign out = (mode == G)? f_out[1343:0]: /*(mode == h)*/{256'b0, f_out[1087:0]};
    assign out_ready = f_out_ready & (~ buffer_un_empty);

    Padder
      padder_ (clk, reset, in, in_ready, is_last, mode, byte_num, buffer_full, buffer_un_empty,  i_last, padder_out, padder_out_ready, f_ack);

    F_Permutation
      f_permutation_ (clk, reset, padder_out, padder_out_ready, squeeze, mode, sha_hold, f_ack, f_out, f_out_ready);

endmodule

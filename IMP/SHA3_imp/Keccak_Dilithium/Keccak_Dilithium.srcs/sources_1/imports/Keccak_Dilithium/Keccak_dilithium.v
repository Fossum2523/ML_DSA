module Keccak_Dilithium(         
    input              clk,
    input              reset,
    input      [63:0]  in,
    input              in_ready, 
    input              is_last,
    input              squeeze, // when squeeze = 0, output once; otherwise, keep squeezing
    input              mode,
    input              sha_hold,
    input      [1:0]   byte_num,
    output             buffer_full, /* to "user" module */
    output             buffer_last,
    output     [1343:0]out,
    output             out_ready
    );
    
    reg                in_squeeze;
    wire       [1343:0]padder_out;
    wire               padder_out_ready;
    wire               f_ack;
    wire       [1599:0]f_out;
    wire               f_out_ready;
    wire       [1343:0]out1;      /* before reorder byte */ // need update
    reg        [22:0]  i;         /* gen "out_ready" */ // need update
    wire               i_last;
    reg                mode_buf;
    
    parameter   G     = 1'b0,
                H     = 1'b1;

    assign buffer_last = i_last & ( ~ buffer_full ) & in_ready;
    assign out = (mode == G)? f_out[1343:0]: /*(mode == h)*/{256'b0, f_out[1087:0]};
    assign out_ready = ( ~ buffer_full ) & f_out_ready;

    Padder_Dilithium
      padder_ (clk, reset, in, in_ready, is_last, mode_buf, byte_num, buffer_full, i_last, padder_out, padder_out_ready, f_ack);

    F_Permutation_Dilithium
      f_permutation_ (clk, reset, padder_out, padder_out_ready, in_squeeze, mode_buf, sha_hold, f_ack, f_out, f_out_ready);

  
    always @ (posedge clk)
    begin
      if (reset)
        in_squeeze <= 0;
      else if (squeeze & f_ack)
        in_squeeze <= 1;
      else if (~squeeze)
        in_squeeze <= 0;
    end

    always @ (posedge clk)
    begin
      if (reset)
        mode_buf <= 0;
      else if (in_ready)
        mode_buf <= mode;
      else
        mode_buf <= mode_buf;
    end

endmodule

module Padder_Dilithium(
    input               clk,
    input               reset,
    input      [63:0]   in,
    input               in_ready,
    input               is_last,
    input               mode,
    input      [2:0]    byte_num,
    output              buffer_full, /* to "user" module */
    output              i_last,
    output reg [1343:0] out,         /* to "f_permutation" module */ // need update
    output              out_ready,   /* to "f_permutation" module */
    input               f_ack,        /* from "f_permutation" module */
    );
 
                                    /* if "ack" is 1, then current output has been used by "f_permutation" module */
    
    reg                state;       /* state == 0: user will send more input data
                                     * state == 1: user will not send any data */
    reg                done;        /* == 1: out_ready should be 0 */
    reg        [20:0]  i;           /* length of "out" buffer */ // 576/32 = 18, therefore i[17:0] (one-hot encoding)
    reg        [63:0]  v1;          /* to be shifted into register "out" */
    wire       [63:0]  v0;          /* output of module "padder1" */  
    wire               accept,      /* accept user input? */
                       update;
                       
    parameter   G     = 1'b0,
                H     = 1'b1; 
    


    assign buffer_full = (mode == G)  ?   i[20]: // (20 + 1) * 64 = 1344
                         /*(mode == H)?*/ i[16]; // (16 + 1) * 64 = 1088
    assign out_ready = buffer_full;
    assign i_last = (mode == G)?    i[19]:
                    /*(mode == H)?*/i[15];
    assign accept = (~ state) & in_ready & (~ buffer_full); // if state == 1, do not eat input
    assign update = (accept | (state & (~ buffer_full))) & (~ done); // don't fill buffer if done
    

    padder1 p0 (in, byte_num, v0);


    always @ (posedge clk or negedge reset)
      if (!reset)
        out <= 0;
      else if (update)
        if (mode == G)
          out <= {v1, out[1343:64]}; // need update
        else 
          out <= {v1, out[1087:64]}; // need update

    always @ (posedge clk or negedge reset)
      if (!reset)
        i <= 0;
      else if (f_ack | update)
        i <= {i[19:0], 1'b1} & {21{~ f_ack}}; // need update

    always @ (posedge clk or negedge reset)
      if (!reset)
        state <= 0;
      else if (is_last)
        state <= 1;
      else
        state <= state;

    always @ (posedge clk or negedge reset)
      if (!reset)
        done <= 0;
      else if (state & out_ready)
        done <= 1;
      else
        done <= done;

    always @ (*)
      begin
        if (state) // @ (posedge clk) is_last == 1
          begin
            v1 = 0;
            v1[63] = v1[63] | i_last; // need update
          end
        else if (is_last == 0)
          v1 = in;
        else // is_last == 1, but not meet with (posedge clk)
          begin
            v1 = v0;
          end
      end
endmodule

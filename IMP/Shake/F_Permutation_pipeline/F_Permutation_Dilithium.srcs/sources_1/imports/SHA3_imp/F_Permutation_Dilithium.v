module F_Permutation_Dilithium(
    input               clk,
    input               reset,
    input      [1343:0] in,
    input               in_ready,           // when squeeze = 0, output once; otherwise, keep squeezing
    input               squeeze,            // when squeeze = 0, output once; otherwise, keep squeezing
    input      [1:0]    mode,               //select sha3 type
    input               sha_hold,           //hold the sha data
    output              ack,                /* if "ack" is 1, then current input has been used. */
    output reg [1599:0] out,
    output reg          out_ready
    );

    //here I check some output
    reg        [22:0]   i;          /* select round constant */
    wire       [1599:0] round_out;
    wire       [63:0]   rc;         /* round constant */
    wire                update;
    wire                accept;
    reg                 calc;       /* == 1: calculating rounds */
    reg                 i_sti_buf; 

    parameter   G     = 2'b00,
                H     = 2'b10;

    assign accept = (in_ready | squeeze) & (~ calc); // in_ready & (i == 0)
    
    assign update = calc | accept | squeeze;

    assign ack = accept;

    rconst
      rconst_ ({i, i_sti_buf}, rc);
      
    round
      round_ (out, rc, round_out);
    
    always @ (posedge clk)
      if (reset) i <= 0;
      else if(sha_hold) i <= i;
      else if(update)i <= {i[21:0], i_sti_buf};
      else i <= i;
    
    always @ (posedge clk)
      if (reset) calc <= 0;
      else       calc <= (calc & (~ i[22]) ) | accept | squeeze;
    
    always @ (posedge clk)
      if (reset) i_sti_buf <= 0;
      else  begin
        i_sti_buf <= out_ready | accept;
      end
    
    always @ (posedge clk)
      if (reset)
        out_ready <= 0;
      else if (i == 0) 
        out_ready <= 0;
      else if (i[22]) // only change at the last round
        out_ready <= 1;

    always @ (posedge clk)
      if (reset)
        out <= 1600'd0;
      else if (accept)
        out <= (mode == G)?     {out[1599:1344], in[1343:0] ^ out[1343:0]}:   //204 G sahke128
               /*mode == H)"*/  {out[1599:1088], in[1087:0] ^ out[1087:0]};   //204 H sahke256
               
      else if (update)
        out <= sha_hold ? out : round_out;
        
endmodule
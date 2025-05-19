`define low_pos(x,y)        `high_pos(x,y) - 63
`define high_pos(x,y)       64*(5*y+x+1) - 1
`define add_1(x)            (x == 4 ? 0 : x + 1)
`define add_2(x)            (x == 3 ? 0 : x == 4 ? 1 : x + 2)
`define sub_1(x)            (x == 0 ? 4 : x - 1)
`define rot_up(in, n)       {in[63-n:0], in[63:63-n+1]}
`define rot_up_1(in)        {in[62:0], in[63]}

module round_B(
    input  [1599:0] in,
    input  [63:0]   round_const,
    output [1599:0] out
    );

    //variable definition----------------------------start
    wire   [63:0]    e[4:0][4:0];
    wire   [63:0]    f[4:0][4:0];
    wire   [63:0]    g[4:0][4:0];

    genvar x;
    genvar y;
    //variable definition----------------------------end
    

    //"generate State Array A[x, y, z]"----------------------------start
    generate
      for(y=0; y<5; y=y+1)
        begin : H0
          for(x=0; x<5; x=x+1)
            begin : H1
              assign e[x][y] = in[`high_pos(x,y) : `low_pos(x,y)];
            end
        end
    endgenerate
    //"generate State Array A[x, y, z]"----------------------------end


    /*χ step:*/
    //" A[x, y] = B[x, y] ⊕ ((NOT B[x + 1, y]) AND B[x + 2, y]), ∀(x, y) in (0 . . . 4, 0 . . . 4)"----------------------------start
    generate
      for(y=0; y<5; y=y+1)
        begin : H6
          for(x=0; x<5; x=x+1)
            begin : H7
              assign f[x][y] = e[x][y] ^ ((~ e[`add_1(x)][y]) & e[`add_2(x)][y]);
            end
        end
    endgenerate
    //" A[x, y] = B[x, y] ⊕ ((NOT B[x + 1, y]) AND B[x + 2, y]), ∀(x, y) in (0 . . . 4, 0 . . . 4)"----------------------------end


    /*ι step:*/
    //"A[0, 0] = A[0, 0] ⊕ RC"----------------------------start
    generate
      for(x=0; x<64; x=x+1)
        begin : H8
          if(x==0 || x==1 || x==3 || x==7 || x==15 || x==31 || x==63)
            assign g[0][0][x] = f[0][0][x] ^ round_const[x];
          else
            assign g[0][0][x] = f[0][0][x];
        end
    endgenerate
    
    generate
      for(y=0; y<5; y=y+1)
        begin : H9
          for(x=0; x<5; x=x+1)
            begin : H10
              if(x!=0 || y!=0)
                assign g[x][y] = f[x][y];
            end
        end
    endgenerate
    //"A[0, 0] = A[0, 0] ⊕ RC"----------------------------end


    //"Converting State Arrays to Strings"----------------------------start
    generate
      for(y=0; y<5; y=y+1)
        begin : H11
          for(x=0; x<5; x=x+1)
            begin : H12
              assign out[`high_pos(x,y) : `low_pos(x,y)] = g[x][y];
            end
        end
    endgenerate
    //"Converting State Arrays to Strings"----------------------------end
endmodule

`undef low_pos
`undef high_pos
`undef add_1
`undef add_2
`undef sub_1
`undef rot_up
`undef rot_up_1

`define low_pos(x,y)        `high_pos(x,y) - 63
`define high_pos(x,y)       64*(5*y+x+1) - 1
`define add_1(x)            (x == 4 ? 0 : x + 1)
`define add_2(x)            (x == 3 ? 0 : x == 4 ? 1 : x + 2)
`define sub_1(x)            (x == 0 ? 4 : x - 1)
`define rot_up(in, n)       {in[63-n:0], in[63:63-n+1]}
`define rot_up_1(in)        {in[62:0], in[63]}

    /*  theta - rho   */
module round(
    input  [1599:0] in,
    input  [63:0]   round_const,
    output [1599:0] out
    );

    //variable definition----------------------------start
    wire   [63:0]   a[4:0][4:0];
    wire   [63:0]   b[4:0];
    wire   [63:0]   c[4:0][4:0];
    wire   [63:0]   d[4:0][4:0];
    wire   [63:0]   e[4:0][4:0];
    wire   [63:0]   f[4:0][4:0];

    genvar x;
    genvar y;
    //variable definition----------------------------end


    //"generate State Array A[x, y, z]"----------------------------start
    generate
      for(y=0; y<5; y=y+1)
        begin : H0
          for(x=0; x<5; x=x+1)
            begin : H1
              assign a[x][y] = in[`high_pos(x,y) : `low_pos(x,y)]; //ex.a[0][0] = in[63:0]、a[4][4] = in[1599:1536]
            end
        end
    endgenerate
    //"generate State Array A[x, y, z]"----------------------------end


    /*θ step:*/
    //"C[x] = A[x, 0] ⊕ A[x, 1] ⊕ A[x, 2] ⊕ A[x, 3] ⊕ A[x, 4]"----------------------------start
    generate
      for(x=0; x<5; x=x+1)
        begin : H2
          assign b[x] = a[x][0] ^ a[x][1] ^ a[x][2] ^ a[x][3] ^ a[x][4];
        end
    endgenerate
    //"C[x] = A[x, 0] ⊕ A[x, 1] ⊕ A[x, 2] ⊕ A[x, 3] ⊕ A[x, 4]"----------------------------end


    //"D[x] = C[x − 1] ⊕ ROT(C[x + 1], 1), ∀x in 0" Merge "A[x, y] = A[x, y] ⊕ D[x], ∀(x, y) in (0 . . . 4, 0 . . . 4)"----------------------------start
    generate
      for(y=0; y<5; y=y+1)
        begin : H3
          for(x=0; x<5; x=x+1)
            begin : H4
              assign c[x][y] = a[x][y] ^ b[`sub_1(x)] ^ `rot_up_1(b[`add_1(x)]);
            end
        end
    endgenerate
    //"D[x] = C[x − 1] ⊕ ROT(C[x + 1], 1), ∀x in 0" Merge "A[x, y] = A[x, y] ⊕ D[x], ∀(x, y) in (0 . . . 4, 0 . . . 4)"----------------------------end

    /*ρ and π steps:*/
    //"B[y, 2x + 3y] = ROT(A[x, y], r[x, y]), ∀(x, y) in (0 . . . 4, 0 . . . 4)"----------------------------start
    assign d[0][0] = c[0][0];
    assign d[0][2] = `rot_up_1(c[1][0]);
    assign d[0][4] = `rot_up(c[2][0], 62);
    assign d[0][1] = `rot_up(c[3][0], 28);
    assign d[0][3] = `rot_up(c[4][0], 27);
    assign d[1][3] = `rot_up(c[0][1], 36);
    assign d[1][0] = `rot_up(c[1][1], 44);
    assign d[1][2] = `rot_up(c[2][1], 6);
    assign d[1][4] = `rot_up(c[3][1], 55);
    assign d[1][1] = `rot_up(c[4][1], 20);
    assign d[2][1] = `rot_up(c[0][2], 3);
    assign d[2][3] = `rot_up(c[1][2], 10);
    assign d[2][0] = `rot_up(c[2][2], 43);
    assign d[2][2] = `rot_up(c[3][2], 25);
    assign d[2][4] = `rot_up(c[4][2], 39);
    assign d[3][4] = `rot_up(c[0][3], 41);
    assign d[3][1] = `rot_up(c[1][3], 45);
    assign d[3][3] = `rot_up(c[2][3], 15);
    assign d[3][0] = `rot_up(c[3][3], 21);
    assign d[3][2] = `rot_up(c[4][3], 8);
    assign d[4][2] = `rot_up(c[0][4], 18);
    assign d[4][4] = `rot_up(c[1][4], 2);
    assign d[4][1] = `rot_up(c[2][4], 61);
    assign d[4][3] = `rot_up(c[3][4], 56);
    assign d[4][0] = `rot_up(c[4][4], 14);  
    //"B[y, 2x + 3y] = ROT(A[x, y], r[x, y]), ∀(x, y) in (0 . . . 4, 0 . . . 4)"----------------------------end


    /*χ step:*/
    //" A[x, y] = B[x, y] ⊕ ((NOT B[x + 1, y]) AND B[x + 2, y]), ∀(x, y) in (0 . . . 4, 0 . . . 4)"----------------------------start
    generate
      for(y=0; y<5; y=y+1)
        begin : H5
          for(x=0; x<5; x=x+1)
            begin : H6
              assign e[x][y] = d[x][y] ^ ((~ d[`add_1(x)][y]) & d[`add_2(x)][y]);
            end
        end
    endgenerate
    //" A[x, y] = B[x, y] ⊕ ((NOT B[x + 1, y]) AND B[x + 2, y]), ∀(x, y) in (0 . . . 4, 0 . . . 4)"----------------------------end


    /*ι step:*/
    //"A[0, 0] = A[0, 0] ⊕ RC"----------------------------start
    generate
      for(x=0; x<64; x=x+1)
        begin : H7
          if(x==0 || x==1 || x==3 || x==7 || x==15 || x==31 || x==63)
            assign f[0][0][x] = e[0][0][x] ^ round_const[x];
          else
            assign f[0][0][x] = e[0][0][x];
        end
    endgenerate
    
    generate
      for(y=0; y<5; y=y+1)
        begin : H8
          for(x=0; x<5; x=x+1)
            begin : H9
              if(x!=0 || y!=0)
                assign f[x][y] = e[x][y];
            end
        end
    endgenerate
    //"A[0, 0] = A[0, 0] ⊕ RC"----------------------------end


    //"Converting State Arrays to Strings"----------------------------start
    generate
      for(y=0; y<5; y=y+1)
        begin : H10
          for(x=0; x<5; x=x+1)
            begin : H11
              assign out[`high_pos(x,y) : `low_pos(x,y)] = f[x][y];
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
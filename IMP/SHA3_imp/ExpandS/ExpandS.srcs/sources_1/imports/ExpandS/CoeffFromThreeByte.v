module CoeffFromThreeByte(
    input         [3:0] in,
    output signed [2:0] out
    );

    /*Karnaugh Map imp:*/
    // wire A;
    // wire B;
    // wire C;
    // wire D;
    // wire A_bar;
    // wire B_bar;
    // wire C_bar;
    // wire D_bar;

    // assign A     = in[3];
    // assign B     = in[2];
    // assign C     = in[1];
    // assign D     = in[0];
    // assign A_bar = ~in[3];
    // assign B_bar = ~in[2];
    // assign C_bar = ~in[1];
    // assign D_bar = ~in[-];

    // always @(*) begin
    //   out[0] = (A & C_bar & D) | (A & B & C & D_bar) | (A_bar & B & C_bar & D_bar) | (A_bar & B_bar & C & D);
    //   out[1] = (A & B & C) | (A & C_bar & D) | (A_bar & B & C_bar) | (B_bar & C_bar & D_bar) | (A_bar & B_bar & C & D);
    //   out[2] = (B_bar & C & D) | (A & B_bar & C_bar & D_bar) | (A & B & C_bar & D) | (A_bar & B & C & D_bar);
    // end

    /*LUT imp:*/
    always @(*) begin
      case (in[3:2])
        2'b00:begin
          case (in[1:0])
            2'b00: out = 3'b010; //  2
            2'b01: out = 3'b001; //  1
            2'b11: out = 3'b111; // -1
            2'b10: out = 3'b000; //  0
            default: out = 3'b000;
          endcase
        end
        2'b01:begin
          case (in[1:0])
            2'b00: out = 3'b110; // -2
            2'b01: out = 3'b010; //  2
            2'b11: out = 3'b000; //  0
            2'b10: out = 3'b001; //  1
            default: out = 3'b000;
          endcase
        end
        2'b11:begin
          case (in[1:0])
            2'b00: out = 3'b000; //  0
            2'b01: out = 3'b111; // -1
            2'b11: out = 3'b010; //  2
            2'b10: out = 3'b110; // -2
            default: out = 3'b000;
          endcase
        end
        2'b10:begin
          case (in[1:0])
            2'b00: out = 3'b111; // -1
            2'b01: out = 3'b110; // -2
            2'b11: out = 3'b001; //  1
            2'b10: out = 3'b000; //  0
            default: out = 3'b000;
          endcase
        end
        default: 
          out = 3'b000;
      endcase
    end
endmodule

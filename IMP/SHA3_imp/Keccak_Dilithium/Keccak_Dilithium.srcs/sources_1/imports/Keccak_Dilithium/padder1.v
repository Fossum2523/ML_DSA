/*
 *     in      byte_num     out
 * 0x11223344      0    0x01000000
 * 0x11223344      1    0x11010000
 * 0x11223344      2    0x11220100
 * 0x11223344      3    0x11223301
 */

module padder1(
    input      [63:0] in,
    input      [2:0]  byte_num,
    output reg [63:0] out
    );
      
    // always @ (*)
    //   case (byte_num) 
    //     //SHAKE-128, SHAKE-256
    //     2'b00: out = 64'h000000000000001f;         //5.𝑡𝑟 ← H(𝑝𝑘, 64) 6.𝜌″ ← H(𝐾||𝑟𝑛𝑑||𝜇, 64) 8.c tilde← H(𝜇||w1Encode(𝐰1), 𝜆/4) 9.𝑐 ∈ 𝑅𝑞 ← SampleInBall(𝑐 tilde)
    //     2'b01: out = {24'h00001f,in[39:0]};       //4.𝜇 ← H(BytesToBits(𝑡𝑟)||𝑀′ , 64)
    //     2'b10: out = {16'h001f,in[47:0]};         //1.(𝜌, 𝜌′ , 𝐾) ← H(𝜉||x04||x04, 128)  2.ExpandA(𝜌)RejNTTPoly(𝜌′) 3.ExpandSRejBoundedPoly(𝜌||IntegerToBytes(𝑟, 2)) 7.ExpandMask(𝜌, 𝜇)𝑣 ← H(𝜌′ , 32𝑐)
	  // endcase

    always @ (*)
      case (byte_num) 
        //SHAKE-128, SHAKE-256
        3'b000: out = 64'h000000000000001f;
        3'b001: out = {56'h0000000000001f,in[7:0]};
        3'b010: out = {48'h00000000001f,in[15:0]};
        3'b011: out = {40'h000000001f,in[23:0]};
        3'b100: out = {32'h0000001f,in[31:0]};
        3'b101: out = {24'h00001f,in[39:0]};
        3'b110: out = {16'h001f,in[47:0]};
        3'b111: out = {8'h1f,in[55:0]};
	  endcase
    
endmodule

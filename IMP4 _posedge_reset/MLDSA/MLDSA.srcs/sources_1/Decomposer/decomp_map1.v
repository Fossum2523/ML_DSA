`timescale 1ns / 1ps

module decomp_map1(
    input [22:0]     din,
    output reg [5:0] dout
    );
    
    reg [44:0] dout_flag;

    always @(*) begin
        dout_flag[0] = 1;
        dout_flag[1] = (din >= 23'd95233) ? 1 : 0;
        dout_flag[2] = (din >= 23'd285697) ? 1 : 0;
        dout_flag[3] = (din >= 23'd476161) ? 1 : 0;
        dout_flag[4] = (din >= 23'd666625) ? 1 : 0;
        dout_flag[5] = (din   >= 23'd857089) ? 1 : 0;
        dout_flag[6] = (din >= 23'd1047553) ? 1 : 0;
        dout_flag[7] = (din >= 23'd1238017) ? 1 : 0;
        dout_flag[8] = (din >= 23'd1428481) ? 1 : 0;
        dout_flag[9] = (din >= 23'd1618945) ? 1 : 0;
        dout_flag[10] = (din >= 23'd1809409) ? 1 : 0;
        dout_flag[11] = (din >= 23'd1999873) ? 1 : 0;
        dout_flag[12] = (din >= 23'd2190337) ? 1 : 0;
        dout_flag[13] = (din >= 23'd2380801) ? 1 : 0;
        dout_flag[14] = (din >= 23'd2571265) ? 1 : 0;
        dout_flag[15] = (din >= 23'd2761729) ? 1 : 0;
        dout_flag[16] = (din >= 23'd2952193) ? 1 : 0;
        dout_flag[17] = (din >= 23'd3142657) ? 1 : 0;
        dout_flag[18] = (din >= 23'd3333121) ? 1 : 0;
        dout_flag[19] = (din >= 23'd3523585) ? 1 : 0;
        dout_flag[20] = (din >= 23'd3714049) ? 1 : 0;
        dout_flag[21] = (din >= 23'd3904513) ? 1 : 0;
        dout_flag[22] = (din >= 23'd4094977) ? 1 : 0;
        dout_flag[23] = (din >= 23'd4285441) ? 1 : 0;
        dout_flag[24] = (din >= 23'd4475905) ? 1 : 0;
        dout_flag[25] = (din >= 23'd4666369) ? 1 : 0;
        dout_flag[26] = (din >= 23'd4856833) ? 1 : 0;
        dout_flag[27] = (din >= 23'd5047297) ? 1 : 0;
        dout_flag[28] = (din >= 23'd5237761) ? 1 : 0;
        dout_flag[29] = (din >= 23'd5428225) ? 1 : 0;
        dout_flag[30] = (din >= 23'd5618689) ? 1 : 0;
        dout_flag[31] = (din >= 23'd5809153) ? 1 : 0;
        dout_flag[32] = (din >= 23'd5999617) ? 1 : 0;
        dout_flag[33] = (din >= 23'd6190081) ? 1 : 0;
        dout_flag[34] = (din >= 23'd6380545) ? 1 : 0;
        dout_flag[35] = (din >= 23'd6571009) ? 1 : 0;
        dout_flag[36] = (din >= 23'd6761473) ? 1 : 0;
        dout_flag[37] = (din >= 23'd6951937) ? 1 : 0;
        dout_flag[38] = (din >= 23'd7142401) ? 1 : 0;
        dout_flag[39] = (din >= 23'd7332865) ? 1 : 0;
        dout_flag[40] = (din >= 23'd7523329) ? 1 : 0;
        dout_flag[41] = (din >= 23'd7713793) ? 1 : 0;
        dout_flag[42] = (din >= 23'd7904257) ? 1 : 0;
        dout_flag[43] = (din >= 23'd8094721) ? 1 : 0;
        dout_flag[44] = (din >= 23'd8285185) ? 1 : 0; 
    end

    always @(*) begin
        dout = 0;
        case(1'b1)
            dout_flag[44]: dout = 0;
            dout_flag[43]: dout = 43;
            dout_flag[42]: dout = 42;
            dout_flag[41]: dout = 41;
            dout_flag[40]: dout = 40;
            dout_flag[39]: dout = 39;
            dout_flag[38]: dout = 38;
            dout_flag[37]: dout = 37;
            dout_flag[36]: dout = 36;
            dout_flag[35]: dout = 35;
            dout_flag[34]: dout = 34;
            dout_flag[33]: dout = 33;
            dout_flag[32]: dout = 32;
            dout_flag[31]: dout = 31;
            dout_flag[30]: dout = 30;
            dout_flag[29]: dout = 29;
            dout_flag[28]: dout = 28;
            dout_flag[27]: dout = 27;
            dout_flag[26]: dout = 26;
            dout_flag[25]: dout = 25;
            dout_flag[24]: dout = 24;
            dout_flag[23]: dout = 23;
            dout_flag[22]: dout = 22;
            dout_flag[21]: dout = 21;
            dout_flag[20]: dout = 20;
            dout_flag[19]: dout = 19;
            dout_flag[18]: dout = 18;
            dout_flag[17]: dout = 17;
            dout_flag[16]: dout = 16;
            dout_flag[15]: dout = 15;
            dout_flag[14]: dout = 14;
            dout_flag[13]: dout = 13;
            dout_flag[12]: dout = 12;
            dout_flag[11]: dout = 11;
            dout_flag[10]: dout = 10;
            dout_flag[9]: dout = 9;
            dout_flag[8]: dout = 8;
            dout_flag[7]: dout = 7;
            dout_flag[6]: dout = 6;
            dout_flag[5]: dout = 5;
            dout_flag[4]: dout = 4;
            dout_flag[3]: dout = 3;
            dout_flag[2]: dout = 2;
            dout_flag[1]: dout = 1;
            dout_flag[0]: dout = 0;
        endcase
    end
endmodule
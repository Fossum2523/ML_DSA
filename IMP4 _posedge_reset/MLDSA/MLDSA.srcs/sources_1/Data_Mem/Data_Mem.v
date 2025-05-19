module Data_Mem
#(  parameter DLEN = 23, L_DLEN = 64, TA_HLEN = 12, T_HLEN = 10, L_HLEN = 4)
(
    input clk,
    input reset,

    /*---temp_A---*/
    input   [DLEN-1:0]      temp_A_data_a,
    input   [DLEN-1:0]      temp_A_data_b,
    input   [TA_HLEN - 1:0] temp_A_addr_a,
    input   [TA_HLEN - 1:0] temp_A_addr_b,
    input                   temp_A_en_a,
    input                   temp_A_en_b,
    input                   temp_A_we_a,
    input                   temp_A_we_b,
    output  [DLEN-1:0]      temp_A_q_a,
    output  [DLEN-1:0]      temp_A_q_b, 

    /*---temp_PWM---*/
    input   [DLEN-1:0]      temp_PWM_data_a,
    input   [DLEN-1:0]      temp_PWM_data_b,
    input   [T_HLEN - 1:0]  temp_PWM_addr_a,
    input   [T_HLEN - 1:0]  temp_PWM_addr_b,
    input                   temp_PWM_en_a,
    input                   temp_PWM_en_b,
    input                   temp_PWM_we_a,
    input                   temp_PWM_we_b,
    output  [DLEN-1:0]      temp_PWM_q_a,
    output  [DLEN-1:0]      temp_PWM_q_b,

    /*---temp_0---*/
    input   [DLEN-1:0]      temp_0_data_a,
    input   [DLEN-1:0]      temp_0_data_b,
    input   [T_HLEN - 1:0]  temp_0_addr_a,
    input   [T_HLEN - 1:0]  temp_0_addr_b,
    input                   temp_0_en_a,
    input                   temp_0_en_b,
    input                   temp_0_we_a,
    input                   temp_0_we_b,
    output  [DLEN-1:0]      temp_0_q_a,
    output  [DLEN-1:0]      temp_0_q_b,

    /*---temp_1---*/
    input   [DLEN-1:0]      temp_1_data_a,
    input   [DLEN-1:0]      temp_1_data_b,
    input   [T_HLEN - 1:0]  temp_1_addr_a,
    input   [T_HLEN - 1:0]  temp_1_addr_b,
    input                   temp_1_en_a,
    input                   temp_1_en_b,
    input                   temp_1_we_a,
    input                   temp_1_we_b,
    output  [DLEN-1:0]      temp_1_q_a,
    output  [DLEN-1:0]      temp_1_q_b,

    /*---temp_2---*/
    input   [DLEN-1:0]      temp_2_data_a,
    input   [DLEN-1:0]      temp_2_data_b,
    input   [T_HLEN - 1:0]  temp_2_addr_a,
    input   [T_HLEN - 1:0]  temp_2_addr_b,
    input                   temp_2_en_a,
    input                   temp_2_en_b,
    input                   temp_2_we_a,
    input                   temp_2_we_b,
    output  [DLEN-1:0]      temp_2_q_a,
    output  [DLEN-1:0]      temp_2_q_b,

    /*---temp_3---*/
    input   [DLEN-1:0]      temp_3_data_a,
    input   [DLEN-1:0]      temp_3_data_b,
    input   [T_HLEN - 1:0]  temp_3_addr_a,
    input   [T_HLEN - 1:0]  temp_3_addr_b,
    input                   temp_3_en_a,
    input                   temp_3_en_b,
    input                   temp_3_we_a,
    input                   temp_3_we_b,
    output  [DLEN-1:0]      temp_3_q_a,
    output  [DLEN-1:0]      temp_3_q_b,

    /*---temp_4---*/
    input   [DLEN-1:0]      temp_4_data_a,
    input   [DLEN-1:0]      temp_4_data_b,
    input   [T_HLEN - 1:0]  temp_4_addr_a,
    input   [T_HLEN - 1:0]  temp_4_addr_b,
    input                   temp_4_en_a,
    input                   temp_4_en_b,
    input                   temp_4_we_a,
    input                   temp_4_we_b,
    output  [DLEN-1:0]      temp_4_q_a,
    output  [DLEN-1:0]      temp_4_q_b,

    /*---temp_5---*/
    input   [DLEN-1:0]      temp_5_data_a,
    input   [DLEN-1:0]      temp_5_data_b,
    input   [T_HLEN - 1:0]  temp_5_addr_a,
    input   [T_HLEN - 1:0]  temp_5_addr_b,
    input                   temp_5_en_a,
    input                   temp_5_en_b,
    input                   temp_5_we_a,
    input                   temp_5_we_b,
    output  [DLEN-1:0]      temp_5_q_a,
    output  [DLEN-1:0]      temp_5_q_b,

    /*---temp_6---*/
    input   [DLEN-1:0]      temp_6_data_a,
    input   [DLEN-1:0]      temp_6_data_b,
    input   [T_HLEN - 1:0]  temp_6_addr_a,
    input   [T_HLEN - 1:0]  temp_6_addr_b,
    input                   temp_6_en_a,
    input                   temp_6_en_b,
    input                   temp_6_we_a,
    input                   temp_6_we_b,
    output  [DLEN-1:0]      temp_6_q_a,
    output  [DLEN-1:0]      temp_6_q_b,

    /*---temp_7---*/
    input   [DLEN-1:0]      temp_7_data_a,
    input   [DLEN-1:0]      temp_7_data_b,
    input   [T_HLEN - 1:0]  temp_7_addr_a,
    input   [T_HLEN - 1:0]  temp_7_addr_b,
    input                   temp_7_en_a,
    input                   temp_7_en_b,
    input                   temp_7_we_a,
    input                   temp_7_we_b,
    output  [DLEN-1:0]      temp_7_q_a,
    output  [DLEN-1:0]      temp_7_q_b,

    /*---temp_8---*/
    input   [DLEN-1:0]      temp_8_data_a,
    input   [DLEN-1:0]      temp_8_data_b,
    input   [T_HLEN - 1:0]  temp_8_addr_a,
    input   [T_HLEN - 1:0]  temp_8_addr_b,
    input                   temp_8_en_a,
    input                   temp_8_en_b,
    input                   temp_8_we_a,
    input                   temp_8_we_b,
    output  [DLEN-1:0]      temp_8_q_a,
    output  [DLEN-1:0]      temp_8_q_b,

    /*---temp_9---*/
    input   [DLEN-1:0]      temp_9_data_a,
    input   [DLEN-1:0]      temp_9_data_b,
    input   [T_HLEN - 1:0]  temp_9_addr_a,
    input   [T_HLEN - 1:0]  temp_9_addr_b,
    input                   temp_9_en_a,
    input                   temp_9_en_b,
    input                   temp_9_we_a,
    input                   temp_9_we_b,
    output  [DLEN-1:0]      temp_9_q_a,
    output  [DLEN-1:0]      temp_9_q_b, 

    /*---temp_L---*/
    input   [L_DLEN-1:0]    temp_L_data_a,
    input   [L_DLEN-1:0]    temp_L_data_b,
    input   [L_HLEN-1:0]    temp_L_addr_a,
    input   [L_HLEN-1:0]    temp_L_addr_b,
    input                   temp_L_en_a,
    input                   temp_L_en_b,
    input                   temp_L_we_a,
    input                   temp_L_we_b,
    output  [L_DLEN-1:0]    temp_L_q_a,
    output  [L_DLEN-1:0]    temp_L_q_b,

    /*---temp_seed---*/
    input   [L_DLEN-1:0]    temp_seed_data_a,
    input   [L_DLEN-1:0]    temp_seed_data_b,
    input   [L_HLEN-1:0]    temp_seed_addr_a,
    input   [L_HLEN-1:0]    temp_seed_addr_b,
    input                   temp_seed_en_a,
    input                   temp_seed_en_b,
    input                   temp_seed_we_a,
    input                   temp_seed_we_b,
    output  [L_DLEN-1:0]    temp_seed_q_a,
    output  [L_DLEN-1:0]    temp_seed_q_b
    );

    // /*---temp_A---*/
    Ture_Dual_Port_RAM_23x4096 temp_A(
        .clka(clk),
        .clkb(clk),
        .dina(temp_A_data_a),
        .dinb(temp_A_data_b),
        .addra(temp_A_addr_a),
        .addrb(temp_A_addr_b),
        .ena(temp_A_en_a),
        .enb(temp_A_en_b),
        .wea(temp_A_we_a),
        .web(temp_A_we_b),
        .douta(temp_A_q_a),
        .doutb(temp_A_q_b)
    );

    /*---temp_PWM---*/
    Ture_Dual_Port_RAM_23x1024 temp_PWM(
        .clka(clk),
        .clkb(clk),
        .dina(temp_PWM_data_a),
        .dinb(temp_PWM_data_b),
        .addra(temp_PWM_addr_a),
        .addrb(temp_PWM_addr_b),
        .ena(temp_PWM_en_a),
        .enb(temp_PWM_en_b),
        .wea(temp_PWM_we_a),
        .web(temp_PWM_we_b),
        .douta(temp_PWM_q_a),
        .doutb(temp_PWM_q_b)
    );
    
    /*---temp_0---*/
    Ture_Dual_Port_RAM_23x1024 temp_0(
        .clka(clk),
        .clkb(clk),
        .dina(temp_0_data_a),
        .dinb(temp_0_data_b),
        .addra(temp_0_addr_a),
        .addrb(temp_0_addr_b),
        .ena(temp_0_en_a),
        .enb(temp_0_en_b),
        .wea(temp_0_we_a),
        .web(temp_0_we_b),
        .douta(temp_0_q_a),
        .doutb(temp_0_q_b)
    );

    /*---temp_1---*/
    Ture_Dual_Port_RAM_23x1024 temp_1(
        .clka(clk),
        .clkb(clk),
        .dina(temp_1_data_a),
        .dinb(temp_1_data_b),
        .addra(temp_1_addr_a),
        .addrb(temp_1_addr_b),
        .ena(temp_1_en_a),
        .enb(temp_1_en_b),
        .wea(temp_1_we_a),
        .web(temp_1_we_b),
        .douta(temp_1_q_a),
        .doutb(temp_1_q_b)
    );

    /*---temp_2---*/
    Ture_Dual_Port_RAM_23x1024 temp_2(
        .clka(clk),
        .clkb(clk),
        .dina(temp_2_data_a),
        .dinb(temp_2_data_b),
        .addra(temp_2_addr_a),
        .addrb(temp_2_addr_b),
        .ena(temp_2_en_a),
        .enb(temp_2_en_b),
        .wea(temp_2_we_a),
        .web(temp_2_we_b),
        .douta(temp_2_q_a),
        .doutb(temp_2_q_b)
    );

    /*---temp_3---*/
    Ture_Dual_Port_RAM_23x1024 temp_3(
        .clka(clk),
        .clkb(clk),
        .dina(temp_3_data_a),
        .dinb(temp_3_data_b),
        .addra(temp_3_addr_a),
        .addrb(temp_3_addr_b),
        .ena(temp_3_en_a),
        .enb(temp_3_en_b),
        .wea(temp_3_we_a),
        .web(temp_3_we_b),
        .douta(temp_3_q_a),
        .doutb(temp_3_q_b)
    );

    /*---temp_4---*/
    Ture_Dual_Port_RAM_23x1024 temp_4(
        .clka(clk),
        .clkb(clk),
        .dina(temp_4_data_a),
        .dinb(temp_4_data_b),
        .addra(temp_4_addr_a),
        .addrb(temp_4_addr_b),
        .ena(temp_4_en_a),
        .enb(temp_4_en_b),
        .wea(temp_4_we_a),
        .web(temp_4_we_b),
        .douta(temp_4_q_a),
        .doutb(temp_4_q_b)
    );

    /*---temp_5---*/
    Ture_Dual_Port_RAM_23x1024 temp_5(
        .clka(clk),
        .clkb(clk),
        .dina(temp_5_data_a),
        .dinb(temp_5_data_b),
        .addra(temp_5_addr_a),
        .addrb(temp_5_addr_b),
        .ena(temp_5_en_a),
        .enb(temp_5_en_b),
        .wea(temp_5_we_a),
        .web(temp_5_we_b),
        .douta(temp_5_q_a),
        .doutb(temp_5_q_b)
    );

    /*---temp_6---*/
    Ture_Dual_Port_RAM_23x1024 temp_6(
        .clka(clk),
        .clkb(clk),
        .dina(temp_6_data_a),
        .dinb(temp_6_data_b),
        .addra(temp_6_addr_a),
        .addrb(temp_6_addr_b),
        .ena(temp_6_en_a),
        .enb(temp_6_en_b),
        .wea(temp_6_we_a),
        .web(temp_6_we_b),
        .douta(temp_6_q_a),
        .doutb(temp_6_q_b)
    );

    /*---temp_7---*/
    Ture_Dual_Port_RAM_23x1024 temp_7(
        .clka(clk),
        .clkb(clk),
        .dina(temp_7_data_a),
        .dinb(temp_7_data_b),
        .addra(temp_7_addr_a),
        .addrb(temp_7_addr_b),
        .ena(temp_7_en_a),
        .enb(temp_7_en_b),
        .wea(temp_7_we_a),
        .web(temp_7_we_b),
        .douta(temp_7_q_a),
        .doutb(temp_7_q_b)
    );

    /*---temp_8---*/
    Ture_Dual_Port_RAM_23x1024 temp_8(
        .clka(clk),
        .clkb(clk),
        .dina(temp_8_data_a),
        .dinb(temp_8_data_b),
        .addra(temp_8_addr_a),
        .addrb(temp_8_addr_b),
        .ena(temp_8_en_a),
        .enb(temp_8_en_b),
        .wea(temp_8_we_a),
        .web(temp_8_we_b),
        .douta(temp_8_q_a),
        .doutb(temp_8_q_b)
    );

    /*---temp_9---*/
    Ture_Dual_Port_RAM_23x1024 temp_9(
        .clka(clk),
        .clkb(clk),
        .dina(temp_9_data_a),
        .dinb(temp_9_data_b),
        .addra(temp_9_addr_a),
        .addrb(temp_9_addr_b),
        .ena(temp_9_en_a),
        .enb(temp_9_en_b),
        .wea(temp_9_we_a),
        .web(temp_9_we_b),
        .douta(temp_9_q_a),
        .doutb(temp_9_q_b)
    );

    /*---temp_L---*/
    Ture_Dual_Port_RAM_64x16 temp_L(
        .clka(clk),
        .clkb(clk),
        .dina(temp_L_data_a),
        .dinb(temp_L_data_b),
        .addra(temp_L_addr_a),
        .addrb(temp_L_addr_b),
        .ena(temp_L_en_a),
        .enb(temp_L_en_b),
        .wea(temp_L_we_a),
        .web(temp_L_we_b),
        .douta(temp_L_q_a),
        .doutb(temp_L_q_b)
    );

    /*---temp_seed---*/
    Ture_Dual_Port_RAM_64x16 temp_seed(
        .clka(clk),
        .clkb(clk),
        .dina(temp_seed_data_a),
        .dinb(temp_seed_data_b),
        .addra(temp_seed_addr_a),
        .addrb(temp_seed_addr_b),
        .ena(temp_seed_en_a),
        .enb(temp_seed_en_b),
        .wea(temp_seed_we_a),
        .web(temp_seed_we_b),
        .douta(temp_seed_q_a),
        .doutb(temp_seed_q_b)
    );  
endmodule

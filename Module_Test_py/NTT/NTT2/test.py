    /*** stage 7 ***/
    CONTR#(
        .BIT_LEN(BIT_LEN),
        .depth(depth_7)
    ) CONTR_7(
        .clk(clk),
        .reset(reset),
        .en(en_7),
        .switch(switch_7),
        .zeta_cnt(zeta_cnt_7),
        .MEM_cnt(MEM_cnt_7)
    );

    rom #(
        .WIDTH(BIT_LEN),
        .LENGTH(128/depth_7),
        .INIT_FILE("C:/Users/USER/Desktop/ML_DSA_syn/IMP/NTT/NTT2/NTT.srcs/sources_1/imports/MEM_zeta/MEM_zeta_7.txt")
    ) MEM_zeta_7(
        .clk(clk), 
        .en(1'b1), 
        .addr(zeta_cnt_7), 
        .do(zeta_7)
    );

    RU #(
        .BIT_LEN(BIT_LEN),
        .depth(depth_7)
    ) RU_7(
        .clk(clk),
        .reset(reset),
        .switch(switch_7),
        .MEM_cnt(MEM_cnt_7),
        .in_u(out_u_6),
        .in_d(out_d_6),
        .out_u(MEM_u_out_7),
        .out_d(MEM_d_out_7)
    );

    BU BU_7(
        .a(MEM_u_out_7),
        .b(MEM_d_out_7),
        .zeta(zeta_7),
        .out_a(out_u_7),
        .out_b(out_d_7)
    );
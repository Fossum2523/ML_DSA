module Data_Path
#(  parameter DLEN = 23, A_HLEN = 12, T_HLEN = 10, HLEN = 8, BIT_LEN = 23)
    (   
    input           clk,
    input           reset,

    input  [8:0]    ctrl_sign,
    /*---Keack---*/
    input           sha_en,
    input  [3:0]    sha_type,
    output          sha_out_ready,

    /*---Data_Mem---*/
    input           mem_sel,
    input           A_mem_sel,
    input           t_mem_sel,
    input           Rho_en,
    input           Rho_prime_en,
    input           Kata_en,
    input           Rho_mode,
    input           Rho_prime_mode,
    input           Kata_mode,

    /*---Sampler---*/
    input   [1:0]   sampler_mode,
    input   [3:0]   s1_index,
    input   [3:0]   s2_index,
    input   [3:0]   A_index,
    input   [3:0]   y_index,
    input           sampler_in_ready,
    output          next_element,

    /*---NTT---*/
    input           NTT_mode,
	input           NTT_in_ready,
    input [1:0]     NTT_index,
    output          NTT_done,

    /*---PWM---*/
    input           PWM_start,
    input [3:0]     PWM_index,
    output          PWM_done,

    /*---AG---*/
    input [1:0]     AG_addr_adder,
    input [7:0]     AG_star_addr,
    input [7:0]     AG_last_addr,
    input           AG_triger,
    input           AG_clean,
    output          AG_done,

    input [1:0]     AG2_addr_adder,
    input [7:0]     AG2_star_addr,
    input [7:0]     AG2_last_addr,
    input           AG2_triger,
    input           AG2_clean,
    output          AG2_done,
    
    /*---from outside---*/
    input   [63:0]  data_in,
    output  [63:0]  data_out,

    /*---test (Need to chage to wire)---*/
    output  [1343:0]    padder_out,
    output              padder_out_ready,
    output  [1599:0]    f_out,
    output              f_out_ready,
    output  [1343:0]    sha_out
    );  



    /*---parameter---*/
    //sha type
    parameter   Gen_Seed    = 4'd0,
                Gen_A       = 4'd1,
                Gen_s1      = 4'd2,
                Gen_s2      = 4'd3,
                Gen_y       = 4'd4,
                H_u_w1      = 4'd5,
                H_pk_1      = 4'd6,
                H_pk_2      = 4'd7,
                Gen_c_1     = 4'd8,
                Gen_c_2     = 4'd9,
                H_K_rnd_u   = 4'd10,
                H_tr_M_1    = 4'd11,
                H_tr_M_2    = 4'd12;

    //main mode
    localparam  [1:0]   KeyGen  = 2'd0,
                        SignGen = 2'd1,
                        SignVer = 2'd2;


    //Keack mode
    localparam          G           = 1'b0,
                        H           = 1'b1;

    //Sampler mode
    localparam [1:0]    S_mode      = 2'd0,
                        A_mode      = 2'd1,
                        MASK_mode   = 2'd2,
                        SIB_mode    = 2'd3;

    //seed_in_sel
    localparam  [1:0]   RHO         = 2'b00,
                        RHO_PRIME   = 2'b01,
                        KATA        = 2'B10;

    //sha_in_sel
    localparam  [1:0]   OUSIDE      = 2'b00,
                        SAMPLE      = 2'b01;

    //Mem_Data Control
    localparam          SAMPLER_ADDR = 1'b0,
                        PWM_ADDR     = 1'b1;



    /*---Keack signals---*/
    wire            sha_in_ready;
    wire            sha_is_last;
    wire            sha_squeeze;
    wire            sha_mode;
    wire            sha_hold;
    wire [2:0]      sha_byte_num;
    wire            sha_clean;
    wire [1:0]      keccak_in_sel;
    wire            mem_sel_1;
    wire [1:0]      mem_sel_2;
    wire [1:0]      index_sel;
    wire            in_seed_sel;
    reg  [63:0]     sha_in;
    reg  [63:0]     mem_1_in;
    reg  [63:0]     mem_2_in;
    reg  [63:0]     index_in;
    reg  [63:0]     in_seed_in;
    wire            sha_AG_gen;
    
    
    /*---Data_Mem signals---*/
    //---seed
    reg [63:0]     seed_data_a;
    reg [63:0]     seed_data_b;
    reg [10 - 1:0] seed_addr_a;
    reg [10 - 1:0] seed_addr_b;
    reg            seed_en_a;
    reg            seed_en_b;
    reg            seed_we_a;
    reg            seed_we_b;
    wire [63:0]     seed_q_a;
    wire [63:0]     seed_q_b;
    //---s1
    reg  [3 - 1:0]  s1_data_a;
    reg  [3 - 1:0]  s1_data_b;
    reg  [10 - 1:0] s1_addr_a;
    reg  [10 - 1:0] s1_addr_b;
    reg             s1_en_a;
    reg             s1_en_b;
    reg             s1_we_a;
    reg             s1_we_b;
    wire [3-1:0]    s1_q_a;
    wire [3-1:0]    s1_q_b;
    //---s2
    wire [3 - 1:0]  s2_data_a;
    wire [3 - 1:0]  s2_data_b;
    wire [10 - 1:0] s2_addr_a;
    wire [10 - 1:0] s2_addr_b;
    wire            s2_en_a;
    wire            s2_en_b;
    wire            s2_we_a;
    wire            s2_we_b;
    wire [3-1:0]    s2_q_a;
    wire [3-1:0]    s2_q_b;
    //---A
    wire [DLEN-1:0]   A_data_a;
    wire [DLEN-1:0]   A_data_b;
    wire [A_HLEN-1:0] A_addr_a;
    wire [A_HLEN-1:0] A_addr_b;
    wire              A_en_a;
    wire              A_en_b;
    wire              A_we_a;
    wire              A_we_b;
    wire [DLEN-1:0]   A_q_a;
    wire [DLEN-1:0]   A_q_b;
    //---w
    wire [DLEN-1:0] w_q_a;
    wire [DLEN-1:0] w_q_b;
    //---c
    wire [DLEN-1:0] c_q_a;
    wire [DLEN-1:0] c_q_b;
    //---temp_0
    reg [DLEN-1:0]      temp_0_data_a;
    reg [DLEN-1:0]      temp_0_data_b;
    reg [T_HLEN - 1:0]  temp_0_addr_a;
    reg [T_HLEN - 1:0]  temp_0_addr_b;
    reg                 temp_0_en_a;
    reg                 temp_0_en_b;
    reg                 temp_0_we_a;
    reg                 temp_0_we_b;
    wire [DLEN-1:0]      temp_0_q_a;
    wire [DLEN-1:0]      temp_0_q_b;



    /*---Sampler signals---*/
    //---Control
    wire            sampler_squeeze;
    //---ExpandS
    wire [2:0]      z0;
    wire [2:0]      z1;
    wire [7:0]      addr_z0;
    wire [7:0]      addr_z1;
    wire            en_z0;
    wire            we_z0;
    wire            en_z1;
    wire            we_z1;
    wire            s1_en_z;
    wire            s1_we_z;
    wire            s2_en_z;
    wire            s2_we_z;
    //---ExpandA
    wire [22:0]     A0;
    wire [22:0]     A1;
    wire [7:0]      addr_A0;
    wire [7:0]      addr_A1;
    wire            en_A0;
    wire            we_A0;
    wire            en_A1;
    wire            we_A1;
    //---ExpandMask
    wire [22:0]     y0;
    wire [22:0]     y1;
    wire [7:0]      addr_y0;
    wire [7:0]      addr_y1;
    wire            en_y;
    wire            we_y;
    //---SampleInBall
    wire [22:0]     ci;
    wire [7:0]      addr_ci;
    wire [7:0]      addr_cj;
    wire            en_ci;
    wire            en_cj;
    wire            we_ci;
    wire            we_cj;

    /*---NTT signals---*/
    //---Control
    wire                NTT_out_ready;
    //---Data
    wire                NTT_data_en;
    reg  [BIT_LEN-1:0]  NTT_in_u;
    reg  [BIT_LEN-1:0]  NTT_in_d;
    wire [7:0]          NTT_in_addr_u;
    wire [7:0]          NTT_in_addr_d;
    wire [BIT_LEN-1:0]  NTT_out_u;
    wire [BIT_LEN-1:0]  NTT_out_d;
    wire [7:0]          NTT_addr_u;
    wire [7:0]          NTT_addr_d;

    /*---PWM Signal---*/
    wire [BIT_LEN - 1:0] PWM_in_a0;
    wire [BIT_LEN - 1:0] PWM_in_a1;
    wire                 PWM_in_a_en;
    wire [HLEN - 1:0]    PWM_in_addr_a;
    wire                 PWM_out_a_en;
    wire [BIT_LEN - 1:0] PWM_out_a;
    wire [HLEN - 1:0]    PWM_out_addr_a;
    wire [BIT_LEN - 1:0] PWM_in_b0;
    wire [BIT_LEN - 1:0] PWM_in_b1;
    wire                 PWM_in_b_en;
    wire [HLEN - 1:0]    PWM_in_addr_b;
    wire                 PWM_out_b_en;
    wire [BIT_LEN - 1:0] PWM_out_b;
    wire [HLEN - 1:0]    PWM_out_addr_b;

    //Adress Generate
    wire                AG_addr_en;
    wire [7:0]          AG_addr_a;
    wire [7:0]          AG_addr_b;

    wire                AG2_addr_en;
    wire [7:0]          AG2_addr_a;
    wire [7:0]          AG2_addr_b;
    wire                AG2_data_valid;
    

    /*---Keccak---*/ //------------------------------------------str
    Keccak_Ctrl KKC(   
        .clk(clk),
        .reset(reset),
        .sha_en(sha_en),
        .sha_type(sha_type),
        .MLSDA_in_byte_num(MLSDA_in_byte_num),
        .next_element(next_element),
        .sha_in_ready(sha_in_ready), 
        .sha_is_last(sha_is_last),
        .sha_squeeze(sha_squeeze), // when squeeze = 0, output once; otherwise, keep squeezing
        .sha_mode(sha_mode),
        .sha_hold(sha_hold),
        .sha_byte_num(sha_byte_num),
        .sha_out_ready(sha_out_ready),//交由主Controller?��?��，�?�sha_en??��??
        .sha_clean(sha_clean),
        .keccak_in_sel(keccak_in_sel),
        .mem_sel_1(mem_sel_1),
        .mem_sel_2(mem_sel_2),
        .index_sel(index_sel),
        .in_seed_sel(in_seed_sel),

        .sha_AG_gen(sha_AG_gen),
        .AG_done(AG_done)
    );  

    Keccak KK(
        .clk(clk),
        .reset(sha_reset),
        .in(sha_in),
        .in_ready(sha_in_ready),
        .is_last(sha_is_last),
        .squeeze(sha_squeeze | sampler_squeeze),
        .mode(sha_mode),
        .sha_hold(sha_hold),
        .byte_num(sha_byte_num),
        // .buffer_full(buffer_full),
        // .buffer_last(buffer_last),
        .out(sha_out),
        .out_ready(sha_out_ready),
        .padder_out(padder_out),
        .padder_out_ready(padder_out_ready),
        .f_out(f_out),                                  
        .f_out_ready(f_out_ready)
    );

    assign sha_reset = reset | sha_clean;

    always @(*) begin
        case (in_seed_sel)  
            1'b0: in_seed_in = data_in;
            1'b1: in_seed_in = 64'h0000_0000_0000_0404;
            default: in_seed_in = 64'd0;
        endcase
    end

    always @(*) begin
        case (mem_sel_1)
            1'b0: mem_1_in = seed_q_a;
            1'b1: mem_1_in = 64'd0;//u_q_a
            default: mem_1_in = 64'd0;
        endcase
    end

    always @(*) begin
        case (index_sel)
            // 2'd0: index_in = A_gen_index;
            2'd1: index_in = {60'd0,s1_index};
            2'd2: index_in = {60'd0,s2_index};
            // 2'd3: index_in = y_gen_index;
            default: index_in = 64'd0;
        endcase
    end
    
    always @(*) begin
        case (keccak_in_sel)
            2'd0: sha_in = mem_1_in;
            2'd1: sha_in = mem_2_in;
            2'd2: sha_in = index_in;
            2'd3: sha_in = in_seed_in;
            default: in_seed_in = 64'd0;
        endcase
    end

    
    /*---Keccak---*/ //------------------------------------------end

    /*---Data_Mem---*/ //------------------------------------------str
    wire [127:0] seed_out;
    
    Data_Mem DM(
        .clk(clk),
        .reset(reset),
        
        /*---Seed---*/
        .seed_data_a(seed_data_a),
        .seed_data_b(seed_data_b),
        .seed_addr_a(seed_addr_a),
        .seed_addr_b(seed_addr_b),
        .seed_en_a(seed_en_a),
        .seed_en_b(seed_en_b),
        .seed_we_a(seed_we_a),
        .seed_we_b(seed_we_b),
        .seed_q_a(seed_q_a),
        .seed_q_b(seed_q_b),

        /*---s1---*/
        .s1_data_a(s1_data_a),
        .s1_data_b(s1_data_b),//
        .s1_addr_a(s1_addr_a),
        .s1_addr_b(s1_addr_b),
        .s1_en_a(s1_en_a),
        .s1_en_b(s1_en_b),
        .s1_we_a(s1_we_a),
        .s1_we_b(s1_we_b),
        .s1_q_a(s1_q_a),
        .s1_q_b(s1_q_b),

        /*---s2---*/
        .s2_data_a(s2_data_a),
        .s2_data_b(s2_data_b),
        .s2_addr_a(s2_addr_a),
        .s2_addr_b(s2_addr_b),
        .s2_en_a(s2_en_a),
        .s2_en_b(s2_en_b),
        .s2_we_a(s2_we_a),
        .s2_we_b(s2_we_b),
        .s2_q_a(s2_q_a),
        .s2_q_b(s2_q_b),

        /*---temp_0---*/
        .temp_0_data_a(temp_0_data_a),
        .temp_0_data_b(temp_0_data_b),//
        .temp_0_addr_a(temp_0_addr_a),
        .temp_0_addr_b(temp_0_addr_b),
        .temp_0_en_a(temp_0_en_a),
        .temp_0_en_b(temp_0_en_b),
        .temp_0_we_a(temp_0_we_a),
        .temp_0_we_b(temp_0_we_b),
        .temp_0_q_a(temp_0_q_a),
        .temp_0_q_b(temp_0_q_b)
    );
    
    mux_gen #(
        .param_in(1024),
        .param_m(128)
    ) mux_(
        .in(sha_out[1023:0]),
        .sel(AG_addr_a >> 1),
        .out(seed_out)
    );


    always @(*) begin
        seed_data_a = 64'd0;
        seed_data_b = 64'd0;
        seed_addr_a = 8'd0;
        seed_addr_b = 8'd0;
        seed_en_a   = 1'd0; 
        seed_en_b   = 1'd0; 
        seed_we_a   = 1'd0; 
        seed_we_b   = 1'd0; 
        case (ctrl_sign)
            {KeyGen,6'd1}:begin
                seed_data_a = seed_out[63:0];
                seed_data_b = seed_out[127:64];
                seed_addr_a = AG_addr_a;
                seed_addr_b = AG_addr_b;
                seed_en_a  =  AG_addr_en;
                seed_en_b  =  AG_addr_en;
                seed_we_a  =  AG_addr_en;
                seed_we_b  =  AG_addr_en;
            end
            {KeyGen,6'd2},
            {KeyGen,6'd3}:begin
                seed_addr_a = AG_addr_a;
                seed_en_a  =  AG_addr_en;
            end
            default: seed_data_a = 64'd0;
        endcase
    end

    always @(*) begin
        case (keccak_in_sel)
            2'd0: sha_in = mem_1_in;
            2'd1: sha_in = mem_2_in;
            2'd2: sha_in = index_in;
            2'd3: sha_in = in_seed_in;
            default: in_seed_in = 64'd0;
        endcase
    end

    
    //---s2 mem
    assign s2_data_a = z0;
    assign s2_data_b = z1;
    assign s2_addr_a = {s2_index[1:0],addr_z0};
    assign s2_addr_b = {s2_index[1:0],addr_z1};
    assign s2_en_a   = sha_type == Gen_s2 ? en_z0 : 1'b0;
    assign s2_en_b   = sha_type == Gen_s2 ? en_z1 : 1'b0;
    assign s2_we_a   = sha_type == Gen_s2 ? we_z0 : 1'b0;
    assign s2_we_b   = sha_type == Gen_s2 ? we_z1 : 1'b0;

    //---s1 mem
    always @(*) begin
        s1_data_a = 3'd0;
        s1_data_b = 3'd0;
        s1_addr_a = 10'd0;
        s1_addr_b = 10'd0;
        s1_en_a   = 1'd0;
        s1_en_b   = 1'd0;
        s1_we_a   = 1'd0;
        s1_we_b   = 1'd0;
        case (ctrl_sign)
            {KeyGen,6'd2}:begin
                s1_data_a = z0;
                s1_data_b = z1;
                s1_addr_a = {s1_index[1:0],addr_z0};
                s1_addr_b = {s1_index[1:0],addr_z1};
                s1_en_a   = en_z0;
                s1_en_b   = en_z1;
                s1_we_a   = we_z0;
                s1_we_b   = we_z1;
            end
            {KeyGen,6'd3}:begin
                s1_addr_a = {NTT_index,AG2_addr_a};
                s1_addr_b = {NTT_index,(AG2_addr_a + 8'd128)};
                s1_en_a   = AG2_addr_en;
                s1_en_b   = AG2_addr_en;
            end
            default: seed_data_a = 64'd0;
        endcase
    end

    //---temp_0 mem
    always @(*) begin
        temp_0_data_a = 23'd0;
        temp_0_data_b = 23'd0;
        temp_0_addr_a = 10'd0;
        temp_0_addr_b = 10'd0;
        temp_0_en_a   = 1'd0;
        temp_0_en_b   = 1'd0;
        temp_0_we_a   = 1'd0;
        temp_0_we_b   = 1'd0;
        case (ctrl_sign)
            {KeyGen,6'd3}:begin
                temp_0_data_a = NTT_out_u;
                temp_0_data_b = NTT_out_d;
                temp_0_addr_a = {NTT_index,NTT_addr_u};
                temp_0_addr_b = {NTT_index,NTT_addr_d};
                temp_0_en_a   = NTT_out_ready;
                temp_0_en_b   = NTT_out_ready;
                temp_0_we_a   = NTT_out_ready;
                temp_0_we_b   = NTT_out_ready;
            end
            default: seed_data_a = 64'd0;
        endcase
    end
    // assign seed_data_a = 
    /*---Data_Mem---*/ //------------------------------------------end


    /*---AG---*/ //------------------------------------------str
    // Address_generate AG
    // (   
    //     .clk(clk),
    //     .reset(reset),
    //     .sha_AG_gen(sha_AG_gen),
    //     .ctrl_sign(ctrl_sign),
    //     .sha_out_ready(sha_out_ready),
    //     .addr_en(AG_addr_en),
    //     .addr_a(AG_addr_a),
    //     .addr_b(AG_addr_b),
    //     .done(AG_done)
    // ); ㄋ

    Address_generate_2 AG
    (   
        .clk(clk),
        .reset(reset),
        .addr_adder(AG_addr_adder),
        .last_addr(AG_last_addr),
        .star_addr(AG_star_addr),
        .triger(AG_triger),
        .addr_en(AG_addr_en),
        .addr_a(AG_addr_a),
        .addr_b(AG_addr_b),
        .data_valid(AG_data_valid),
        .clean(AG_clean),
        .done(AG_done)
    ); 

    Address_generate_2 AG2
    (   
        .clk(clk),
        .reset(reset),
        .addr_adder(AG2_addr_adder),
        .last_addr(AG2_last_addr),
        .star_addr(AG2_star_addr),
        .triger(AG2_triger),
        .addr_en(AG2_addr_en),
        .addr_a(AG2_addr_a),
        .addr_b(AG2_addr_b),
        .data_valid(AG2_data_valid),
        .clean(AG2_clean),
        .done(AG2_done)
    ); 
    /*---AG---*/ //------------------------------------------end

    /*---Sampler---*/ //------------------------------------------str
    Sampler Sampler_(
        .clk(clk),
        .reset(reset),

        /*---Control----*/
        .mode(sampler_mode),
        .sampler_in_ready(sampler_in_ready),
        .sampler_in(sha_out),
        .sampler_squeeze(sampler_squeeze),
        .next_element(next_element),

        /*---ExpandS----*/
        .z0(z0),
        .z1(z1),
        .addr_z0(addr_z0),
        .addr_z1(addr_z1),
        .en_z0(en_z0),
        .we_z0(we_z0),
        .en_z1(en_z1),
        .we_z1(we_z1),

        /*---ExpandA----*/
        .A0(A0),
        .A1(A1),
        .addr_A0(addr_A0),
        .addr_A1(addr_A1),
        .en_A0(en_A0),
        .we_A0(we_A0),
        .en_A1(en_A1),
        .we_A1(we_A1),

        /*---ExpandMask----*/
        .y0(y0),
        .y1(y1),
        .addr_y0(addr_y0),
        .addr_y1(addr_y1),
        .en_y(en_y),
        .we_y(we_y),

        /*---SampleInBall----*/
        .ci(ci),
        .addr_ci(addr_ci),
        .addr_cj(addr_cj),
        .en_ci(en_ci),
        .en_cj(en_cj),
        .we_ci(we_ci),
        .we_cj(we_cj)
    );
    /*---Sampler---*/ //------------------------------------------end

    /*---NTT---*/ //------------------------------------------str
    NTT #(.BIT_LEN(BIT_LEN)) NTT_(
        .clk(clk),
        .reset(reset),
        .mode(NTT_mode),//
        .in_ready(AG2_addr_en),//
        .NTT_in_u(NTT_in_u),//
        .NTT_in_d(NTT_in_d),//
        .NTT_out_u(NTT_out_u),
        .NTT_out_d(NTT_out_d),
        .NTT_addr_u(NTT_addr_u),
        .NTT_addr_d(NTT_addr_d),
        .done(NTT_done),
        .out_ready(NTT_out_ready)//
    );

    always @(*) begin
        NTT_in_u = 23'd0;
        NTT_in_d = 23'd0;
        case (ctrl_sign)
            {KeyGen,6'd3}:begin
                NTT_in_u = s1_q_a[2] ?  {{20{1'b1}}, s1_q_a} + 23'd8380417 : {20'd0, s1_q_a};
                NTT_in_d = s1_q_b[2] ?  {{20{1'b1}}, s1_q_b} + 23'd8380417 : {20'd0, s1_q_b}; 
            end
            default: begin
                NTT_in_u = 23'd0;
                NTT_in_d = 23'd0;
            end
        endcase
    end
    /*---NTT---*/ //------------------------------------------end

    // encoder enc_(
    //     .reset(reset),
    //     .clk(clk),
    //     .sec_lvl(ENC_sec_lel),
    //     .encode_mode(ENC_encode_mode),
    //     .valid_i(ENC_valid_i),
    //     .ready_i(ENC_ready_i),
    //     .di(ENC_di),
    //     .dout(ENC_dout),
    //     .valid_o(ENC_valid_o),
    //     .ready_o(ENC_ready_o)
    // );

    // always @(*) begin
    //     ENC_sec_lel     = 3'd0;
    //     ENC_encode_mode = 3'd0;
    //     case (ctrl_sign)
    //         {KeyGen,6'd3}:begin
    //             ENC_sec_lel     = 3'd2;
    //             ENC_encode_mode = 3'd2;
    //         end
    //         default: begin
    //             ENC_sec_lel     = 3'd0;
    //             ENC_encode_mode = 3'd0;
    //         end
    //     endcase
    // end
endmodule

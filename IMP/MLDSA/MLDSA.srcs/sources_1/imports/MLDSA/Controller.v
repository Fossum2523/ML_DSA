module Controller
    (   
    input               clk,
    input               reset,

    output [8:0]        ctrl_sign,
    /*---from outside---*/
    input               start,
    input   [1:0]       main_mode, //KeyGen, SignGen, SignVer

    //AXI Stream input protocol A
    input               MLDSA_i_valid_A,
    input               MLDSA_i_last_A,
    output reg          MLDSA_i_ready_A,
    
    //AXI Stream input protocol B
    input               MLDSA_i_valid_B,
    input               MLDSA_i_last_B,
    output reg          MLDSA_i_ready_B,

    /*---Keack---*/
    output  reg         sha_en, 
    output  reg [3:0]   sha_type,
    input               sha_out_ready,

    /*---Data_Mem---*/
    output              mem_sel,
    output              A_mem_sel,
    output              t_mem_sel,

    /*---Sampler---*/
    output reg [1:0]    sampler_mode,
    output [3:0]        s1_index,
    output [3:0]        s2_index,
    output [3:0]        A_index,
    output [3:0]        y_index,
    output reg          sampler_in_ready,
    input               next_element,
    output [1:0]        sha_in_sel,
    output [1:0]        seed_in_sel,

    /*---NTT---*/
    output  reg         NTT_mode,
	output reg          NTT_in_ready,
    output reg [1:0]    NTT_index,
    input               NTT_done,

    /*---PWM---*/
    // output              PWM_start,
    output reg [1:0]    PWM_index,
    // input               PWM_done,

    //Sampler Rejection
    input             z_fail,
    input             r0_fail,
    input             ct0_fail,
    input             hint_fail,

    /*---Address genetate---*/
    output reg [3:0]    main_mem_sel,

    output reg          AG_1_triger,
    output reg          AG_1_clean,
    input               AG_1_addr_en,
    input               AG_1_done,

    output reg          AG_2_triger,
    output reg          AG_2_clean,
    input               AG_2_done,
    
    output reg          AG_3_triger,
    output reg          AG_3_clean,
    input               AG_3_done,

    output reg          AG_4_triger,
    output reg          AG_4_clean,
    input               AG_4_done,

    /*---Encoder---*/
    input               DEC_ready_i
    // /*---Encoder---*/
    // output reg          ENC_valid_i,
    // input               ENC_ready_i,
    // input               ENC_valid_o,
    // output reg          ENC_ready_o


    );  

    //main mode
    localparam  [1:0]   KeyGen  = 2'd0,
                        SignGen = 2'd1,
                        SignVer = 2'd2;

    //KeyGen FSM
    localparam  [5:0]   IDLE        = 6'd0,
                        STAGE_1     = 6'd1,        
                        STAGE_2     = 6'd2,        
                        STAGE_3     = 6'd3,        
                        STAGE_4     = 6'd4,        
                        STAGE_5     = 6'd5,        
                        STAGE_6     = 6'd6,        
                        STAGE_7     = 6'd7,        
                        STAGE_8     = 6'd8,        
                        STAGE_9     = 6'd9,        
                        STAGE_10    = 6'd10,        
                        STAGE_11    = 6'd11,        
                        STAGE_12    = 6'd12,        
                        STAGE_13    = 6'd13,        
                        STAGE_14    = 6'd14,        
                        STAGE_15    = 6'd15,        
                        STAGE_16    = 6'd16,        
                        STAGE_17    = 6'd17,        
                        STAGE_18    = 6'd18,        
                        STAGE_19    = 6'd19,        
                        STAGE_20    = 6'd20,        
                        STAGE_21    = 6'd21,

                        STAGE_4_1   = 6'd30,        
                        STAGE_T     = 6'd31;        

    //Sampler mode
    localparam [1:0]    S_mode    = 2'd0,
                        A_mode    = 2'd1,
                        MASK_mode = 2'd2,
                        SIB_mode  = 2'd3;

    reg  [3:0]   s_mem_cnt;
    reg  [3:0]   A_mem_cnt;
    reg  [1:0]   y_mem_cnt;

    wire [5:0] curr_state;
    reg  [5:0] curr_state_KeyGen;
    reg  [5:0] curr_state_SignGen;
    reg  [5:0] curr_state_SignVer;

    wire [5:0] next_state;
    reg  [5:0] next_state_KeyGen;
    reg  [5:0] next_state_SignGen;
    reg  [5:0] next_state_SignVer;

    reg        sha_out_ready_tmp;

    reg  keccak_done; 
    reg  keccak_done_tmp;
    reg [1:0] NTT_end_index;
    reg  NTT_done_tmp;

    reg [1:0]PWM_index_tmp;
    reg [1:0]PWM_end_index;
    reg PWM_done;
    reg PWM_done_tmp;
    reg Encoder_done;
    reg Encoder_done_tmp;
    reg Decoder_done;
    reg Decoder_done_tmp;
    reg send_done;
    reg send_done_tmp;
    reg Decomposer_done;
    reg Decomposer_done_tmp;
    reg MakeHint_done;
    reg MakeHint_done_tmp;

    assign  curr_state = main_mode == KeyGen  ? curr_state_KeyGen : 
                         main_mode == SignGen ? curr_state_SignGen:
                         main_mode == SignVer ? curr_state_SignVer: 6'd0;

    assign  next_state = main_mode == KeyGen  ? next_state_KeyGen : 
                         main_mode == SignGen ? next_state_SignGen: 
                         main_mode == SignVer ? next_state_SignVer: 6'd0;

    assign  ctrl_sign = {main_mode,curr_state};

    /*---KeyGen Main---*/ //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    always @ (posedge clk or posedge reset) begin
        if (reset)
            curr_state_KeyGen <= IDLE;
        else if(main_mode == KeyGen)
            curr_state_KeyGen <= next_state_KeyGen;
    end

    always @(*) begin
        case (curr_state_KeyGen)
            IDLE: begin
                if(start)   
                    next_state_KeyGen = STAGE_1;
                else        
                    next_state_KeyGen = IDLE;
            end
            STAGE_1: begin
                if(keccak_done_tmp)   
                    next_state_KeyGen = STAGE_2; //Stage 2
                else                
                    next_state_KeyGen = STAGE_1;
            end 
            STAGE_2: begin
                if(keccak_done_tmp)   
                    next_state_KeyGen = STAGE_3;
                else                
                    next_state_KeyGen = STAGE_2;
            end
            STAGE_3: begin
                if(keccak_done_tmp & NTT_done_tmp)   
                    next_state_KeyGen = STAGE_4;
                else                
                    next_state_KeyGen = STAGE_3;
            end 
            STAGE_4: begin
                if(Encoder_done_tmp && keccak_done)   
                    next_state_KeyGen = STAGE_5;
                else                
                    next_state_KeyGen = STAGE_4;
            end 
            STAGE_5: begin
                if(Encoder_done_tmp && PWM_done_tmp)   
                    next_state_KeyGen = STAGE_6;
                else                
                    next_state_KeyGen = STAGE_5;
            end 
            STAGE_6: begin
                if(NTT_done_tmp)   
                    next_state_KeyGen = STAGE_7;
                else                
                    next_state_KeyGen = STAGE_6;
            end 
            STAGE_7: begin
                if(Encoder_done_tmp && PWM_done_tmp)   
                    next_state_KeyGen = STAGE_8;
                else                
                    next_state_KeyGen = STAGE_7;
            end 
            STAGE_8: begin
                if(Encoder_done_tmp && keccak_done_tmp)   
                    next_state_KeyGen = STAGE_9;
                else                
                    next_state_KeyGen = STAGE_8;
            end
            STAGE_9: begin
                if(send_done)   
                    next_state_KeyGen = STAGE_10;
                else                
                    next_state_KeyGen = STAGE_9;
            end 
            STAGE_10: begin
                if(send_done)   
                    next_state_KeyGen = STAGE_T;
                else                
                    next_state_KeyGen = STAGE_10;
            end 
            STAGE_T: begin
                next_state_KeyGen = STAGE_T;
            end
            default: next_state_KeyGen = IDLE;
        endcase
    end
    /*---KeyGen Main---*/ //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


    /*---SignGen Main---*/ //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    always @ (posedge clk or posedge reset) begin
        if (reset)
            curr_state_SignGen <= IDLE;
        else if(main_mode == SignGen)
            curr_state_SignGen <= next_state_SignGen;
    end

    always @(*) begin
        case (curr_state_SignGen)
            IDLE: begin
                if(start)   
                    next_state_SignGen = STAGE_1;
                else        
                    next_state_SignGen = IDLE;
            end
            STAGE_1: begin
                if(keccak_done_tmp && Decoder_done_tmp)   
                    next_state_SignGen = STAGE_2;
                else 
                    next_state_SignGen = STAGE_1;
            end
            STAGE_2: begin
                if(keccak_done_tmp && Decoder_done_tmp && NTT_done_tmp)   
                    next_state_SignGen = STAGE_3;
                else 
                    next_state_SignGen = STAGE_2;
            end
            STAGE_3: begin
                if(keccak_done_tmp && Decoder_done_tmp && NTT_done_tmp)   
                    next_state_SignGen = STAGE_4_1;
                else 
                    next_state_SignGen = STAGE_3;
            end
            STAGE_4_1: begin
                if(AG_1_done)   
                    next_state_SignGen = STAGE_4;
                else 
                    next_state_SignGen = STAGE_4_1;
            end
            STAGE_4: begin
                if(NTT_done_tmp)   
                    next_state_SignGen = STAGE_5;
                else 
                    next_state_SignGen = STAGE_4;
            end
            STAGE_5: begin
                if(keccak_done_tmp && NTT_done_tmp)   
                    next_state_SignGen = STAGE_6;
                else 
                    next_state_SignGen = STAGE_5;
            end
            STAGE_6: begin
                if(PWM_done_tmp)   
                    next_state_SignGen = STAGE_7;
                else 
                    next_state_SignGen = STAGE_6;
            end
            STAGE_7: begin
                if(NTT_done_tmp)   
                    next_state_SignGen = STAGE_8;
                else 
                    next_state_SignGen = STAGE_7;
            end
            STAGE_8: begin
                if(Encoder_done_tmp)   
                    next_state_SignGen = STAGE_9;
                else 
                    next_state_SignGen = STAGE_8;
            end
            STAGE_9: begin
                if(keccak_done_tmp)   
                    next_state_SignGen = STAGE_10;
                else 
                    next_state_SignGen = STAGE_9;
            end
            STAGE_10: begin
                if(keccak_done_tmp)   
                    next_state_SignGen = STAGE_11;
                else 
                    next_state_SignGen = STAGE_10;
            end ////////
            STAGE_11: begin
                if(NTT_done_tmp)   
                    next_state_SignGen = STAGE_12;
                else    
                    next_state_SignGen = STAGE_11;
            end
            STAGE_12: begin
                if(PWM_done_tmp)   
                    next_state_SignGen = STAGE_13;
                else 
                    next_state_SignGen = STAGE_12;
            end
            STAGE_13: begin
                if(NTT_done_tmp && PWM_done_tmp)   
                    next_state_SignGen = STAGE_14;
                else 
                    next_state_SignGen = STAGE_13;
            end
            STAGE_14: begin
                if(NTT_done_tmp && PWM_done_tmp)   
                    next_state_SignGen = STAGE_15;
                else 
                    next_state_SignGen = STAGE_14;
            end//////////////////////////////////////////////////
            STAGE_15: begin
                if(keccak_done_tmp && PWM_done_tmp)   
                    next_state_SignGen = STAGE_16;
                else 
                    next_state_SignGen = STAGE_15;
            end
            // STAGE_16: begin
            //     if(NTT_done_tmp && PWM_done_tmp)
            //         next_state_SignGen = STAGE_17;
            //     else 
            //         next_state_SignGen = STAGE_16;
            // end
            STAGE_16: begin
                if(NTT_done_tmp && PWM_done_tmp)
                    if(z_fail || r0_fail)
                        next_state_SignGen = STAGE_6;
                    else
                        next_state_SignGen = STAGE_17;
                else 
                    next_state_SignGen = STAGE_16;
            end
            STAGE_17: begin
                if(NTT_done_tmp)   
                    next_state_SignGen = STAGE_18;
                else 
                    next_state_SignGen = STAGE_17;
            end
            // STAGE_18: begin
            //     if(PWM_done_tmp)   
            //         next_state_SignGen = STAGE_T;
            //     else 
            //         next_state_SignGen = STAGE_18;
            // end
            STAGE_18: begin
                if(PWM_done_tmp && MakeHint_done)   
                    if(ct0_fail || hint_fail)
                        next_state_SignGen = STAGE_6;
                    else
                        next_state_SignGen = STAGE_19;
                else 
                    next_state_SignGen = STAGE_18;
            end
            STAGE_19: begin
                if(send_done)   
                    next_state_SignGen = STAGE_20;
                else 
                    next_state_SignGen = STAGE_19;
            end
            STAGE_20: begin
                if(Encoder_done_tmp)   
                    next_state_SignGen = STAGE_21;
                else 
                    next_state_SignGen = STAGE_20;
            end
            STAGE_21: begin
                if(send_done)   
                    next_state_SignGen = STAGE_T;
                else 
                    next_state_SignGen = STAGE_21;
            end
            STAGE_T: begin
                next_state_SignGen = STAGE_T;
            end
            default: next_state_SignGen = IDLE;
        endcase
    end
    /*---SignGen Main---*/ //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


    /*---Outside---*/ //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    always @(*) begin
        send_done = 1'b0;
        case (ctrl_sign)
            {KeyGen,6'd9}: begin
                send_done = main_mem_sel[0] & AG_1_done;
            end
            {KeyGen,6'd10}: begin
                send_done = main_mem_sel[2] & main_mem_sel[0] & AG_1_done;
            end
            {SignGen,6'd19}: begin
                send_done = AG_1_done;
            end
            {SignGen,6'd21}: begin
                send_done = AG_1_done;
            end
        endcase
    end
    /*---Outside---*/ //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


    /*---keccak---*/ //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    always @(*) begin
        sha_type = 4'd0;
        case (ctrl_sign)
            {KeyGen,STAGE_1}: begin
                sha_type = 4'd0;
            end 
            {KeyGen,STAGE_2}: begin
                sha_type = 4'd2;
            end 
            {KeyGen,STAGE_3}: begin
                sha_type = 4'd3;
            end 
            {KeyGen,STAGE_4}: begin
                sha_type = 4'd1;
            end 
            {KeyGen,STAGE_8}: begin
                sha_type = 4'd6;
            end
            {SignGen,STAGE_1}: begin
                sha_type = 4'd11;
            end
            {SignGen,STAGE_2}: begin
                sha_type = 4'd10;
            end
            {SignGen,STAGE_3}: begin
                sha_type = 4'd4;
            end
            {SignGen,STAGE_4},
            {SignGen,STAGE_5}: begin
                sha_type = 4'd1;
            end
            {SignGen,STAGE_9}: begin
                sha_type = 4'd5;
            end
            {SignGen,STAGE_10}: begin
                sha_type = 4'd8;
            end
            {SignGen,STAGE_15}: begin
                sha_type = 4'd4;
            end
            default: sha_type = 4'd0;
        endcase
    end

    /*---sha_en---*/
    always @(*) begin
        sha_en = 1'd0;
        case (ctrl_sign)
            {KeyGen,STAGE_1},
            {KeyGen,STAGE_2},
            {KeyGen,STAGE_3},
            {KeyGen,STAGE_4},
            {KeyGen,STAGE_8},
            {SignGen,STAGE_1},
            {SignGen,STAGE_2},
            {SignGen,STAGE_3},
            {SignGen,STAGE_4},
            {SignGen,STAGE_5},
            {SignGen,STAGE_9},
            {SignGen,STAGE_10},
            {SignGen,STAGE_15}: begin
                sha_en = ~(keccak_done | keccak_done_tmp);
            end 
            default: sha_en = 1'd0;
        endcase
    end

    assign s1_index = s_mem_cnt;
    assign s2_index = s_mem_cnt;
    assign A_index  = A_mem_cnt;
    assign y_index  = y_mem_cnt;

    always @ (posedge clk) begin 
        if (reset)                                                                                                                                                   
            s_mem_cnt <= 4'd0;
        else if((ctrl_sign == {KeyGen,STAGE_2} | curr_state == {KeyGen,STAGE_3}) && next_element)
            s_mem_cnt <= s_mem_cnt + 1'b1;
    end

    always @ (posedge clk) begin 
        if (reset)                                                                                                                                                   
            A_mem_cnt <= 4'd0;
        else if((ctrl_sign == {KeyGen,STAGE_4} | ctrl_sign == {SignGen,STAGE_4} |ctrl_sign == {SignGen,STAGE_5}) && next_element)
            A_mem_cnt <= A_mem_cnt + 1'b1;
    end

    always @ (posedge clk) begin 
        if (reset)                                                                                                                                                   
            y_mem_cnt <= 2'd0;
        else if((ctrl_sign  == {SignGen,STAGE_3} | ctrl_sign  == {SignGen,STAGE_15}) && next_element)
            y_mem_cnt <= y_mem_cnt + 1'b1;
    end
    
    
    always @(*) begin
        keccak_done = 1'b0;
        case (ctrl_sign)
            {KeyGen,STAGE_1}: begin
                keccak_done = AG_4_done;
            end 
            {KeyGen,STAGE_2}: begin 
                keccak_done = (s1_index == 3 & next_element);
            end
            {KeyGen,STAGE_3}: begin
                keccak_done = (s2_index == 7 & next_element);
            end 
            {KeyGen,STAGE_4}: begin
                keccak_done = (A_index == 15 & next_element);
            end
            {KeyGen,STAGE_8}: begin
                keccak_done = AG_4_done;
            end
            {SignGen,STAGE_1}: begin
                keccak_done = AG_4_done;
            end
            {SignGen,STAGE_2}: begin
                keccak_done = AG_4_done;
            end
            {SignGen,STAGE_3}: begin
                keccak_done = (y_index == 3 & next_element);
            end
            {SignGen,STAGE_4},
            {SignGen,STAGE_5}: begin
                keccak_done = (A_index == 15 & next_element);
            end
            {SignGen,STAGE_9}: begin  //store c_tilde to c_tilde MEM
                keccak_done = AG_4_done;
            end
            {SignGen,STAGE_10}: begin
                keccak_done = (next_element);
            end
            {SignGen,STAGE_15}: begin
                keccak_done = (y_index == 3 & next_element);
            end
            default: keccak_done = 1'b0;
        endcase
    end

    always @(posedge clk) begin
        if(reset)
            keccak_done_tmp <= 1'b0;
        else if(next_state != curr_state)
            keccak_done_tmp <= 1'b0;
        else if(keccak_done)
            keccak_done_tmp <= 1'b1;
    end
    /*---keccak---*/ //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


    /*---Sampler---*/ //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    always @(*) begin
        sampler_in_ready = 1'b0;
        case (ctrl_sign)
            {KeyGen,6'd2},
            {KeyGen,6'd3}:begin
                sampler_mode = S_mode;
                if(sha_out_ready)
                    sampler_in_ready = 1'b1;
            end
            {KeyGen,6'd4}:begin
                sampler_mode = A_mode;
                if(sha_out_ready)
                    sampler_in_ready = 1'b1;
            end
            {SignGen,6'd3}:begin
                sampler_mode = MASK_mode;
                if(sha_out_ready)
                    sampler_in_ready = 1'b1;
            end
            {SignGen,6'd4},
            {SignGen,6'd5}:begin
                sampler_mode = A_mode;
                if(sha_out_ready)
                    sampler_in_ready = 1'b1;
            end
            {SignGen,6'd10}:begin
                sampler_mode = SIB_mode;
                if(sha_out_ready)
                    sampler_in_ready = 1'b1;
            end
            {SignGen,6'd15}:begin
                sampler_mode = MASK_mode;
                if(sha_out_ready)
                    sampler_in_ready = 1'b1;
            end
            default: sampler_in_ready = 1'b0;
        endcase
    end
    /*---Sampler---*/ //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


    /*---NTT---*/ //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    always @(*) begin
        NTT_mode = 1'b0;
        case (ctrl_sign)
            {KeyGen,6'd3}:begin
                NTT_mode = 1'b0;
            end
            {KeyGen,6'd6}:begin
                NTT_mode = 1'b1;
            end
            {KeyGen,6'd6}:begin
                NTT_mode = 1'b1;
            end
            {SignGen,6'd2}:begin
                NTT_mode = 1'b0;
            end
            {SignGen,6'd3}:begin
                NTT_mode = 1'b0;
            end
            {SignGen,6'd4}:begin
                NTT_mode = 1'b0;
            end
            {SignGen,6'd5}:begin
                NTT_mode = 1'b0;
            end
            {SignGen,6'd7}:begin
                NTT_mode = 1'b1;
            end
            {SignGen,6'd11}:begin
                NTT_mode = 1'b0;
            end
            {SignGen,6'd13}:begin
                NTT_mode = 1'b1;
            end
            {SignGen,6'd14}:begin
                NTT_mode = 1'b1;
            end
            {SignGen,6'd16}:begin
                NTT_mode = 1'b0;
            end
            {SignGen,6'd17}:begin
                NTT_mode = 1'b1;
            end
            default: NTT_mode = 1'b0;
        endcase
    end

    always @(*) begin
        NTT_in_ready = 1'b0;
        case (ctrl_sign)
            {KeyGen,6'd3}:begin
                NTT_in_ready = 1'b1;
            end
            {KeyGen,6'd6}:begin
                NTT_in_ready = 1'b1;
            end
            {SignGen,6'd2}:begin
                NTT_in_ready = 1'b1;
            end
            {SignGen,6'd3}:begin
                NTT_in_ready = 1'b1;
            end
            {SignGen,6'd4}:begin
                NTT_in_ready = 1'b1;
            end
            {SignGen,6'd5}:begin
                NTT_in_ready = 1'b1;
            end
            {SignGen,6'd7}:begin
                NTT_in_ready = 1'b1;
            end
            {SignGen,6'd11}:begin
                NTT_in_ready = 1'b1;
            end
            {SignGen,6'd13}:begin
                NTT_in_ready = 1'b1;
            end
            {SignGen,6'd14}:begin
                NTT_in_ready = 1'b1;
            end
            {SignGen,6'd16}:begin
                NTT_in_ready = 1'b1;
            end
            {SignGen,6'd17}:begin
                NTT_in_ready = 1'b1;
            end
            default: NTT_in_ready = 1'b0;
        endcase
    end

    always @(*) begin
        NTT_end_index  = 1'b0;
        case (ctrl_sign)
            {KeyGen,6'd3},
            {KeyGen,6'd6},
            {SignGen,6'd2},
            {SignGen,6'd3},
            {SignGen,6'd4},
            {SignGen,6'd5},
            {SignGen,6'd7},
            {SignGen,6'd13},
            {SignGen,6'd14},
            {SignGen,6'd16},
            {SignGen,6'd17}:begin
                NTT_end_index = 2'd3;
            end 
            {SignGen,6'd11}:begin
                NTT_end_index = 2'd0;
            end 
        endcase
    end
            
    always @ (posedge clk) begin 
        if (reset)                                                                                                                                                   
            NTT_index <= 2'd0;
        else if(next_state != curr_state)
            NTT_index <= 2'b0;
        else if(NTT_done)
            NTT_index <= NTT_index + 1'b1;
    end

    always @ (posedge clk) begin 
        if (reset)                                                                                                                                                   
            NTT_done_tmp <= 1'b0;
        else if(next_state != curr_state)
            NTT_done_tmp <= 1'b0;
        else if(NTT_index == NTT_end_index & NTT_done)
            NTT_done_tmp <= 1'b1;
    end
    /*---NTT---*/ //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


    /*---Encoder---*/ //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    always @(*) begin
        Encoder_done = 1'b0;
        case (ctrl_sign)
            {KeyGen,6'd4}:begin
                Encoder_done = AG_3_done;
            end
            {KeyGen,6'd5}:begin
                Encoder_done = AG_3_done;
            end
            {KeyGen,6'd7}:begin
                Encoder_done = AG_3_done;
            end
            {KeyGen,6'd8}:begin
                Encoder_done = AG_3_done;
            end
            {SignGen,6'd8}:begin
                Encoder_done = AG_3_done;
            end
            {SignGen,6'd15}:begin
                Encoder_done = AG_3_done;
            end
            {SignGen,6'd20}:begin
                Encoder_done = AG_3_done;
            end
        endcase
    end

    always @ (posedge clk) begin 
        if (reset)                                                                                                                                                   
            Encoder_done_tmp <= 1'b0;
        else if(next_state != curr_state)
            Encoder_done_tmp <= 1'b0;
        else if(Encoder_done)
            Encoder_done_tmp <= 1'b1;
    end
    /*---Encoder---*/ //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


    /*---Decoder---*/ //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    always @(*) begin
        Decoder_done = 1'b0;
        case (ctrl_sign)
            {SignGen,6'd1}:begin
                Decoder_done = AG_3_done;
            end
            {SignGen,6'd2}:begin
                Decoder_done = AG_3_done;
            end
            {SignGen,6'd3}:begin
                Decoder_done = AG_3_done;
            end
        endcase
    end

    always @ (posedge clk) begin 
        if (reset)                                                                                                                                                   
            Decoder_done_tmp <= 1'b0;
        else if(next_state != curr_state)
            Decoder_done_tmp <= 1'b0;
        else if(Decoder_done)
            Decoder_done_tmp <= 1'b1;
    end
    /*---Decoder---*/ //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

    /*---MakeHint---*/ //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    always @(*) begin
        MakeHint_done = 1'b0;
        case (ctrl_sign)
            {SignGen,6'd18}:begin
                MakeHint_done = AG_3_done;
            end
        endcase
    end

    always @ (posedge clk) begin 
        if (reset)                                                                                                                                                   
            MakeHint_done_tmp <= 1'b0;
        else if(next_state != curr_state)
            MakeHint_done_tmp <= 1'b0;
        else if(MakeHint_done)
            MakeHint_done_tmp <= 1'b1;
    end
    /*---MakeHint---*/ //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

    /*---Address_Generate---*/ //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    reg main_mem_sel_triger;

    always @(*) begin
        main_mem_sel_triger = 1'b0;
        case (ctrl_sign)
            {KeyGen,6'd8}:begin //main_mem_sel: 4'd0 -> p, 4'd1 -> t1_pack
                main_mem_sel_triger = AG_1_done; 
            end
            {KeyGen,6'd9}:begin //main_mem_sel: "4'd0 -> p", "4'd1 -> t1_pack"
                main_mem_sel_triger = AG_1_done; 
            end
            {KeyGen,6'd10}:begin //main_mem_sel: "4'd0 -> p", "4'd1 -> t1_pack"
                main_mem_sel_triger = AG_1_done; 
            end
            {SignGen,6'd9}:begin //main_mem_sel: 4'd0 -> u, 4'd1 -> w1_pack
                main_mem_sel_triger = AG_1_done; 
            end
            // {KeyGen,6'd10}:begin //main_mem_sel: "3'd0 -> p", "3'd1 -> K", "3'd2 -> tr", "3'd3 -> s1_pack", "3'd4 -> s2_pack", "3'd5 -> t0_pack",    
            //     main_mem_sel_triger = AG_1_done; 
            // end
        endcase
    end

    always @(posedge clk) begin
        if(reset)
            main_mem_sel <= 4'd0;
        else if(next_state != curr_state)
            main_mem_sel <= 4'd0;
        else if(main_mem_sel_triger)
            main_mem_sel <= main_mem_sel + 1'b1;
    end

    always @(*) begin
        AG_1_triger      = 1'b0;
        AG_1_clean       = 1'b0;
        case (ctrl_sign)
            // STAGE_1: begin
            //     AG_1_triger      = sha_out_ready;
            //     AG_1_clean       = AG_1_done;
            // end
            {KeyGen,STAGE_2}, // Gen s1
            {KeyGen,STAGE_3}, // Gen s2
            {KeyGen,STAGE_4}: begin // Gen A
                AG_1_triger      = ~(keccak_done | keccak_done_tmp);
                AG_1_clean       = next_element;
            end 
            {KeyGen,STAGE_8}: begin
                AG_1_triger      = ~main_mem_sel[1];
                AG_1_clean       = AG_1_done;
            end
            {KeyGen,STAGE_9}: begin
                AG_1_triger      = ~main_mem_sel[1];
                AG_1_clean       = AG_1_done;
            end
            {KeyGen,STAGE_10}: begin
                AG_1_triger      = ~(main_mem_sel[2] & main_mem_sel[1]);
                AG_1_clean       = AG_1_done;
            end
            {SignGen,STAGE_2}: begin  //wait K and rnd data send in by MLDSA_in_A then take u data out
                AG_1_triger      = MLDSA_i_last_A;
                AG_1_clean       = AG_1_done;
            end
            {SignGen,STAGE_3}: begin  //take p'' MEM data out to keccak gen y
                AG_1_triger      = ~(keccak_done | keccak_done_tmp);
                AG_1_clean       = next_element;
            end  
            {SignGen,STAGE_4_1}: begin  //store p from MLDSA_in_B (stage_4-1)
                AG_1_triger      = MLDSA_i_valid_B;
                AG_1_clean       = AG_1_done;
            end
            {SignGen,STAGE_4},       // Gen A
            {SignGen,STAGE_5}: begin // Gen A
                AG_1_triger      = ~(keccak_done | keccak_done_tmp);
                AG_1_clean       = next_element;
            end
            {SignGen,STAGE_9}: begin
                AG_1_triger      = ~main_mem_sel[1];
                AG_1_clean       = AG_1_done;
            end
            {SignGen,STAGE_10}: begin  //take c_tile MEM data out to keccak and then sampler gen c
                AG_1_triger      = ~(keccak_done | keccak_done_tmp);
                AG_1_clean       = next_element;
            end
            {SignGen,STAGE_15}: begin  //take p'' MEM data out to keccak gen y
                AG_1_triger      = ~(keccak_done | keccak_done_tmp);
                AG_1_clean       = next_element;
            end 
            {SignGen,STAGE_19}: begin  //sned out c_tilde
                AG_1_triger      = ~AG_1_done;
                AG_1_clean       = AG_1_done;
            end 
            {SignGen,STAGE_21}: begin  //sned out hint_packed
                AG_1_triger      = ~AG_1_done;
                AG_1_clean       = AG_1_done;
            end 
        endcase
    end

    always @(*) begin
        AG_2_triger      = 1'b0;
        AG_2_clean       = 1'b0;
        case (ctrl_sign)
            {KeyGen,STAGE_3}: begin  // NTT s1
                AG_2_triger      = ~NTT_done_tmp;
                AG_2_clean       = NTT_done;
            end 
            {KeyGen,STAGE_4}: begin  // Enocder s1 TX
                AG_2_triger      = ~Encoder_done_tmp;
                AG_2_clean       = Encoder_done;
            end
            {KeyGen,STAGE_5}: begin // Enocder s2 TX
                AG_2_triger      = ~Encoder_done_tmp;
                AG_2_clean       = Encoder_done;
            end
            {KeyGen,STAGE_6}: begin //INTT ^A*^s1
                AG_2_triger      = ~NTT_done_tmp;
                AG_2_clean       = NTT_done;
            end
            {KeyGen,STAGE_8}: begin // Enocder t0 TX
                AG_2_triger      = ~Encoder_done_tmp;
                AG_2_clean       = Encoder_done;
            end
            {KeyGen,STAGE_T}: begin // Enocder t0 TX
                AG_2_triger      = ~Encoder_done_tmp;
                AG_2_clean       = Encoder_done;
            end
            {SignGen,STAGE_2}: begin  // NTT s1
                AG_2_triger      = ~NTT_done_tmp;
                AG_2_clean       = NTT_done;
            end 
            {SignGen,STAGE_3}: begin  // NTT s2
                AG_2_triger      = ~NTT_done_tmp;
                AG_2_clean       = NTT_done;
            end 
            {SignGen,STAGE_4}: begin  // NTT t0
                AG_2_triger      = ~NTT_done_tmp;
                AG_2_clean       = NTT_done;
            end 
            {SignGen,STAGE_5}: begin  // NTT y
                AG_2_triger      = ~NTT_done_tmp;
                AG_2_clean       = NTT_done;
            end 
            {SignGen,STAGE_7}: begin  // INTT W^
                AG_2_triger      = ~NTT_done_tmp;
                AG_2_clean       = NTT_done;
            end
            {SignGen,STAGE_8}: begin // Decomposer w1 =Decomp(w) and Enocder w1 TX
                AG_2_triger      = ~Encoder_done_tmp;
                AG_2_clean       = Encoder_done;
            end
            {SignGen,STAGE_11}: begin  // NTT C
                AG_2_triger      = ~NTT_done_tmp;
                AG_2_clean       = NTT_done;
            end 
            {SignGen,STAGE_13}: begin  // INTT <<cs1>>^
                AG_2_triger      = ~NTT_done_tmp;
                AG_2_clean       = NTT_done;
            end 
            {SignGen,STAGE_14}: begin  // INTT <<cs2>>^
                AG_2_triger      = ~NTT_done_tmp;
                AG_2_clean       = NTT_done;
            end 
            {SignGen,STAGE_16}: begin  // NTT y
                AG_2_triger      = ~NTT_done_tmp;
                AG_2_clean       = NTT_done;
            end  
            {SignGen,STAGE_17}: begin  // INTT(<<ct0>>^ )
                AG_2_triger      = ~NTT_done_tmp;
                AG_2_clean       = NTT_done;
            end 
            {SignGen,STAGE_20}: begin // Enocder z TX
                AG_2_triger      = ~Encoder_done_tmp;
                AG_2_clean       = Encoder_done;
            end 
        endcase
    end

    always @(*) begin
        AG_3_triger      = 1'b0;
        AG_3_clean       = 1'b0;
        case (ctrl_sign)
            {KeyGen,STAGE_4}: begin // Enocder s1 RX
                AG_3_triger      = ~Encoder_done_tmp;
                AG_3_clean       = Encoder_done;
            end 
            {KeyGen,STAGE_5}: begin // Enocder s2 RX
                AG_3_triger      = ~Encoder_done_tmp;
                AG_3_clean       = Encoder_done;
            end 
            {KeyGen,STAGE_7}: begin // Enocder t RX
                AG_3_triger      = ~Encoder_done_tmp;
                AG_3_clean       = Encoder_done;
            end 
            {KeyGen,STAGE_8}: begin // Enocder t RX
                AG_3_triger      = ~Encoder_done_tmp;
                AG_3_clean       = Encoder_done;
            end
            {SignGen,STAGE_1}: begin // Decoder s1 RX
                AG_3_triger      = ~Decoder_done_tmp;
                AG_3_clean       = Decoder_done;
            end
            {SignGen,STAGE_2}: begin // Decoder s2 RX
                AG_3_triger      = ~Decoder_done_tmp;
                AG_3_clean       = Decoder_done;
            end
            {SignGen,STAGE_3}: begin // Decoder t0 RX
                AG_3_triger      = ~Decoder_done_tmp;
                AG_3_clean       = Decoder_done;
            end
            {SignGen,STAGE_8}: begin // Enocder w1 RX
                AG_3_triger      = ~Encoder_done_tmp;
                AG_3_clean       = Encoder_done;
            end
            {SignGen,STAGE_18}: begin // MakeHint hint RX
                AG_3_triger      = ~MakeHint_done_tmp;
                AG_3_clean       = MakeHint_done;
            end
            {SignGen,STAGE_20}: begin // Enocder z RX
                AG_3_triger      = ~Encoder_done_tmp;
                AG_3_clean       = Encoder_done;
            end
        endcase
    end

    always @(*) begin
        AG_4_triger      = 1'b0;
        AG_4_clean       = 1'b0;
        case (ctrl_sign)
            {KeyGen,STAGE_1}: begin //after keccak gen seed, take seed to mem
                AG_4_triger      = sha_out_ready;
                AG_4_clean       = AG_4_done;
            end
            {KeyGen,STAGE_5}: begin //PWM t^ = A^ * s1^
                AG_4_triger      = ~PWM_done_tmp;
                AG_4_clean       = AG_4_done;
            end 
            {KeyGen,STAGE_7}: begin
                AG_4_triger      = ~PWM_done_tmp;
                AG_4_clean       = AG_4_done;
            end
            {KeyGen,STAGE_8}: begin
                AG_4_triger      = sha_out_ready;
                AG_4_clean       = AG_4_done;
            end 
            {SignGen,STAGE_1}: begin
                AG_4_triger      = sha_out_ready;
                AG_4_clean       = AG_4_done;
            end 
            {SignGen,STAGE_2}: begin  //after keccak gen p'' , take seed to mem
                AG_4_triger      = sha_out_ready;
                AG_4_clean       = AG_4_done;
            end 
            // {SignGen,STAGE_3}: begin  //after keccak gen y , take data to y  mem
            //     AG_4_triger      = sha_out_ready;
            //     AG_4_clean       = AG_4_done;
            // end 
            {SignGen,STAGE_6}: begin //PWM W^ = A^ * y^
                AG_4_triger      = ~PWM_done_tmp;
                AG_4_clean       = AG_4_done;
            end
            {SignGen,STAGE_9}: begin //after keccak gen c_tilde , take c_tile to mem
                AG_4_triger      = sha_out_ready;
                AG_4_clean       = AG_4_done;
            end
            {SignGen,STAGE_12}: begin //PWM <<cs1>> = c^ * s1^
                AG_4_triger      = ~PWM_done_tmp;
                AG_4_clean       = AG_4_done;
            end 
            {SignGen,STAGE_13}: begin //PWM <<cs2>> = c^ * s2^
                AG_4_triger      = ~PWM_done_tmp;
                AG_4_clean       = AG_4_done;
            end 
            {SignGen,STAGE_14}: begin //PWM z = y + <<cs1>>
                AG_4_triger      = ~PWM_done_tmp;
                AG_4_clean       = AG_4_done;
            end 
            {SignGen,STAGE_15}: begin // PWM w_cs2 = 𝐰 − ⟨⟨𝑐𝐬2⟩⟩ and LowBits(w_cs2)
                AG_4_triger      = ~PWM_done_tmp;
                AG_4_clean       = AG_4_done;
            end 
            {SignGen,STAGE_16}: begin //PWM <<ct0>>^ = c^ * t0^
                AG_4_triger      = ~PWM_done_tmp;
                AG_4_clean       = AG_4_done;
            end 
            {SignGen,STAGE_18}: begin //PWM (𝐰 − ⟨⟨𝑐𝐬2⟩⟩) + <<ct0>>
                AG_4_triger      = ~PWM_done_tmp;
                AG_4_clean       = AG_4_done;
            end 
        endcase
    end
    /*---Address_Generate---*/ //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


    /*---PWM---*/ //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    always @(*) begin
        PWM_index_tmp  = 1'b0;
        case (ctrl_sign)
            {KeyGen,STAGE_5}: begin
                PWM_end_index = 2'd3;
            end 
            {KeyGen,STAGE_7}: begin
                PWM_end_index = 2'd0;
            end
            {SignGen,STAGE_6}: begin
                PWM_end_index = 2'd3;
            end 
            {SignGen,STAGE_12}: begin
                PWM_end_index = 2'd0;
            end
            {SignGen,STAGE_13}: begin
                PWM_end_index = 2'd0;
            end 
            {SignGen,STAGE_14}: begin
                PWM_end_index = 2'd0;
            end
            {SignGen,STAGE_15}: begin
                PWM_end_index = 2'd0;
            end 
            {SignGen,STAGE_16}: begin //PWM <<ct0>>^ = c^ * t0^
                PWM_end_index = 2'd0;
            end
            {SignGen,STAGE_18}: begin //PWM (𝐰 − ⟨⟨𝑐𝐬2⟩⟩) + <<ct0>> 
                PWM_end_index = 2'd0;
            end
        endcase
    end

    always @(*) begin
        PWM_done = 1'b0;
        case (ctrl_sign)
            {KeyGen,STAGE_5}: begin
                PWM_done = AG_4_done;
            end 
            {KeyGen,STAGE_7}: begin
                PWM_done = AG_4_done;
            end 
            {SignGen,STAGE_6}: begin
                PWM_done = AG_4_done;
            end 
            {SignGen,STAGE_12}: begin
                PWM_done = AG_4_done;
            end 
            {SignGen,STAGE_13}: begin
                PWM_done = AG_4_done;
            end 
            {SignGen,STAGE_14}: begin
                PWM_done = AG_4_done;
            end 
            {SignGen,STAGE_15}: begin
                PWM_done = AG_4_done;
            end 
            {SignGen,STAGE_16}: begin //PWM <<ct0>>^ = c^ * t0^
                PWM_done = AG_4_done;
            end
            {SignGen,STAGE_18}: begin //PWM (𝐰 − ⟨⟨𝑐𝐬2⟩⟩) + <<ct0>>
                PWM_done = AG_4_done;
            end
            default: PWM_done = 1'b0;
        endcase
    end
    
    always @ (posedge clk) begin 
        if (reset)                                                                                                                                                   
            PWM_index_tmp <= 2'd0;
        else if(next_state != curr_state)
            PWM_index_tmp <= 1'b0;
        else if(PWM_done)
            PWM_index_tmp <= PWM_index_tmp + 1'b1;
    end

    always @ (posedge clk) begin 
        if (reset)                                                                                                                                                   
            PWM_index <= 2'd0;
        else
            PWM_index <= PWM_index_tmp;
    end

    always @ (posedge clk) begin 
        if (reset)                                                                                                                                                   
            PWM_done_tmp <= 1'b0;
        else if(next_state != curr_state)
            PWM_done_tmp <= 1'b0;
        else if(PWM_index == PWM_end_index && PWM_done)
            PWM_done_tmp <= 1'b1;
    end
    /*---PWM---*/ //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


    /*---Decomposer---*/ //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    always @(*) begin
        Decomposer_done = 1'b0;
        case (ctrl_sign)
            {SignGen,STAGE_8}: begin
                Decomposer_done = AG_4_done;
            end 
            {SignGen,STAGE_15}: begin
                Decomposer_done = AG_4_done;
            end 
        endcase
    end

    always @ (posedge clk) begin 
        if (reset)                                                                                                                                                   
            Decomposer_done_tmp <= 1'b0;
        else if(next_state != curr_state)
            Decomposer_done_tmp <= 1'b0;
        else if(Decomposer_done)
            Decomposer_done_tmp <= 1'b1;
    end
    /*---Decomposer---*/ //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


    /*---AXI Stream input protocol A---*/ //------------------------------------------str
    always @(posedge clk) begin
        if(reset)
            MLDSA_i_ready_A = 1'b0;
        else if(next_state != curr_state)
            MLDSA_i_ready_A <= 1'b1;
        else if(MLDSA_i_last_A)
            MLDSA_i_ready_A <= 1'b0;
    end
    /*---AXI Stream input protocol A---*/ //------------------------------------------end


    /*---AXI Stream input protocol B---*/ //------------------------------------------str
    reg MLDSA_i_ready_B_tmp;

    always @(*) begin
        MLDSA_i_ready_B = 1'b0;
        case (ctrl_sign)
            {SignGen,STAGE_1}: begin
                MLDSA_i_ready_B = MLDSA_i_ready_B_tmp & DEC_ready_i;
            end 
            {SignGen,STAGE_2}: begin
                MLDSA_i_ready_B = MLDSA_i_ready_B_tmp & DEC_ready_i;
            end 
            {SignGen,STAGE_3}: begin
                MLDSA_i_ready_B = MLDSA_i_ready_B_tmp & DEC_ready_i;
            end
            {SignGen,STAGE_4_1}: begin
                MLDSA_i_ready_B = MLDSA_i_ready_B_tmp & AG_1_addr_en;
            end
        endcase
    end
    
    always @(posedge clk) begin
        if(reset)
            MLDSA_i_ready_B_tmp = 1'b0;
        else if(next_state != curr_state)
            MLDSA_i_ready_B_tmp <= 1'b1;
        else if(MLDSA_i_last_B & MLDSA_i_ready_B)
            MLDSA_i_ready_B_tmp <= 1'b0;
    end
    /*---AXI Stream input protocol B---*/ //------------------------------------------end
endmodule











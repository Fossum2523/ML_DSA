module MLDSA
    (   
    input               clk,
    input               reset,
    input               start,
    input               data_in_ready,
    // input               i_valid,
    // output              i_ready,
    output              MLDSA_o_valid,
    output              MLDSA_o_last,
    // input               o_ready,
    input   [1:0]       main_mode, // KeyGen, SignGen, SignVer
    //External signals
    input   [2:0]       MLDSA_byte_num,
    input   [63:0]      MLDSA_data_in,
    output  [63:0]      MLDSA_data_out,

    //test
    output  [1343:0]    padder_out,
    output              padder_out_ready,
    output  [1599:0]    f_out,
    output              f_out_ready,
    output  [1343:0]    sha_out,
    output              sha_out_ready
    );  
    
    // Controller signals

    wire [8:0]  ctrl_sign;
    /*---Sha---*/
    wire          sha_en;
    wire  [3:0]   sha_type;
    // wire          sha_out_ready;

    /*---Data_MEM---*/
    wire        mem_sel;
    wire        A_mem_sel;
    wire        t_mem_sel;

    /*---Sampler---*/
    wire [1:0]  sampler_mode;
    wire [3:0]  s1_index;
    wire [3:0]  s2_index;
    wire [3:0]  A_index;
    wire [3:0]  y_index;
    wire        sampler_in_ready;
    wire        next_element;
    wire [1:0]  sha_in_sel;
    wire [1:0]  seed_in_sel;

    /*---NTT---*/
    wire        NTT_in_ready;
    wire [1:0]  NTT_index;
    wire        NTT_out_ready;
    wire        NTT_done;     
    
    /*---PWM---*/
    wire [1:0]  PWM_index;

    /*---AG---*/
    wire [3:0] main_mem_sel;

    wire AG_1_triger;
    wire AG_1_clean;
    wire AG_1_done;

    wire AG_2_triger;
    wire AG_2_clean;
    wire AG_2_done;

    wire AG_3_triger;
    wire AG_3_clean;
    wire AG_3_done;

    wire AG_4_triger;
    wire AG_4_clean;
    wire AG_4_done;

    // Instantiate Controller
    Controller controller_inst (
        .clk(clk),
        .reset(reset),

        .ctrl_sign(ctrl_sign),
        /*---from outside---*/
        .start(start),
        // .data_in_ready(data_in_ready),
        .main_mode(main_mode),

        /*---Keccak---*/
        .sha_en(sha_en),
        .sha_type(sha_type),
        .sha_out_ready(sha_out_ready),

        /*---Data_Mem---*/
        .mem_sel(mem_sel),
        .A_mem_sel(A_mem_sel),
        .t_mem_sel(t_mem_sel),

        /*---Sampler---*/
        .sampler_mode(sampler_mode),
        .s1_index(s1_index),
        .s2_index(s2_index),
        .A_index(A_index),
        .y_index(y_index),
        .sampler_in_ready(sampler_in_ready),
        .next_element(next_element),

        /*---NTT---*/
        .NTT_mode(NTT_mode),
	    .NTT_in_ready(NTT_in_ready),
        .NTT_index(NTT_index),
        .NTT_done(NTT_done),
        
        /*---PWM---*/
        .PWM_index(PWM_index),
        
         /*---AG_1---*/
        .main_mem_sel(main_mem_sel),

        .AG_1_triger(AG_1_triger),
        .AG_1_clean(AG_1_clean),
        .AG_1_done(AG_1_done),

        .AG_2_triger(AG_2_triger),
        .AG_2_clean(AG_2_clean),
        .AG_2_done(AG_2_done),

        .AG_3_triger(AG_3_triger),
        .AG_3_clean(AG_3_clean),
        .AG_3_done(AG_3_done),

        .AG_4_triger(AG_4_triger),
        .AG_4_clean(AG_4_clean),
        .AG_4_done(AG_4_done)
    );

    


    // Instantiate Data_Path
    Data_Path data_path_inst (
        .clk(clk),
        .reset(reset),
        
        .ctrl_sign(ctrl_sign),

        /*---Keccak---*/
        .sha_en(sha_en),
        .sha_type(sha_type),
        .sha_out_ready(sha_out_ready),

        /*---Data_Mem---*/
        .mem_sel(mem_sel),
        .A_mem_sel(A_mem_sel),
        .t_mem_sel(t_mem_sel),

        /*---Sampler---*/
        .sampler_mode(sampler_mode),
        .s1_index(s1_index),
        .s2_index(s2_index),
        .A_index(A_index),
        .y_index(y_index),
        .sampler_in_ready(sampler_in_ready),
        .next_element(next_element),

        /*---NTT---*/
        .NTT_mode(NTT_mode),
	    .NTT_in_ready(NTT_in_ready),
        .NTT_index(NTT_index),
        .NTT_done(NTT_done),

        /*---PWM---*/
        .PWM_index(PWM_index),

        /*---AG_1---*/
        .main_mem_sel(main_mem_sel),

        .AG_1_triger(AG_1_triger),
        .AG_1_clean(AG_1_clean),
        .AG_1_done(AG_1_done),

        .AG_2_triger(AG_2_triger),
        .AG_2_clean(AG_2_clean),
        .AG_2_done(AG_2_done),

        .AG_3_triger(AG_3_triger),
        .AG_3_clean(AG_3_clean),
        .AG_3_done(AG_3_done),

        .AG_4_triger(AG_4_triger),
        .AG_4_clean(AG_4_clean),
        .AG_4_done(AG_4_done),
        
        /*---from outside---*/
        .data_in(MLDSA_data_in),
        .data_in_ready(data_in_ready),
        .data_out(MLDSA_data_out),
        .o_valid(MLDSA_o_valid),
        .o_last(MLDSA_o_last),

        /*---test (Need to delete)---*/
        .padder_out(padder_out),
        .padder_out_ready(padder_out_ready),
        .f_out(f_out),
        .f_out_ready(f_out_ready),
        .sha_out(sha_out)
    );

endmodule

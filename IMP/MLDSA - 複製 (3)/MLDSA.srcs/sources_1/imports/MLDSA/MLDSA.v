module MLDSA
    (   
    input               clk,
    input               reset,
    input               start,
    input               data_in_ready,
    input   [1:0]       main_mode, // KeyGen, SignGen, SignVer
    //External signals
    input   [63:0]      data_in,
    output  [63:0]      data_out,

    //test
    output  [1343:0]    padder_out,
    output              padder_out_ready,
    output  [1599:0]    f_out,
    output              f_out_ready,
    output  [1343:0]    sha_out,
    output              sha_out_ready
    );  
    
    // Controller signals
    /*---Sha---*/
    wire        sha_in_ready;
    wire        sha_is_last;
    wire        sha_squeeze;
    wire        sha_mode;
    wire        sha_hold;
    wire [2:0]  sha_byte_num;
    // wire                sha_out_ready;
    wire        sha_clean;

    /*---Seed---*/
    wire        Rho_prime_en;
    wire        Rho_en;
    wire        Kata_en;
    wire        Rho_prime_mode;
    wire        Rho_mode;
    wire        Kata_mode;

    /*---Data_MEM---*/
    wire        mem_sel;
    wire        A_mem_sel;
    wire        t_mem_sel;

    /*---Sampler---*/
    wire [1:0]  sampler_mode;
    wire [3:0]  index;
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
    wire        PWM_start;
    wire [3:0]  PWM_index;
    wire        PWM_done;

    

    // Instantiate Controller
    Controller controller_inst (
        .clk(clk),
        .reset(reset),

        /*---from outside---*/
        .start(start),
        .data_in_ready(data_in_ready),
        .main_mode(main_mode),

        /*---Keack---*/
        .sha_in_ready(sha_in_ready),
        .sha_is_last(sha_is_last),
        .sha_squeeze(sha_squeeze),
        .sha_mode(sha_mode),
        .sha_hold(sha_hold),
        .sha_byte_num(sha_byte_num),
        .sha_out_ready(sha_out_ready),
        .sha_clean(sha_clean),

        /*---Data_Mem---*/
        .mem_sel(mem_sel),
        .A_mem_sel(A_mem_sel),
        .t_mem_sel(t_mem_sel),
        .Rho_en(Rho_en),
        .Rho_prime_en(Rho_prime_en),
        .Kata_en(Kata_en),
        .Rho_mode(Rho_mode),
        .Rho_prime_mode(Rho_prime_mode),
        .Kata_mode(Kata_mode),

        /*---Sampler---*/
        .sampler_mode(sampler_mode),
        .index(index),
        .sampler_in_ready(sampler_in_ready),
        .next_element(next_element),
        .sha_in_sel(sha_in_sel),
        .seed_in_sel(seed_in_sel),

        /*---NTT---*/
        .NTT_mode(NTT_mode),
	    .NTT_in_ready(NTT_in_ready),
        .NTT_index(NTT_index),
        .NTT_done(NTT_done),
        
        /*---PWM---*/
	    .PWM_start(PWM_start),
        .PWM_index(PWM_index),
        .PWM_done(PWM_done)
    );

    // Instantiate Data_Path
    Data_Path data_path_inst (
        .clk(clk),
        .reset(reset),
        
        /*---Keack---*/
        .sha_in_ready(sha_in_ready),
        .sha_is_last(sha_is_last),
        .sha_squeeze(sha_squeeze),
        .sha_mode(sha_mode),
        .sha_hold(sha_hold),
        .sha_byte_num(sha_byte_num),
        .sha_out_ready(sha_out_ready),
        .sha_clean(sha_clean),

        /*---Data_Mem---*/
        .mem_sel(mem_sel),
        .A_mem_sel(A_mem_sel),
        .t_mem_sel(t_mem_sel),
        .Rho_en(Rho_en),
        .Rho_prime_en(Rho_prime_en),
        .Kata_en(Kata_en),
        .Rho_mode(Rho_mode),
        .Rho_prime_mode(Rho_prime_mode),
        .Kata_mode(Kata_mode),

        /*---Sampler---*/
        .sampler_mode(sampler_mode),
        .index(index),
        .sampler_in_ready(sampler_in_ready),
        .next_element(next_element),
        .sha_in_sel(sha_in_sel),
        .seed_in_sel(seed_in_sel),

        /*---NTT---*/
        .NTT_mode(NTT_mode),
	    .NTT_in_ready(NTT_in_ready),
        .NTT_index(NTT_index),
        .NTT_done(NTT_done),

        /*---PWM---*/
	    .PWM_start(PWM_start),
        .PWM_index(PWM_index),
        .PWM_done(PWM_done),

        /*---from outside---*/
        .data_in(data_in),
        .data_out(data_out),

        /*---test (Need to delete)---*/
        .padder_out(padder_out),
        .padder_out_ready(padder_out_ready),
        .f_out(f_out),
        .f_out_ready(f_out_ready),
        .sha_out(sha_out)
    );

endmodule

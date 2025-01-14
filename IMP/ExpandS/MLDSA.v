module MLDSA
    (   
    input               clk,
    input               reset,
    input               start,
    input   [1:0]       main_mode, // KeyGen, SignGen, SignVer
    // External signals
    input   [63:0]      data_in,
    output  [63:0]      data_out
    );  
    
    // Controller signals
    /*---Sha---*/
    wire                sha_in_ready;
    wire                sha_is_last;
    wire                sha_squeeze;
    wire                sha_mode;
    wire                sha_sha_hold;
    wire    [1:0]       sha_byte_num;
    wire                sha_out_ready;

    /*---Seed---*/
    wire                Rho_prime_en;
    wire                Rho_en;
    wire                Kata_en;


    // Instantiate Controller
    Controller controller_inst (
        .clk(clk),
        .reset(reset),
        .start(start),
        .main_mode(main_mode),
        .sha_in_ready(sha_in_ready),
        .sha_is_last(sha_is_last),
        .sha_squeeze(sha_squeeze),
        .sha_mode(sha_mode),
        .sha_sha_hold(sha_sha_hold),
        .sha_byte_num(sha_byte_num),
        .sha_out_ready(sha_out_ready),
        .Rho_prime_en(Rho_prime_en),
        .Rho_en(Rho_en),
        .Kata_en(Kata_en)
    );

    // Instantiate Data_Path
    Data_Path data_path_inst (
        .clk(clk),
        .reset(reset),
        .main_mode(main_mode),
        .sha_in_ready(sha_in_ready),
        .sha_is_last(sha_is_last),
        .sha_squeeze(sha_squeeze),
        .sha_mode(sha_mode),
        .sha_sha_hold(sha_sha_hold),
        .sha_byte_num(sha_byte_num),
        .sha_out_ready(sha_out_ready),
        .Rho_prime_en(Rho_prime_en),
        .Rho_en(Rho_en),
        .Kata_en(Kata_en),
        .data_in(data_in),
        .data_out(data_out)
    );

endmodule

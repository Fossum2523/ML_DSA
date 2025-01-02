`define din_choose(x) shake_in[(x + 1)*64 - 1 + 32 * 8: (x)*64 + 32 * 8] 
module ExpandS
    #(parameter DLEN = 64, HLEN=3)(   
    input                 clk,
    input                 reset,
    output                Rho_prime_wen,
    output reg  [HLEN-1:0]Rho_prime_waddr,
    output      [DLEN-1:0]Rho_prime_din,
    output reg  [HLEN-1:0]Rho_prime_raddr,
    input       [DLEN-1:0]Rho_prime_dout,
    //shake
    output   [DLEN-1:0] sample_out,
    output reg          sample_ready, 
    output              is_last,
    output              squeeze, // when squeeze = 0, output once; otherwise, keep squeezing
    output              sha_mode,
    output              sha_hold,
    output      [1:0]   byte_num,
    input    [1343:0]   shake_in,
    input               shake_in_ready
    );  

   localparam [3:0] IDLE    = 4'd0,
                    Rho_prime_Store    = 4'd1,
                    Rho_prime_Sample   = 4'd2,
                    S1      = 4'd3,
                    S2      = 4'd4,
                    S3      = 4'd5;

    reg [3:0]curr_state;
    reg [3:0]next_state;
    reg        [11:0] sample_addr;

    assign Rho_prime_wen =  curr_state == Rho_prime_Store ? 1'b1 : 1'b0;
    assign Rho_prime_din =  Rho_prime_waddr == 3'd0 ? din_choose(0) :
                            Rho_prime_waddr == 3'd1 ? din_choose(1) :
                            Rho_prime_waddr == 3'd2 ? din_choose(2) :
                            Rho_prime_waddr == 3'd3 ? din_choose(3) :
                            Rho_prime_waddr == 3'd4 ? din_choose(4) :
                            Rho_prime_waddr == 3'd5 ? din_choose(5) :
                            Rho_prime_waddr == 3'd6 ? din_choose(6) :
                            Rho_prime_waddr == 3'd7 ? din_choose(7) : 64'd0;

    // assign 
    // assign sample_out = 
    // CoeffFromThreeByte z0(  .in(),
    //                         .out());
    // CoeffFromThreeByte z1(  .in(),
    //                         .out());

    always @ (posedge clk)
        if (reset)
            Rho_prime_waddr <= 0;
        else if (curr_state == Rho_prime_Store)
            Rho_prime_waddr <= Rho_prime_waddr + 1'b1;

    always @ (posedge clk)
        if (reset)
            Rho_prime_raddr <= 0;
        else if (curr_state == Rho_prime_Sample)
            Rho_prime_raddr <= Rho_prime_raddr + 1'b1;

    always @ (posedge clk)
        if (reset)
            sample_ready <= 0;
        else if (curr_state == Rho_prime_Sample)
            sample_ready <= 1'b1;
        else 
            sample_ready <= 1'b0;

    always @ (posedge clk) begin
        if (reset)
            curr_state <= IDLE;
        else 
            curr_state <= next_state;
    end

    always @(*) begin
        case (curr_state)
            IDLE:begin
                if(shake_in_ready) 
                    next_state = Rho_prime_Store;
                else
                    next_state = IDLE;
            end 
            Rho_prime_Store:begin
                if(Rho_prime_waddr != 3'd7)
                    next_state = S1;
                else
                    next_state = Rho_prime_Store;
            end
            Rho_prime_Sample:begin
                if(sample_in_ready)
                    next_state = Rho_prime_Sample;
                else
                    next_state = Rho_prime_Store;
            end
            S1:begin
                if(sample_in_ready)
                    next_state = Rho_prime_Sample;
                else
                    next_state = Rho_prime_Store;
            end
            default: 
                next_state = IDLE;
        endcase
    end

endmodule
`undef din_choose

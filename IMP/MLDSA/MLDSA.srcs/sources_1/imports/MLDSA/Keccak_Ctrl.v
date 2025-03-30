module Keccak_Ctrl
    (   
    input               clk,
    input               reset,
    input               sha_en,
    input   [3:0]       sha_type,
    input   [2:0]       MLSDA_in_byte_num,
    input               next_element,
    output              sha_in_ready, 
    output  reg         sha_is_last,
    output              sha_squeeze, // when squeeze = 0, output once; otherwise, keep squeezing
    output              sha_mode,
    output              sha_hold,
    output  [2:0]       sha_byte_num,
    input               sha_out_ready,//交由主Controller控制，將sha_en拉掉
    output              sha_clean,
    output  reg [1:0]   keccak_in_sel,
    output  reg [1:0]   mem_sel_1,
    output  reg [1:0]   mem_sel_2,
    output  reg [1:0]   index_sel,
    output  reg         in_seed_sel
    );  

    //Keccak mode
    parameter           G = 1'b0,
                        H = 1'b1;


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


    reg     [3:0]   padder_cnt;//用來計數padder的次數，最後會送一筆last訊號
    reg     state;      
    reg     sha_in_ready_tmp;

    assign  sha_in_ready =  sha_in_ready_tmp & sha_en;             
    assign  sha_squeeze  =  1'b0;//交由其他module來送，可以不用
    assign  sha_mode     =  sha_type == 4'd1 ? G : H;
    assign  sha_hold     =  1'b0;
    assign  sha_clean    =  1'b0;                  
   

    assign  sha_byte_num = sha_type <= 4'd5  ? 3'b010 :
                           sha_type >= 4'd11 ? MLSDA_in_byte_num : 3'b000;

    
    always @(posedge clk) begin
        if(reset)
            padder_cnt <= 4'd0;
        else if(!sha_en)
            padder_cnt <= 4'd0;
        else if(sha_en && padder_cnt < 4'd15)
            padder_cnt <= padder_cnt + 1'b1;
    end

    always @(*) begin
        sha_in_ready_tmp = 1'b0;
        case (sha_type)
            Gen_Seed:begin
                if(padder_cnt <= 4)
                    sha_in_ready_tmp = 1'b1;
            end
            default: begin
                sha_in_ready_tmp = 1'b0;
            end
        endcase
    end   

    always @(*) begin
        keccak_in_sel   = 2'd0;
        mem_sel_1       = 2'd0;
        mem_sel_2       = 2'd0;
        index_sel       = 2'd0;
        in_seed_sel     = 1'd0;

        case (sha_type)
            Gen_Seed:begin
                keccak_in_sel = 2'd3;
                if(padder_cnt <= 3)
                    in_seed_sel = 1'd0;
                else
                    in_seed_sel = 1'd1;
            end
            default: begin
                keccak_in_sel   = 2'd0;
                mem_sel_1       = 2'd0;
                mem_sel_2       = 2'd0;
                index_sel       = 2'd0;
                in_seed_sel     = 1'd0;
            end
        endcase
    end     

    always @(*) begin
        sha_is_last = 1'b0;
        case (sha_type)
            Gen_Seed:begin
                if(padder_cnt == 4)
                    sha_is_last = 1'b1;
            end
            default: begin
                sha_is_last = 1'b0;
            end
        endcase
    end        

endmodule

module Keccak_Ctrl
    (   
    input               clk,
    input               reset,
    input   [63:0]      sha_in,
    input               sha_data_valid,
    input               sha_en,
    input   [3:0]       sha_type,
    input               next_element,
    input               MLDSA_i_last,
    output              sha_in_ready, 
    output  reg         sha_is_last,
    output              sha_squeeze, // when squeeze = 0, output once; otherwise, keep squeezing
    output              sha_mode,
    output              sha_hold,
    output  [2:0]       sha_byte_num,
    input               sha_out_ready,//交由主Controller控制，將sha_en拉掉
    output  reg         sha_clean,
    output  reg [1:0]   keccak_in_sel,
    output  reg [1:0]   kk_sub_sel_1,
    output  reg [1:0]   kk_sub_sel_2,
    output  reg [1:0]   kk_sub_sel_3,

    /*---AG---*/
    // output   reg        sha_AG_gen,
    input               AG_done
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

    wire            index_triger;
    reg     [7:0]   padder_cnt;//Used to count the number of padding operations, and a final last signal will be sent.
    reg     [7:0]   padder_cnt_last;

    reg     [2:0]   H_tr_M_1_byte_num;


    assign  sha_in_ready =  sha_en & (sha_data_valid | index_triger);             
    assign  sha_squeeze  =  1'b0;
    assign  sha_mode     =  sha_type == 4'd1 ? G : H;
    assign  sha_hold     =  1'b0;
    assign  index_triger =  padder_cnt == padder_cnt_last;
   

    assign  sha_byte_num =  sha_type == H_tr_M_1  ? H_tr_M_1_byte_num :
                            sha_type < 4'd5  ? 3'b010 :
                            sha_type >= 4'd11 ? 3'b000/*MLSDA_in_byte_num*/ : 3'b000;

    
    always @(posedge clk) begin
        if(reset)
            padder_cnt <= 8'd0;
        else if(sha_clean)
            padder_cnt <= 8'd0;
        else if(sha_en & (sha_data_valid | index_triger))
            padder_cnt <= padder_cnt + 1'b1;
    end

    always @(*) begin
        padder_cnt_last = 8'd0;
        case (sha_type)
            Gen_Seed:begin
                padder_cnt_last = 8'd4;
            end
            Gen_s1,
            Gen_s2:begin
                padder_cnt_last = 8'd8;
            end
            Gen_A:begin
                padder_cnt_last = 8'd4;
            end
            H_pk_1:begin
                padder_cnt_last = 8'd164; //p have 4 data and t1 have 160 data
            end
            H_pk_2:begin
                padder_cnt_last = 8'd164; //p have 4 data and t1 have 160 data
            end
            // H_tr_M_1:begin
            //     padder_cnt_last = 8'd164; //p have 4 data and t1 have 160 data
            // end
            H_K_rnd_u:begin
                padder_cnt_last = 8'd16; //p have 4 data and t1 have 160 data
            end
            Gen_y:begin
                padder_cnt_last = 8'd8; //y have 8 data 
            end
            H_u_w1:begin
                padder_cnt_last = 8'd104; //u have 8 data and w1 have 96 data
            end
            Gen_c_1:begin
                padder_cnt_last = 8'd4; //ctilde have 4 data
            end
        endcase
    end 

    always @(*) begin
        sha_clean = 1'b0;
        case (sha_type)
            Gen_Seed:begin
                if(AG_done)
                    sha_clean = 1'b1;
            end
            Gen_s1,
            Gen_s2,
            Gen_A:begin
                if(next_element)
                    sha_clean = 1'b1;
            end
            H_pk_1:begin
                if(AG_done)
                    sha_clean = 1'b1;
            end
            H_pk_2:begin
                if(AG_done)
                    sha_clean = 1'b1;
            end
            H_tr_M_1:begin
                if(AG_done)
                    sha_clean = 1'b1;
            end
            H_K_rnd_u:begin
                if(AG_done)
                    sha_clean = 1'b1;
            end
            Gen_y:begin
                if(next_element)
                    sha_clean = 1'b1;
            end
            H_u_w1:begin
                if(AG_done)
                    sha_clean = 1'b1;
            end
            Gen_c_1:begin
                if(next_element)
                    sha_clean = 1'b1;
            end
            default:sha_clean = 1'b0;
        endcase
    end 

    always @(*) begin
        keccak_in_sel = 2'd0;
        kk_sub_sel_1  = 2'd0;
        kk_sub_sel_2  = 2'd0;
        kk_sub_sel_3  = 2'd0;
        case (sha_type)
            Gen_Seed:begin
                if(padder_cnt <= 3)
                    keccak_in_sel = 2'd3;
                else
                    keccak_in_sel = 2'd1;
                    kk_sub_sel_2  = 2'd3;
            end
            Gen_s1:begin
                if(padder_cnt <= 7)begin
                    keccak_in_sel = 2'd0;
                    kk_sub_sel_1  = 2'd0;
                end
                else begin
                    keccak_in_sel = 2'd2;
                    kk_sub_sel_3  = 2'd1;
                end
            end
            Gen_s2:begin
                if(padder_cnt <= 7)begin
                    keccak_in_sel = 2'd0;
                    kk_sub_sel_1  = 2'd0;
                end
                else begin
                    keccak_in_sel = 2'd2;
                    kk_sub_sel_3  = 2'd2;
                end
            end
            Gen_A:begin
                if(padder_cnt <= 3)begin
                    keccak_in_sel = 2'd0;
                    kk_sub_sel_1  = 2'd0;
                end
                else begin
                    keccak_in_sel = 2'd2;
                    kk_sub_sel_3  = 2'd0;
                end
            end
            H_pk_1:begin
                if(padder_cnt <= 3)begin
                    keccak_in_sel = 2'd0;
                    kk_sub_sel_1  = 2'd0;
                end
                else if(padder_cnt <= 163)begin
                    keccak_in_sel = 2'd0;
                    kk_sub_sel_1  = 2'd3;
                end
                else begin
                    keccak_in_sel = 2'd1;
                    kk_sub_sel_2  = 2'd2;
                end
            end
            H_pk_2:begin
                if(padder_cnt <= 163)begin
                   keccak_in_sel = 2'd3;
                end
                else begin
                    keccak_in_sel = 2'd1;
                    kk_sub_sel_2  = 2'd2;
                end
            end
            H_tr_M_1:begin
                keccak_in_sel = 2'd3;
            end
            H_K_rnd_u:begin
                if(padder_cnt <= 7)begin
                    keccak_in_sel = 2'd3;
                end
                else if(padder_cnt <= 15) begin
                    keccak_in_sel = 2'd0;
                    kk_sub_sel_1  = 2'd1;
                end
                else begin
                    keccak_in_sel = 2'd1;
                    kk_sub_sel_2  = 2'd2;
                end
            end
            Gen_y:begin
                if(padder_cnt <= 7)begin
                    keccak_in_sel = 2'd0;
                    kk_sub_sel_1  = 1'd1;
                end
                else begin
                    keccak_in_sel = 2'd2;
                    kk_sub_sel_3  = 2'd3;
                end
            end
            H_u_w1:begin
                if(padder_cnt <= 7)begin
                    keccak_in_sel = 2'd0;
                    kk_sub_sel_1  = 2'd1;
                end
                else if(padder_cnt <= 103)begin
                    keccak_in_sel = 2'd0;
                    kk_sub_sel_1  = 2'd3;
                end
                else begin
                    keccak_in_sel = 2'd1;
                    kk_sub_sel_2  = 2'd2;
                end
            end
            Gen_c_1:begin
                if(padder_cnt <= 3)begin
                    keccak_in_sel = 2'd0;
                    kk_sub_sel_2  = 2'd0;
                end
                else begin
                    keccak_in_sel = 2'd1;
                    kk_sub_sel_2  = 2'd2;
                end
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
            Gen_s1,
            Gen_s2:begin
                if(padder_cnt == 8)
                    sha_is_last = 1'b1;
            end
            Gen_A:begin
                if(padder_cnt == 4)
                    sha_is_last = 1'b1;
            end
            H_pk_1:begin
                if(padder_cnt == 164)
                    sha_is_last = 1'b1;
            end
            H_pk_2:begin
                if(padder_cnt == 164)
                    sha_is_last = 1'b1;
            end
            H_tr_M_1:begin
                sha_is_last = MLDSA_i_last;
            end
            H_K_rnd_u:begin
                if(padder_cnt == 16)
                    sha_is_last = 1'b1;
            end 
            Gen_y:begin
                if(padder_cnt == 8)
                    sha_is_last = 1'b1;
            end
            H_u_w1:begin
                if(padder_cnt == 104)
                    sha_is_last = 1'b1;
            end
            Gen_c_1:begin
                if(padder_cnt == 4)
                    sha_is_last = 1'b1;
            end
        endcase
    end      

    always @(posedge clk) begin
        if(reset)
            H_tr_M_1_byte_num <= 3'b0;
        else if(sha_type == H_tr_M_1 & padder_cnt == 8)
            H_tr_M_1_byte_num <= 3'd5 + sha_in[15:8];
    end  
endmodule

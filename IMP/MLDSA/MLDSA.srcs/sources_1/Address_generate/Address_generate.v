module Address_generate
    (   
    input               clk,
    input               reset,

    input [8:0]         ctrl_sign,

    /*---Keack---*/
    input               sha_AG_gen,
    input               sha_out_ready,

    /*---Address genetate---*/
    output              addr_en,
    output [7:0]        addr_a,
    output [7:0]        addr_b,
    output              done
    );  

    reg [1:0]   addr_adder;
    reg [7:0]   last_addr;
    reg [7:0]   star_addr;
    reg         triger;
    reg         cnt_en;
    reg [7:0]   cnt;
    
    //main mode
    localparam  [1:0]   KeyGen  = 2'd0,
                        SignGen = 2'd1,
                        SignVer = 2'd2;

    assign  done    = cnt == last_addr ? 1'b1 : 1'b0; 
    assign  addr_en = cnt_en;
    assign  addr_a  = cnt;
    assign  addr_b  = cnt + 1'b1;
    

    always @(*) begin
        triger      = 0;
        addr_adder  = 2'd0;
        star_addr   = 8'd0;
        last_addr   = 8'd255;
        case (ctrl_sign)
            {KeyGen,6'd1}:begin         //seed gen with store seed
                addr_adder   = 2'd2;
                star_addr    = 8'd0;
                last_addr    = 8'd14;
                triger       = sha_out_ready;
            end
            {KeyGen,6'd2},              //s1 gen with input seed to keccak
            {KeyGen,6'd3}:begin         //s2 gen 
                addr_adder   = 2'd1;
                star_addr    = 8'd4;
                last_addr    = 8'd11;
                triger       = sha_AG_gen;
            end
            default:begin
                last_addr    = 8'd255;
                triger       = 1'b0;
            end
        endcase
    end

    always @(posedge clk) begin
        if(reset)
            cnt_en <= 1'b0;
        else if(done)
            cnt_en <= 1'b0;
        else if(triger)
            cnt_en <= 1'b1;
    end

    always @(posedge clk) begin
        if(reset)
            cnt <= 8'd0;
        else if(cnt_en)
            cnt <= cnt + addr_adder;
        else if(triger)
            cnt <= star_addr;
        else if(done)
            cnt <= 8'd0;
    end
endmodule
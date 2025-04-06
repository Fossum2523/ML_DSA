module Address_generate
    (   
    input               clk,
    input               reset,

    /*---Address genetate---*/
    input  [1:0]        addr_adder,
    input  [11:0]       last_addr,
    input  [11:0]       star_addr,
    input               triger,
    input               clean,
    output              addr_en,
    output [11:0]       addr_a,
    output [11:0]       addr_b,
    output reg          data_valid,
    output              done
    );  


    reg         cnt_en;
    reg [11:0]   cnt;
    reg         done_tmp;
    
    assign  done    = cnt == last_addr | done_tmp;
    assign  addr_en = cnt_en;
    assign  addr_a  = cnt;
    assign  addr_b  = cnt + 1'b1;

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
            data_valid <= 1'b0;
        else
            data_valid <= cnt_en;
    end

    always @(posedge clk) begin
        if(reset)
            cnt <= 12'd0;
        else if(cnt_en & ~done)
            cnt <= cnt + addr_adder;
        else if(triger)
            cnt <= star_addr;
    end

    always @(posedge clk) begin
        if(reset)
            done_tmp <= 1'b0;
        else if(clean)      
            done_tmp <= 1'b0;
        else if(cnt == last_addr)
            done_tmp <= 1'b1;
    end
endmodule
module CONTR#(
    parameter BIT_LEN = 23,
    parameter depth = 64
    )(
    input   clk,
    input   reset,
    input   mode,
    input   i_valid,
    output  [$clog2(128/(depth)) - 1:0]   zeta_addr                       
    );

    localparam  NTT_mode  = 1'b0,
                INTT_mode = 1'b1;

    reg     [depth - 1:0]                   triger_buf;
    reg     [$clog2(128/(depth)) - 1:0]     addr;

    assign zeta_addr = mode ? {($clog2(128/(depth))){1'b1}} - addr : addr;
    
    genvar i;
    generate
        for (i = 0; i < depth; i = i + 1) begin : triger_buf_
            always @(posedge clk) begin
                if (reset)begin
                    if (i == 0)
                        triger_buf[i] <= 1'b1;
                    else
                        triger_buf[i] <= 1'b0; 
                end
                else if(i_valid)begin
                    if (i == 0)
                        triger_buf[i] <= triger_buf[depth-1];
                    else
                        triger_buf[i] <= triger_buf[i-1]; 
                end
            end
        end
    endgenerate

    always @(posedge clk) begin
        if(reset)
            addr <= {($clog2(128/(depth))){1'b0}};
        else if(i_valid & triger_buf[depth-1])
            addr <= addr + 1'b1;
    end

endmodule
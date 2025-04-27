module RU#(
    parameter BIT_LEN = 23,
    parameter depth = 64
    )(
    input                           clk,
    input                           reset,
    input                           i_valid,
    input   [BIT_LEN - 1:0]         in_u,
    input   [BIT_LEN - 1:0]         in_d,
    output                          o_valid,
    output  reg                     zeta_trig,
    output  [BIT_LEN - 1:0]         out_u,
    output  [BIT_LEN - 1:0]         out_d
    );
    reg                             switch;
    reg     [depth - 1:0]           switch_buf;
    reg     [depth - 1:0]           valid_buf;

    reg     [BIT_LEN-1:0] shift_reg_u [depth-1:0];
    reg     [BIT_LEN-1:0] shift_reg_d [depth-1:0];

    assign o_valid  = valid_buf[depth-1];
    assign out_u    = shift_reg_u[depth-1];
    assign out_d    = switch ? in_u : shift_reg_d[depth-1];

    genvar i_u;
    generate
        for (i_u = 0; i_u < depth; i_u = i_u + 1) begin : shift_registers_u
            always @(posedge clk) begin
                if (reset)
                    shift_reg_u[i_u] <= 0;
                else if (i_u == 0)
                    shift_reg_u[i_u] <= switch ? shift_reg_d[depth-1] : in_u;
                else
                    shift_reg_u[i_u] <= shift_reg_u[i_u-1]; 
            end
        end
    endgenerate

    genvar i_d;
    generate
        for (i_d = 0; i_d < depth; i_d = i_d + 1) begin : shift_registers_d
            always @(posedge clk) begin
                if (reset)
                    shift_reg_d[i_d] <= 0;
                else if (i_d == 0)
                    shift_reg_d[i_d] <= in_d;
                else
                    shift_reg_d[i_d] <= shift_reg_d[i_d-1]; 

            end
        end
    endgenerate

    genvar i;
    generate
        for (i = 0; i < depth; i = i + 1) begin : valid_buf_
            always @(posedge clk) begin
                if (reset)begin
                    valid_buf[i] <= 1'b0; 
                end
                else begin
                    if (i == 0)
                        valid_buf[i] <= i_valid;
                    else
                        valid_buf[i] <= valid_buf[i-1]; 
                end
            end
        end
    endgenerate

    generate
        for (i = 0; i < depth; i = i + 1) begin : switch_buf_
            always @(posedge clk) begin
                if (reset)begin
                    if (i == 0)
                        switch_buf[i] <= 1'b1;
                    else
                        switch_buf[i] <= 1'b0; 
                end
                else if(i_valid)begin
                    if (i == 0)
                        switch_buf[i] <= switch_buf[depth-1];
                    else
                        switch_buf[i] <= switch_buf[i-1]; 
                end
            end
        end
    endgenerate

    always @(posedge clk) begin
        if (reset)
            switch <= 1'b0;
        else if(switch_buf[depth-1] && i_valid)
            switch <= ~switch;
    end  

    always @(posedge clk) begin
        if (reset)
            zeta_trig <= 1'b0;
        else if(depth == 1)
            zeta_trig <= i_valid;
        else
            zeta_trig <= switch_buf[depth-2] && i_valid;
    end  
endmodule
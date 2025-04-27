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

    wire    [BIT_LEN - 1:0]         MEM_u_in;   
    wire    [BIT_LEN - 1:0]         MEM_d_in;   
    wire    [BIT_LEN - 1:0]         MEM_u_out;   
    wire    [BIT_LEN - 1:0]         MEM_d_out;      

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

    always @(posedge clk) begin
        if (reset)
            valid_buf <= {depth{1'b0}};
        else
            valid_buf <= {valid_buf[depth-2:0],i_valid};
    end  

    always @(posedge clk) begin
        if (reset)
            switch_buf <= {{(depth-1){1'b0}},1'b1};
        else if(i_valid)
            switch_buf <= {switch_buf[depth-2:0],switch_buf[depth-1]};
    end  

    always @(posedge clk) begin
        if (reset)
            switch <= 1'b0;
        else if(switch_buf[depth-1] && i_valid)
            switch <= ~switch;
    end  

    always @(posedge clk) begin
        if (reset)
            zeta_trig <= 1'b0;
        else
            zeta_trig <= switch_buf[depth-1] && i_valid;
    end  

    
    
    // assign MEM_u_in = switch ? MEM_d_out : in_u;
    // assign MEM_d_in = in_d;

endmodule
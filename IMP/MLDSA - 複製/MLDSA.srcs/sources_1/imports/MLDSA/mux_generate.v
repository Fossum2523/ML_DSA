//提醒：sel 必須大於 param_n 的可能數量，以便能處理所有選項均不符合的情況，類似於未滿足條件時的 case default。
`define pos(i)        in[ (i + 1) * 8 - 1 : i * 8]
module mux_gen#(parameter  param_in = 1344, param_m = 8)
    (input  [param_in - 1 : 0]          in,
     input  [$clog2(param_in/param_m) - 1 : 0]   sel,
     output [param_m - 1 : 0]           out
    ); 
    
    localparam param_n = param_in/param_m;

    wire [param_m - 1 : 0] data_in [param_n - 1 : 0];
    wire [param_m - 1 : 0] data_tmp [param_n - 1 : 0];
    wire [param_m - 1 : 0] data_tmp2 [param_n - 1 : 0];

    genvar i;

    generate
      for (i = 0; i < param_n; i = i + 1) begin : data_mux_in
            assign data_in[i] = `pos(i);
        end
    endgenerate

    generate
        for (i = 0; i < param_n; i = i + 1) begin : data_mux
            if (i == 0) begin
                assign data_tmp2[0] = (sel == 0) ? data_in[0] : 'h0;
                assign data_tmp[0] = data_tmp2[0]; // 可省略
            end 
            else begin
                assign data_tmp2[i] = (sel == i) ? data_in[i] : 'h0;
                assign data_tmp[i] = data_tmp2[i] | data_tmp[i - 1];
            end
        end
    endgenerate

    assign out = data_tmp[param_n - 1];
endmodule
`undef pos
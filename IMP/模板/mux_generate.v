    //Mux 
    //提醒：sel 必須大於 param_n 的可能數量，以便能處理所有選項均不符合的情況，類似於未滿足條件時的 case default。
    localparam param_m = 8;
    localparam param_n = 136;
    
    wire [param_m - 1 : 0] data_in [param_n - 1 : 0];
    wire [param_m - 1 : 0] data_tmp [param_n - 1 : 0];
    wire [param_m - 1 : 0] data_tmp2 [param_n - 1 : 0];
    wire [param_m - 1 : 0] data_out;
    wire [param_n : 0] sel;

    genvar i;
    generate
        for (i = 0; i < param_n; i = i + 1) begin : data_mux
            if (i == 0) begin
                assign data_tmp2[0] = (sel == 0) ? data_in[0] : 'h0;
                assign data_tmp[0] = data_tmp2[0]; // 可省略
            end else begin
                assign data_tmp2[i] = (sel == i) ? data_in[i] : 'h0;
                assign data_tmp[i] = data_in[i] | data_tmp2[i - 1];
            end
        end
    endgenerate
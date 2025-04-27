// module CONTR#(
//     parameter BIT_LEN = 23,
//     parameter depth = 64
//     )(
//     input                               clk,
//     input                               reset,
//     input                               mode,
//     input                               en,
//     output  reg                         switch,
//     output  reg [(128/(depth*2)) - 1:0] zeta_cnt,
//     output  reg [$clog2(depth)-1:0]     MEM_cnt
//     );

//     localparam  NTT_mode  = 1'b0,
//                 INTT_mode = 1'b1;

//     wire                             MEM_clean;
//     wire                             zeta_clean;

//     assign MEM_clean = MEM_cnt == (depth-1);
//     assign zeta_clean = mode ? zeta_cnt == {(7 - ($clog2(depth))){1'b0}} : zeta_cnt == {(7 - ($clog2(depth))){1'b1}};

//     always @(posedge clk) begin
//         if(reset)
//             zeta_cnt <= {(7 - ($clog2(depth))){1'b1}}; //devise
//         else if(en) 
//             if(MEM_clean && zeta_clean)
//                 zeta_cnt = mode ? {(7 - ($clog2(depth))){1'b1}} : {(7 - ($clog2(depth))){1'b0}}; //devise
//             else if(MEM_clean)
//                 zeta_cnt = mode ? zeta_cnt - 1'b1 : zeta_cnt + 1'b1;
//     end

//     always @(posedge clk) begin
//         if(reset)
//             MEM_cnt <= {($clog2(depth)){1'b0}};
//         else if(en)
//             if(MEM_clean)
//                 MEM_cnt <= {($clog2(depth)){1'b0}};
//             else
//                 MEM_cnt <= MEM_cnt + 1'b1;
//     end

//     always @(posedge clk) begin
//         if(reset)
//             switch <= 1'b0;
//         else if(en)
//             if(MEM_clean)
//                 switch = ~switch;
//     end

// endmodule


module CONTR#(
    parameter BIT_LEN = 23,
    parameter depth = 64
    )(
    input   clk,
    input   reset,
    input   mode,
    input   i_valid,
    input   zeta_trig,
    output  [$clog2(256/(depth)) - 1:0]   zeta_addr                       
    );

    localparam  NTT_mode  = 1'b0,
                INTT_mode = 1'b1;

    reg     [depth - 1:0]                   triger_buf;
    reg     [$clog2(256/(depth)) - 1:0]     addr;

    assign zeta_addr = mode ? {($clog2(256/(depth))){1'b1}} - addr : addr;
    
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
            addr <= {($clog2(256/(depth))){1'b0}};
        else if(i_valid & triger_buf[depth-1])
            addr <= addr + 1'b1;
    end

endmodule
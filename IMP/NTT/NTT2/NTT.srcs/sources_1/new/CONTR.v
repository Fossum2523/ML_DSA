module CONTR#(
    parameter BIT_LEN = 23,
    parameter depth = 64
    )(
    input                               clk,
    input                               reset,
    input                               mode,
    input                               en,
    output  reg                         switch,
    output  reg [(128/(depth*2)) - 1:0] zeta_cnt,
    output  reg [$clog2(depth)-1:0]     MEM_cnt
    );

    localparam  NTT_mode  = 1'b0,
                INTT_mode = 1'b1;

    wire                             MEM_clean;
    wire                             zeta_clean;

    assign MEM_clean = MEM_cnt == (depth-1);
    assign zeta_clean = mode ? zeta_cnt == {(7 - ($clog2(depth))){1'b0}} : zeta_cnt == {(7 - ($clog2(depth))){1'b1}};

    always @(posedge clk or negedge reset) begin
        if(!reset)
            zeta_cnt <= {(7 - ($clog2(depth))){1'b1}}; //devise
        else if(en) 
            if(MEM_clean && zeta_clean)
                zeta_cnt = mode ? {(7 - ($clog2(depth))){1'b1}} : {(7 - ($clog2(depth))){1'b0}}; //devise
            else if(MEM_clean)
                zeta_cnt = mode ? zeta_cnt - 1'b1 : zeta_cnt + 1'b1;
    end

    always @(posedge clk or negedge reset) begin
        if(!reset)
            MEM_cnt <= {($clog2(depth)){1'b0}};
        else if(en)
            if(MEM_clean)
                MEM_cnt <= {($clog2(depth)){1'b0}};
            else
                MEM_cnt <= MEM_cnt + 1'b1;
    end

    always @(posedge clk or negedge reset) begin
        if(!reset)
            switch <= 1'b0;
        else if(en)
            if(MEM_clean)
                switch = ~switch;
    end

endmodule
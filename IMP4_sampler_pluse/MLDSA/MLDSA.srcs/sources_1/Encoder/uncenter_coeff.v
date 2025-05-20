module uncenter_coeff(
    input [2:0] mode,
    input [22:0] di,
    output reg [22:0] dout
    );
    
    localparam
        Q = 23'd8380417;
        
    localparam
        M_NONE   = 3'd0,
        M_ETA    = 3'd1,
        M_T0     = 3'd2,
        M_T1     = 3'd3,
        M_GAMMA1 = 3'd4;
        
    reg signed [23:0] t0, t1;
    
    reg [3:0] ETA;
    reg [12:0] T;
    reg [19:0] GAMMA1;

    always @(*) begin
        ETA     =  2;
        T       = (1 << 13-1);
        GAMMA1  = (1 << 17);
        t1      = (di + T - 1) >> 13;
        t0      = di - (t1 << 13);
    end

    always @(*) begin
        dout = 23'd0;
        case(mode)
            M_NONE  :   dout = di;
            M_ETA   :   dout = (di > ETA)    ? ETA + Q - di    : ETA - di;
            M_T0    :   dout = T - t0;
            M_T1    :   dout = t1;
            M_GAMMA1:   dout = (di > GAMMA1) ? GAMMA1 + Q - di : GAMMA1 - di;
            default :   dout = 23'd0;
        endcase
    end
    
endmodule

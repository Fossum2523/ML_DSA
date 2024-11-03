module BT_unit 
#(  parameter bit_len = 23)
(
    input   [bit_len-1:0]A_in,
    input   [bit_len-1:0]B_in,
    input   [bit_len-1:0]zeta,
    output  [bit_len-1:0]A_out,
    output  [bit_len-1:0]B_out,
    output  valid
);

always @(*) begin
        BT_out <= 23'd0;
        valid <= 23'd0;
    else
end

always
endmodule
    module BT
#(
    parameter BIT_LEN = 13,
    parameter q = 7681
)(
    input clk,
    input reset,
    input [BIT_LEN - 1:0] in0,  //Individual input points, each 8 bits wide
    input [BIT_LEN - 1:0] in1,
    input [BIT_LEN - 1:0] phi,
    output reg [BIT_LEN - 1:0] out0,  //Individual output points, each 8 bits wide
    output reg [BIT_LEN - 1:0] out1
);
    

    // Function for modular addition
    function [BIT_LEN - 1:0] mod_add;
        input [BIT_LEN - 1:0] a, b;
        begin
            mod_add = (a + b) % q;
        end
    endfunction

    // Function for modular subtraction
    function [BIT_LEN - 1:0] mod_sub;
        input [BIT_LEN - 1:0] a, b;
        begin
            mod_sub = (a >= b) ? (a - b) : (q + a - b);
        end
    endfunction

    // Function for modular multiplication
    function [BIT_LEN - 1:0] mod_mul;
        input [BIT_LEN - 1:0] a, b;
        begin
            mod_mul = (a * b) % q;
        end
    endfunction

    // Butterfly operation
    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            out0 <= 0;
            out1 <= 0;
        end else begin
            out0 <= mod_add(in0, mod_mul(in1, phi));
            out1 <= mod_sub(in0, mod_mul(in1, phi));
        end
    end
endmodule
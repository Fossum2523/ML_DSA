module BU
#(
    parameter BIT_LEN = 23,
    parameter q = 8380417
)(
    input [BIT_LEN - 1:0] in0,  //Individual input points, each 8 bits wide
    input [BIT_LEN - 1:0] in1,
    input [BIT_LEN - 1:0] phi,
    output [BIT_LEN - 1:0] out0,  //Individual output points, each 8 bits wide
    output [BIT_LEN - 1:0] out1
);
    wire [BIT_LEN - 1:0] mm_out;

    mod_mul mm(in1, phi, mm_out);
    mod_add ma(in0, mm_out, out0);
    mod_sub ms(in0, mm_out, out1);
endmodule
// #(
//     parameter BIT_LEN = 23,
//     parameter q = 8380417
// )(
//     input clk,
//     input reset,
//     input [BIT_LEN - 1:0] in0,  //Individual input points, each 8 bits wide
//     input [BIT_LEN - 1:0] in1,
//     input [BIT_LEN - 1:0] phi,
//     output [BIT_LEN - 1:0] out0,  //Individual output points, each 8 bits wide
//     output [BIT_LEN - 1:0] out1
// );
    

//     // Function for modular addition
//     function [BIT_LEN - 1:0] mod_add;
//         input [BIT_LEN - 1:0] a, b;
//         begin
//             mod_add = (a + b) % q;
//         end
//     endfunction

//     // Function for modular subtraction
//     function [BIT_LEN - 1:0] mod_sub;
//         input [BIT_LEN - 1:0] a, b;
//         begin
//             mod_sub = (a >= b) ? (a - b) : (q + a - b);
//         end
//     endfunction

//     // Function for modular multiplication
//     function [BIT_LEN*2 - 1:0] mod_mul;
//         input [BIT_LEN - 1:0] a, b;
//         begin
//             mod_mul = (a * b) % q;
//         end
//     endfunction

//     // Butterfly operation
//     assign out0 = mod_add(in0, mod_mul(in1, phi));
//     assign out1 = mod_sub(in0, mod_mul(in1, phi));
// endmodule
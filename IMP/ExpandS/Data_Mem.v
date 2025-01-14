module Data_Mem(
    input clk,
    input reset,

    /*---Rho---*/
    input Rho_en,
    input  [255:0]Rho_din,
    output reg [255:0]Rho_dout,

    /*---Rho_prime---*/
    input Rho_prime_en,
    input [511:0]Rho_prime_din,
    output reg [511:0]Rho_prime_dout,

    /*---Kata---*/
    input Kata_en,
    input [255:0]Kata_din,
    output reg [255:0]Kata_dout
    );


always @(posedge clk) begin
    if(reset)
        Rho_dout <= 256'd0;
    else if(Rho_en)
        Rho_dout <= Rho_din;
end

always @(posedge clk) begin
    if(reset)
        Rho_prime_dout <= 256'd0;
    else if(Rho_en)
        Rho_prime_dout <= Rho_prime_din;
end

always @(posedge clk) begin
    if(reset)
        Kata_dout <= 256'd0;
    else if(Kata_en)
        Kata_dout <= Kata_din;
end




endmodule

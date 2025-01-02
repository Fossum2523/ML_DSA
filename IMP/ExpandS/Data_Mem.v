module Data_Mem(
    input clk,
    input reset,

    input  Rho_prime_wen,
    input  Rho_prime_waddr,
    input  Rho_prime_din,
    input  Rho_prime_raddr,
    output Rho_prime_dout
    );

// wire Rho_prime_wen;
// wire Rho_prime_waddr;
// wire Rho_prime_din;
// wire Rho_prime_raddr;
// wire Rho_prime_dout;

BRAM #(.DLEN(64), .HLEN(3)) Mem_Rho_prime(.clk(clk),
                                          .wen(Rho_prime_wen),
                                          .waddr(Rho_prime_waddr),
                                          .din(Rho_prime_din),
                                          .raddr(Rho_prime_raddr),
                                          .dout(Rho_prime_dout));

BRAM #(.DLEN(64), .HLEN(3)) Mem_Rho_prime(.clk(clk),
                                          .wen(Rho_prime_wen),
                                          .waddr(Rho_prime_waddr),
                                          .din(Rho_prime_din),
                                          .raddr(Rho_prime_raddr),
                                          .dout(Rho_prime_dout));


endmodule

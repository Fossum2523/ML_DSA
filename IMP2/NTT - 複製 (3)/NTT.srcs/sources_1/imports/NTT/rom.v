module rom #(
    parameter WIDTH = 23,
    parameter LENGTH = 256, 
    parameter INIT_FILE = "../imports/MEM_zeta/MEM_zeta_0.txt"
    )(
    input clk,
    input en,
    input [$clog2(LENGTH)-1:0] addr,
    output [WIDTH-1:0] do
    );

    (* rom_style = "distributed" *) reg[WIDTH-1:0] ram [LENGTH-1:0];
    
    assign do = ram[addr];
    
    integer i;
    initial begin
        if (INIT_FILE != "") begin
            $readmemh(INIT_FILE, ram);
        end else begin
            for (i = 0; i < LENGTH; i = i + 1)
                ram[i] = 0;
        end
    end
    
endmodule
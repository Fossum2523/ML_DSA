module PWM
#(
    parameter BIT_LEN = 23
)(  
    input                   clk,
    input                   reset,
    input   [1:0]           mode,
    input                   i_valid,
    output                  i_ready,
    input                   o_ready,
    output                  o_valid,
    output                  done,

    //---Path 1
    input   [BIT_LEN - 1:0] in_a0,
    input   [BIT_LEN - 1:0] in_a1,
    input   [BIT_LEN - 1:0] in_a2,
    output  [BIT_LEN - 1:0] out_a,
    output  [7:0]           addr_a,
    //---Path 2
    input   [BIT_LEN - 1:0] in_b0,
    input   [BIT_LEN - 1:0] in_b1,
    input   [BIT_LEN - 1:0] in_b2,
    output  [BIT_LEN - 1:0] out_b,
    output  [7:0]           addr_b 
);
    localparam DELAY_CYCLES  = 5;       // delay cycle num，set 5 Cycle

    //PWM mode
    localparam [1:0]    MATRIX_VECTOR = 2'd0, /*path 1(in_a0, in_a1, in_a2)*/ /*path 2(in_b0, in_b1, in_b2)*/
                        SCALAR_VECTOR = 2'd1, /*path 1(in_a0, in_a1)*/        /*path 2(in_b0, in_b1)*/     
                        ADD_VECTOR    = 2'd2; /*path 1(in_a1, in_a2)*/        /*path 2(in_b1, in_b2)*/
    
    reg [DELAY_CYCLES - 1:0 ]   valid_buf;
    reg [7:0]                   cnt_i;
    reg [7:0]                   cnt_o;

    reg  [BIT_LEN * 2 - 1:0] mul_a;
    reg  [BIT_LEN * 2 - 1:0] mul_b;

    wire [BIT_LEN - 1:0] mod_mul_a;
    wire [BIT_LEN - 1:0] mod_mul_b;
    
    wire [BIT_LEN - 1:0] mod_in_a;
    wire [BIT_LEN - 1:0] mod_in_b;

    wire [BIT_LEN - 1:0] w_a;
    wire [BIT_LEN - 1:0] w_b;
    
    assign i_ready  = cnt_i < 256;
    assign o_valid  = mode[1] ? i_valid : valid_buf[DELAY_CYCLES - 1];

    always @(posedge clk or posedge reset) begin
        if(reset)
            mul_a <= 46'd0;
        else
            mul_a <= in_a0 * in_a1;
    end

    always @(posedge clk or posedge reset) begin
        if(reset)
            mul_b <= 46'd0;
        else
            mul_b <= in_b0 * in_b1;
    end

    Modular_Reduction MR0(.clk(clk),.reset(reset),.in(mul_a),.out(mod_mul_a));
    Modular_Reduction MR1(.clk(clk),.reset(reset),.in(mul_b),.out(mod_mul_b));

    assign mod_in_a = mode[1] ? in_a1 : mod_mul_a;
    assign mod_in_b = mode[1] ? in_b1 : mod_mul_b;

    mod_add mod_add0(mod_in_a,in_a2,w_a);
    mod_add mod_add1(mod_in_b,in_b2,w_b);

    assign out_a = mode[0]  ? /*SCALAR_VECTOR*/             mod_mul_a:
                              /*MATRIX_VECTOR & ADD_VECTOR*/w_a;
    assign out_b = mode[0]  ? /*SCALAR_VECTOR*/             mod_mul_b:
                              /*MATRIX_VECTOR & ADD_VECTOR*/w_b ;

    always @(posedge clk or posedge reset) begin
        if (reset)
            valid_buf <= {DELAY_CYCLES{1'b0}};
        else 
            valid_buf <= {valid_buf[DELAY_CYCLES-2:0],i_valid};
    end  

    always @(posedge clk or posedge reset) begin
        if(reset)
            cnt_i <= 9'd0;
        else if(done)
            cnt_i <= 9'd0;
        else if(i_valid)
            cnt_i <= cnt_i + 1'b1;
    end 

    always @(posedge clk or posedge reset) begin
        if(reset)
            cnt_o <= 9'd0;
        else if(done)
            cnt_o <= 9'd0;
        else if(o_valid)
            cnt_o <= cnt_o + 1'b1;
    end
endmodule
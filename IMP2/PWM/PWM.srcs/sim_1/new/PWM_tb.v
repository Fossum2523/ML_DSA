`timescale 1ns / 1ps

module PWM_tb;

    parameter BIT_LEN = 23;
    parameter CLK_PERIOD = 20; // Clock cycle time in ns (e.g., 10ns for 100MHz)

    reg clk, reset;
    reg [1:0] mode;
    reg i_valid;
    wire i_ready;
    reg o_ready;
    wire o_valid;
    wire done;

    reg [BIT_LEN-1:0] in_a0, in_a1, in_a2;
    reg [BIT_LEN-1:0] in_b0, in_b1, in_b2;
    wire [BIT_LEN-1:0] out_a, out_b;
    wire [9:0] addr_a, addr_b;

    reg [BIT_LEN-1:0] A_hat [0:4095];
    reg [BIT_LEN-1:0] s1_hat [0:1023];

    reg [BIT_LEN-1:0] PWM_temp_0 [0:1023];
    reg [BIT_LEN-1:0] PWM_temp_1 [0:1023];

    integer i;
    integer j;

    // Instantiate DUT
    PWM #(BIT_LEN) uut (
        .clk(clk),
        .reset(reset),
        .mode(mode),
        .i_valid(i_valid),
        .i_ready(i_ready),
        .o_ready(o_ready),
        .o_valid(o_valid),
        .done(done),
        .in_a0(in_a0), .in_a1(in_a1), .in_a2(in_a2),
        .out_a(out_a), .addr_a(addr_a),
        .in_b0(in_b0), .in_b1(in_b1), .in_b2(in_b2),
        .out_b(out_b), .addr_b(addr_b)
    );

    initial begin
        $readmemh("../../../../A_hat_data.txt", A_hat);
    end

    initial begin
        $readmemh("../../../../s1_hat_data.txt", s1_hat);
    end

    // Clock generation
    initial begin
        clk = 0;
        forever #(CLK_PERIOD / 2) clk = ~clk;
    end

    // Stimulus
    initial begin
        for(i=0;i<1024;i=i+1)begin
            PWM_temp_0[i] = 0;
            PWM_temp_1[i] = 0;
        end
        reset = 1; i_valid = 0; o_ready = 1;
        in_a0 = 0; in_a1 = 0; in_a2 = 0;
        in_b0 = 0; in_b1 = 0; in_b2 = 0;
        mode = 2'b00;

        #(2 * CLK_PERIOD); 
        reset = 0;

        // Test MATRIX_VECTOR
        mode = 2'b00;
        i=0;
        j=0;
        while(!done)begin
            if(i_ready & i<1024) begin
                i_valid = 1;
                /*---a---*/
                in_a0 = s1_hat[(i%256)];
                in_a1 = A_hat[i%256+j*1024];
                in_a2 = PWM_temp_0[i];
                /*---b---*/
                in_b0 = s1_hat[(i%256)+1];
                in_b1 = A_hat[i%256+j*1024+1];
                in_b2 = PWM_temp_0[i+1];
            end
            else
                i_valid = 0;

            if(o_ready) begin
                PWM_temp_1[addr_a] = out_a;
                PWM_temp_1[addr_b] = out_b;
            end
            
            i=i+2;
            if((i%256)==0)
                j = j + 1;
            #(CLK_PERIOD); 
        end
        #(3 * CLK_PERIOD); 

        i=0;
        j=0;
        while(!done)begin
            if(i_ready & i<1024) begin
                i_valid = 1;
                /*---a---*/
                in_a0 = s1_hat[(i%256)];
                in_a1 = A_hat[i%256+j*1024];
                in_a2 = PWM_temp_0[i];
                /*---b---*/
                in_b0 = s1_hat[(i%256)+1];
                in_b1 = A_hat[i%256+j*1024+1];
                in_b2 = PWM_temp_0[i+1];
            end
            else
                i_valid = 0;

            if(o_ready) begin
                PWM_temp_1[addr_a] = out_a;
                PWM_temp_1[addr_b] = out_b;
            end
            
            i=i+2;
            if((i%256)==0)
                j = j + 1;
            #(CLK_PERIOD); 
        end
        #(3 * CLK_PERIOD); 
        
    


        // // Test SCALAR_VECTOR
        // mode = 2'b01;
        // in_a0 = 23'd7; in_a1 = 23'd8;
        // in_b0 = 23'd9; in_b1 = 23'd10;
        // i_valid = 1;
        // #10 i_valid = 0;
        // #60;

        // // Test ADD_VECTOR
        // mode = 2'b10;
        // in_a1 = 23'd11; in_a2 = 23'd12;
        // in_b1 = 23'd13; in_b2 = 23'd14;
        // i_valid = 1;
        // #10 i_valid = 0;
        // #60;


        $finish;
    end

endmodule
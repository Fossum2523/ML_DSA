module Decomposer #(parameter Q = 8380417, parameter GAMMA2 = 95232) (
    input  wire [22:0] r_in_a,
    input  wire [22:0] r_in_b,
    output reg  [5:0]  r1_out_a,
    output reg  signed [17:0] r0_out_a,
    output reg  [5:0]  r1_out_b,
    output reg  signed [17:0] r0_out_b
);

    localparam signed ALPHA = 2 * GAMMA2;
    localparam N = 24; // Shift amount
    localparam MAGIC = (1<<N) / ALPHA; // 2^24 / 190464 ≈ 87

    // Internal wires for channel A
    wire [22:0] r_plus_a;
    wire signed [22:0] r_plus_a_mod_2ALPHA;
    wire signed [17:0] r0_tmp_a;
    wire [22:0] temp_sub_a;
    wire is_special_case_a;
    wire [31:0] mult_a; // needs enough bits for multiplication
    wire [5:0] pre_r1_a;
    wire [31:0] back_calc_a;

    // Internal wires for channel B
    wire [22:0] r_plus_b;
    wire signed [22:0] r_plus_b_mod_2ALPHA;
    wire signed [17:0] r0_tmp_b;
    wire [22:0] temp_sub_b;
    wire is_special_case_b;
    wire [31:0] mult_b;
    wire [5:0] pre_r1_b;
    wire [31:0] back_calc_b;

    // Channel A computation
    assign r_plus_a = (r_in_a >= Q) ? (r_in_a - Q) : r_in_a;
    assign r_plus_a_mod_2ALPHA = r_plus_a % ALPHA;
    assign r0_tmp_a = (r_plus_a_mod_2ALPHA > GAMMA2) ? 
                      (r_plus_a_mod_2ALPHA) - ALPHA : 
                      (r_plus_a_mod_2ALPHA);
    assign temp_sub_a = $signed(r_plus_a) - r0_tmp_a;
    assign is_special_case_a = (temp_sub_a == (Q - 1));
    assign mult_a = temp_sub_a * MAGIC;
    assign pre_r1_a = mult_a >> N;
    assign back_calc_a = pre_r1_a * ALPHA;

    // Channel B computation
    assign r_plus_b = (r_in_b >= Q) ? (r_in_b - Q) : r_in_b;
    assign r_plus_b_mod_2ALPHA = r_plus_b % ALPHA;
    assign r0_tmp_b = (r_plus_b_mod_2ALPHA > GAMMA2) ? 
                      (r_plus_b_mod_2ALPHA) - ALPHA : 
                      (r_plus_b_mod_2ALPHA);
    assign temp_sub_b = $signed(r_plus_b) - r0_tmp_b;
    assign is_special_case_b = (temp_sub_b == (Q - 1));
    assign mult_b = temp_sub_b * MAGIC;
    assign pre_r1_b = mult_b >> N;
    assign back_calc_b = pre_r1_b * ALPHA;

    // Output assignment (pure combinational)
    always @(*) begin
        // Channel A
        if (is_special_case_a) begin
            r1_out_a = 6'd0;
            r0_out_a = r0_tmp_a - 1;
        end else begin
            if (temp_sub_a - back_calc_a >= ALPHA) begin
                r1_out_a = pre_r1_a + 1;
            end else begin
                r1_out_a = pre_r1_a;
            end
            r0_out_a = r0_tmp_a;
        end

        // Channel B
        if (is_special_case_b) begin
            r1_out_b = 6'd0;
            r0_out_b = r0_tmp_b - 1;
        end else begin
            if (temp_sub_b - back_calc_b >= ALPHA) begin
                r1_out_b = pre_r1_b + 1;
            end else begin
                r1_out_b = pre_r1_b;
            end
            r0_out_b = r0_tmp_b;
        end
    end

endmodule


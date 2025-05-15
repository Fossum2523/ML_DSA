module AXIS_MLDSA_Wrapper (
    input               clk,
    input               resetn,

    // AXIS Slave A
    input       [63:0]  s_axis_a_tdata,
    input               s_axis_a_tvalid,
    input               s_axis_a_tlast,
    output              s_axis_a_tready,

    // AXIS Slave B
    input       [63:0]  s_axis_b_tdata,
    input               s_axis_b_tvalid,
    input               s_axis_b_tlast,
    output              s_axis_b_tready,

    // AXIS Master Output
    output      [63:0]  m_axis_tdata,
    output              m_axis_tvalid,
    output              m_axis_tlast,
    input               m_axis_tready,

    // MLDSA interface
    output      [63:0]  MLDSA_data_in_A,
    output              MLDSA_i_valid_A,
    output              MLDSA_i_last_A,
    input               MLDSA_i_ready_A,

    output      [63:0]  MLDSA_data_in_B,
    output              MLDSA_i_valid_B,
    output              MLDSA_i_last_B,
    input               MLDSA_i_ready_B,

    input       [63:0]  MLDSA_data_out,
    input               MLDSA_o_valid,
    input               MLDSA_o_last,
    output              MLDSA_o_ready
);

    // AXIS A to MLDSA
    assign MLDSA_data_in_A  = s_axis_a_tdata;
    assign MLDSA_i_valid_A  = s_axis_a_tvalid;
    assign MLDSA_i_last_A   = s_axis_a_tlast;
    assign s_axis_a_tready  = MLDSA_i_ready_A;

    // AXIS B to MLDSA
    assign MLDSA_data_in_B  = s_axis_b_tdata;
    assign MLDSA_i_valid_B  = s_axis_b_tvalid;
    assign MLDSA_i_last_B   = s_axis_b_tlast;
    assign s_axis_b_tready  = MLDSA_i_ready_B;

    // MLDSA to AXIS output
    assign m_axis_tdata     = MLDSA_data_out;
    assign m_axis_tvalid    = MLDSA_o_valid;
    assign m_axis_tlast     = MLDSA_o_last;
    assign MLDSA_o_ready    = m_axis_tready;

endmodule
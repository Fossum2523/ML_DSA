module AXI4_Lite_Slave (
    input wire          clk,
    input wire          resetn,

    // AXI write address channel
    input  wire [31:0]  AWADDR,
    input  wire         AWVALID,
    output wire         AWREADY,

    // AXI write data channel
    input  wire [31:0]  WDATA,
    input  wire [3:0]   WSTRB,
    input  wire         WVALID,
    output wire         WREADY,

    // AXI write response channel
    output wire  [1:0]  BRESP,
    output wire         BVALID,
    input  wire         BREADY,

    // AXI read address channel
    input  wire [31:0]  ARADDR,
    input  wire         ARVALID,
    output wire         ARREADY,

    // AXI read data channel
    output wire [31:0]  RDATA,
    output wire [1:0]   RRESP,
    output wire         RVALID,
    input  wire         RREADY,

    // Output signals to MLDSA
    output reg [1:0]    main_mode,
    output wire         start_pulse,
    input               done
);

    //AXI4_Lite FSM
    localparam  [2:0]   IDLE            = 3'd0,
                        MODE_CHOOSE     = 3'd1,
                        WRESP__CHANNEL  = 3'd2,
                        START_MLDSA     = 3'd3,
                        WORK_MLDSA      = 3'd4,
                        OVER_MLDSA      = 3'd5;

    wire        write_addr;
    wire        write_data;
    reg [2:0]   curr_state;
    reg [2:0]   next_state;

    always @(posedge clk or negedge resetn) begin
        if(!resetn)
            curr_state <= IDLE;
        else
            curr_state <= next_state;
    end

    always @(*) begin
        next_state = IDLE;
        case (curr_state)
            IDLE:begin
                if (AWVALID) begin
                    next_state = MODE_CHOOSE;
                end
            end
            MODE_CHOOSE:begin
                if (write_addr && write_data)
                    next_state = WRESP__CHANNEL; 
            end
            WRESP__CHANNEL:begin
                if (BVALID && BREADY) 
                    next_state = START_MLDSA;
            end
            START_MLDSA:begin
                next_state = WORK_MLDSA;
            end
            WORK_MLDSA:begin
                if(done)
                    next_state = OVER_MLDSA;
            end
            OVER_MLDSA:begin
                next_state = IDLE;
            end
            default: next_state = IDLE;
        endcase
    end

    always @(posedge clk or negedge resetn) begin
        if(!resetn)
            main_mode <= 2'd0;
        else if(curr_state == MODE_CHOOSE)
            if(WVALID && WREADY)
                main_mode <= WDATA[1:0];
    end

    // AXI write address channel (AW)
    assign AWREADY = (curr_state == MODE_CHOOSE) ? 1'b1 : 1'b0;

    // AXI write data channel (W)
    assign WREADY = (curr_state == MODE_CHOOSE) ? 1'b1 : 1'b0;
    assign write_addr = AWVALID && AWREADY;
    assign write_data = WREADY && WVALID;

    // AXI write response channel (B)
    assign BVALID = (curr_state == WRESP__CHANNEL) ? 1'b1 : 1'b0;
    assign BRESP  = (curr_state == WRESP__CHANNEL )? 2'd0 : 2'd0;

    // AXI read address channel (AR)
    assign ARREADY = 1'b1;

    // AXI read data channel (R)
    assign RVALID = 1'b1;
    assign RDATA  = {27'd0,main_mode,curr_state};
    assign RRESP  = 2'b00;

    //MLDSA
    assign start_pulse = (curr_state == START_MLDSA) ? 1'b1 : 1'b0;
endmodule
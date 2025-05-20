`timescale 1ns / 1ps

`define ACLK 4.8
`define CYCLE 4.8
`define PAT "../axi/ex224_A3.txt"
`define ANS "../axi/ans_256.txt"
`define SDFFILE "./sha_syn.sdf"
`define ENDCYCLE 1000000

module axi_ip_sha_tb;
	reg [31:0] mem [0:255];
	reg [31:0] answer [0:31];
	// Inputs
	reg 		ACLK;
	reg 		ARESETn;
	reg 		AWID;
	reg [31:0] 	AWADDR;
	reg [7:0] 	AWLEN;
	reg [2:0] 	AWSIZE;
	reg [1:0] 	AWBURST;
	reg 		AWVALID;
	reg 		WID;
	reg [31:0] 	WDATA;//------------
	reg [3:0] 	WSTRB;
	reg 		WLAST;
	reg 		WVALID;
	reg 		BREADY;
	reg 		ARID;
	reg [31:0] 	ARADDR;
	reg [7:0] 	ARLEN;
	reg [2:0] 	ARSIZE;
	reg [1:0] 	ARBURST;
	reg 		ARVALID;
	reg 		RREADY;
	reg 		clk;
	reg 		reset_n;

	// Outputs
	wire AWREADY;
	wire WREADY;
	wire BID;
	wire [1:0] BRESP;
	wire BVALID;
	wire ARREADY;
	wire RID;
	wire [31:0] RDATA;
	wire [1:0] RRESP;
	wire RLAST;
	wire RVALID;
	////////////////////
//	wire [31:0] WRDATA , data_out;
//	reg [31:0] data_in;
	//reg en_inout;
	////////////////////
	/*assign WRDATA = ( WVALID == 1'b1 )? WDATA : 32'd20;
 	assign data_out = ( WVALID == 1'b0)? WRDATA : 32'bz;*/
	// Instantiate the Unit Under Test (UUT)
	axi_ip uut (
		.ACLK(ACLK), 
		.ARESETn(ARESETn), 
		.AWID(AWID), 
		.AWADDR(AWADDR), 
		.AWLEN(AWLEN), 
		.AWSIZE(AWSIZE), 
		.AWBURST(AWBURST), 
		.AWVALID(AWVALID), 
		.AWREADY(AWREADY),//out 
		.WID(WID), 
		.WDATA(WDATA), 
		.WSTRB(WSTRB), 
		.WLAST(WLAST), 
		.WVALID(WVALID), 
		.WREADY(WREADY), //out 
		.BREADY(BREADY), 
		.BID(BID), //out 
		.BRESP(BRESP), //out 
		.BVALID(BVALID), //out 
		.ARID(ARID), 
		.ARADDR(ARADDR), 
		.ARLEN(ARLEN), 
		.ARSIZE(ARSIZE), 
		.ARBURST(ARBURST), 
		.ARVALID(ARVALID), 
		.ARREADY(ARREADY), //out 
		.RREADY(RREADY), 
		.RID(RID), //out 
		//.WRDATA(WRDATA),///////////
		.RDATA(RDATA), //out 
		.RRESP(RRESP), //out 
		.RLAST(RLAST), //out 
		.RVALID(RVALID), //out 
		.clk(clk), 
		.reset_n(reset_n)
	);
	
	
	
	always #(`ACLK/2) ACLK = ~ACLK;
	always #(`CYCLE/2) clk = ~clk;
	initial #(`ENDCYCLE) $finish;	

	initial $readmemh (`PAT , mem );
	initial $readmemh (`ANS , answer);
	`ifdef SDF
		initial $sdf_annotate(`SDFFILE , uut);
	`endif
//////////////////////////////////////////////////////////

	integer i ;	
	initial begin
		for(i=0 ; i<=49; i=i+1)begin
			$display("memory [%0d] = %h" , i, mem[i]);
		end
	end
/////////////// ID //////////////////////
	initial begin
		AWID = 1'd0;
		WID = 1'd0;                                                  
	end
		
//////////////////////////////////////////////////////////
	initial begin
		// Initialize Inputs
		i = 0;
		ACLK = 0;
		ARESETn = 0;
		AWID = 0;
		AWADDR = 0;
		AWLEN = 0;
		AWSIZE = 0;
		AWBURST = 0;
		AWVALID = 0;
		WID = 0;
		WDATA = mem[i];//
		WSTRB = 0;
		WLAST = 0;
		WVALID = 0;
		BREADY = 0;
		ARID = 0;
		ARADDR = 0;
		ARLEN = 0;
		ARSIZE = 0;
		ARBURST = 0;
		ARVALID = 0;
		RREADY = 0;
		clk = 0;
		reset_n = 0;
		
		
	
	
		#(`CYCLE*4);
		ARESETn = 1;
		reset_n = 1;
		#(`CYCLE*2);
	///////////////// awaddr_mode //////////////////////
			//~~~~~~~ sel ~~~~~~~~~
		while( !AWREADY )begin
			@( posedge ACLK );
		end
			@( posedge ACLK )
				AWADDR = 32'h 0000_0011;
				ARADDR = 32'h 0000_0000;
				AWBURST = 1;
	     //~~~~~~ wenable ~~~~~~~~		
			#(`ACLK*4)
			@( posedge ACLK )
				AWADDR = 32'h 0000_0100;
			
			//#(`ACLK)	
			@( posedge ACLK )
				AWVALID = 1'd1;
				AWLEN = 50;
				AWSIZE = 5;
				
			@( posedge ACLK )
				if( AWVALID == 1'd1 )begin
					AWVALID = 0;
					//WVALID = 1;
					WSTRB = 15;
					BREADY = 1;
					ARADDR = 32'h 0000_0010;
				end
			#(`ACLK*16);
			@( negedge ACLK )
				WVALID = 1;
				WDATA = mem[i];
				for( i = 0 ; i <= 49 ; i = i + 1) begin
					@( negedge ACLK ) begin
						WDATA = mem[i];
						if( i==48 )begin
							WLAST = 1;
						end
						/*else begin
							//WLAST = 0;
						end*/	
					end
				end

				WVALID = 0;
				AWLEN = 0;
				AWSIZE = 0;
			@( posedge ACLK )
				WLAST = 0;
			@( posedge ACLK )
				if( BVALID == 1'd1 )begin
					BREADY = 0;
				end
				
		  //~~~~~~ renble ~~~~~~~~~	
		  #(`ACLK*2)
			@( posedge ACLK )	
				AWADDR = 32'h 0000_1000;
				ARADDR = 32'h 0000_0010;
		  #(`ACLK*255)	
			@( posedge ACLK )
				AWADDR = 32'h 0000_1000;
			#(`ACLK*135)
			@( posedge ACLK )
				ARVALID = 1;
			@( posedge ACLK )	
				RREADY = 1;		
				ARVALID = 0;
			
			wait ( RLAST == 1'd1)			
			@ ( posedge ACLK )
				RREADY = 0;
      
	end
	integer err = 0;

	initial begin
		wait(RVALID)
			for (i=0 ; i<6 ; i=i+1)
				@(posedge clk) begin
					$display("%h	%h" , RDATA , answer[i]);
					if (RDATA != answer[i])
						err = err + 1;
				end
			if (err == 0)
				$display("All of your data are correct!");
			else
				$display("There are something wrong :(");
			$finish;
	end
      
endmodule


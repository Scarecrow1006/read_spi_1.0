
`timescale 1 ns / 1 ps

	module read_spi_v1_0_Read_from_SPI #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line

		// Base address of targeted slave
		parameter  C_M_TARGET_SLAVE_BASE_ADDR	= 32'he0007000,
		// Burst Length. Supports 1, 2, 4, 8, 16, 32, 64, 128, 256 burst lengths
		parameter integer C_M_AXI_BURST_LEN	= 16,
		// Thread ID Width
		parameter integer C_M_AXI_ID_WIDTH	= 5,
		// Width of Address Bus
		parameter integer C_M_AXI_ADDR_WIDTH	= 32,
		// Width of Data Bus
		parameter integer C_M_AXI_DATA_WIDTH	= 32,
		// Width of User Write Address Bus
		parameter integer C_M_AXI_AWUSER_WIDTH	= 0,
		// Width of User Read Address Bus
		parameter integer C_M_AXI_ARUSER_WIDTH	= 0,
		// Width of User Write Data Bus
		parameter integer C_M_AXI_WUSER_WIDTH	= 0,
		// Width of User Read Data Bus
		parameter integer C_M_AXI_RUSER_WIDTH	= 0,
		// Width of User Response Bus
		parameter integer C_M_AXI_BUSER_WIDTH	= 0
	)
	(
		// Users to add ports here
		input wire [5:0] state,
		// User ports ends
		// Do not modify the ports beyond this line

		// Initiate AXI transactions
		input wire  INIT_AXI_TXN,
		// Asserts when transaction is complete
		output wire  TXN_DONE,
		// Asserts when ERROR is detected
		output reg  ERROR,
		// Global Clock Signal.
		input wire  M_AXI_ACLK,
		// Global Reset Singal. This Signal is Active Low
		input wire  M_AXI_ARESETN,
		// Master Interface Write Address ID
		output wire [C_M_AXI_ID_WIDTH-1 : 0] M_AXI_AWID,
		// Master Interface Write Address
		output wire [C_M_AXI_ADDR_WIDTH-1 : 0] M_AXI_AWADDR,
		// Burst length. The burst length gives the exact number of transfers in a burst
		output wire [7 : 0] M_AXI_AWLEN,
		// Burst size. This signal indicates the size of each transfer in the burst
		output wire [2 : 0] M_AXI_AWSIZE,
		// Burst type. The burst type and the size information, 
    // determine how the address for each transfer within the burst is calculated.
		output wire [1 : 0] M_AXI_AWBURST,
		// Lock type. Provides additional information about the
    // atomic characteristics of the transfer.
		output wire  M_AXI_AWLOCK,
		// Memory type. This signal indicates how transactions
    // are required to progress through a system.
		output wire [3 : 0] M_AXI_AWCACHE,
		// Protection type. This signal indicates the privilege
    // and security level of the transaction, and whether
    // the transaction is a data access or an instruction access.
		output wire [2 : 0] M_AXI_AWPROT,
		// Quality of Service, QoS identifier sent for each write transaction.
		output wire [3 : 0] M_AXI_AWQOS,
		// Optional User-defined signal in the write address channel.
		output wire [C_M_AXI_AWUSER_WIDTH-1 : 0] M_AXI_AWUSER,
		// Write address valid. This signal indicates that
    // the channel is signaling valid write address and control information.
		output wire  M_AXI_AWVALID,
		// Write address ready. This signal indicates that
    // the slave is ready to accept an address and associated control signals
		input wire  M_AXI_AWREADY,
		// Master Interface Write Data.
		output wire [C_M_AXI_DATA_WIDTH-1 : 0] M_AXI_WDATA,
		// Write strobes. This signal indicates which byte
    // lanes hold valid data. There is one write strobe
    // bit for each eight bits of the write data bus.
		output wire [C_M_AXI_DATA_WIDTH/8-1 : 0] M_AXI_WSTRB,
		// Write last. This signal indicates the last transfer in a write burst.
		output wire  M_AXI_WLAST,
		// Optional User-defined signal in the write data channel.
		output wire [C_M_AXI_WUSER_WIDTH-1 : 0] M_AXI_WUSER,
		// Write valid. This signal indicates that valid write
    // data and strobes are available
		output wire  M_AXI_WVALID,
		// Write ready. This signal indicates that the slave
    // can accept the write data.
		input wire  M_AXI_WREADY,
		// Master Interface Write Response.
		input wire [C_M_AXI_ID_WIDTH-1 : 0] M_AXI_BID,
		// Write response. This signal indicates the status of the write transaction.
		input wire [1 : 0] M_AXI_BRESP,
		// Optional User-defined signal in the write response channel
		input wire [C_M_AXI_BUSER_WIDTH-1 : 0] M_AXI_BUSER,
		// Write response valid. This signal indicates that the
    // channel is signaling a valid write response.
		input wire  M_AXI_BVALID,
		// Response ready. This signal indicates that the master
    // can accept a write response.
		output wire  M_AXI_BREADY,
		// Master Interface Read Address.
		output wire [C_M_AXI_ID_WIDTH-1 : 0] M_AXI_ARID,
		// Read address. This signal indicates the initial
    // address of a read burst transaction.
		output wire [C_M_AXI_ADDR_WIDTH-1 : 0] M_AXI_ARADDR,
		// Burst length. The burst length gives the exact number of transfers in a burst
		output wire [7 : 0] M_AXI_ARLEN,
		// Burst size. This signal indicates the size of each transfer in the burst
		output wire [2 : 0] M_AXI_ARSIZE,
		// Burst type. The burst type and the size information, 
    // determine how the address for each transfer within the burst is calculated.
		output wire [1 : 0] M_AXI_ARBURST,
		// Lock type. Provides additional information about the
    // atomic characteristics of the transfer.
		output wire  M_AXI_ARLOCK,
		// Memory type. This signal indicates how transactions
    // are required to progress through a system.
		output wire [3 : 0] M_AXI_ARCACHE,
		// Protection type. This signal indicates the privilege
    // and security level of the transaction, and whether
    // the transaction is a data access or an instruction access.
		output wire [2 : 0] M_AXI_ARPROT,
		// Quality of Service, QoS identifier sent for each read transaction
		output wire [3 : 0] M_AXI_ARQOS,
		// Optional User-defined signal in the read address channel.
		output wire [C_M_AXI_ARUSER_WIDTH-1 : 0] M_AXI_ARUSER,
		// Write address valid. This signal indicates that
    // the channel is signaling valid read address and control information
		output wire  M_AXI_ARVALID,
		// Read address ready. This signal indicates that
    // the slave is ready to accept an address and associated control signals
		input wire  M_AXI_ARREADY,
		// Read ID tag. This signal is the identification tag
    // for the read data group of signals generated by the slave.
		input wire [C_M_AXI_ID_WIDTH-1 : 0] M_AXI_RID,
		// Master Read Data
		input wire [C_M_AXI_DATA_WIDTH-1 : 0] M_AXI_RDATA,
		// Read response. This signal indicates the status of the read transfer
		input wire [1 : 0] M_AXI_RRESP,
		// Read last. This signal indicates the last transfer in a read burst
		input wire  M_AXI_RLAST,
		// Optional User-defined signal in the read address channel.
		input wire [C_M_AXI_RUSER_WIDTH-1 : 0] M_AXI_RUSER,
		// Read valid. This signal indicates that the channel
    // is signaling the required read data.
		input wire  M_AXI_RVALID,
		// Read ready. This signal indicates that the master can
    // accept the read data and response information.
		output wire  M_AXI_RREADY
	);


	// function called clogb2 that returns an integer which has the
	//value of the ceiling of the log base 2

	  // function called clogb2 that returns an integer which has the 
	  // value of the ceiling of the log base 2.                      
	  function integer clogb2 (input integer bit_depth);              
	  begin                                                           
	    for(clogb2=0; bit_depth>0; clogb2=clogb2+1)                   
	      bit_depth = bit_depth >> 1;                                 
	    end                                                           
	  endfunction                                                     

	// C_TRANSACTIONS_NUM is the width of the index counter for 
	// number of write or read transaction.
	 localparam integer C_TRANSACTIONS_NUM = clogb2(C_M_AXI_BURST_LEN-1);

	// Burst length for transactions, in C_M_AXI_DATA_WIDTHs.
	// Non-2^n lengths will eventually cause bursts across 4K address boundaries.
	 localparam integer C_MASTER_LENGTH	= 12;
	// total number of burst transfers is master length divided by burst length and burst size
	 localparam integer C_NO_BURSTS_REQ = C_MASTER_LENGTH-clogb2((C_M_AXI_BURST_LEN*C_M_AXI_DATA_WIDTH/8)-1);
	// Example State machine to initialize counter, initialize write transactions, 
	// initialize read transactions and comparison of read data with the 
	// written data words.
	parameter [1:0] IDLE = 2'b00, // This state initiates AXI4Lite transaction 
			// after the state machine changes state to INIT_WRITE 
			// when there is 0 to 1 transition on INIT_AXI_TXN
		INIT_WRITE   = 2'b01, // This state initializes write transaction,
			// once writes are done, the state machine 
			// changes state to INIT_READ 
		INIT_READ = 2'b10, // This state initializes read transaction
			// once reads are done, the state machine 
			// changes state to INIT_COMPARE 
		INIT_COMPARE = 2'b11; // This state issues the status of comparison 
			// of the written data with the read data	

	 reg [1:0] mst_exec_state;


	localparam t_00=6'b000000;
	localparam t_01=6'b000001;
	localparam t_02=6'b000010;
	localparam t_03=6'b000011;
	localparam t_04=6'b000100;
	localparam t_05=6'b000101;
	localparam t_06=6'b000110;
	localparam t_07=6'b000111;
	localparam t_08=6'b001000;
	localparam t_09=6'b001001;
	localparam t_10=6'b001010;
	localparam t_11=6'b001011;
	localparam t_12=6'b001100;
	localparam t_13=6'b001101;
	localparam t_14=6'b001110;
	localparam t_15=6'b001111;
	localparam t_16=6'b010000;
	localparam t_17=6'b010001;
	localparam t_18=6'b010010;
	localparam t_19=6'b010011;
	localparam t_20=6'b010100;
	localparam t_21=6'b010101;
	localparam t_22=6'b010110;
	localparam t_23=6'b010111;
	localparam t_24=6'b011000;
	localparam t_25=6'b011001;
	localparam t_26=6'b011010;
	localparam t_27=6'b011011;
	localparam t_28=6'b011100;
	localparam t_29=6'b011101;
	localparam t_30=6'b011110;
	localparam t_31=6'b011111;
	localparam t_32=6'b100000;
	localparam t_33=6'b100001;
	localparam t_34=6'b100010;
	localparam t_35=6'b100011;
	localparam t_36=6'b100100;
	localparam t_37=6'b100101;

	// AXI4LITE signals
	//AXI4 internal temp signals
	reg [C_M_AXI_ID_WIDTH-1:0]  axi_id;
	reg [C_M_AXI_ADDR_WIDTH-1 : 0] 	axi_awaddr;
	reg  	axi_awvalid;
	reg [C_M_AXI_DATA_WIDTH-1 : 0] 	axi_wdata;
	//reg  	axi_wlast;
	reg  	axi_wvalid;
	reg  	axi_bready;
	//reg [C_M_AXI_ADDR_WIDTH-1 : 0] 	axi_araddr;
	reg  	axi_arvalid;
	reg  	axi_rready;
	//write beat count in a burst
	reg [C_TRANSACTIONS_NUM : 0] 	write_index;
	//read beat count in a burst
	reg [C_TRANSACTIONS_NUM : 0] 	read_index;
	//size of C_M_AXI_BURST_LEN length burst in bytes
	wire [C_TRANSACTIONS_NUM+2 : 0] 	burst_size_bytes;
	//The burst counters are used to track the number of burst transfers of C_M_AXI_BURST_LEN burst length needed to transfer 2^C_MASTER_LENGTH bytes of data.
	reg [C_NO_BURSTS_REQ : 0] 	write_burst_counter;
	reg [C_NO_BURSTS_REQ : 0] 	read_burst_counter;
	reg  	start_single_burst_write;
	reg  	start_single_burst_read;
	reg  	writes_done;
	reg  	reads_done;
	reg  	error_reg;
	reg  	compare_done;
	reg  	read_mismatch;
	reg  	burst_write_active;
	reg  	burst_read_active;
	reg [C_M_AXI_DATA_WIDTH-1 : 0] 	expected_rdata;
	//Interface response error flags
	wire  	write_resp_error;
	wire  	read_resp_error;
	wire  	wnext;
	wire  	rnext;
	reg  	init_txn_ff;
	reg  	init_txn_ff2;
	reg  	init_txn_edge;
	wire  	init_txn_pulse;


	// I/O Connections assignments

	//I/O Connections. Write Address (AW)
	assign M_AXI_AWID	= 'b0;
	//The AXI address is a concatenation of the target base address + active offset range
	assign M_AXI_AWADDR	= C_M_TARGET_SLAVE_BASE_ADDR + axi_awaddr;
	//Burst LENgth is number of transaction beats, minus 1
	assign M_AXI_AWLEN	= C_M_AXI_BURST_LEN - 1;
	//Size should be C_M_AXI_DATA_WIDTH, in 2^SIZE bytes, otherwise narrow bursts are used
	assign M_AXI_AWSIZE	= clogb2((C_M_AXI_DATA_WIDTH/8)-1);
	//INCR burst type is usually used, except for keyhole bursts
	assign M_AXI_AWBURST	= 2'b01;
	assign M_AXI_AWLOCK	= 1'b0;
	//Update value to 4'b0011 if coherent accesses to be used via the Zynq ACP port. Not Allocated, Modifiable, not Bufferable. Not Bufferable since this example is meant to test memory, not intermediate cache. 
	assign M_AXI_AWCACHE	= 4'b0010;
	assign M_AXI_AWPROT	= 3'h0;
	assign M_AXI_AWQOS	= 4'h0;
	assign M_AXI_AWUSER	= 'b1;
	assign M_AXI_AWVALID	= axi_awvalid;
	//Write Data(W)
	assign M_AXI_WDATA	= axi_wdata;
	//All bursts are complete and aligned in this example
	assign M_AXI_WSTRB	= {(C_M_AXI_DATA_WIDTH/8){1'b1}};
	assign M_AXI_WLAST	= axi_wvalid;
	assign M_AXI_WUSER	= 'b0;
	assign M_AXI_WVALID	= axi_wvalid;
	//Write Response (B)
	assign M_AXI_BREADY	= axi_bready;
	//Read Address (AR)
	assign M_AXI_ARID	= axi_id;
	assign M_AXI_ARADDR	= C_M_TARGET_SLAVE_BASE_ADDR + 32'h00000020;
	//Burst LENgth is number of transaction beats, minus 1
	assign M_AXI_ARLEN	= C_M_AXI_BURST_LEN - 1;
	//Size should be C_M_AXI_DATA_WIDTH, in 2^n bytes, otherwise narrow bursts are used
	assign M_AXI_ARSIZE	= clogb2((C_M_AXI_DATA_WIDTH/8)-1);
	//INCR burst type is usually used, except for keyhole bursts
	assign M_AXI_ARBURST	= 2'b01;
	assign M_AXI_ARLOCK	= 1'b0;
	//Update value to 4'b0011 if coherent accesses to be used via the Zynq ACP port. Not Allocated, Modifiable, not Bufferable. Not Bufferable since this example is meant to test memory, not intermediate cache. 
	assign M_AXI_ARCACHE	= 4'b0010;
	assign M_AXI_ARPROT	= 3'h0;
	assign M_AXI_ARQOS	= 4'h0;
	assign M_AXI_ARUSER	= 'b1;
	assign M_AXI_ARVALID	= axi_arvalid;
	//Read and Read Response (R)
	assign M_AXI_RREADY	= axi_rready;
	//Example design I/O
	assign TXN_DONE	= compare_done;
	//Burst size in bytes
	assign burst_size_bytes	= C_M_AXI_BURST_LEN * C_M_AXI_DATA_WIDTH/8;
	//assign init_txn_pulse	= (!init_txn_ff2) && init_txn_ff;


	//Generate a pulse to initiate AXI transaction.
	/*always @(posedge M_AXI_ACLK)										      
	  begin                                                                        
	    // Initiates AXI transaction delay    
	    if (M_AXI_ARESETN == 0 )                                                   
	      begin                                                                    
	        init_txn_ff <= 1'b0;                                                   
	        init_txn_ff2 <= 1'b0;                                                   
	      end                                                                               
	    else                                                                       
	      begin  
	        init_txn_ff <= INIT_AXI_TXN;
	        init_txn_ff2 <= init_txn_ff;                                                                 
	      end                                                                      
	  end*/     


	//--------------------
	//Write Address Channel
	//--------------------

	//awvalid logic
	always @(*)begin
		case(state)
			t_00: axi_awvalid = 1'b0;
			t_01: axi_awvalid = 1'b1;
			t_02: axi_awvalid = 1'b0;
			t_03: axi_awvalid = 1'b1;
			t_04: axi_awvalid = 1'b0;
			t_05: axi_awvalid = 1'b0;
			t_06: axi_awvalid = 1'b1;
			t_07: axi_awvalid = 1'b0;
			t_08: axi_awvalid = 1'b1;
			t_09: axi_awvalid = 1'b0;
			t_10: axi_awvalid = 1'b1;
			t_11: axi_awvalid = 1'b0;
			t_12: axi_awvalid = 1'b1;
			t_13: axi_awvalid = 1'b0;
			t_14: axi_awvalid = 1'b1;
			t_15: axi_awvalid = 1'b0;
			t_16: axi_awvalid = 1'b1;
			t_17: axi_awvalid = 1'b0;
			t_18: axi_awvalid = 1'b1;
			t_19: axi_awvalid = 1'b0;
			t_20: axi_awvalid = 1'b1;
			t_21: axi_awvalid = 1'b0;
			t_22: axi_awvalid = 1'b1;
			t_23: axi_awvalid = 1'b0;
			t_24: axi_awvalid = 1'b0;
			t_25: axi_awvalid = 1'b1;
			t_26: axi_awvalid = 1'b0;
			t_27: axi_awvalid = 1'b1;
			t_28: axi_awvalid = 1'b0;
			t_29: axi_awvalid = 1'b1;
			t_30: axi_awvalid = 1'b0;
			t_31: axi_awvalid = 1'b0;
			t_32: axi_awvalid = 1'b0;
			t_33: axi_awvalid = 1'b0;
			t_34: axi_awvalid = 1'b0;
			t_35: axi_awvalid = 1'b0;
			t_36: axi_awvalid = 1'b0;
			t_37: axi_awvalid = 1'b0;
		endcase
	end

	//awaddr logic
	always @(*) begin
		case(state) 
			t_00: axi_awaddr = 32'h00000000;
			t_01: axi_awaddr = 32'h00000000;
			t_02: axi_awaddr = 32'h00000000;
			t_03: axi_awaddr = 32'h0000002c;
			t_04: axi_awaddr = 32'h00000000;
			t_05: axi_awaddr = 32'h00000000;
			t_06: axi_awaddr = 32'h00000000;
			t_07: axi_awaddr = 32'h00000000;
			t_08: axi_awaddr = 32'h00000014;
			t_09: axi_awaddr = 32'h00000000;
			t_10: axi_awaddr = 32'h0000001c;
			t_11: axi_awaddr = 32'h00000000;
			t_12: axi_awaddr = 32'h0000001c;
			t_13: axi_awaddr = 32'h00000000;
			t_14: axi_awaddr = 32'h0000001c;
			t_15: axi_awaddr = 32'h00000000;
			t_16: axi_awaddr = 32'h0000001c;
			t_17: axi_awaddr = 32'h00000000;
			t_18: axi_awaddr = 32'h00000008;
			t_19: axi_awaddr = 32'h00000000;
			t_20: axi_awaddr = 32'h0000000c;
			t_21: axi_awaddr = 32'h00000000;
			t_22: axi_awaddr = 32'h00000000;
			t_23: axi_awaddr = 32'h00000000;
			t_24: axi_awaddr = 32'h00000000;
			t_25: axi_awaddr = 32'h0000000c;
			t_26: axi_awaddr = 32'h00000000;
			t_27: axi_awaddr = 32'h00000000;
			t_28: axi_awaddr = 32'h00000000;
			t_29: axi_awaddr = 32'h00000014;
			t_30: axi_awaddr = 32'h00000000;
			t_31: axi_awaddr = 32'h00000000;
			t_32: axi_awaddr = 32'h00000000;
			t_33: axi_awaddr = 32'h00000000;
			t_34: axi_awaddr = 32'h00000000;
			t_35: axi_awaddr = 32'h00000000;
			t_36: axi_awaddr = 32'h00000000;
			t_37: axi_awaddr = 32'h00000000;
		default   axi_awaddr = 32'h00000000;
		endcase
	end

	//--------------------
	//Write Data Channel
	//--------------------

	// WVALID logic
	always @(*) begin
		case(state) 
			t_00: axi_wvalid=1'b0;
			t_01: axi_wvalid=1'b1;
			t_02: axi_wvalid=1'b1;
			t_03: axi_wvalid=1'b1;
			t_04: axi_wvalid=1'b1;
			t_05: axi_wvalid=1'b0;
			t_06: axi_wvalid=1'b1;
			t_07: axi_wvalid=1'b1;
			t_08: axi_wvalid=1'b1;
			t_09: axi_wvalid=1'b1;
			t_10: axi_wvalid=1'b1;
			t_11: axi_wvalid=1'b1;
			t_12: axi_wvalid=1'b1;
			t_13: axi_wvalid=1'b1;
			t_14: axi_wvalid=1'b1;
			t_15: axi_wvalid=1'b1;
			t_16: axi_wvalid=1'b1;
			t_17: axi_wvalid=1'b1;
			t_18: axi_wvalid=1'b1;
			t_19: axi_wvalid=1'b1;
			t_20: axi_wvalid=1'b1;
			t_21: axi_wvalid=1'b1;
			t_22: axi_wvalid=1'b1;
			t_23: axi_wvalid=1'b1;
			t_24: axi_wvalid=1'b0;
			t_25: axi_wvalid=1'b1;
			t_26: axi_wvalid=1'b1;
			t_27: axi_wvalid=1'b1;
			t_28: axi_wvalid=1'b1;
			t_29: axi_wvalid=1'b1;
			t_30: axi_wvalid=1'b1;
			t_31: axi_wvalid=1'b0;
			t_32: axi_wvalid=1'b0;
			t_33: axi_wvalid=1'b0;
			t_34: axi_wvalid=1'b0;
			t_35: axi_wvalid=1'b0;
			t_36: axi_wvalid=1'b0;
			t_37: axi_wvalid=1'b0;
		default   axi_wvalid=1'b0;
		endcase
	end


	//WLAST logic
	//assign axi_wlast = axi_wvalid;

	//wdata logic
	always @(*) begin
		case(state) 
			t_00: axi_wdata=32'h00000000;
			t_01: axi_wdata=32'h0000fc17;
			t_02: axi_wdata=32'h0000fc17;
			t_03: axi_wdata=32'h00000006;
			t_04: axi_wdata=32'h00000006;
			t_05: axi_wdata=32'h00000000;
			t_06: axi_wdata=32'h00004017;
			t_07: axi_wdata=32'h00004017;
			t_08: axi_wdata=32'h00000001;
			t_09: axi_wdata=32'h00000001;
			t_10: axi_wdata=32'h00000090;
			t_11: axi_wdata=32'h00000090;
			t_12: axi_wdata=32'h00000000;
			t_13: axi_wdata=32'h00000000;
			t_14: axi_wdata=32'h00000000;
			t_15: axi_wdata=32'h00000000;
			t_16: axi_wdata=32'h00000000;
			t_17: axi_wdata=32'h00000000;
			t_18: axi_wdata=32'h00000010;
			t_19: axi_wdata=32'h00000010;
			t_20: axi_wdata=32'h0000006f;
			t_21: axi_wdata=32'h0000006f;
			t_22: axi_wdata=32'h0001f417;
			t_23: axi_wdata=32'h0001f417;
			t_24: axi_wdata=32'h00000000;
			t_25: axi_wdata=32'h0000007f;
			t_26: axi_wdata=32'h0000007f;
			t_27: axi_wdata=32'h00007c17;
			t_28: axi_wdata=32'h00007c17;
			t_29: axi_wdata=32'h00000000;
			t_30: axi_wdata=32'h00000000;
			t_31: axi_wdata=32'h00000000;
			t_32: axi_wdata=32'h00000000;
			t_33: axi_wdata=32'h00000000;
			t_34: axi_wdata=32'h00000000;
			t_35: axi_wdata=32'h00000000;
			t_36: axi_wdata=32'h00000000;
			t_37: axi_wdata=32'h00000000;
		default   axi_wdata=32'h00000000;
		endcase
	end


	//----------------------------
	//Write Response (B) Channel
	//----------------------------

	//The write response channel provides feedback that the write has committed
	//to memory. BREADY will occur when all of the data and the write address
	//has arrived and been accepted by the slave.

	//The write issuance (number of outstanding write addresses) is started by 
	//the Address Write transfer, and is completed by a BREADY/BRESP.

	//While negating BREADY will eventually throttle the AWREADY signal, 
	//it is best not to throttle the whole data channel this way.

	//The BRESP bit [1] is used indicate any errors from the interconnect or
	//slave for the entire write burst. This example will capture the error 
	//into the ERROR output. 

	  always @(posedge M_AXI_ACLK)                                     
	  begin                                                                 
	    if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1 )                                            
	      begin                                                             
	        axi_bready <= 1'b0;                                             
	      end                                                               
	    // accept/acknowledge bresp with axi_bready by the master           
	    // when M_AXI_BVALID is asserted by slave                           
	    else if (M_AXI_BVALID && ~axi_bready)                               
	      begin                                                             
	        axi_bready <= 1'b1;                                             
	      end                                                               
	    // deassert after one clock cycle                                   
	    else if (axi_bready)                                                
	      begin                                                             
	        axi_bready <= 1'b0;                                             
	      end                                                               
	    // retain the previous value                                        
	    else                                                                
	      axi_bready <= axi_bready;                                         
	  end                                                                   
	                                                                        
	                                                                        
	//Flag any write response errors                                        
	  assign write_resp_error = axi_bready & M_AXI_BVALID & M_AXI_BRESP[1]; 


	//----------------------------
	//Read Address Channel
	//----------------------------

	//arvalid logic
	always @(*) begin
		case(state)
			t_31: axi_arvalid=1'b1;
			t_33: axi_arvalid=1'b1;
		default   axi_arvalid=1'b0;
		endcase
	end

	//araddr logic
	//assign axi_araddr = 32'h00000020;

	//--------------------------------
	//Read Data (and Response) Channel
	//--------------------------------

	//rready logic
	always @(*) begin
		case(state)
			t_32: axi_rready=1'b1;
			t_34: axi_rready=1'b1;
		default   axi_rready=1'b0;
		endcase
	end

	
	// Add user logic here

	// User logic ends

	endmodule

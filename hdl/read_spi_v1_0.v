
`timescale 1 ns / 1 ps

	module read_spi_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Master Bus Interface Read_from_SPI
		parameter  C_Read_from_SPI_TARGET_SLAVE_BASE_ADDR	= 32'he0007000,
		parameter integer C_Read_from_SPI_BURST_LEN	= 16,
		parameter integer C_Read_from_SPI_ID_WIDTH	= 5,
		parameter integer C_Read_from_SPI_ADDR_WIDTH	= 32,
		parameter integer C_Read_from_SPI_DATA_WIDTH	= 32,
		parameter integer C_Read_from_SPI_AWUSER_WIDTH	= 0,
		parameter integer C_Read_from_SPI_ARUSER_WIDTH	= 0,
		parameter integer C_Read_from_SPI_WUSER_WIDTH	= 0,
		parameter integer C_Read_from_SPI_RUSER_WIDTH	= 0,
		parameter integer C_Read_from_SPI_BUSER_WIDTH	= 0,

		// Parameters of Axi Master Bus Interface Write_to_RAM
		parameter  C_Write_to_RAM_TARGET_SLAVE_BASE_ADDR	= 32'h00000000,
		parameter integer C_Write_to_RAM_BURST_LEN	= 16,
		parameter integer C_Write_to_RAM_ID_WIDTH	= 1,
		parameter integer C_Write_to_RAM_ADDR_WIDTH	= 32,
		parameter integer C_Write_to_RAM_DATA_WIDTH	= 32,
		parameter integer C_Write_to_RAM_AWUSER_WIDTH	= 0,
		parameter integer C_Write_to_RAM_ARUSER_WIDTH	= 0,
		parameter integer C_Write_to_RAM_WUSER_WIDTH	= 0,
		parameter integer C_Write_to_RAM_RUSER_WIDTH	= 0,
		parameter integer C_Write_to_RAM_BUSER_WIDTH	= 0
	)
	(
		// Users to add ports here
		input wire rx_fifo_not_empty,
		input wire init_spi_config,
		input wire clk,
		output reg [5:0] cur,
		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Master Bus Interface Read_from_SPI
		input wire  read_from_spi_init_axi_txn,
		output wire  read_from_spi_txn_done,
		output wire  read_from_spi_error,
		input wire  read_from_spi_aclk,
		input wire  read_from_spi_aresetn,
		output wire [C_Read_from_SPI_ID_WIDTH-1 : 0] read_from_spi_awid,
		output wire [C_Read_from_SPI_ADDR_WIDTH-1 : 0] read_from_spi_awaddr,
		output wire [7 : 0] read_from_spi_awlen,
		output wire [2 : 0] read_from_spi_awsize,
		output wire [1 : 0] read_from_spi_awburst,
		output wire  read_from_spi_awlock,
		output wire [3 : 0] read_from_spi_awcache,
		output wire [2 : 0] read_from_spi_awprot,
		output wire [3 : 0] read_from_spi_awqos,
		output wire [C_Read_from_SPI_AWUSER_WIDTH-1 : 0] read_from_spi_awuser,
		output wire  read_from_spi_awvalid,
		input wire  read_from_spi_awready,
		output wire [C_Read_from_SPI_DATA_WIDTH-1 : 0] read_from_spi_wdata,
		output wire [C_Read_from_SPI_DATA_WIDTH/8-1 : 0] read_from_spi_wstrb,
		output wire  read_from_spi_wlast,
		output wire [C_Read_from_SPI_WUSER_WIDTH-1 : 0] read_from_spi_wuser,
		output wire  read_from_spi_wvalid,
		input wire  read_from_spi_wready,
		input wire [C_Read_from_SPI_ID_WIDTH-1 : 0] read_from_spi_bid,
		input wire [1 : 0] read_from_spi_bresp,
		input wire [C_Read_from_SPI_BUSER_WIDTH-1 : 0] read_from_spi_buser,
		input wire  read_from_spi_bvalid,
		output wire  read_from_spi_bready,
		output wire [C_Read_from_SPI_ID_WIDTH-1 : 0] read_from_spi_arid,
		output wire [C_Read_from_SPI_ADDR_WIDTH-1 : 0] read_from_spi_araddr,
		output wire [7 : 0] read_from_spi_arlen,
		output wire [2 : 0] read_from_spi_arsize,
		output wire [1 : 0] read_from_spi_arburst,
		output wire  read_from_spi_arlock,
		output wire [3 : 0] read_from_spi_arcache,
		output wire [2 : 0] read_from_spi_arprot,
		output wire [3 : 0] read_from_spi_arqos,
		output wire [C_Read_from_SPI_ARUSER_WIDTH-1 : 0] read_from_spi_aruser,
		output wire  read_from_spi_arvalid,
		input wire  read_from_spi_arready,
		input wire [C_Read_from_SPI_ID_WIDTH-1 : 0] read_from_spi_rid,
		input wire [C_Read_from_SPI_DATA_WIDTH-1 : 0] read_from_spi_rdata,
		input wire [1 : 0] read_from_spi_rresp,
		input wire  read_from_spi_rlast,
		input wire [C_Read_from_SPI_RUSER_WIDTH-1 : 0] read_from_spi_ruser,
		input wire  read_from_spi_rvalid,
		output wire  read_from_spi_rready,

		// Ports of Axi Master Bus Interface Write_to_RAM
		input wire  write_to_ram_init_axi_txn,
		output wire  write_to_ram_txn_done,
		output wire  write_to_ram_error,
		input wire  write_to_ram_aclk,
		input wire  write_to_ram_aresetn,
		output wire [C_Write_to_RAM_ID_WIDTH-1 : 0] write_to_ram_awid,
		output wire [C_Write_to_RAM_ADDR_WIDTH-1 : 0] write_to_ram_awaddr,
		output wire [7 : 0] write_to_ram_awlen,
		output wire [2 : 0] write_to_ram_awsize,
		output wire [1 : 0] write_to_ram_awburst,
		output wire  write_to_ram_awlock,
		output wire [3 : 0] write_to_ram_awcache,
		output wire [2 : 0] write_to_ram_awprot,
		output wire [3 : 0] write_to_ram_awqos,
		output wire [C_Write_to_RAM_AWUSER_WIDTH-1 : 0] write_to_ram_awuser,
		output wire  write_to_ram_awvalid,
		input wire  write_to_ram_awready,
		output wire [C_Write_to_RAM_DATA_WIDTH-1 : 0] write_to_ram_wdata,
		output wire [C_Write_to_RAM_DATA_WIDTH/8-1 : 0] write_to_ram_wstrb,
		output wire  write_to_ram_wlast,
		output wire [C_Write_to_RAM_WUSER_WIDTH-1 : 0] write_to_ram_wuser,
		output wire  write_to_ram_wvalid,
		input wire  write_to_ram_wready,
		input wire [C_Write_to_RAM_ID_WIDTH-1 : 0] write_to_ram_bid,
		input wire [1 : 0] write_to_ram_bresp,
		input wire [C_Write_to_RAM_BUSER_WIDTH-1 : 0] write_to_ram_buser,
		input wire  write_to_ram_bvalid,
		output wire  write_to_ram_bready,
		output wire [C_Write_to_RAM_ID_WIDTH-1 : 0] write_to_ram_arid,
		output wire [C_Write_to_RAM_ADDR_WIDTH-1 : 0] write_to_ram_araddr,
		output wire [7 : 0] write_to_ram_arlen,
		output wire [2 : 0] write_to_ram_arsize,
		output wire [1 : 0] write_to_ram_arburst,
		output wire  write_to_ram_arlock,
		output wire [3 : 0] write_to_ram_arcache,
		output wire [2 : 0] write_to_ram_arprot,
		output wire [3 : 0] write_to_ram_arqos,
		output wire [C_Write_to_RAM_ARUSER_WIDTH-1 : 0] write_to_ram_aruser,
		output wire  write_to_ram_arvalid,
		input wire  write_to_ram_arready,
		input wire [C_Write_to_RAM_ID_WIDTH-1 : 0] write_to_ram_rid,
		input wire [C_Write_to_RAM_DATA_WIDTH-1 : 0] write_to_ram_rdata,
		input wire [1 : 0] write_to_ram_rresp,
		input wire  write_to_ram_rlast,
		input wire [C_Write_to_RAM_RUSER_WIDTH-1 : 0] write_to_ram_ruser,
		input wire  write_to_ram_rvalid,
		output wire  write_to_ram_rready
	);

	//reg [5:0] cur;
	reg [5:0] next;
	integer count;
	reg [31:0] data;

// Instantiation of Axi Bus Interface Read_from_SPI


	read_spi_v1_0_Read_from_SPI # ( 
		.C_M_TARGET_SLAVE_BASE_ADDR(C_Read_from_SPI_TARGET_SLAVE_BASE_ADDR),
		.C_M_AXI_BURST_LEN(C_Read_from_SPI_BURST_LEN),
		.C_M_AXI_ID_WIDTH(C_Read_from_SPI_ID_WIDTH),
		.C_M_AXI_ADDR_WIDTH(C_Read_from_SPI_ADDR_WIDTH),
		.C_M_AXI_DATA_WIDTH(C_Read_from_SPI_DATA_WIDTH),
		.C_M_AXI_AWUSER_WIDTH(C_Read_from_SPI_AWUSER_WIDTH),
		.C_M_AXI_ARUSER_WIDTH(C_Read_from_SPI_ARUSER_WIDTH),
		.C_M_AXI_WUSER_WIDTH(C_Read_from_SPI_WUSER_WIDTH),
		.C_M_AXI_RUSER_WIDTH(C_Read_from_SPI_RUSER_WIDTH),
		.C_M_AXI_BUSER_WIDTH(C_Read_from_SPI_BUSER_WIDTH)
	) read_spi_v1_0_Read_from_SPI_inst (
		.state(cur),
		.INIT_AXI_TXN(read_from_spi_init_axi_txn),
		.TXN_DONE(read_from_spi_txn_done),
		.ERROR(read_from_spi_error),
		.M_AXI_ACLK(read_from_spi_aclk),
		.M_AXI_ARESETN(read_from_spi_aresetn),
		.M_AXI_AWID(read_from_spi_awid),
		.M_AXI_AWADDR(read_from_spi_awaddr),
		.M_AXI_AWLEN(read_from_spi_awlen),
		.M_AXI_AWSIZE(read_from_spi_awsize),
		.M_AXI_AWBURST(read_from_spi_awburst),
		.M_AXI_AWLOCK(read_from_spi_awlock),
		.M_AXI_AWCACHE(read_from_spi_awcache),
		.M_AXI_AWPROT(read_from_spi_awprot),
		.M_AXI_AWQOS(read_from_spi_awqos),
		.M_AXI_AWUSER(read_from_spi_awuser),
		.M_AXI_AWVALID(read_from_spi_awvalid),
		.M_AXI_AWREADY(read_from_spi_awready),
		.M_AXI_WDATA(read_from_spi_wdata),
		.M_AXI_WSTRB(read_from_spi_wstrb),
		.M_AXI_WLAST(read_from_spi_wlast),
		.M_AXI_WUSER(read_from_spi_wuser),
		.M_AXI_WVALID(read_from_spi_wvalid),
		.M_AXI_WREADY(read_from_spi_wready),
		.M_AXI_BID(read_from_spi_bid),
		.M_AXI_BRESP(read_from_spi_bresp),
		.M_AXI_BUSER(read_from_spi_buser),
		.M_AXI_BVALID(read_from_spi_bvalid),
		.M_AXI_BREADY(read_from_spi_bready),
		.M_AXI_ARID(read_from_spi_arid),
		.M_AXI_ARADDR(read_from_spi_araddr),
		.M_AXI_ARLEN(read_from_spi_arlen),
		.M_AXI_ARSIZE(read_from_spi_arsize),
		.M_AXI_ARBURST(read_from_spi_arburst),
		.M_AXI_ARLOCK(read_from_spi_arlock),
		.M_AXI_ARCACHE(read_from_spi_arcache),
		.M_AXI_ARPROT(read_from_spi_arprot),
		.M_AXI_ARQOS(read_from_spi_arqos),
		.M_AXI_ARUSER(read_from_spi_aruser),
		.M_AXI_ARVALID(read_from_spi_arvalid),
		.M_AXI_ARREADY(read_from_spi_arready),
		.M_AXI_RID(read_from_spi_rid),
		.M_AXI_RDATA(read_from_spi_rdata),
		.M_AXI_RRESP(read_from_spi_rresp),
		.M_AXI_RLAST(read_from_spi_rlast),
		.M_AXI_RUSER(read_from_spi_ruser),
		.M_AXI_RVALID(read_from_spi_rvalid),
		.M_AXI_RREADY(read_from_spi_rready)
	);

// Instantiation of Axi Bus Interface Write_to_RAM
	read_spi_v1_0_Write_to_RAM # ( 
		.C_M_TARGET_SLAVE_BASE_ADDR(C_Write_to_RAM_TARGET_SLAVE_BASE_ADDR),
		.C_M_AXI_BURST_LEN(C_Write_to_RAM_BURST_LEN),
		.C_M_AXI_ID_WIDTH(C_Write_to_RAM_ID_WIDTH),
		.C_M_AXI_ADDR_WIDTH(C_Write_to_RAM_ADDR_WIDTH),
		.C_M_AXI_DATA_WIDTH(C_Write_to_RAM_DATA_WIDTH),
		.C_M_AXI_AWUSER_WIDTH(C_Write_to_RAM_AWUSER_WIDTH),
		.C_M_AXI_ARUSER_WIDTH(C_Write_to_RAM_ARUSER_WIDTH),
		.C_M_AXI_WUSER_WIDTH(C_Write_to_RAM_WUSER_WIDTH),
		.C_M_AXI_RUSER_WIDTH(C_Write_to_RAM_RUSER_WIDTH),
		.C_M_AXI_BUSER_WIDTH(C_Write_to_RAM_BUSER_WIDTH)
	) read_spi_v1_0_Write_to_RAM_inst (
		.state(cur),
		.data(data),
		.INIT_AXI_TXN(write_to_ram_init_axi_txn),
		.TXN_DONE(write_to_ram_txn_done),
		.ERROR(write_to_ram_error),
		.M_AXI_ACLK(write_to_ram_aclk),
		.M_AXI_ARESETN(write_to_ram_aresetn),
		.M_AXI_AWID(write_to_ram_awid),
		.M_AXI_AWADDR(write_to_ram_awaddr),
		.M_AXI_AWLEN(write_to_ram_awlen),
		.M_AXI_AWSIZE(write_to_ram_awsize),
		.M_AXI_AWBURST(write_to_ram_awburst),
		.M_AXI_AWLOCK(write_to_ram_awlock),
		.M_AXI_AWCACHE(write_to_ram_awcache),
		.M_AXI_AWPROT(write_to_ram_awprot),
		.M_AXI_AWQOS(write_to_ram_awqos),
		.M_AXI_AWUSER(write_to_ram_awuser),
		.M_AXI_AWVALID(write_to_ram_awvalid),
		.M_AXI_AWREADY(write_to_ram_awready),
		.M_AXI_WDATA(write_to_ram_wdata),
		.M_AXI_WSTRB(write_to_ram_wstrb),
		.M_AXI_WLAST(write_to_ram_wlast),
		.M_AXI_WUSER(write_to_ram_wuser),
		.M_AXI_WVALID(write_to_ram_wvalid),
		.M_AXI_WREADY(write_to_ram_wready),
		.M_AXI_BID(write_to_ram_bid),
		.M_AXI_BRESP(write_to_ram_bresp),
		.M_AXI_BUSER(write_to_ram_buser),
		.M_AXI_BVALID(write_to_ram_bvalid),
		.M_AXI_BREADY(write_to_ram_bready),
		.M_AXI_ARID(write_to_ram_arid),
		.M_AXI_ARADDR(write_to_ram_araddr),
		.M_AXI_ARLEN(write_to_ram_arlen),
		.M_AXI_ARSIZE(write_to_ram_arsize),
		.M_AXI_ARBURST(write_to_ram_arburst),
		.M_AXI_ARLOCK(write_to_ram_arlock),
		.M_AXI_ARCACHE(write_to_ram_arcache),
		.M_AXI_ARPROT(write_to_ram_arprot),
		.M_AXI_ARQOS(write_to_ram_arqos),
		.M_AXI_ARUSER(write_to_ram_aruser),
		.M_AXI_ARVALID(write_to_ram_arvalid),
		.M_AXI_ARREADY(write_to_ram_arready),
		.M_AXI_RID(write_to_ram_rid),
		.M_AXI_RDATA(write_to_ram_rdata),
		.M_AXI_RRESP(write_to_ram_rresp),
		.M_AXI_RLAST(write_to_ram_rlast),
		.M_AXI_RUSER(write_to_ram_ruser),
		.M_AXI_RVALID(write_to_ram_rvalid),
		.M_AXI_RREADY(write_to_ram_rready)
	);

	// Add user logic here
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

	//logic for state updation
	always @(posedge clk) begin
		if (write_to_ram_aresetn==1'b0 || read_from_spi_aresetn==1'b0) begin
			cur <= t_00;			
		end
		else begin
			cur <= next;
		end
	end

	//logic for data register
	always @(posedge clk)begin
		if (write_to_ram_aresetn==1'b0 || read_from_spi_aresetn==1'b0) begin
			data <= 0;
		end
		else begin
			if (read_from_spi_rready && read_from_spi_rvalid) begin
				data <= read_from_spi_rdata;
			end
		end
	end

	//logic for counter of number of reads from fifo
	always @(posedge clk) begin
		case (cur)
			t_29: count=5;
			t_30: count=5;
			t_31: count=count-1;
		default   count=count;
		endcase
	end

	//logic for next state calculation
	always @(*) begin
		case(cur)
			t_00: begin
				if (init_spi_config) begin
					next = t_01;
				end
				else begin
					next = t_00;
				end
			end
			t_01: begin
				if (read_from_spi_awready) begin
					if (read_from_spi_wready) begin
						next = t_03;
					end
					else begin
						next = t_02;
					end
				end
				else begin
					next = t_01;
				end
			end
			t_02: begin
				if (read_from_spi_wready) begin
					next = t_03;
				end
				else begin
					next = t_02;
				end
			end
			t_03: begin
				if (read_from_spi_awready) begin
					if (read_from_spi_wready) begin
						next = t_05;
					end
					else begin
						next = t_04;
					end
				end
				else begin
					next = t_03;
				end	
			end
			t_04: begin
				if (read_from_spi_wready) begin
					next = t_05;
				end
				else begin
					next = t_04;
				end
			end
			t_05: begin
				if (read_from_spi_init_axi_txn) begin
					next = t_06;
				end
				else begin
					next = t_05;
				end
			end
			t_06: begin
				if (read_from_spi_awready) begin
					if (read_from_spi_wready) begin
						next = t_08;
					end
					else begin
						next = t_07;
					end
				end
				else begin
					next = t_06;
				end	
			end
			t_07: begin
				if (read_from_spi_wready) begin
					next = t_08;
				end
				else begin
					next = t_07;
				end
			end 
			t_08: begin
				if (read_from_spi_awready) begin
					if (read_from_spi_wready) begin
						next = t_10;
					end
					else begin
						next = t_09;
					end
				end
				else begin
					next = t_08;
				end	
			end
			t_09: begin
				if (read_from_spi_wready) begin
					next = t_10;
				end
				else begin
					next = t_09;
				end
			end
			t_10: begin
				if (read_from_spi_awready) begin
					if (read_from_spi_wready) begin
						next = t_12;
					end
					else begin
						next = t_11;
					end
				end
				else begin
					next = t_10;
				end	
			end
			t_11: begin
				if (read_from_spi_wready) begin
					next = t_12;
				end
				else begin
					next = t_11;
				end
			end
			t_12: begin
				if (read_from_spi_awready) begin
					if (read_from_spi_wready) begin
						next = t_14;
					end
					else begin
						next = t_13;
					end
				end
				else begin
					next = t_12;
				end	
			end
			t_13: begin
				if (read_from_spi_wready) begin
					next = t_14;
				end
				else begin
					next = t_13;
				end
			end
			t_14: begin
				if (read_from_spi_awready) begin
					if (read_from_spi_wready) begin
						next = t_16;
					end
					else begin
						next = t_15;
					end
				end
				else begin
					next = t_14;
				end	
			end
			t_15: begin
				if (read_from_spi_wready) begin
					next = t_16;
				end
				else begin
					next = t_15;
				end
			end
			t_16: begin
				if (read_from_spi_awready) begin
					if (read_from_spi_wready) begin
						next = t_18;
					end
					else begin
						next = t_17;
					end
				end
				else begin
					next = t_16;
				end	
			end
			t_17: begin
				if (read_from_spi_wready) begin
					next = t_18;
				end
				else begin
					next = t_17;
				end
			end
			t_18: begin
				if (read_from_spi_awready) begin
					if (read_from_spi_wready) begin
						next = t_20;
					end
					else begin
						next = t_19;
					end
				end
				else begin
					next = t_18;
				end	
			end
			t_19: begin
				if (read_from_spi_wready) begin
					next = t_20;
				end
				else begin
					next = t_19;
				end
			end
			t_20: begin
				if (read_from_spi_awready) begin
					if (read_from_spi_wready) begin
						next = t_22;
					end
					else begin
						next = t_21;
					end
				end
				else begin
					next = t_20;
				end	
			end
			t_21: begin
				if (read_from_spi_wready) begin
					next = t_22;
				end
				else begin
					next = t_21;
				end
			end
			t_22: begin
				if (read_from_spi_awready) begin
					if (read_from_spi_wready) begin
						next = t_24;
					end
					else begin
						next = t_23;
					end
				end
				else begin
					next = t_22;
				end	
			end
			t_23: begin
				if (read_from_spi_wready) begin
					next = t_24;
				end
				else begin
					next = t_23;
				end
			end
			t_24: begin 
				if (rx_fifo_not_empty) begin
					next = t_25;
				end
				else begin
					next = t_24;
				end
			end
			t_25: begin
				if (read_from_spi_awready) begin
					if (read_from_spi_wready) begin
						next = t_27;
					end
					else begin
						next = t_26;
					end
				end
				else begin
					next = t_25;
				end	
			end
			t_26: begin
				if (read_from_spi_wready) begin
					next = t_27;
				end
				else begin
					next = t_26;
				end
			end
			t_27: begin
				if (read_from_spi_awready) begin
					if (read_from_spi_wready) begin
						next = t_29;
					end
					else begin
						next = t_28;
					end
				end
				else begin
					next = t_27;
				end	
			end
			t_28: begin
				if (read_from_spi_wready) begin
					next = t_29;
				end
				else begin
					next = t_28;
				end
			end
			t_29: begin
				if (read_from_spi_awready) begin
					if (read_from_spi_wready) begin
						next = t_31;
					end
					else begin
						next = t_30;
					end
				end
				else begin
					next = t_29;
				end	
			end
			t_30: begin
				if (read_from_spi_wready) begin
					next = t_31;
				end
				else begin
					next = t_30;
				end
			end
			t_31: begin
				if (read_from_spi_arready) begin
					next = t_32;
				end
				else begin
					next = t_31;
				end
			end
			t_32: begin
				if (read_from_spi_rvalid) begin
					if (count==0) begin
						next = t_33;
					end
					else begin
						next = t_31;
					end
				end
				else begin
					next = t_32;
				end
			end
			t_33: begin
				if (read_from_spi_arready) begin
					next = t_34;
				end
				else begin
					next = t_33;
				end
			end
			t_34: begin
				if (read_from_spi_rvalid) begin
					next = t_35;
				end
				else begin
					next = t_34;
				end
			end
			t_35: begin
				if (write_to_ram_init_axi_txn) begin
					next =  t_36;
				end
				else begin
					next = t_35;
				end
			end
			t_36: begin
				if (write_to_ram_awready) begin
					if (write_to_ram_wready) begin
						next = t_00;
					end
					else begin
						next = t_37;
					end
				end
				else begin
					next = t_36;
				end
			end
			t_37: begin
				if (write_to_ram_wready) begin
					next = t_00;
				end
				else begin
					next = t_37;
				end
			end

		default  next = t_00;
		endcase
	end

	// User logic ends

	endmodule

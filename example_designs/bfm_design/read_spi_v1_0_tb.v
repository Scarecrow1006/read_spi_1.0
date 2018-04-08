
`timescale 1 ns / 1 ps

`include "read_spi_v1_0_tb_include.vh"

module read_spi_v1_0_tb;
	reg tb_ACLK;
	reg tb_ARESETn;

	reg Read_from_SPI_INIT_AXI_TXN;
	wire Read_from_SPI_TXN_DONE;
	wire Read_from_SPI_ERROR;

	reg Write_to_RAM_INIT_AXI_TXN;
	wire Write_to_RAM_TXN_DONE;
	wire Write_to_RAM_ERROR;

	// Create an instance of the example tb
	`BD_WRAPPER dut (.ACLK(tb_ACLK),
				.ARESETN(tb_ARESETn),
				.Read_from_SPI_TXN_DONE(Read_from_SPI_TXN_DONE),
				.Read_from_SPI_ERROR(Read_from_SPI_ERROR),
				.Read_from_SPI_INIT_AXI_TXN(Read_from_SPI_INIT_AXI_TXN),
				.Write_to_RAM_TXN_DONE(Write_to_RAM_TXN_DONE),
				.Write_to_RAM_ERROR(Write_to_RAM_ERROR),
				.Write_to_RAM_INIT_AXI_TXN(Write_to_RAM_INIT_AXI_TXN));

	// Simple Reset Generator and test
	initial begin
		tb_ARESETn = 1'b0;
	  #500;
		// Release the reset on the posedge of the clk.
		@(posedge tb_ACLK);
	  tb_ARESETn = 1'b1;
		@(posedge tb_ACLK);
	end

	// Simple Clock Generator
	initial tb_ACLK = 1'b0;
	always #10 tb_ACLK = !tb_ACLK;

	// Drive the BFM
	initial begin
		// Wait for end of reset
		wait(tb_ARESETn === 0) @(posedge tb_ACLK);
		wait(tb_ARESETn === 1) @(posedge tb_ACLK);
		wait(tb_ARESETn === 1) @(posedge tb_ACLK);     
		wait(tb_ARESETn === 1) @(posedge tb_ACLK);     
		wait(tb_ARESETn === 1) @(posedge tb_ACLK);     

		Read_from_SPI_INIT_AXI_TXN = 1'b0;
		#500 Read_from_SPI_INIT_AXI_TXN = 1'b1;

		$display("EXAMPLE TEST Read_from_SPI:");
		wait( Read_from_SPI_TXN_DONE == 1'b1);
		$display("Read_from_SPI: PTGEN_TEST_FINISHED!");
		if ( Read_from_SPI_ERROR ) begin
		  $display("PTGEN_TEST: FAILED!");
		end else begin
		  $display("PTGEN_TEST: PASSED!");
		end

	end

	// Drive the BFM
	initial begin
		// Wait for end of reset
		wait(tb_ARESETn === 0) @(posedge tb_ACLK);
		wait(tb_ARESETn === 1) @(posedge tb_ACLK);
		wait(tb_ARESETn === 1) @(posedge tb_ACLK);     
		wait(tb_ARESETn === 1) @(posedge tb_ACLK);     
		wait(tb_ARESETn === 1) @(posedge tb_ACLK);     

		Write_to_RAM_INIT_AXI_TXN = 1'b0;
		#500 Write_to_RAM_INIT_AXI_TXN = 1'b1;

		$display("EXAMPLE TEST Write_to_RAM:");
		wait( Write_to_RAM_TXN_DONE == 1'b1);
		$display("Write_to_RAM: PTGEN_TEST_FINISHED!");
		if ( Write_to_RAM_ERROR ) begin
		  $display("PTGEN_TEST: FAILED!");
		end else begin
		  $display("PTGEN_TEST: PASSED!");
		end

	end

endmodule

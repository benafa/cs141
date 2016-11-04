`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:55:51 11/04/2016
// Design Name:   synth_dual_port_memory
// Module Name:   C:/Users/cs141/cs141/lab4-start/memory_testbench.v
// Project Name:  lab4-start
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: synth_dual_port_memory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module memory_testbench;

	// Inputs
	reg clk;
	reg rstb;
	reg wr_ena0;
	reg [31:0] addr0;
	reg [31:0] din0;
	reg wr_ena1;
	reg [31:0] addr1;
	reg [31:0] din1;

	// Outputs
	wire error;
	wire [31:0] dout0;
	wire [31:0] dout1;

	// Instantiate the Unit Under Test (UUT)
	synth_dual_port_memory uut (
		.clk(clk), 
		.rstb(rstb), 
		.error(error), 
		.wr_ena0(wr_ena0), 
		.addr0(addr0), 
		.din0(din0), 
		.dout0(dout0), 
		.wr_ena1(wr_ena1), 
		.addr1(addr1), 
		.din1(din1), 
		.dout1(dout1)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rstb = 0;
		wr_ena0 = 0;
		addr0 = 0;
		din0 = 0;
		wr_ena1 = 0;
		addr1 = 0;
		din1 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		addr0 = 32'h00400000; #20;
		addr0 = 32'h00400004; #20;

	end
	
	//simulating the clock
	always #5 clk = !clk;
      
endmodule


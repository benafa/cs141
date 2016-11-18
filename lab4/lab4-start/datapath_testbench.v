`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:28:21 11/04/2016
// Design Name:   mips_datapath
// Module Name:   C:/Users/cs141/cs141/lab4-start/datapath_testbench.v
// Project Name:  lab4-start
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mips_datapath
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module datapath_testbench;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire Error;
	wire [31:0] instr, PC_out;
	wire [4:0] state;

	// Instantiate the Unit Under Test (UUT)
	mips_datapath uut (
		.clk(clk), 
		.rst(rst), 
		.Error(Error), 
		.instr(instr), 
		.PC_out(PC_out), 
		.state(state)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		rst = 1; #100;
		rst = 0; #2000;
	end

	//simulating the clock
	always #5 clk = !clk;
      
endmodule


`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    register 
// Author(s): Patrick Hansen & Ben Anadappa
// Description: Stores a number of bits according to the parameter SIZE. On a positive
//					 edge of the clock the register can either reset itself to 0 or write
//					 data D into memory if enable is active.
//
//////////////////////////////////////////////////////////////////////////////////
module register(rst, ena, clk, D, Q);

	//parameter definitions
	parameter SIZE = 2;
	
	//port definitions
	input wire rst, clk, ena;
	input wire [(SIZE - 1):0] D;
	output reg [(SIZE - 1):0] Q;
	
	//sequential logic
	always @(posedge clk) begin
		if (rst)
			Q <= 0;
		else if (ena)
			Q <= D;
	end

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire

`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    equals 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module equals(A,B,Z);

	//parameter definitions
	parameter N = 32;
	
	//port definitions - customize for different bit widths
	input  wire [(N - 1):0] A, B;
	output wire Z;
	
	wire [(N - 1):0] C;
	
	assign C = A ^ ~(B);
	assign Z = &C;

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire

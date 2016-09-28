`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    carry_cause 
// Author(s): Patrick Hansen & Ben Anadappa
// Description: Determines if two bits would cause a carry signal, and outputs
//					 a carry generate and carry propagate signal.
//
//////////////////////////////////////////////////////////////////////////////////
module carry_cause(A,B,G,P);

	//port definitions - customize for different bit widths
	input  wire A, B;
	output wire G, P;
	
	//calculate generate and propogate
	assign G = A & B;
	assign P = A ^ B;

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire

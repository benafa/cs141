`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    full_adder 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module full_adder(A,B,C_in,S,C_out);

	//parameter definitions

	//port definitions - customize for different bit widths
	input  wire A,B,C_in;
	output wire S,C_out;
	
	assign S = (A ^ B) ^ C_in;
	assign C_out = (A & B) | (A & C_in) | (B & C_in);

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire

`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    or32 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module or32(X,Y,Z);

	//parameter definitions
	parameter LENGTH = 32;

	//port definitions
	input  wire [LENGTH-1:0] X;
	input  wire [LENGTH-1:0] Y;
	output wire [LENGTH-1:0] Z;
	
	assign Z = X | Y;


endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire

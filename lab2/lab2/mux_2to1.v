`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    mux_2to1 
// Author(s): Patrick Hansen & Ben Anadappa
// Description: Takes in two inputs, X and Y, and outputs X if S==0 or Y if s==1
//
//////////////////////////////////////////////////////////////////////////////////
module mux_2to1(X,Y,S,Z);

	//parameter definitions
	parameter N = 32;

	//port definitions
	input wire [(N - 1):0] X, Y;
	input wire S;
	output wire [(N - 1):0] Z;
	
	//assign output using multiplexing operator
	assign Z = S ? Y : X;

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire

`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    shift_left 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module shift_left(X, Y);
	
	//parameter definitions
	parameter START = 32;
	parameter END = 32;
	parameter SHAMT = 2;
	parameter TRIMMED = END - SHAMT;
	
	input wire [START-1:0] X;
	output wire [END-1:0] Y;
	
	assign Y = {X[TRIMMED-1:0], {SHAMT{1'b0}}};


endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire

`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    srl_mux_2to1 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module shift_mux_2to1(X,Y,S,Z);

	//parameter definitions

	//port definitions - customize for different bit widths

	//port definitions
	input wire X, Y;
	input wire S;
	output wire Z;
	
	//assign output using multiplexing operator
	assign Z = S ? Y : X;
endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire

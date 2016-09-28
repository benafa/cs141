`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    carry_lookahead_unit_2 
// Author(s): Patrick Hansen & Ben Anadappa
// Description: Calculates the carry outputs from carry generate and carry propagate
//					 signals from two adders of an unspecified size.
//
//////////////////////////////////////////////////////////////////////////////////
module carry_lookahead_unit_2(P,G,C_in,C);

	//port definitions
	input wire [1:0] P, G;
	input wire C_in;
	output wire [1:0] C;
	
	//calculate C
	assign C[0] = G[0] | (P[0] & C_in);
	assign C[1] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C_in);

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire

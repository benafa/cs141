`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    carry_lookahead_unit_4
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module carry_lookahead_unit_4(P,G,C_in,Pg,Gg,C);

	//parameter definitions

	//port definitions - customize for different bit widths
	//calculate C
	input wire [3:0] P, G;
	input wire C_in;
	output wire [3:0] C;
	output wire Pg, Gg;
	
	//calculate C
	assign C[0] = G[0] | (P[0] & C_in);
	assign C[1] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C_in);
	assign C[2] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C_in);
	assign C[3] = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & C_in);
	
	//calculate group carries
	assign Pg = &P;
	assign Gg = G[3] | (G[2] & P[3]) | (G[1] & P[3] & P[2]) | (G[0] & P[3] & P[2] & P[1]);

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire

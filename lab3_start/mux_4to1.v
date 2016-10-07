`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    mux_4to1 
// Author(s): Patrick Hansen & Ben Anadappa
// Description: Takes in 4 inputs, A B C and D, and outputs one of them depending on (S[1],S[0])
//							A if (0,0)
//							B if (0,1)
//							C if (1,0)
//							D if (1,1)
//
//////////////////////////////////////////////////////////////////////////////////
module mux_4to1(A,B,C,D,Z,S);

	//parameter definitions
	parameter N = 8;

	//port definitions
	input  wire [(N - 1):0] A,B,C,D;
	output wire [(N - 1):0] Z;
	input  wire [1:0] S;
	wire [(N - 1):0] z0,z1;
	
	//first layer of multiplexing
	mux_2to1 #(.N(N)) MUX_A (.X(A), .Y(B), .S(S[0]), .Z(z0));
	mux_2to1 #(.N(N)) MUX_B (.X(C), .Y(D), .S(S[0]), .Z(z1));
	
	//second level
	mux_2to1 #(.N(N)) MUX_C (.X(z0), .Y(z1), .S(S[1]), .Z(Z));


endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire

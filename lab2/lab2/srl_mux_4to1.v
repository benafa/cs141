`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    srl_mux_4to1 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module srl_mux_4to1(A,B,C,D,Z,S);

	//parameter definitions

	//port definitions - customize for different bit widths

	//port definitions
	input  wire A,B,C,D;
	output wire Z;
	input  wire [1:0] S;
	wire z0,z1;
	
	//first layer of multiplexing
	srl_mux_2to1 MUX_A (.X(A), .Y(B), .S(S[0]), .Z(z0));
	srl_mux_2to1 MUX_B (.X(C), .Y(D), .S(S[0]), .Z(z1));
	
	//second level
	srl_mux_2to1 MUX_C (.X(z0), .Y(z1), .S(S[1]), .Z(Z));

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire

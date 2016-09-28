`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    mux_16to1 
// Author(s): Patrick Hansen & Ben Anadappa
// Description: Takes in 4 inputs and outputs one of them depending on (S[3],S[2],S[1],S[0])
//
//////////////////////////////////////////////////////////////////////////////////
module mux_16to1(in0,in1,in2,in3,in4,in5,in6,in7,in8,
					  in9,in10,in11,in12,in13,in14,in15,S,Z);

	//parameter definitions
	parameter N = 32;

	//port definitions - customize for different bit widths
	input  wire [(N - 1):0] in0, in1, in2, in3, in4, in5, in6, in7,
									 in8, in9, in10, in11, in12, in13, in14, in15;
	input  wire [3:0] S;
	output wire [(N - 1):0] Z;

	wire [(N - 1):0] z0,z1,z2,z3;
	
	//first level of 4:1 mux
	mux_4to1 #(.N(N)) MUX_0 (.A(in0), .B(in1), .C(in2), .D(in3), .S(S[1:0]), .Z(z0));
	mux_4to1 #(.N(N)) MUX_1 (.A(in4), .B(in5), .C(in6), .D(in7), .S(S[1:0]), .Z(z1));
	mux_4to1 #(.N(N)) MUX_2 (.A(in8), .B(in9), .C(in10), .D(in11), .S(S[1:0]), .Z(z2));
	mux_4to1 #(.N(N)) MUX_3 (.A(in12), .B(in13), .C(in14), .D(in15), .S(S[1:0]), .Z(z3));
	
	//second level
	mux_4to1 #(.N(N)) MUX_4 (.A(z0), .B(z1), .C(z2), .D(z3), .S(S[3:2]), .Z(Z));
	
endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire

`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    mux_8to1 
// Author(s): Patrick Hansen & Ben Anadappa
// Description: Takes in 8 inputs and outputs one of them depending on S
//
//////////////////////////////////////////////////////////////////////////////////
module mux_8to1(in0,in1,in2,in3,in4,in5,in6,in7,S,Z);

	//parameter definitions
	parameter N = 8;

	//port definitions - customize for different bit widths
	input  wire [(N - 1):0] in0, in1, in2, in3, in4, in5, in6, in7;
	input  wire [2:0] S;
	output wire [(N - 1):0] Z;

	wire [(N - 1):0] z0,z1;
	
	//first level of 4:1 mux
	mux_4to1 #(.N(N)) MUX_0 (.A(in0), .B(in1), .C(in2), .D(in3), .S(S[1:0]), .Z(z0));
	mux_4to1 #(.N(N)) MUX_1 (.A(in4), .B(in5), .C(in6), .D(in7), .S(S[1:0]), .Z(z1));
	
	//second level
	mux_2to1 #(.N(N)) MUX_2 (.X(z0), .Y(z1), .S(S[2]), .Z(Z));
	
endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire

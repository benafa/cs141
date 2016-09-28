`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    add_sub_32b 
// Author(s): Patrick Hansen & Ben Anadappa
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module add_sub_32b(X,Y,sub,S,overflow);

	//port definitions
	input wire [31:0] X, Y;
	input wire sub;
	output wire [31:0] S;
	output wire overflow;
	wire [31:0] invert_Y;
	
	//mux controling inversion of Y and C_in
	input_inversion INVERT (.Y(Y),.sub(sub),.invert_Y(invert_Y));
	
	//instantiate CLA
	carry_lookahead_adder_32b ADD_SUB (.A(X),.B(invert_Y),.C_in(sub),.S(S),.overflow(overflow));

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire

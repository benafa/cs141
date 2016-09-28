`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    input_inversion 
// Author(s): Patrick Hansen & Ben Anadappa
// Description: This is the mechanism that inverts Y and C_in to the
//					 adder/subtractor depending on op_code.
//
//
//////////////////////////////////////////////////////////////////////////////////
module input_inversion(Y,sub,invert_Y);

	//parameter definitions
	
	//port definitions - customize for different bit widths
	input wire [31:0] Y;
	input wire sub;
	output wire [31:0] invert_Y;
	
	mux_2to1 #(.N(32)) ADD_SUB_MUX (.X(Y),.Y(~Y),.S(sub),.Z(invert_Y));

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire

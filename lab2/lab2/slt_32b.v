`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    slt_32b 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module slt_32b(S, Z);

	//parameter definitions
	parameter N = 32;

	//port definitions
	output wire [(N - 1):0] Z;
	input wire S;
	wire Less, More;
	
	assign Less = 32'b00000000000000000000000000000001; 
	assign More = 32'b00000000000000000000000000000000;
	
	//assign output using multiplexing operator
	assign Z = S ? Less : More;


endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire

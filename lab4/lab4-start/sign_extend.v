`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    sign_extend
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module sign_extend(unextended, extended);

	//parameter definitions
	parameter START = 5;
	parameter END = 32;
	parameter DELTA = END - START;
	
	input wire [START-1:0] unextended;
	output wire [END-1:0] extended;
	
	assign extended = {{DELTA{unextended[START-1]}}, unextended};

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire

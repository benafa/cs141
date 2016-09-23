`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    ripple_carry_adder_4b 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module ripple_carry_adder_4b(A,B,S,C_in,C_out,Y);

	//parameter definitions

	//port definitions - customize for different bit widths
	input  wire [3:0] A,B;
	input  wire C_in;
	output wire [3:0] S;
	output wire C_out;
	output wire Y;
	
	wire C_out0, C_out1, C_out2;
	
	full_adder ADD_0 (.A(A[0]),.B(B[0]),.C_in(C_in),.S(S[0]),.C_out(C_out0));
	full_adder ADD_1 (.A(A[1]),.B(B[1]),.C_in(C_out0),.S(S[1]),.C_out(C_out1));
	full_adder ADD_2 (.A(A[2]),.B(B[2]),.C_in(C_out1),.S(S[2]),.C_out(C_out2));
	
	assign Y = C_out2;
	
	full_adder ADD_3 (.A(A[3]),.B(B[3]),.C_in(C_out2),.S(S[3]),.C_out(C_out));

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire

`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    carry_lookahead_adder_32b 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module carry_lookahead_adder_32b(A,B,C_in,S,overflow);

	//parameter definitions

	//port definitions - customize for different bit widths
	input wire [31:0] A, B;
	input wire C_in;
	output wire [31:0] S;
	output wire overflow;
	
	wire [1:0] P, G, C;
	
	//instantiate 4 4-bit adders
	carry_lookahead_adder_16b ADD16b_0 (.A(A[15:0]),.B(B[15:0]),.C_in(C_in),.S(S[15:0]),.Pg(P[0]),.Gg(G[0]),.overflow());
	carry_lookahead_adder_16b ADD16b_1 (.A(A[31:16]),.B(B[31:16]),.C_in(C[0]),.S(S[31:16]),.Pg(P[1]),.Gg(G[1]),.overflow(overflow));

	//CLU to connect them
	carry_lookahead_unit_2 CLU (.P(P),.G(G),.C_in(C_in),.C(C));
	
endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire

`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    carry_lookahead_adder_16b 
// Author(s): Patrick Hansen & Ben Anadappa
// Description: Adds two 16-bit integers and outputs the sum, signals any
//					 overflow, and outputsgroup propagate and generate signals.
//
//////////////////////////////////////////////////////////////////////////////////
module carry_lookahead_adder_16b(A,B,C_in,S,Pg,Gg,overflow);

	//port definitions - customize for different bit widths
	input wire [15:0] A, B;
	input wire C_in;
	output wire [15:0] S;
	output wire Pg, Gg, overflow;
	wire [3:0] P, G, C;
	
	//instantiate 4 4-bit adders
	carry_lookahead_adder_4b ADD4b_0 (.A(A[3:0]),.B(B[3:0]),.C_in(C_in),.S(S[3:0]),.Pg(P[0]),.Gg(G[0]),.overflow());
	carry_lookahead_adder_4b ADD4b_1 (.A(A[7:4]),.B(B[7:4]),.C_in(C[0]),.S(S[7:4]),.Pg(P[1]),.Gg(G[1]),.overflow());
	carry_lookahead_adder_4b ADD4b_2 (.A(A[11:8]),.B(B[11:8]),.C_in(C[1]),.S(S[11:8]),.Pg(P[2]),.Gg(G[2]),.overflow());
	carry_lookahead_adder_4b ADD4b_3 (.A(A[15:12]),.B(B[15:12]),.C_in(C[2]),.S(S[15:12]),.Pg(P[3]),.Gg(G[3]),.overflow(overflow));
	
	//CLU to connect them
	carry_lookahead_unit_4 CLU (.P(P),.G(G),.C_in(C_in),.Pg(Pg),.Gg(Gg),.C(C));

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire

`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    carry_lookahead_adder_4b 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module carry_lookahead_adder_4b(A,B,C_in,S,Pg,Gg,overflow);

	//parameter definitions

	//port definitions - customize for different bit widths
	input wire [3:0] A, B;
	input wire C_in;
	output wire [3:0] S;
	output wire Pg, Gg, overflow;
	
	wire [3:0] P, G, C;
	
	//A,B --> P,G
	carry_cause CC0 (.A(A[0]), .B(B[0]), .G(G[0]), .P(P[0]));
	carry_cause CC1 (.A(A[1]), .B(B[1]), .G(G[1]), .P(P[1]));
	carry_cause CC2 (.A(A[2]), .B(B[2]), .G(G[2]), .P(P[2]));
	carry_cause CC3 (.A(A[3]), .B(B[3]), .G(G[3]), .P(P[3]));
	
	//instantiate CLU
	carry_lookahead_unit_4 CLU (.P(P),.G(G),.C_in(C_in),.Pg(Pg),.Gg(Gg),.C(C));
	
	//calculate S
	assign S[0] = C_in ^ P[0];
	assign S[1] = C[0] ^ P[1];
	assign S[2] = C[1] ^ P[2];
	assign S[3] = C[2] ^ P[3];
	
	assign overflow = C[3] ^ C[2];

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire

`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    ripple_carry_adder_32b 
// Author(s): Patrick Hansen & Ben Anadappa
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module ripple_carry_adder_32b(A,B,S,overflow);

	//parameter definitions

	//port definitions - customize for different bit widths
	input  wire [31:0] A,B;
	output wire [31:0] S;
	output wire overflow;
	
	wire C_in, Y;
	wire [7:0] C_out;
	
	assign C_in = 0;
	
	ripple_carry_adder_4b ADD_4b_0 (.A(A[3:0]),.B(B[3:0]),.S(S[3:0]),.C_in(C_in),.C_out(C_out[0]), .Y());
	ripple_carry_adder_4b ADD_4b_1 (.A(A[7:4]),.B(B[7:4]),.S(S[7:4]),.C_in(C_out[0]),.C_out(C_out[1]), .Y());
	ripple_carry_adder_4b ADD_4b_2 (.A(A[11:8]),.B(B[11:8]),.S(S[11:8]),.C_in(C_out[1]),.C_out(C_out[2]), .Y());
	ripple_carry_adder_4b ADD_4b_3 (.A(A[15:12]),.B(B[15:12]),.S(S[15:12]),.C_in(C_out[2]),.C_out(C_out[3]), .Y());
	ripple_carry_adder_4b ADD_4b_4 (.A(A[19:16]),.B(B[19:16]),.S(S[19:16]),.C_in(C_out[3]),.C_out(C_out[4]), .Y());
	ripple_carry_adder_4b ADD_4b_5 (.A(A[23:20]),.B(B[23:20]),.S(S[23:20]),.C_in(C_out[4]),.C_out(C_out[5]), .Y());
	ripple_carry_adder_4b ADD_4b_6 (.A(A[27:24]),.B(B[27:24]),.S(S[27:24]),.C_in(C_out[5]),.C_out(C_out[6]), .Y());
	ripple_carry_adder_4b ADD_4b_7 (.A(A[31:28]),.B(B[31:28]),.S(S[31:28]),.C_in(C_out[6]),.C_out(C_out[7]), .Y(Y));
	
	assign overflow = C_out[7] ^ Y;

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire

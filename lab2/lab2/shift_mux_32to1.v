`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    shift_smux_32to1 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module shift_mux_32to1(X0, X1, X2, X3, X4, X5, X6, X7, X8, X9, X10, X11, X12, X13, X14, X15, X16, X17, X18, X19, X20, X21, X22, X23,
									X24, X25, X26, X27, X28, X29, X30, X31, Y, S);

	//parameter definitions
	input wire X0, X1, X2, X3, X4, X5, X6, X7, X8, X9, X10, X11, X12, X13, X14, X15, X16, X17, X18, X19, X20, X21, X22, X23,
									X24, X25, X26, X27, X28, X29, X30, X31;
	input wire [4:0] Y;
	output wire S;
	wire z0, z1;
	
	//port definitions - customize for different bit widths
	shift_mux_16to1 MUXA (.in0(X0),
							.in1(X1),
							.in2(X2),
							.in3(X3),
							.in4(X4),
							.in5(X5),
							.in6(X6),
							.in7(X7),
							.in8(X8),
							.in9(X9),
							.in10(X10),
							.in11(X11),
							.in12(X12),
							.in13(X13),
							.in14(X14),
							.in15(X15),
							.S(Y[3:0]),
							.Z(z0));
							
	shift_mux_16to1 MUXB  (.in0(X16),
							.in1(X17),
							.in2(X18),
							.in3(X19),
							.in4(X20),
							.in5(X21),
							.in6(X22),
							.in7(X23),
							.in8(X24),
							.in9(X25),
							.in10(X26),
							.in11(X27),
							.in12(X28),
							.in13(X29),
							.in14(X30),
							.in15(X31),
							.S(Y[3:0]),
							.Z(z1));					

	shift_mux_2to1 MUXC (.X(z0), .Y(z1), .S(Y[4]), .Z(S));
endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire

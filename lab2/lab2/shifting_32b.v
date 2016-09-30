`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    shifting_32b 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module srl_unit(X0, X1, X2, X3, X4, X5, X6, X7, X8, X9, X10, X11, X12, X13, X14, X15, X16, X17, X18, X19, X20, X21, X22, X23,
									X24, X25, X26, X27, X28, X29, X30, X31, Y, S);

	//port definitions
	input wire X0, X1, X2, X3, X4, X5, X6, X7, X8, X9, X10, X11, X12, X13, X14, X15, X16, X17, X18, X19, X20, X21, X22, X23,
									X24, X25, X26, X27, X28, X29, X30, X31;
	input wire [4:0] Y;
	output wire [31:0] S;
	
	shift_mux_32to1 DIGIT_0 (.X0(X0), .X1(X1), .X2(X2), .X3(X3), .X4(X4), .X5(X5), .X6(X6), .X7(X7), .X8(X8), .X9(X9), .X10(X10), 
										.X11(X11), .X12(X12), .X13(X13), .X14(X14), .X15(X15), .X16(X16), .X17(X17), .X18(X18), .X19(X19),
										.X20(X20), .X21(X21), .X22(X22), .X23(X23), .X24(X24), .X25(X25), .X26(X26), .X27(X27), 
										.X28(X28), .X29(X29), .X30(X30), .X31(X31), .Y(Y), .S(S[0]));
	shift_mux_32to1 DIGIT_1 (.X0(X1), .X1(X2), .X2(X3), .X3(X4), .X4(X5), .X5(X6), .X6(X7), .X7(X8), .X8(X9), .X9(X10), .X10(X11), 
										.X11(X12), .X12(X13), .X13(X14), .X14(X15), .X15(X16), .X16(X17), .X17(X18), .X18(X19), .X19(X20),
										.X20(X21), .X21(X22), .X22(X23), .X23(X24), .X24(X25), .X25(X26), .X26(X27), .X27(X28), 
										.X28(X29), .X29(X30), .X30(X31), .X31(1'b0), .Y(Y), .S(S[1]));
	shift_mux_32to1 DIGIT_2 (.X0(X2), .X1(X3), .X2(X4), .X3(X5), .X4(X6), .X5(X7), .X6(X8), .X7(X9), .X8(X10), .X9(X11), .X10(X12), 
										.X11(X13), .X12(X14), .X13(X15), .X14(X16), .X15(X17), .X16(X18), .X17(X19), .X18(X20), .X19(X21),
										.X20(X22), .X21(X23), .X22(X24), .X23(X25), .X24(X26), .X25(X27), .X26(X28), .X27(X29), 
										.X28(X30), .X29(X31), .X30(1'b0), .X31(1'b0),.Y(Y), .S(S[2]));
	shift_mux_32to1 DIGIT_3 (.X0(X3), .X1(X4), .X2(X5), .X3(X6), .X4(X7), .X5(X8), .X6(X9), .X7(X10), .X8(X11), .X9(X12), .X10(X13), 
										.X11(X14), .X12(X15), .X13(X16), .X14(X17), .X15(X18), .X16(X19), .X17(X20), .X18(X21), .X19(X22),
										.X20(X23), .X21(X24), .X22(X25), .X23(X26), .X24(X27), .X25(X28), .X26(X29), .X27(X30), 
										.X28(X31), .X29(1'b0), .X30(1'b0), .X31(1'b0), .Y(Y), .S(S[3]));
	shift_mux_32to1 DIGIT_4 (.X0(X4), .X1(X5), .X2(X6), .X3(X7), .X4(X8), .X5(X9), .X6(X10), .X7(X11), .X8(X12), .X9(X13), .X10(X14), 
										.X11(X15), .X12(X16), .X13(X17), .X14(X18), .X15(X19), .X16(X20), .X17(X21), .X18(X22), .X19(X23),
										.X20(X24), .X21(X25), .X22(X26), .X23(X27), .X24(X28), .X25(X29), .X26(X30), .X27(X31), 
										.X28(1'b0), .X29(1'b0), .X30(1'b0), .X31(1'b0), .Y(Y), .S(S[4]));
	shift_mux_32to1 DIGIT_5 (.X0(X5), .X1(X6), .X2(X7), .X3(X8), .X4(X9), .X5(X10), .X6(X11), .X7(X12), .X8(X13), .X9(X14), .X10(X15), 
										.X11(X16), .X12(X17), .X13(X18), .X14(X19), .X15(X20), .X16(X21), .X17(X22), .X18(X23), .X19(X24),
										.X20(X25), .X21(X26), .X22(X27), .X23(X28), .X24(X29), .X25(X30), .X26(X31), .X27(1'b0), 
										.X28(1'b0), .X29(1'b0), .X30(1'b0), .X31(1'b0),  .Y(Y), .S(S[5]));
	shift_mux_32to1 DIGIT_6 (.X0(X6), .X1(X7), .X2(X8), .X3(X9), .X4(X10), .X5(X11), .X6(X12), .X7(X13), .X8(X14), .X9(X15), .X10(X16), 
										.X11(X17), .X12(X18), .X13(X19), .X14(X20), .X15(X21), .X16(X22), .X17(X23), .X18(X24), .X19(X24),
										.X20(X26), .X21(X27), .X22(X27), .X23(X29), .X24(X30), .X25(X31), .X26(1'b0), .X27(1'b0), 
										.X28(1'b0), .X29(1'b0), .X30(1'b0), .X31(1'b0), .Y(Y), .S(S[6]));
	shift_mux_32to1 DIGIT_7 (.X0(X7), .X1(X8), .X2(X9), .X3(X10), .X4(X11), .X5(X12), .X6(X13), .X7(X14), .X8(X15), .X9(X16), .X10(X17), 
										.X11(X18), .X12(X19), .X13(X20), .X14(X21), .X15(X22), .X16(X23), .X17(X24), .X18(X25), .X19(X26),
										.X20(X27), .X21(X28), .X22(X29), .X23(X30), .X24(X31), .X25(1'b0), .X26(1'b0), .X27(1'b0), 
										.X28(1'b0), .X29(1'b0), .X30(1'b0), .X31(1'b0), .Y(Y), .S(S[7]));
	shift_mux_32to1 DIGIT_8 (.X0(X8), .X1(X9), .X2(X10), .X3(X11), .X4(X12), .X5(X13), .X6(X14), .X7(X15), .X8(X16), .X9(X17), .X10(X18), 
										.X11(X19), .X12(X20), .X13(X21), .X14(X22), .X15(X23), .X16(X24), .X17(X25), .X18(X26), .X19(X27),
										.X20(X28), .X21(X29), .X22(X30), .X23(X31), .X24(1'b0), .X25(1'b0), .X26(1'b0), .X27(1'b0), 
										.X28(1'b0), .X29(1'b0), .X30(1'b0), .X31(1'b0), .Y(Y), .S(S[8]));
	shift_mux_32to1 DIGIT_9 (.X0(X9), .X1(X10), .X2(X11), .X3(X12), .X4(X13), .X5(X14), .X6(X15), .X7(X16), .X8(X17), .X9(X18), .X10(X19), 
										.X11(X20), .X12(X21), .X13(X22), .X14(X23), .X15(X24), .X16(X25), .X17(X26), .X18(X27), .X19(X28),
										.X20(X29), .X21(X30), .X22(X31), .X23(1'b0), .X24(1'b0), .X25(1'b0), .X26(1'b0), .X27(1'b0), 
										.X28(1'b0), .X29(1'b0), .X30(1'b0), .X31(1'b0),  .Y(Y), .S(S[9]));
	shift_mux_32to1 DIGIT_10 (.X0(X10), .X1(X11), .X2(X12), .X3(X13), .X4(X14), .X5(X15), .X6(X16), .X7(X17), .X8(X18), .X9(X19), .X10(X20), 
										.X11(X21), .X12(X22), .X13(X23), .X14(X24), .X15(X25), .X16(X26), .X17(X27), .X18(X28), .X19(X29),
										.X20(X30), .X21(X31), .X22(1'b0), .X23(1'b0), .X24(1'b0), .X25(1'b0), .X26(1'b0), .X27(1'b0), 
										.X28(1'b0), .X29(1'b0), .X30(1'b0), .X31(1'b0), .Y(Y), .S(S[10]));
	shift_mux_32to1 DIGIT_11 (.X0(X11), .X1(X12), .X2(X13), .X3(X14), .X4(X15), .X5(X16), .X6(X17), .X7(X18), .X8(X19), .X9(X20), .X10(X21), 
										.X11(X22), .X12(X23), .X13(X24), .X14(X25), .X15(X26), .X16(X27), .X17(X28), .X18(X29), .X19(X30),
										.X20(X31), .X21(1'b0), .X22(1'b0), .X23(1'b0), .X24(1'b0), .X25(1'b0), .X26(1'b0), .X27(1'b0), 
										.X28(1'b0), .X29(1'b0), .X30(1'b0), .X31(1'b0), .Y(Y), .S(S[11]));
	shift_mux_32to1 DIGIT_12 (.X0(X12), .X1(X13), .X2(X14), .X3(X15), .X4(X16), .X5(X17), .X6(X18), .X7(X19), .X8(X20), .X9(X21), .X10(X22), 
										.X11(X23), .X12(X24), .X13(X25), .X14(X26), .X15(X27), .X16(X28), .X17(X29), .X18(X30), .X19(X31),
										.X20(1'b0), .X21(1'b0), .X22(1'b0), .X23(1'b0), .X24(1'b0), .X25(1'b0), .X26(1'b0), .X27(1'b0), 
										.X28(1'b0), .X29(1'b0), .X30(1'b0), .X31(1'b0), .Y(Y), .S(S[12]));
	shift_mux_32to1 DIGIT_13 (.X0(X13), .X1(X14), .X2(X15), .X3(X16), .X4(X17), .X5(X18), .X6(X19), .X7(X20), .X8(X21), .X9(X22), .X10(X23), 
										.X11(X24), .X12(X25), .X13(X26), .X14(X27), .X15(X28), .X16(X29), .X17(X30), .X18(X31), .X19(1'b0),
										.X20(1'b0), .X21(1'b0), .X22(1'b0), .X23(1'b0), .X24(1'b0), .X25(1'b0), .X26(1'b0), .X27(1'b0), 
										.X28(1'b0), .X29(1'b0), .X30(1'b0), .X31(1'b0), .Y(Y), .S(S[13]));
	shift_mux_32to1 DIGIT_14 (.X0(X14), .X1(X15), .X2(X16), .X3(X17), .X4(X18), .X5(X19), .X6(X20), .X7(X21), .X8(X22), .X9(X23), .X10(X24), 
										.X11(X25), .X12(X26), .X13(X27), .X14(X28), .X15(X29), .X16(X30), .X17(X31), .X18(1'b0), .X19(1'b0),
										.X20(1'b0), .X21(1'b0), .X22(1'b0), .X23(1'b0), .X24(1'b0), .X25(1'b0), .X26(1'b0), .X27(1'b0), 
										.X28(1'b0), .X29(1'b0), .X30(1'b0), .X31(1'b0), .Y(Y), .S(S[14]));
	shift_mux_32to1 DIGIT_15 (.X0(X15), .X1(X16), .X2(X17), .X3(X18), .X4(X19), .X5(X20), .X6(X21), .X7(X22), .X8(X23), .X9(X24), .X10(X25), 
										.X11(X26), .X12(X27), .X13(X28), .X14(X29), .X15(X30), .X16(X31), .X17(1'b0), .X18(1'b0), .X19(1'b0),
										.X20(1'b0), .X21(1'b0), .X22(1'b0), .X23(1'b0), .X24(1'b0), .X25(1'b0), .X26(1'b0), .X27(1'b0), 
										.X28(1'b0), .X29(1'b0), .X30(1'b0), .X31(1'b0), .Y(Y), .S(S[15]));
	shift_mux_32to1 DIGIT_16 (.X0(X16), .X1(X17), .X2(X18), .X3(X19), .X4(X20), .X5(X21), .X6(X22), .X7(X23), .X8(X24), .X9(X25), .X10(X26), 
										.X11(X27), .X12(X28), .X13(X29), .X14(X30), .X15(X31), .X16(1'b0), .X17(1'b0), .X18(1'b0), .X19(1'b0),
										.X20(1'b0), .X21(1'b0), .X22(1'b0), .X23(1'b0), .X24(1'b0), .X25(1'b0), .X26(1'b0), .X27(1'b0), 
										.X28(1'b0), .X29(1'b0), .X30(1'b0), .X31(1'b0), .Y(Y), .S(S[16]));
	shift_mux_32to1 DIGIT_17 (.X0(X17), .X1(X18), .X2(X19), .X3(X20), .X4(X21), .X5(X22), .X6(X23), .X7(X24), .X8(X25), .X9(X26), .X10(X27), 
										.X11(X28), .X12(X29), .X13(X30), .X14(X31), .X15(1'b0), .X16(1'b0), .X17(1'b0), .X18(1'b0), .X19(1'b0),
										.X20(1'b0), .X21(1'b0), .X22(1'b0), .X23(1'b0), .X24(1'b0), .X25(1'b0), .X26(1'b0), .X27(1'b0), 
										.X28(1'b0), .X29(1'b0), .X30(1'b0), .X31(1'b0),  .Y(Y), .S(S[17]));
	shift_mux_32to1 DIGIT_18 (.X0(X18), .X1(X19), .X2(X20), .X3(X21), .X4(X22), .X5(X23), .X6(X24), .X7(X25), .X8(X26), .X9(X27), .X10(X28), 
										.X11(X29), .X12(X30), .X13(X31), .X14(1'b0), .X15(1'b0), .X16(1'b0), .X17(1'b0), .X18(1'b0), .X19(1'b0),
										.X20(1'b0), .X21(1'b0), .X22(1'b0), .X23(1'b0), .X24(1'b0), .X25(1'b0), .X26(1'b0), .X27(1'b0), 
										.X28(1'b0), .X29(1'b0), .X30(1'b0), .X31(1'b0), .Y(Y), .S(S[18]));
	shift_mux_32to1 DIGIT_19 (.X0(X19), .X1(X20), .X2(X21), .X3(X22), .X4(X23), .X5(X24), .X6(X25), .X7(X26), .X8(X27), .X9(X28), .X10(X29), 
										.X11(X30), .X12(X31), .X13(1'b0), .X14(1'b0), .X15(1'b0), .X16(1'b0), .X17(1'b0), .X18(1'b0), .X19(1'b0),
										.X20(1'b0), .X21(1'b0), .X22(1'b0), .X23(1'b0), .X24(1'b0), .X25(1'b0), .X26(1'b0), .X27(1'b0), 
										.X28(1'b0), .X29(1'b0), .X30(1'b0), .X31(1'b0), .Y(Y), .S(S[19]));
	shift_mux_32to1 DIGIT_20 (.X0(X20), .X1(X21), .X2(X22), .X3(X23), .X4(X24), .X5(X25), .X6(X26), .X7(X27), .X8(X28), .X9(X29), .X10(X30), 
										.X11(X31), .X12(1'b0), .X13(1'b0), .X14(1'b0), .X15(1'b0), .X16(1'b0), .X17(1'b0), .X18(1'b0), .X19(1'b0),
										.X20(1'b0), .X21(1'b0), .X22(1'b0), .X23(1'b0), .X24(1'b0), .X25(1'b0), .X26(1'b0), .X27(1'b0), 
										.X28(1'b0), .X29(1'b0), .X30(1'b0), .X31(1'b0),.Y(Y), .S(S[20]));
	shift_mux_32to1 DIGIT_21 (.X0(X21), .X1(X22), .X2(X23), .X3(X24), .X4(X25), .X5(X26), .X6(X27), .X7(X28), .X8(X29), .X9(X30), .X10(X31), 
										.X11(1'b0), .X12(1'b0), .X13(1'b0), .X14(1'b0), .X15(1'b0), .X16(1'b0), .X17(1'b0), .X18(1'b0), .X19(1'b0),
										.X20(1'b0), .X21(1'b0), .X22(1'b0), .X23(1'b0), .X24(1'b0), .X25(1'b0), .X26(1'b0), .X27(1'b0), 
										.X28(1'b0), .X29(1'b0), .X30(1'b0), .X31(1'b0),.Y(Y), .S(S[21]));
	shift_mux_32to1 DIGIT_22 (.X0(X22), .X1(X23), .X2(X24), .X3(X25), .X4(X26), .X5(X27), .X6(X28), .X7(X29), .X8(X30), .X9(X31),.X10(1'b0), 
										.X11(1'b0), .X12(1'b0), .X13(1'b0), .X14(1'b0), .X15(1'b0), .X16(1'b0), .X17(1'b0), .X18(1'b0), .X19(1'b0),
										.X20(1'b0), .X21(1'b0), .X22(1'b0), .X23(1'b0), .X24(1'b0), .X25(1'b0), .X26(1'b0), .X27(1'b0), 
										.X28(1'b0), .X29(1'b0), .X30(1'b0), .X31(1'b0), .Y(Y), .S(S[22]));
	shift_mux_32to1 DIGIT_23 (.X0(X23), .X1(X24), .X2(X25), .X3(X26), .X4(X27), .X5(X28), .X6(X29), .X7(X30), .X8(X31), .X9(1'b0), .X10(1'b0), 
										.X11(1'b0), .X12(1'b0), .X13(1'b0), .X14(1'b0), .X15(1'b0), .X16(1'b0), .X17(1'b0), .X18(1'b0), .X19(1'b0),
										.X20(1'b0), .X21(1'b0), .X22(1'b0), .X23(1'b0), .X24(1'b0), .X25(1'b0), .X26(1'b0), .X27(1'b0), 
										.X28(1'b0), .X29(1'b0), .X30(1'b0), .X31(1'b0), .Y(Y), .S(S[23]));
	shift_mux_32to1 DIGIT_24 (.X0(X24), .X1(X25), .X2(X26), .X3(X27), .X4(X28), .X5(X29), .X6(X30), .X7(X31), .X8(1'b0), .X9(1'b0), .X10(1'b0), 
										.X11(1'b0), .X12(1'b0), .X13(1'b0), .X14(1'b0), .X15(1'b0), .X16(1'b0), .X17(1'b0), .X18(1'b0), .X19(1'b0),
										.X20(1'b0), .X21(1'b0), .X22(1'b0), .X23(1'b0), .X24(1'b0), .X25(1'b0), .X26(1'b0), .X27(1'b0), 
										.X28(1'b0), .X29(1'b0), .X30(1'b0), .X31(1'b0),  .Y(Y), .S(S[24]));
	shift_mux_32to1 DIGIT_25 (.X0(X25), .X1(X26), .X2(X27), .X3(X28), .X4(X29), .X5(X30), .X6(X31), .X7(1'b0), .X8(1'b0), .X9(1'b0), .X10(1'b0), 
										.X11(1'b0), .X12(1'b0), .X13(1'b0), .X14(1'b0), .X15(1'b0), .X16(1'b0), .X17(1'b0), .X18(1'b0), .X19(1'b0),
										.X20(1'b0), .X21(1'b0), .X22(1'b0), .X23(1'b0), .X24(1'b0), .X25(1'b0), .X26(1'b0), .X27(1'b0), 
										.X28(1'b0), .X29(1'b0), .X30(1'b0), .X31(1'b0), .Y(Y), .S(S[25]));
	shift_mux_32to1 DIGIT_26 (.X0(X26), .X1(X27), .X2(X28), .X3(X29), .X4(X30), .X5(X31), .X6(1'b0), .X7(1'b0), .X8(1'b0), .X9(1'b0), .X10(1'b0), 
										.X11(1'b0), .X12(1'b0), .X13(1'b0), .X14(1'b0), .X15(1'b0), .X16(1'b0), .X17(1'b0), .X18(1'b0), .X19(1'b0),
										.X20(1'b0), .X21(1'b0), .X22(1'b0), .X23(1'b0), .X24(1'b0), .X25(1'b0), .X26(1'b0), .X27(1'b0), 
										.X28(1'b0), .X29(1'b0), .X30(1'b0), .X31(1'b0), .Y(Y), .S(S[26]));
	shift_mux_32to1 DIGIT_27 (.X0(X27), .X1(X28), .X2(X29), .X3(X30), .X4(X31), .X5(1'b0), .X6(1'b0), .X7(1'b0), .X8(1'b0), .X9(1'b0), .X10(1'b0), 
										.X11(1'b0), .X12(1'b0), .X13(1'b0), .X14(1'b0), .X15(1'b0), .X16(1'b0), .X17(1'b0), .X18(1'b0), .X19(1'b0),
										.X20(1'b0), .X21(1'b0), .X22(1'b0), .X23(1'b0), .X24(1'b0), .X25(1'b0), .X26(1'b0), .X27(1'b0), 
										.X28(1'b0), .X29(1'b0), .X30(1'b0), .X31(1'b0), .Y(Y), .S(S[27]));
	shift_mux_32to1 DIGIT_28 (.X0(X28), .X1(X29), .X2(X30), .X3(X31), .X4(1'b0), .X5(1'b0), .X6(1'b0), .X7(1'b0), .X8(1'b0), .X9(1'b0), .X10(1'b0), 
										.X11(1'b0), .X12(1'b0), .X13(1'b0), .X14(1'b0), .X15(1'b0), .X16(1'b0), .X17(1'b0), .X18(1'b0), .X19(1'b0),
										.X20(1'b0), .X21(1'b0), .X22(1'b0), .X23(1'b0), .X24(1'b0), .X25(1'b0), .X26(1'b0), .X27(1'b0), 
										.X28(1'b0), .X29(1'b0), .X30(1'b0), .X31(1'b0), .Y(Y), .S(S[28]));
	shift_mux_32to1 DIGIT_29 (.X0(X29), .X1(X30), .X2(X31), .X3(1'b0), .X4(1'b0), .X5(1'b0), .X6(1'b0), .X7(1'b0), .X8(1'b0), .X9(1'b0), .X10(1'b0), 
										.X11(1'b0), .X12(1'b0), .X13(1'b0), .X14(1'b0), .X15(1'b0), .X16(1'b0), .X17(1'b0), .X18(1'b0), .X19(1'b0),
										.X20(1'b0), .X21(1'b0), .X22(1'b0), .X23(1'b0), .X24(1'b0), .X25(1'b0), .X26(1'b0), .X27(1'b0), 
										.X28(1'b0), .X29(1'b0), .X30(1'b0), .X31(1'b0), .Y(Y), .S(S[29]));
	shift_mux_32to1 DIGIT_30 (.X0(X30), .X1(X31), .X2(1'b0), .X3(1'b0), .X4(1'b0), .X5(1'b0), .X6(1'b0), .X7(1'b0), .X8(1'b0), .X9(1'b0), .X10(1'b0), 
										.X11(1'b0), .X12(1'b0), .X13(1'b0), .X14(1'b0), .X15(1'b0), .X16(1'b0), .X17(1'b0), .X18(1'b0), .X19(1'b0),
										.X20(1'b0), .X21(1'b0), .X22(1'b0), .X23(1'b0), .X24(1'b0), .X25(1'b0), .X26(1'b0), .X27(1'b0), 
										.X28(1'b0), .X29(1'b0), .X30(1'b0), .X31(1'b0), .Y(Y), .S(S[30]));
	shift_mux_32to1 DIGIT_31 (.X0(X31), .X1(1'b0), .X2(1'b0), .X3(1'b0), .X4(1'b0), .X5(1'b0), .X6(1'b0), .X7(1'b0), .X8(1'b0), .X9(1'b0), .X10(1'b0), 
										.X11(1'b0), .X12(1'b0), .X13(1'b0), .X14(1'b0), .X15(1'b0), .X16(1'b0), .X17(1'b0), .X18(1'b0), .X19(1'b0),
										.X20(1'b0), .X21(1'b0), .X22(1'b0), .X23(1'b0), .X24(1'b0), .X25(1'b0), .X26(1'b0), .X27(1'b0), 
										.X28(1'b0), .X29(1'b0), .X30(1'b0), .X31(1'b0), .Y(Y), .S(S[31]));

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire

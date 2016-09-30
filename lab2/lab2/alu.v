`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2016
// Module Name:    alu 
// Author(s): Patrick Hansen and Ben Anadappa
// Description: CS 141 lab 2
//
//
//////////////////////////////////////////////////////////////////////////////////
`include "alu_defines.v"

module alu(X,Y,Z,op_code, equal, overflow, zero);

	//port definitions - customize for different bit widths
	input  wire [31:0] X;
	input  wire [31:0] Y;
	output wire [31:0] Z;
	input  wire [3:0] op_code;
	
	output wire equal, overflow, zero;
	
	wire [31:0] and_out, or_out, xor_out, nor_out, add_out, sub_out, slt_out, srl_out, sll_out, sra_out;
	wire add, sub, not_reserved, overflow_check, slt_sub, slt, sub_or_slt, is_less_than;
	
	//functional blocks
	//16:1 multiplexer
	mux_16to1 #(.N(32)) MUX (.in0(and_out),
									.in1(or_out),
									.in2(xor_out),
									.in3(nor_out),
									.in4(`RESERVED),
									.in5(add_out),
									.in6(sub_out),
									.in7(slt_out),
									.in8(srl_out),
									.in9(sll_out),
									.in10(sra_out),
									.in11(`RESERVED),
									.in12(`RESERVED),
									.in13(`RESERVED),
									.in14(`RESERVED),
									.in15(`RESERVED),
									.S(op_code),
									.Z(Z));
									
	//check if op_code is not reserved
	assign not_reserved = (~(op_code[2]) & ~(op_code[0])) |
								 (~(op_code[3]) & op_code[0]) |
								 (~(op_code[3]) & op_code[1]) |
								 (op_code[3] & ~(op_code[2]) & ~(op_code[1]));
	
	//determine equality and zero
	assign equal = (&(X ^ ~(Y))) & not_reserved;
	assign zero = (&(~(Z))) & not_reserved;
		
	//logical operations
   assign and_out = X & Y;
	assign or_out = X | Y;
	assign xor_out = X ^ Y;
	assign nor_out = ~(or_out);

	//classify arithmetic op_codes
	assign add = (~(op_code[3]) & op_code[2] & ~(op_code[1]) & op_code[0]);
	assign sub = (~(op_code[3]) & op_code[2] & op_code[1] & ~(op_code[0]));
	assign slt = (~(op_code[3]) & op_code[2] & op_code[1] & op_code[0]);
	assign sub_or_slt = sub | slt;
		
	//set overflow
	assign overflow = overflow_check & (add | sub);
	
	//addition and  subtraction
	add_sub_32b ADD_SUB_UNIT (.X(X),.Y(Y),.sub(sub_or_slt),.S(add_out),.overflow(overflow_check));
	assign sub_out = add_out;
	
	// For less than, we can separate it into two cases: same sign or opposite signs. 
		// Case 1: If the inputs are the same sign then overflow will never occur, so we just 
		// look at the sign after the subtraction. In either case (both positive, both negative), 
		// if X is less than Y then the subtraction is negative i.e. most significant bit is 1.
		// Case 2: If they have opposite signs, we just look at whether X is negative in which case X < Y
	assign is_less_than =  ((X[31] ^ ~(Y[31])) & add_out[31]) | (X[31] & ~(Y[31]));
	
	// We need a 32 bit output, so we use 2:1 mux
	slt_32b SLT_UNIT (.S(is_less_than), .Z(slt_out));
	
	//shifting each bit of X by the lasy 5 bits of Y (max of 32 shift)
	srl_unit SRL_UNIT (.X0(X[0]), .X1(X[1]), .X2(X[2]), .X3(X[3]), .X4(X[4]), .X5(X[5]), .X6(X[6]), .X7(X[7]), .X8(X[8]), .X9(X[9]), .X10(X[10]), 
										.X11(X[11]), .X12(X[12]), .X13(X[13]), .X14(X[14]), .X15(X[15]), .X16(X[16]), .X17(X[17]), .X18(X[18]), .X19(X[19]),
										.X20(X[20]), .X21(X[21]), .X22(X[22]), .X23(X[23]), .X24(X[24]), .X25(X[25]), .X26(X[26]), .X27(X[27]), 
										.X28(X[28]), .X29(X[29]), .X30(X[30]), .X31(X[31]),
							.Y(Y[4:0]),.S(srl_out));
	sra_unit SRA_UNIT (.X0(X[0]), .X1(X[1]), .X2(X[2]), .X3(X[3]), .X4(X[4]), .X5(X[5]), .X6(X[6]), .X7(X[7]), .X8(X[8]), .X9(X[9]), .X10(X[10]), 
										.X11(X[11]), .X12(X[12]), .X13(X[13]), .X14(X[14]), .X15(X[15]), .X16(X[16]), .X17(X[17]), .X18(X[18]), .X19(X[19]),
										.X20(X[20]), .X21(X[21]), .X22(X[22]), .X23(X[23]), .X24(X[24]), .X25(X[25]), .X26(X[26]), .X27(X[27]), 
										.X28(X[28]), .X29(X[29]), .X30(X[30]), .X31(X[31]),
							.Y(Y[4:0]),.S(sra_out));
	
	sll_unit SLL_UNIT (.X0(X[0]), .X1(X[1]), .X2(X[2]), .X3(X[3]), .X4(X[4]), .X5(X[5]), .X6(X[6]), .X7(X[7]), .X8(X[8]), .X9(X[9]), .X10(X[10]), 
										.X11(X[11]), .X12(X[12]), .X13(X[13]), .X14(X[14]), .X15(X[15]), .X16(X[16]), .X17(X[17]), .X18(X[18]), .X19(X[19]),
										.X20(X[20]), .X21(X[21]), .X22(X[22]), .X23(X[23]), .X24(X[24]), .X25(X[25]), .X26(X[26]), .X27(X[27]), 
										.X28(X[28]), .X29(X[29]), .X30(X[30]), .X31(X[31]),
							.Y(Y[4:0]),.S(sll_out));


endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire

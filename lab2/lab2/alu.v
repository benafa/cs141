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
	
	wire [31:0] and_out, or_out, xor_out, nor_out, add_out, sub_out, slt_out, srl_out, sll_out, sra_out, invert_Y;
	wire add, sub, not_reserved, overflow_check;
	
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
	
	//check if op_code is add or sub
	assign add = (~(op_code[3]) & op_code[2] & ~(op_code[1]) & op_code[0]);
	assign sub = (~(op_code[3]) & op_code[2] & op_code[1] & ~(op_code[0]));
	
	//set overflow
	assign overflow = overflow_check & (add | sub);
	
	//logical operations
   assign and_out = X & Y;
	assign or_out = X | Y;
	assign xor_out = X ^ Y;
	assign nor_out = ~(or_out);
	
	//addition and subtraction
	//mux controling inversion of Y and C_in
	mux_2to1 #(.N(32)) ADD_SUB_MUX (.X(Y),.Y(~Y),.S(sub),.Z(invert_Y));
	//instantiate CLA
	carry_lookahead_adder_32b ADD_SUB (.A(X),.B(invert_Y),.C_in(sub),.S(add_out),.overflow(overflow_check));
	assign sub_out = add_out;
	
	//shifting
	
	


endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire

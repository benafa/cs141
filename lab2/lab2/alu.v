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
	
	//logical operations
   assign and_out = X & Y;
	assign or_out = X | Y;
	assign xor_out = X ^ Y;
	assign nor_out = ~(X | Y);
	
	//addition and subtraction
	carry_lookahead_adder_32b ADD (.A(X),.B(Y),.C_in(0),.S(add_out),.overflow(overflow));
	
	//shifting
	


endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire

`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    tape 
// Author(s): Patrick Hansen, Ben Anadappa
// Description: Reads or writes data on positive edge of clock, depending on write_ena
//
//
//////////////////////////////////////////////////////////////////////////////////
module tape(head, write_ena, rst, clk, write_data, read_data,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7);

	//parameter definitions
	parameter SIZE = 2;

	//port definitions
	input wire [2:0] head;
	input wire write_ena, clk;
	input wire rst;
	input wire [(SIZE - 1):0] write_data;
	output wire [(SIZE - 1):0] read_data;
	
	wire [7:0] ena,A;
	//temporary output
	output wire [(SIZE - 1):0] Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
	wire [(SIZE - 1):0] B;
	
	register #(.SIZE(SIZE)) REG0 (.rst(rst), .ena(ena[0]), .clk(clk), .D(write_data), .Q(Q0));
	register #(.SIZE(SIZE)) REG1 (.rst(rst), .ena(ena[1]), .clk(clk), .D(write_data), .Q(Q1));
	register #(.SIZE(SIZE)) REG2 (.rst(rst), .ena(ena[2]), .clk(clk), .D(write_data), .Q(Q2));
	register #(.SIZE(SIZE)) REG3 (.rst(rst), .ena(ena[3]), .clk(clk), .D(write_data), .Q(Q3));
	register #(.SIZE(SIZE)) REG4 (.rst(rst), .ena(ena[4]), .clk(clk), .D(write_data), .Q(Q4));
	register #(.SIZE(SIZE)) REG5 (.rst(rst), .ena(ena[5]), .clk(clk), .D(write_data), .Q(Q5));
	register #(.SIZE(SIZE)) REG6 (.rst(rst), .ena(ena[6]), .clk(clk), .D(write_data), .Q(Q6));
	register #(.SIZE(SIZE)) REG7 (.rst(rst), .ena(ena[7]), .clk(clk), .D(write_data), .Q(Q7));
	
	//enabling registers if write anable is active and head matches
	//lazy decoder using 8to1 mux
	mux_8to1 #(.N(8)) ena_MUX (.in0(8'b00000001),
										.in1(8'b00000010),
										.in2(8'b00000100),
										.in3(8'b00001000),
										.in4(8'b00010000),
										.in5(8'b00100000),
										.in6(8'b01000000),
										.in7(8'b10000000),
										.S(head),
										.Z(A));
	assign ena = write_ena ? A : 8'b00000000;
	
	
	//reading data, multiplexing Qs into output if write enable is inactive.
	//multiplexing data outputs
	mux_8to1 #(.N(SIZE)) out_MUX (.in0(Q0), .in1(Q1), .in2(Q2), .in3(Q3), .in4(Q4),
											.in5(Q5), .in6(Q6), .in7(Q7), .S(head), .Z(B));
	assign read_data = (~write_ena) ? B : 0; 

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire

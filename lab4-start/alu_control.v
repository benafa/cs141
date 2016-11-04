`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    alu_control 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
`include "alu_defines.v"
`include "mips_defines.v"

module alu_control(ALUOp, funct, ALUControl);

	input  wire [1:0] ALUOp;
	input  wire [5:0] funct;
	output reg [3:0] ALUControl;

	always @(*) begin
		if (ALUOp[1]) begin
			case (funct)
				`ADD : ALUControl = `ALU_OP_ADD;
				`SUB : ALUControl = `ALU_OP_SUB;
				`AND : ALUControl = `ALU_OP_AND;
				`OR  : ALUControl = `ALU_OP_OR;
				`SLT : ALUControl = `ALU_OP_SLT;
				`XOR : ALUControl = `ALU_OP_XOR;
				`NOR : ALUControl = `ALU_OP_NOR;
				`SLL : ALUControl = `ALU_OP_SLL;
				`SRL : ALUControl = `ALU_OP_SRL;
				`SRA : ALUControl = `ALU_OP_SRA;
				default : ALUControl = 0;
			endcase
		end
		if (ALUOp[0]) begin
			ALUControl = `ALU_OP_SUB;
		end
		else if (!ALUOp[1]) begin
			ALUControl = `ALU_OP_ADD;
		end
	end

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire

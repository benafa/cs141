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

module alu_control(ALUOp, funct, ALUControl, shift);

	input  wire [2:0] ALUOp;
	input  wire [5:0] funct;
	output reg [3:0] ALUControl;
	output reg shift;

	always @(*) begin
		case (ALUOp)
			`MIPS_R_TYPE : begin
				case (funct)
					`ADD : begin
						ALUControl = `ALU_OP_ADD;
						shift = 0;
					end
					`SUB : begin
						ALUControl = `ALU_OP_SUB;
						shift = 0;
					end
					`AND : begin
						ALUControl = `ALU_OP_AND;
						shift = 0;
					end
					`OR  : begin
						ALUControl = `ALU_OP_OR;
						shift = 0;
					end
					`SLT : begin
						ALUControl = `ALU_OP_SLT;
						shift = 0;
					end
					`XOR : begin
						ALUControl = `ALU_OP_XOR;
						shift = 0;
					end
					`NOR : begin
						ALUControl = `ALU_OP_NOR;
						shift = 0;
					end
					`SLL : begin
						ALUControl = `ALU_OP_SLL;
						shift = 1;
					end
					`SRL : begin
						ALUControl = `ALU_OP_SRL;
						shift = 1;
					end
					`SRA : begin
						ALUControl = `ALU_OP_SRA;
						shift = 1;
					end
					default : begin
						ALUControl = 0;
						shift = 0;
					end
				endcase
			end
			`MIPS_AND : begin
				ALUControl = `ALU_OP_AND;
				shift = 0;
			end
			`MIPS_OR : begin
				ALUControl = `ALU_OP_OR;
				shift = 0;
			end
			`MIPS_XOR : begin
				ALUControl = `ALU_OP_XOR;
				shift = 0;
			end
			`MIPS_NOR : begin
				ALUControl = `ALU_OP_NOR;
				shift = 0;
			end
			`MIPS_SLT : begin
				ALUControl = `ALU_OP_SLT;
				shift = 0;
			end
			`MIPS_ADD : begin
				ALUControl = `ALU_OP_ADD;
				shift = 0;
			end
			`MIPS_SUB : begin
				ALUControl = `ALU_OP_SUB;
				shift = 0;
			end
			default : begin
				ALUControl = `ALU_OP_ADD;
				shift = 0;
			end
		endcase
	end

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire

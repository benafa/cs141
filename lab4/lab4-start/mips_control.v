`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    mips_control 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
`include "mips_defines.v"

module mips_control(clk, rst, op_code, funct, PCWriteCond, PCWrite, IorD, MemWrite, MemtoReg, IRWrite, 
						  ALUSrcA, RegWrite, RegDst, Error, ALUSrcB, ALUOp, PCSource, EQorNE, state);

	input wire clk, rst;
	input wire [5:0] op_code, funct;
	output reg PCWriteCond, PCWrite, IorD, MemWrite, IRWrite, 
					 ALUSrcA, RegWrite, EQorNE, Error;
	output reg [1:0] ALUSrcB, PCSource, RegDst, MemtoReg;
	output reg [2:0] ALUOp;
	
	output reg [4:0] state;
	reg [4:0] next_state;
	
	//next state logic
	always @(posedge clk) begin
		if (rst) state <= `FETCH_0;
		else state <= next_state;
	end
	
	// FSM logic
	always @(*) begin
		if (rst) begin
			next_state = `FETCH_0;
			PCWrite = 1;
			IRWrite = 0;
			MemWrite = 0;
			RegWrite = 0;
			Error = 0;
			PCWriteCond = 0;
			IorD = 0;
			MemtoReg = 00;
			ALUSrcA = 0;
			RegDst = 00;
			ALUSrcB = 01;
			ALUOp = `MIPS_ADD;
			PCSource = 00;
			EQorNE = 1;
		end
		else begin
			case (state)
				`FETCH_0 : begin
					next_state = `FETCH_1;
					PCWrite = 0;
					IRWrite = 0;
					MemWrite = 0;
					RegWrite = 0;
					IorD = 0;
					ALUSrcA = 0;
					ALUSrcB = 01;
					ALUOp = `MIPS_ADD;
					PCSource = 00;
				end
				`FETCH_1 : begin
					next_state = `DECODE;
					PCWrite = 1;
					IRWrite = 1;
					MemWrite = 0;
					RegWrite = 0;
				end
				`DECODE : begin
					if (op_code == `R_TYPE && funct == `JR) begin
						next_state = `EXECUTE_JR;
					end
					else begin
						case (op_code)
							`R_TYPE	: next_state = `EXECUTE_R;
							`ANDI		: next_state = `EXECUTE_ANDI;
							`ORI		: next_state = `EXECUTE_ORI;
							`XORI 	: next_state = `EXECUTE_XORI;
							`SLTI 	: next_state = `EXECUTE_SLTI;
							`ADDI 	: next_state = `EXECUTE_ADDI;
							`LW		: next_state = `MEM_ADDR;
							`SW		: next_state = `MEM_ADDR;
							`J			: next_state = `EXECUTE_J;
							`JAL		: next_state = `EXECUTE_JAL;
							`BEQ		: next_state = `BRANCH_COND_BEQ;
							`BNE		: next_state = `BRANCH_COND_BNE;
							default	: next_state = `ERROR;
						endcase
					end
					PCWrite = 0;
					IRWrite = 0;
					MemWrite = 0;
					RegWrite = 0;
					ALUSrcA = 0;
					ALUSrcB = 11;
					ALUOp = `MIPS_ADD;
					PCWriteCond = 0;
				end
				`EXECUTE_R : begin
					next_state = `WRITEBACK_R;
					PCWrite = 0;
					IRWrite = 0;
					MemWrite = 0;
					RegWrite = 0;
					ALUSrcA = 1;
					ALUSrcB = 00;
					ALUOp = `MIPS_R_TYPE;
				end
				`WRITEBACK_R : begin
					next_state = `FETCH_0;
					PCWrite = 0;
					IRWrite = 0;
					MemWrite = 0;
					RegWrite = 0;
					RegDst = 01;
					MemtoReg = 00;
					RegWrite = 1;
				end
				`EXECUTE_ANDI : begin
					next_state = `WRITEBACK_I;
					PCWrite = 0;
					IRWrite = 0;
					MemWrite = 0;
					RegWrite = 0;
					ALUSrcA = 1;
					ALUSrcB = 10;
					ALUOp = `MIPS_AND;
				end
				`EXECUTE_ORI : begin
					next_state = `WRITEBACK_I;
					PCWrite = 0;
					IRWrite = 0;
					MemWrite = 0;
					RegWrite = 0;
					ALUSrcA = 1;
					ALUSrcB = 10;
					ALUOp = `MIPS_OR;
				end
				`EXECUTE_XORI : begin
					next_state = `WRITEBACK_I;
					PCWrite = 0;
					IRWrite = 0;
					MemWrite = 0;
					RegWrite = 0;
					ALUSrcA = 1;
					ALUSrcB = 10;
					ALUOp = `MIPS_XOR;
				end
				`EXECUTE_SLTI : begin
					next_state = `WRITEBACK_I;
					PCWrite = 0;
					IRWrite = 0;
					MemWrite = 0;
					RegWrite = 0;
					ALUSrcA = 1;
					ALUSrcB = 10;
					ALUOp = `MIPS_SLT;
				end
				`EXECUTE_ADDI : begin
					next_state = `WRITEBACK_I;
					PCWrite = 0;
					IRWrite = 0;
					MemWrite = 0;
					RegWrite = 0;
					ALUSrcA = 1;
					ALUSrcB = 10;
					ALUOp = `MIPS_ADD;
				end
				`WRITEBACK_I : begin
					next_state = `FETCH_0;
					PCWrite = 0;
					IRWrite = 0;
					MemWrite = 0;
					RegWrite = 1;
					RegDst = 00;
					MemtoReg = 00;
				end
				`MEM_ADDR : begin
					case (op_code)
						`LW		: next_state = `MEM_READ_0;
						`SW		: next_state = `MEM_WRITE;
						default	: next_state = `ERROR;
					endcase
					PCWrite = 0;
					IRWrite = 0;
					MemWrite = 0;
					RegWrite = 0;
					ALUSrcA = 1;
					ALUSrcB = 10;
					ALUOp = `MIPS_ADD;
				end
				`MEM_READ_0 : begin
					next_state = `MEM_READ_1;
					PCWrite = 0;
					IRWrite = 0;
					MemWrite = 0;
					RegWrite = 0;
					ALUSrcA = 1;
					ALUSrcB = 10;
					ALUOp = `MIPS_ADD;
					IorD = 1;
				end
				`MEM_READ_1 : begin
					next_state = `MEM_WRITEBACK;
					PCWrite = 0;
					IRWrite = 0;
					MemWrite = 0;
					RegWrite = 0;
					ALUSrcA = 1;
					ALUSrcB = 10;
					ALUOp = `MIPS_ADD;
					IorD = 1;
				end
				`MEM_WRITEBACK : begin
					next_state = `FETCH_0;
					PCWrite = 0;
					IRWrite = 0;
					MemWrite = 0;
					RegWrite = 1;
					RegDst = 00;
					MemtoReg = 01;
				end
				`MEM_WRITE : begin
					next_state = `FETCH_0;
					PCWrite = 0;
					IRWrite = 0;
					MemWrite = 1;
					RegWrite = 0;
					IorD = 1;
				end
				`EXECUTE_J : begin
					next_state = `FETCH_0;
					PCWrite = 1;
					IRWrite = 0;
					MemWrite = 0;
					RegWrite = 0;
					PCSource = 10;
				end
				`EXECUTE_JR : begin
					next_state = `FETCH_0;
					PCWrite = 1;
					IRWrite = 0;
					MemWrite = 0;
					RegWrite = 0;
					PCSource = 11;
				end
				`EXECUTE_JAL : begin
					next_state = `FETCH_0;
					PCWrite = 1;
					IRWrite = 0;
					MemWrite = 0;
					RegWrite = 0;
					PCSource = 10;
					RegDst = 10;
					MemtoReg = 10;
				end
				`BRANCH_COND_BEQ : begin
					next_state = `EXECUTE_BRANCH;
					PCWrite = 0;
					IRWrite = 0;
					MemWrite = 0;
					RegWrite = 0;
					ALUSrcA = 1;
					ALUSrcB = 00;
					ALUOp = `MIPS_SUB;
					EQorNE = 1;
				end
				`BRANCH_COND_BNE : begin
					next_state = `EXECUTE_BRANCH;
					PCWrite = 0;
					IRWrite = 0;
					MemWrite = 0;
					RegWrite = 0;
					ALUSrcA = 1;
					ALUSrcB = 0;
					ALUOp = `MIPS_SUB;
					EQorNE = 0;
				end
				`EXECUTE_BRANCH : begin
					next_state = `FETCH_0;
					PCWrite = 0;
					IRWrite = 0;
					MemWrite = 0;
					RegWrite = 0;
					ALUSrcA = 0;
					ALUSrcB = 11;
					ALUOp = `MIPS_ADD;
					PCSource = 0;
					PCWriteCond = 1;
				end
				`ERROR : begin
					PCWrite = 0;
					IRWrite = 0;
					MemWrite = 0;
					RegWrite = 0;
					Error = 1;
				end
				default : begin
					next_state = `FETCH_0;
					PCWrite = 0;
					IRWrite = 0;
					MemWrite = 0;
					RegWrite = 0;
				end
			endcase
		end
	end

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire

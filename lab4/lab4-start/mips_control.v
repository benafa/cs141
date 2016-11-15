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

module mips_control(clk, rst, op_code, PCWriteCond, PCWrite, IorD, MemWrite, MemtoReg, IRWrite, 
						  ALUSrcA, RegWrite, RegDst, Error, ALUSrcB, ALUOp, PCSource, state);

	input wire clk, rst;
	input wire [5:0] op_code;
	output reg PCWriteCond, PCWrite, IorD, MemWrite, MemtoReg, IRWrite, 
					 ALUSrcA, RegWrite, RegDst, Error;
	output reg [1:0] ALUSrcB, PCSource;
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
			MemtoReg = 0;
			ALUSrcA = 0;
			RegDst = 0;
			ALUSrcB = 01;
			ALUOp = `MIPS_ADD;
			PCSource = 00;
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
					case (op_code)
						`R_TYPE	: next_state = `EXECUTE_R;
						`ANDI		: next_state = `EXECUTE_ANDI;
						`ORI		: next_state = `EXECUTE_ORI;
						`XORI 	: next_state = `EXECUTE_XORI;
						`SLTI 	: next_state = `EXECUTE_SLTI;
						`ADDI 	: next_state = `EXECUTE_ADDI;
						`LW		: next_state = `MEM_ADDR;
						`SW		: next_state = `MEM_ADDR;
						default	: next_state = `ERROR;
					endcase
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
					RegDst = 1;
					MemtoReg = 0;
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
					RegDst = 0;
					MemtoReg = 0;
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
					RegDst = 0;
					MemtoReg = 1;
				end
				`MEM_WRITE : begin
					next_state = `FETCH_0;
					PCWrite = 0;
					IRWrite = 0;
					MemWrite = 1;
					RegWrite = 0;
					IorD = 1;
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

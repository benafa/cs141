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
	output reg [1:0] ALUSrcB, ALUOp, PCSource;
	
	output reg [3:0] state;
	reg [3:0] next_state;
	
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
			ALUOp = 00;
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
					ALUOp = 00;
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
						`R_TYPE : next_state = `EXECUTE;
						default : next_state = `ERROR;
					endcase
					PCWrite = 0;
					IRWrite = 0;
					MemWrite = 0;
					RegWrite = 0;
					ALUSrcA = 0;
					ALUSrcB = 11; //not currently useful
					ALUOp = 00;
					PCWriteCond = 0;
				end
				`EXECUTE : begin
					next_state = `ALU_WRITEBACK;
					PCWrite = 0;
					IRWrite = 0;
					MemWrite = 0;
					RegWrite = 0;
					ALUSrcA = 1;
					ALUSrcB = 00;
					ALUOp = 10;
				end
				`ALU_WRITEBACK : begin
					next_state = `FETCH_0;
					PCWrite = 0;
					IRWrite = 0;
					MemWrite = 0;
					RegWrite = 0;
					RegDst = 1;
					MemtoReg = 0;
					RegWrite = 1;
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

	//port definitions - customize for different bit widths


endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire

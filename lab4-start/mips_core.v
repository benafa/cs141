`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    mips_core 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
`include "mips_defines.v"

module mips_core(clk, rst, mem_rd_data, mem_addr, mem_wr_data, instr, PCWriteCond,
					  PCWrite, IorD, MemtoReg, IRWrite, RegDst, RegWrite, ALUSrcA, ALUSrcB, ALUOp, PCSource,
					  PC_out, MDR_out, A_out, B_out, ALU_out, ALUout_out);

	input wire clk, rst, PCWriteCond, PCWrite, IorD, MemtoReg, IRWrite, RegDst, RegWrite, ALUSrcA;
	input wire [1:0] ALUSrcB, ALUOp, PCSource;
	input wire [31:0] mem_rd_data;
	output wire [31:0] mem_addr, mem_wr_data, instr;
	
	//buses
	wire PC_ena, ALU_zero;
	output wire [31:0] PC_out, MDR_out, A_out, B_out, ALU_out, ALUout_out;
	reg [31:0] PC_in;
	wire [31:0] reg_file_wr_data, reg_file_rd_data1, reg_file_rd_data2, ALU_in1, ALU_in2;
	wire [3:0] ALUControl;
	wire [4:0] reg_file_rd_addr1, reg_file_rd_addr2, reg_file_wr_addr;
					
	assign mem_wr_data = B_out;
	
	//muxes and combinational logic
	assign PC_ena = PCWrite | (PCWriteCond & ALU_zero);
	assign mem_addr = IorD ? ALUout_out : PC_out;
	assign reg_file_wr_addr = RegDst ? instr[15:11] : instr[20:16];
	assign reg_file_wr_data = MemtoReg ? MDR_out : ALUout_out;
	assign ALU_in1 = ALUSrcA ? A_out : PC_out;
	assign ALU_in2 = ALUSrcB[1] ? (ALUSrcB[0] ? 0/* TODO: shift left */ : 0/* TODO: sign extend */) : (ALUSrcB[0] ? 32'h4 : B_out);
	
	//sign extend and shift lefts
	/* TODO */
	
	//instantiating registers
	register #(.N(32)) PC (.clk(clk), .d(PC_in), .q(PC_out), .rst(0), .ena(PC_ena));
	register #(.N(32)) IR (.clk(clk), .d(mem_rd_data), .q(instr), .rst(rst), .ena(IRWrite));
	register #(.N(32)) MDR (.clk(clk), .d(mem_rd_data), .q(MDR_out), .rst(rst), .ena(`ALWAYS_ENA));
	register #(.N(32)) A (.clk(clk), .d(reg_file_rd_data1), .q(A_out), .rst(rst), .ena(`ALWAYS_ENA));
	register #(.N(32)) B (.clk(clk), .d(reg_file_rd_data2), .q(B_out), .rst(rst), .ena(`ALWAYS_ENA));
	register #(.N(32)) ALUout (.clk(clk), .d(ALU_out), .q(ALUout_out), .rst(rst), .ena(`ALWAYS_ENA));
	
	//instantiating ALU
	alu #(.N(32)) ALU (.x(ALU_in1), .y(ALU_in2), .op_code(ALUControl), .z(ALU_out), .zero(ALU_zero));
	
	//instantiating ALU control
	alu_control ALU_CONTROL (.ALUOp(ALUOp), .funct(instr[5:0]), .ALUControl(ALUControl));
	
	//instantiating Register File
	register_file #(.N(32)) REGISTER_FILE (.clk(clk), .rst(rst), .rd_addr0(instr[25:21]), .rd_addr1(instr[20:16]),
		.wr_addr(reg_file_wr_addr), .rd_data0(reg_file_rd_data1), .rd_data1(reg_file_rd_data2),
		.wr_data(reg_file_wr_data), .wr_ena(RegWrite));
		
	always @(*) begin
		if (rst) begin
			PC_in = 32'h00400000;
		end
		else begin
			PC_in = PCSource[1] ? (PCSource[0] ? 0 : 0/* TODO: jump addr */) : (PCSource[0] ? ALUout_out : ALU_out);
		end
	end


endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire

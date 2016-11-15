`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    mips_datapath 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module mips_datapath(clk, rst, Error, instr, PC_out, state, MDR_out, A_out, B_out, ALU_out, ALUout_out, mem_addr0, mem_wr_ena0, mem_wr_data0);

	parameter N = 32;

	//inputs and outputs
	input wire clk, rst;
	output wire Error;
	output wire mem_wr_ena0;
	output wire [31:0]  mem_wr_data0;

	//memory buses
	wire [N-1:0] mem_rd_addr0, mem_wr_addr1, mem_rd_addr1, mem_wr_data1, mem_addr1;
	output wire [N-1:0] mem_addr0;
	wire [N-1:0] mem_rd_data0, mem_rd_data1;
	wire mem_wr_ena1;
	//not using second bus
	assign mem_wr_ena1 = 0;

	//mips core outputs
	output wire [31:0] instr;
	output wire [31:0] PC_out;
	output wire [31:0] MDR_out, A_out, B_out, ALU_out, ALUout_out;

	//mips control outputs
	wire PCWriteCond, PCWrite, IorD, MemtoReg, IRWrite, ALUSrcA, RegWrite, RegDst, EQorNE;
	wire [1:0] ALUSrcB, PCSource;
	wire [2:0] ALUOp;
	output wire [4:0] state;

	//instantiate memory
	assign mem_addr1 = mem_wr_ena1 ? mem_wr_addr1 : mem_rd_addr1;
	synth_dual_port_memory #(.N(32), .I_LENGTH(256), .D_LENGTH(513), .I_WIDTH(8), .D_WIDTH(10)) MEMORY (
		.clk(clk),
		.rstb(~rst),
		.wr_ena0(mem_wr_ena0),
		.addr0(mem_addr0),
		.din0(mem_wr_data0),
		.dout0(mem_rd_data0),
		.wr_ena1(mem_wr_ena1),
		.addr1(mem_addr1),
		.din1(mem_wr_data1),
		.dout1(mem_rd_data1)
	);

	//instantiate mips core
	mips_core CORE (.clk(clk), .rst(rst), .mem_rd_data(mem_rd_data0), .mem_addr(mem_addr0), .mem_wr_data(mem_wr_data0),
						 .instr(instr), .PCWriteCond(PCWriteCond), .PCWrite(PCWrite), .IorD(IorD), .MemtoReg(MemtoReg),
						 .IRWrite(IRWrite), .RegDst(RegDst), .RegWrite(RegWrite), .ALUSrcA(ALUSrcA), .ALUSrcB(ALUSrcB),
						 .ALUOp(ALUOp), .PCSource(PCSource), .EQorNE(EQorNE), .PC_out(PC_out), .MDR_out(MDR_out), .A_out(A_out), .B_out(B_out),
						 .ALU_out(ALU_out), .ALUout_out(ALUout_out));

	//instantiate mips control
	mips_control CONTROL (.clk(clk), .rst(rst), .op_code(instr[31:26]), .funct(instr[5:0]), .PCWriteCond(PCWriteCond), .PCWrite(PCWrite),
								 .IorD(IorD), .MemWrite(mem_wr_ena0), .MemtoReg(MemtoReg), .IRWrite(IRWrite), .ALUSrcA(ALUSrcA),
								 .RegWrite(RegWrite), .RegDst(RegDst), .Error(Error), .ALUSrcB(ALUSrcB), .ALUOp(ALUOp),
								 .PCSource(PCSource), .EQorNE(EQorNE), .state(state));

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire

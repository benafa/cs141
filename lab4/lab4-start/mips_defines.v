`ifndef MIPS_DEFINES
`define MIPS_DEFINES

// for registers that are alway enabled
`define ALWAYS_ENA 1

//op codes -> ALUOp
`define MIPS_R_TYPE	3'b000
`define MIPS_AND 		3'b001
`define MIPS_OR		3'b010
`define MIPS_XOR		3'b011
`define MIPS_NOR		3'b100
`define MIPS_SLT		3'b101
`define MIPS_ADD		3'b110
`define MIPS_SUB		3'b111

// funct codes
`define ADD 6'd32
`define SUB 6'd34
`define AND 6'd36
`define OR  6'd37
`define SLT 6'd42
`define XOR 6'd38
`define NOR 6'd39
`define SLL 6'd0
`define SRL 6'd2
`define SRA 6'd3

// mips control fsm states
`define FETCH_0 			5'b00000
`define FETCH_1			5'b00001
`define DECODE				5'b00010
`define EXECUTE_R			5'b00011
`define EXECUTE_ANDI		5'b00100
`define EXECUTE_ORI		5'b00101
`define EXECUTE_XORI		5'b00110
`define EXECUTE_SLTI		5'b00111
`define EXECUTE_ADDI		5'b01000
`define WRITEBACK_R		5'b01001
`define WRITEBACK_I		5'b01010
`define MEM_ADDR			5'b01011
`define MEM_READ_0		5'b01100
`define MEM_READ_1		5'b01101
`define MEM_WRITEBACK	5'b01110
`define MEM_WRITE			5'b01111
`define EXECUTE_J			5'b10000
`define EXECUTE_JR		5'b10001
`define EXECUTE_JAL		5'b10010
`define BRANCH_COND_BEQ	5'b10011
`define BRANCH_COND_BNE	5'b10100
`define EXECUTE_BRANCH	5'b10101
`define ERROR				5'b11111

// op codes
`define R_TYPE 6'b000000
`define ANDI	6'b001100
`define ORI		6'b001101
`define XORI	6'b001110
`define SLTI	6'b001010
`define ADDI	6'b001000
`define LW		6'b100011
`define SW		6'b101011
`define J		6'b101100
`define JR		6'b101101
`define JAL		6'b101110
`define BEQ		6'b101111
`define BNE		6'b110000

`endif

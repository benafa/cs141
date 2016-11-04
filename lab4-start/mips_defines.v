`ifndef MIPS_DEFINES
`define MIPS_DEFINES

// for registers that are alway enabled
`define ALWAYS_ENA 1

// funct codes
`define ADD 6'd32
`define SUB 6'd34
`define AND 6'd36
`define OR 6'd37
`define SLT 6'd42
`define XOR 6'd38
`define NOR 6'd39
`define SLL 6'd0
`define SRL 6'd2
`define SRA 6'd3

// mips control fsm states
`define FETCH_0 4'd0
`define FETCH_1 4'd1
`define DECODE 4'd2
`define EXECUTE 4'd3
`define ALU_WRITEBACK 4'd4
`define ERROR 4'd5

// op codes
`define R_TYPE 6'd0

`endif

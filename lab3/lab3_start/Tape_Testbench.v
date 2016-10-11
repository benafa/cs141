`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:56:38 10/06/2016
// Design Name:   tape
// Module Name:   C:/Users/cs141/cs141/lab3_start/Tape_Testbench.v
// Project Name:  lab3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: tape
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Tape_Testbench;

	// Inputs
	reg [2:0] head;
	reg write_ena;
	reg rst;
	reg clk;
	reg [1:0] write_data;

	// Outputs
	wire [1:0] read_data;

	// Instantiate the Unit Under Test (UUT)
	tape uut (
		.head(head), 
		.write_ena(write_ena), 
		.rst(rst), 
		.clk(clk), 
		.write_data(write_data), 
		.read_data(read_data)
	);

	initial begin
		// Initialize Inputs
		head = 0;
		write_ena = 0;
		rst = 0;
		clk = 0;
		write_data = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		/*******Read and write data from the register address within the tape specified by the tape's head*******/
		//testing writes
		write_ena = 1;
		
			  head = 3'b000; write_data = 2'b00;
		#10; head = 3'b001; write_data = 2'b01;
		#10; head = 3'b010; write_data = 2'b10;
		#10; head = 3'b011; write_data = 2'b01;
		#10; head = 3'b100; write_data = 2'b00;
		#10; head = 3'b101; write_data = 2'b01;
		#10; head = 3'b110; write_data = 2'b10;
		#10; head = 3'b111; write_data = 2'b11; //invalid state
		#10;
		
		//testing reads
		write_ena = 0;
		
			  head = 3'b000;
		#10; head = 3'b001;
		#10; head = 3'b010;
		#10; head = 3'b011;
		#10; head = 3'b100;
		#10; head = 3'b101;
		#10; head = 3'b110;
		#10; head = 3'b111;
		#10;
		
		/********Not write new data while attempting to read older data.********/
		write_ena = 0;
		
			  head = 3'b000;
		#10; head = 3'b001;
		#10; head = 3'b010;
		#10; head = 3'b011;
		#10; head = 3'b100;
		#10; head = 3'b101;
		#10; head = 3'b110;
		#10; head = 3'b111;
		#10;
		
		//testing if the tape is synchronous
		write_ena = 1;
		head = 3'b000; write_data = 2'b11; #3;
		write_ena = 0; #7;
		
		rst = 1; #3;
		rst = 0; #7;
		
		//testing reset
		rst = 1; #10;
		rst = 0;
		write_ena = 0;
		
			  head = 3'b000;
		#10; head = 3'b001;
		#10; head = 3'b010;
		#10; head = 3'b011;
		#10; head = 3'b100;
		#10; head = 3'b101;
		#10; head = 3'b110;
		#10; head = 3'b111;
		#10;
		

	end
	
	//simulating the clock
	always #5 clk = !clk;
      
endmodule


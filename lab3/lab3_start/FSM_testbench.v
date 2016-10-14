`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:59:46 10/13/2016
// Design Name:   adding_fsm
// Module Name:   C:/Users/cs141/cs141/lab3/lab3_start/FSM_TESTBENCH.v
// Project Name:  lab3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: adding_fsm
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FSM_TESTBENCH;

	// Inputs
	reg [7:0] switch;
	reg button_center;
	reg rst;
	reg clk;

	// Outputs
	wire [7:0] led;
	wire [2:0] state;
	wire [2:0] head, write_ena;
	wire [1:0] read_data_0, read_data_1, read_data_SUM, write_data;

	// Instantiate the Unit Under Test (UUT)
	adding_fsm uut (
		.switch(switch), 
		.button_center(button_center), 
		.rst(rst), 
		.clk(clk), 
		.led(led),
		.state(state), .head(head), .write_ena(write_ena), .write_data(write_data),
		.read_data_0(read_data_0), .read_data_1(read_data_1), .read_data_SUM(read_data_SUM)
	);

	initial begin
		// Initialize Inputs
		switch = 0;
		button_center = 0;
		rst = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		//set tapes to fully blank
		rst = 1;
		#10; rst = 0;
		
		//0000111 + 0000111 (equal is true)
			   switch[6:0] = 7'b0000101;
		#10;  button_center = 1;
		#10;  button_center = 0;
		#100; switch[6:0] = 7'b0000010;
		#10;  button_center = 1;
		#10;  button_center = 0;
		#400; switch[7] = 1;
		#100; switch[7] = 0;
		#100;
		
		//reset tapes and state
		rst = 1;
		#20; rst = 0;
		
		//1111111 + 0000001 (overflow case)
			   switch[6:0] = 7'b1111111;
		#10;  button_center = 1;
		#10;  button_center = 0;
		#100; switch[6:0] = 7'b0000001;
		#10;	button_center = 1;
		#10;  button_center = 0;
		#400;
	end
	
	//simulating the clock
	always #5 clk = !clk;
      
endmodule


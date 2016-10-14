`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:05:33 10/13/2016
// Design Name:   main
// Module Name:   Z:/CS141/cs141_git/lab3/lab3_start/FSM_testbench.v
// Project Name:  lab3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: main
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FSM_testbench;

	// Inputs
	reg [7:0] switch;
	reg rstb_button;
	reg unbuf_clk;
	reg button_center;

	// Outputs
	wire [7:0] led;

	// Instantiate the Unit Under Test (UUT)
	main uut (
		.switch(switch), 
		.led(led), 
		.rstb_button(rstb_button), 
		.unbuf_clk(unbuf_clk), 
		.button_center(button_center)
	);

	initial begin
		// Initialize Inputs
		switch = 0;
		rstb_button = 0;
		unbuf_clk = 0;
		button_center = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule


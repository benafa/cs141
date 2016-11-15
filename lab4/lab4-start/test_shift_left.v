`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:59:57 11/08/2016
// Design Name:   sign_extend
// Module Name:   C:/Users/cs141/cs141/lab4/lab4-start/test_shift_left.v
// Project Name:  lab4-start
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sign_extend
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_shift_left;

	// Inputs
	reg [1:0] X;

	// Outputs
	wire [3:0] Y;

	// Instantiate the Unit Under Test (UUT)
	shift_left #(.START(2), .END(4), .SHAMT(2)) uut (
		.X(X), 
		.Y(Y)
	);

	initial begin
		// Initialize Inputs
		X = 0;

		// Wait 100 ns for global reset to finish
		#100;
      X = 4'b00; #10;
		X = 4'b01; #10;
		X = 4'b10; #10;
		X = 4'b11; #10;
		// Add stimulus here

	end
      
endmodule


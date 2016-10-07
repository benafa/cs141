`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs

// You will need to add to this module to interface it with your FSM

module led_switch_driver(button_center_db, rst);

	input wire button_center_db, rst;
	
	reg [1:0] ctr;
	
	// creates a 4 bit counter that counts everytime the center button is pressed
	// feel free to modify this as you see fit - you likely will need to
	always @(posedge button_center_db) begin
		if (rst) begin
			ctr <= 0;
		end
		else begin
			ctr <= ctr + 1;
		end
	end


endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire

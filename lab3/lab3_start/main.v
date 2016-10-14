`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2016
// Module Name:    main 
// Author(s): Patrick Hansen & Ben Anadappa
// Description: CS141 Lab 3
//
//
//////////////////////////////////////////////////////////////////////////////////
`include "FSM_DEFINES.v"

module main(switch, led, rstb_button, unbuf_clk, button_center);

	//port definitions
	input wire [7:0] switch;
	input wire rstb_button, unbuf_clk, button_center;
	output wire [7:0] led;
	
	wire cclk, rstb, rst, button_center_db;
	reg [2:0] state;
	
	clock_generator CLOCK_GEN (.clk_100M_raw(unbuf_clk),.clk_100M(cclk));
	
	// debounce any changes lasting less than 100ms
	debouncer #(.CYCLES(10_000_000),.RESET_VALUE(1'b0),.COUNTER_WIDTH(32)) DEBOUNCE_RSTB (
		.clk(cclk),.rst(1'b0),.bouncy(rstb_button),.debounced(rstb));
	debouncer #(.CYCLES(10_000_000),.RESET_VALUE(1'b0),.COUNTER_WIDTH(32)) DEBOUNCE_CENTB (
		.clk(cclk),.rst(1'b0),.bouncy(button_center),.debounced(button_center_db));
		
	assign rst = ~rstb;
	assign led = switch; // you'll want to change this!
	
	led_switch_driver LS_DRIVER (.button_center_db(button_center_db),.rst(rst));
	
	always @(posedge cclk) begin
		case (state)
			`INIT_0 : begin
			
			end
			`INIT_1 : begin
			
			end
			`ADD_c0 : begin
			
			end
			`ADD_c1 : begin
			
			end
			`DISPLAY_SUM : begin
			
			end
			`DISPLAY_EQUALS : begin
			
			end
			default : begin
				
			end
		endcase
	
endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire

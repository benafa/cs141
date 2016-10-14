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
	output reg [7:0] led;
	
	wire cclk, rstb, rst, button_center_db;
	
	clock_generator CLOCK_GEN (.clk_100M_raw(unbuf_clk),.clk_100M(cclk));
	
	// debounce any changes lasting less than 100ms
	debouncer #(.CYCLES(10_000_000),.RESET_VALUE(1'b0),.COUNTER_WIDTH(32)) DEBOUNCE_RSTB (
		.clk(cclk),.rst(1'b0),.bouncy(rstb_button),.debounced(rstb));
	debouncer #(.CYCLES(10_000_000),.RESET_VALUE(1'b0),.COUNTER_WIDTH(32)) DEBOUNCE_CENTB (
		.clk(cclk),.rst(1'b0),.bouncy(button_center),.debounced(button_center_db));
		
	assign rst = ~rstb;
	//assign led = switch; // you'll want to change this!
	
	led_switch_driver LS_DRIVER (.button_center_db(button_center_db),.rst(rst));
	
	/****FINITE STATE MACHINE****/
	
	reg [2:0] state,			//holds the state of the fsm
				 head,			//determines the address of the registers reading from/writing to
				 write_ena;		//determines which tapes are being written to
	reg [1:0] write_data;	//data being written
	wire [1:0] read_data_0,	//data being read
				  read_data_1,
				  read_data_SUM;
				  
	reg reading;
	
	tape TAPE_0 (.head(head), .write_ena(write_ena[0]), .rst(rst), .clk(cclk), .write_data(write_data), .read_data(read_data_0));
	tape TAPE_1 (.head(head), .write_ena(write_ena[1]), .rst(rst), .clk(cclk), .write_data(write_data), .read_data(read_data_1));
	tape TAPE_SUM (.head(head), .write_ena(write_ena[2]), .rst(rst), .clk(cclk), .write_data(write_data), .read_data(read_data_SUM));
	
	always @(negedge cclk) begin
	
		if (rst) begin
			state <= `INITIALIZE;
		end
		
		case (state)
			`INITIALIZE : begin
				head <= 3'b000;
				write_ena <= 3'b000;
				write_data <= 2'b00;
				state <= `INPUT_0;
			end
			//taking in first number
			`INPUT_0 : begin
				//only reads switches once the center button has been pressed and released
				if (reading && ~button_center_db) begin
					head = head + 1;
					//if we are at the end of our input, go to next state
					if (head == 3'b111) begin
						head <= 3'b000;
						write_ena[0] <= 0;
						reading <= 0;
						state <= `INPUT_1;
					end
					else begin
						//write data into register corresponding to the switch
						write_data <= switch[head];
					end
				end
				else if (button_center_db) begin
					reading <= 1;
					write_ena[0] <= 1;
					write_data <= switch[head];
				end
			end
			`INPUT_1 : begin
				//only reads switches once the center button has been pressed and released
				if (reading && ~button_center_db) begin
					head = head + 1;
					//if we are at the end of our input, go to next state
					if (head == 3'b111) begin
						head <= 3'b000;
						write_ena[1] <= 0;
						reading <= 0;
						state <= `ADD_c0;
					end
					else begin
						//write data into register corresponding to the switch
						write_data <= switch[head];
					end
				end
				else if (button_center_db) begin
					reading <= 1;
					write_ena[1] <= 1;
					write_data <= switch[head];
				end
			end
			`ADD_c0 : begin
			
			end
			`ADD_c1 : begin
			
			end
			
			`DISPLAY_SUM : begin
				if (head == 3'b111) begin
					reading <= 0;
				end
				else if (head == 3'b000) begin
					reading <= 1;
				end
				else if (reading) begin
					head = head + 1;
				end
				case (read_data_SUM)
					`B : begin
						led[head] <= 0;
					end
					`ZERO : begin
						led[head] <= 0;
					end
					`ONE : begin
						led[head] <= 0;
					end
				endcase
				if (switch[7] == 1) begin
					state <= `DISPLAY_EQUALS;
				end	
			end
			
			`DISPLAY_EQUALS : begin
				//temporary
				led <= 8'b00000000;
				
				if (switch[7] == 0) begin
					state <= `DISPLAY_EQUALS;
				end
			end
			
			default : begin
				state <= `INITIALIZE;
			end
		endcase
	end
	
endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire

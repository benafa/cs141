`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    adding_fsm 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
`include "FSM_DEFINES.v"

module adding_fsm(switch, button_center, rst, clk, led);

	//port definitions
	input wire [7:0] switch;
	input wire clk, rst, button_center;
	output reg [7:0] led;
	
	/****FINITE STATE MACHINE****/
	
	reg [2:0] state,			//holds the state of the fsm
				 head,			//determines the address of the registers reading from/writing to
				 write_ena;		//determines which tapes are being written to
	reg [1:0] write_data;	//data being written
	wire [1:0] read_data_0,	//data being read
				  read_data_1,
				  read_data_SUM;
				  
	reg reading;				//flag
	
	//instantiate tapes for inputs and output
	tape TAPE_0 (.head(head), .write_ena(write_ena[0]), .rst(rst), .clk(cclk), .write_data(write_data), .read_data(read_data_0));
	tape TAPE_1 (.head(head), .write_ena(write_ena[1]), .rst(rst), .clk(cclk), .write_data(write_data), .read_data(read_data_1));
	tape TAPE_SUM (.head(head), .write_ena(write_ena[2]), .rst(rst), .clk(cclk), .write_data(write_data), .read_data(read_data_SUM));
	
	always @(negedge cclk) begin
	
		//resetting the fsm to the initial state
		if (rst) begin
			state <= `INITIALIZE;
		end
		
		case (state)
			/* Inititalizes the inputs */
			`INITIALIZE : begin
				head <= 3'b000;
				write_ena <= 3'b000;
				write_data <= 2'b00;
				reading <= 0;
				state <= `INPUT_0;
			end
			
			/* Takes in first number to its respective tape */
			`INPUT_0 : begin
				//only reads switches once the center button has been pressed and released
				if (reading && ~button_center) begin
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
				else if (button_center) begin
					reading <= 1;
					write_ena[0] <= 1;
					write_data <= switch[head];
				end
			end
			
			/* Takes in second number to its respective tape */
			`INPUT_1 : begin
				//only reads switches once the center button has been pressed and released
				if (reading && ~button_center) begin
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
				else if (button_center) begin
					reading <= 1;
					write_ena[1] <= 1;
					write_data <= switch[head];
				end
			end
			
			/* Adding state (without carry in) */
			`ADD_c0 : begin
				if (reading) begin
					head = head + 1;
				end
				
				if(read_data_0 == `ZERO && read_data_1 == `ZERO && read_data_SUM == `B) begin
					reading <= 1;
					write_ena[2] <= 1;
					write_data <= `ZERO;
				end
 				if(read_data_0 == `ZERO && read_data_1 == `ONE && read_data_SUM == `B) begin
					reading <= 1;
					write_ena[2] <= 1;
					write_data <= `ONE;
				end
				if(read_data_0 == `ONE && read_data_1 == `ZERO && read_data_SUM == `B) begin
					reading <= 1;
					write_ena[2] <= 1;
					write_data <= `ONE;
				end
				if(read_data_0 == `ONE && read_data_1 == `ONE && read_data_SUM == `B) begin
					reading <= 1;
					write_ena[2] <= 1;
					write_data <= `ZERO;
					state <= `ADD_c1;
				end
				if(read_data_0 == `B && read_data_1 == `B && read_data_SUM == `B) begin
					head = 3'b000;
					write_ena[2] <= 0;
					reading <= 0;
					state <= `DISPLAY_SUM;
				end
			end	
			
			/* Adding state (with carry in) */
			`ADD_c1 : begin
				if (reading) begin
					head = head + 1;
				end
			
				if(read_data_0 == `ZERO && read_data_1 == `ZERO && read_data_SUM == `B) begin
					reading <= 1;
					write_ena[2] <= 1;
					write_data <= `ONE;
					state <= `ADD_c0;
				end
 				if(read_data_0 == `ZERO && read_data_1 == `ONE && read_data_SUM == `B) begin
					reading <= 1;
					write_ena[2] <= 1;
					write_data <= `ZERO;
				end
				if(read_data_0 == `ONE && read_data_1 == `ZERO && read_data_SUM == `B) begin
					reading <= 1;
					write_ena[2] <= 1;
					write_data <= `ZERO;
					end
				if(read_data_0 == `ONE && read_data_1 == `ONE && read_data_SUM == `B) begin
					reading <= 1;
					write_ena[2] <= 1;
					write_data <= `ONE;
				end
				if(read_data_0 == `B && read_data_1 == `B && read_data_SUM == `B) begin
					head = 3'b000;
					write_ena[2] <= 0;
					reading <= 0;
					state <= `DISPLAY_SUM;
				end
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

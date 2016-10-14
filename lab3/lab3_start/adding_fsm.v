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

module adding_fsm(switch, button_center, rst, clk, led, state, head, write_ena, read_data_0, read_data_1, read_data_SUM, write_data);

	//port definitions
	input wire [7:0] switch;
	input wire clk, rst, button_center;
	output reg [7:0] led;
	
	/****FINITE STATE MACHINE****/
	
	output reg [2:0] state,			//holds the state of the fsm
				 head,			//determines the address of the registers reading from/writing to
				 write_ena;		//determines which tapes are being written to
	output reg [1:0] write_data;	//data being written
	output wire [1:0] read_data_0,	//data being read
				  read_data_1,
				  read_data_SUM;
				  
	reg reading;				//flag
	reg equal;
	
	//instantiate tapes for inputs and output
	tape TAPE_0 (.head(head), .write_ena(write_ena[0]), .rst(rst), .clk(clk), .write_data(write_data), .read_data(read_data_0));
	tape TAPE_1 (.head(head), .write_ena(write_ena[1]), .rst(rst), .clk(clk), .write_data(write_data), .read_data(read_data_1));
	tape TAPE_SUM (.head(head), .write_ena(write_ena[2]), .rst(rst), .clk(clk), .write_data(write_data), .read_data(read_data_SUM));
	
	always @(negedge clk) begin
	
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
				led <= 8'b00000000;
				equal <= 1;
			end
			
			/* Takes in first number to its respective tape */
			`INPUT_0 : begin
				//only reads switches once the center button has been pressed and released
				if (reading && ~button_center) begin
					head <= head + 1;
					//if we are at the end of our input, go to next state
					if (head == 3'b111) begin
						head <= 3'b000;
						write_ena[0] <= 0;
						reading <= 0;
						state <= `INPUT_1;
					end
					else begin
						//write data into register corresponding to the switch
						case (switch[head + 1])
							0 : write_data <= `ZERO;
							1 : write_data <= `ONE;
						endcase
					end
				end
				else if (button_center) begin
					reading <= 1;
					write_ena[0] <= 1;
					case (switch[head])
							0 : write_data <= `ZERO;
							1 : write_data <= `ONE;
					endcase
				end
			end
			
			/* Takes in second number to its respective tape */
			`INPUT_1 : begin
				//only reads switches once the center button has been pressed and released
				if (reading && ~button_center) begin
					head <= head + 1;
					//if we are at the end of our input, go to next state
					if (head == 3'b111) begin
						head <= 3'b000;
						write_ena[1] <= 0;
						reading <= 0;
						state <= `ADD_c0;
					end
					else begin
						//write data into register corresponding to the switch
						case (switch[head + 1])
							0 : write_data <= `ZERO;
							1 : write_data <= `ONE;
						endcase
					end
				end
				else if (button_center) begin
					reading <= 1;
					write_ena[1] <= 1;
					case (switch[head])
							0 : write_data <= `ZERO;
							1 : write_data <= `ONE;
					endcase
				end
			end
			
			/* Adding state (without carry in) */
			`ADD_c0 : begin
				if (reading) begin
					if (head == 3'b111) begin
						head <= 3'b000;
						write_ena[2] <= 0;
						reading <= 0;
						state <= `DISPLAY_SUM;
					end
					else begin
						head <= head + 1;
						reading <= 0;
						write_ena[2] <= 0;
					end
				end
				
				if(read_data_0 == `ZERO && read_data_1 == `ZERO && read_data_SUM == `B) begin
					reading <= 1;
					write_ena[2] <= 1;
					write_data <= `ZERO;
				end
 				else if(read_data_0 == `ZERO && read_data_1 == `ONE && read_data_SUM == `B) begin
					reading <= 1;
					write_ena[2] <= 1;
					write_data <= `ONE;
				end
				else if(read_data_0 == `ONE && read_data_1 == `ZERO && read_data_SUM == `B) begin
					reading <= 1;
					write_ena[2] <= 1;
					write_data <= `ONE;
				end
				else if(read_data_0 == `ONE && read_data_1 == `ONE && read_data_SUM == `B) begin
					reading <= 1;
					write_ena[2] <= 1;
					write_data <= `ZERO;
					state <= `ADD_c1;
				end
				else if(read_data_0 == `B && read_data_1 == `B && read_data_SUM == `B) begin
					reading <= 1;
					write_ena[2] <= 1;
					write_data <= `ZERO;
				end
			end	
			
			/* Adding state (with carry in) */
			`ADD_c1 : begin
				if (reading) begin
					if (head == 3'b111) begin
						head <= 3'b000;
						write_ena[2] <= 0;
						reading <= 0;
						state <= `DISPLAY_SUM;
					end
					else begin
						head <= head + 1;
						reading <= 0;
						write_ena[2] <= 0;
					end
				end
			
				if(read_data_0 == `ZERO && read_data_1 == `ZERO && read_data_SUM == `B) begin
					reading <= 1;
					write_ena[2] <= 1;
					write_data <= `ONE;
					state <= `ADD_c0;
				end
 				else if(read_data_0 == `ZERO && read_data_1 == `ONE && read_data_SUM == `B) begin
					reading <= 1;
					write_ena[2] <= 1;
					write_data <= `ZERO;
				end
				else if(read_data_0 == `ONE && read_data_1 == `ZERO && read_data_SUM == `B) begin
					reading <= 1;
					write_ena[2] <= 1;
					write_data <= `ZERO;
					end
				else if(read_data_0 == `ONE && read_data_1 == `ONE && read_data_SUM == `B) begin
					reading <= 1;
					write_ena[2] <= 1;
					write_data <= `ONE;
				end
				else if(read_data_0 == `B && read_data_1 == `B && read_data_SUM == `B) begin
					reading <= 1;
					write_ena[2] <= 1;
					write_data <= `ONE;
				end
			end
			
			`DISPLAY_SUM : begin
				if (reading) begin
					head <= head + 1;
					reading <= 0;
				end
				else begin
					case (read_data_SUM)
						`B : begin
							led[head] <= 0;
							reading <= 1;
						end
						`ZERO : begin
							led[head] <= 0;
							reading <= 1;
						end
						`ONE : begin
							led[head] <= 1;
							reading <= 1;
						end
					endcase
				end
				
				if (switch[7] == 1) begin
					state <= `DISPLAY_EQUALS;
				end	
			end
			
			`DISPLAY_EQUALS : begin
				if (read_data_0 != read_data_1) begin
					equal <= 0;
				end
				
				if (equal) begin
					led <= 8'b11111111;
				end
				else begin
					led <= 8'b00000000;
				end

				head <= head + 1;
				
				if (switch[7] == 0) begin
					state <= `DISPLAY_SUM;
				end
			end
			
			default : begin
				state <= `INITIALIZE;
			end
		endcase
	end

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire

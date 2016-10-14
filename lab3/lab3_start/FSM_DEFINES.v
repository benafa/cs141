`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    FSM_DEFINES 
// Author(s): Patrick Hansen & Ben Anadappa
// Description: contains a written set of defines for FSM and register values
//
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef FSM_DEFINES
`define FSM_DEFINES

`define B 2'b00
`define ZERO 2'b01
`define ONE 2'b10

`define INIT_0 3'b000
`define INIT_1 3'b001
`define ADD_c0 3'b010
`define ADD_c1 3'b011
`define DISPLAY_SUM 3'b100
`define DISPLAY_EQUALS 3'b101

`endif

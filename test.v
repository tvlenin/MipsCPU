`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:06:01 06/18/2017
// Design Name:   top
// Module Name:   /home/tvlenin/Projects/XILINX/MipsCPU/test.v
// Project Name:  MipsCPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test;

	// Inputs
	reg clock;
	reg reset;
	reg [5:0] opc;
	reg [5:0] func;
	reg [4:0] Number1;
	reg [4:0] Number2;

	// Outputs
	wire [31:0] exit;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.clock(clock), 
		.reset(reset), 
		.opc(opc), 
		.func(func), 
		.Number1(Number1), 
		.Number2(Number2), 
		.exit(exit)
	);
always #1 clock = ~clock;
	initial begin
		// Initialize Inputs
		clock = 0;
		reset = 0;
		opc = 0;
		func = 0;
		Number1 = 0;
		Number2 = 0;

		// Wait 100 ns for global reset to finish
		
		#0;
		reset = 1;
		#2
		reset = 0;
		Number1 = 1;
		#15
		reset = 1;
		#2
		reset = 0;
		// Add stimulus here

	end
      
endmodule


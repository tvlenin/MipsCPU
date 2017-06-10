`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:56:48 06/09/2017
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
	reg [5:0] opc;
	reg [5:0] func;
	reg [4:0] Number1;
	reg [4:0] Number2;

	// Outputs
	wire [31:0] exit;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.clock(clock), 
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
		opc = 0;
		func = 0;
		Number1 = 0;
		Number2 = 0;

		// Wait 100 ns for global reset to finish
		#100;
		func = 6'b100000;
      Number1 = 0;
		Number2 = 1;  
		// Add stimulus here

	end
      
endmodule


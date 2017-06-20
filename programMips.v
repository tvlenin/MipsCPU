`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:07:39 06/09/2017 
// Design Name: 
// Module Name:    programMips 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module programMips(
	 input [2:0] enableFSM,
    input clock,
    input [4:0] address,
    output [31:0] data
    );
reg [31:0] dataReg ;
reg [31:0] rom [0:31];

always @(negedge clock) begin
	if(enableFSM == 3'b000)
		dataReg <= rom[address];
end
	initial begin //calculator all instructions pre
    rom[0] = 32'b00000000001000100000000000100000;//add t0, t1, t2 
    rom[1] = 32'b00000000001000100000000000100010;//sub t0, t1, t2
    rom[2] = 32'b00000000001000100000000000100110;//mul t0, t1, t2
	end
assign data = dataReg;




endmodule

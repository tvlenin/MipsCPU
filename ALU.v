`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:20:32 06/09/2017 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
    input clock,
    input [5:0] opcode,
    input [31:0] nIn1,
    input [31:0] nIn2,
    input [5:0] functionCode,
    output [31:0] answerOut
	 
    );
reg [31:0] answerOutreg;
always @(*) begin
	if (opcode == 6'b000000) begin
		if (functionCode == 6'b100000) begin//add two numbers
			answerOutreg = nIn1 + nIn2;
		end
		if (functionCode == 6'b100010) begin//subtract two numbers
			answerOutreg = nIn1 + nIn2;
		end
		if (functionCode == 6'b100110) begin//multiply two numbers
			answerOutreg = nIn1 * nIn2;
		end
		if (functionCode == 6'b100100) begin//And instruction
			answerOutreg = nIn1 & nIn2;
		end
		if (functionCode == 6'b100101) begin//OR instruction
			answerOutreg = nIn1 | nIn2;
		end
	end
end 
assign answerOut = answerOutreg;
endmodule

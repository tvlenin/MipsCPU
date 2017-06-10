`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:07:56 06/10/2017 
// Design Name: 
// Module Name:    splitInstruction 
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
module splitInstruction(
    input [31:0] instruction,
    output reg[5:0] opcodeOut,
    output reg[4:0] rs,
    output reg[4:0] rt,
    output reg[4:0] rd,
    output reg[5:0] functionCode
    );
always @(instruction)begin
	 opcodeOut = instruction[31:26];
	 rs = instruction[25:21];
	 rt = instruction[20:16];
	 rd = instruction[15:11];
	 functionCode = instruction[5:0];
end

endmodule

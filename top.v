`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:16:43 06/09/2017 
// Design Name: 
// Module Name:    top 
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
module top(
    input clock,
	 input reset,
	 input [5:0] opc,
	 input [5:0] func,
	 input [4:0] Number1,
	 input [4:0] Number2,
	 output [31:0] exit,
	 output [31:0] exit2
    );
	 
	 wire [31:0] data1;
	 wire [31:0] data2;
	 wire [31:0] instructionWire;
	 wire [31:0] rsWire;
	 wire [31:0] rtWire;
	 wire [31:0] rdWire;
	 wire [5:0] funcWire;
	 wire [5:0] opcodeWire;
	 wire [2:0] enableFSMwire;
	 wire [31:0] answer2;


FSM_Mips instance_name (
	 .reset(reset),
    .in1(clock), 
    .in2(clock), 
    .clock(clock), 
    .enable(enableFSMwire),
	 .exit(exit)
    );




	 
	 // Instantiate the module
ALU instance_ALU (
	.enableFSM(enableFSMwire),
	.clock(clock), 
	.opcode(opcodeWire), 
	.nIn1(data1), //Info que viene de la ALU**
	.nIn2(data2),	//Info que viene de la ALU**
	.functionCode(funcWire),
	.answerOut(exit),
	.answerOut2(answer2)
	);
programMips instance_Memory (
	.enableFSM(enableFSMwire),
	.clock(clock), 
	.address(Number1), 
	.data(instructionWire)
	);
registers instance_Register (
	.enableFSM(enableFSMwire),
	.data_in1(data_in1), //Por aqui escribimos los numeros al registro
	.data_in2(data_in2), //Por aqui escribimos los numeros al registro
	.data_in3(answer2),
	.data_out1(data1), // info que va a la ALU**
	.data_out2(data2), // info que va a la ALU**
	.rw(1), 				//Elegir lectura o escritura
	.addr1(rsWire),	//Direccion donde se encuentra el dato    t1 
	.addr2(rtWire),	//Direccion donde se encuentra el dato 	t2
	.exit(exit2),
	.clock(clock)
	);
// Instantiate the module
splitInstruction instance_Split (
	.enableFSM(enableFSMwire),
	.instruction(instructionWire), 
	.opcodeOut(opcodeWire), 
	.rs(rsWire), 
	.rt(rtWire), 
	.rd(rd),
	.functionCode(funcWire)
	);








	 
	 


endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:49:57 06/09/2017 
// Design Name: 
// Module Name:    registers 
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
module registers(
	 input [2:0] enableFSM,
    input [31:0] data_in1,
	 input [31:0] data_in2,
	 input [31:0] data_in3,
    output [31:0] data_out1,
	 output [31:0] data_out2,
    input rw,
    input [4:0] addr1,
	 input [4:0] addr2,
	 input [4:0] addr3,
	 output [31:0] exit,
    input clock
    );
reg [31:0] dataReg1;
reg [31:0] dataReg2;

reg [31:0] ram [0:31];
initial begin
    ram[0] = 0; //t0
    ram[1] = 20; //t1
    ram[2] = 30; //t2
    ram[3] = 0; //t3
    ram[4] = 0; //t4 
    ram[5] = 0; //t5
    ram[6] = 0; //t6
    ram[7] = 0; //t7
end
  always @(posedge clock) begin
    if (rw == 1 && enableFSM == 3'b001)begin
    dataReg1 <= ram[addr1];
	 dataReg2 <= ram[addr2];
	 end
  end

  //-- Escritura en la memoria
  always @(posedge clock) begin
    if (rw == 0)begin
     ram[addr1] <= data_in1;
	  ram[addr2] <= data_in2;
	 end
	 if (enableFSM == 3'b011)begin
     ram[00011] <= data_in3;
	 end
  end
assign data_out1 = dataReg1;
assign data_out2 = dataReg2;
assign exit = ram[00011];

endmodule

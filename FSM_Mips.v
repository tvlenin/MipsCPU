`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:29:04 06/18/2017 
// Design Name: 
// Module Name:    FSM_Mips 
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
module FSM_Mips(
	 input reset,
    input in1,
    input in2,
	 input clock,
    output [0:2] enable,
	 output [31:0] exit
    );
	 
parameter State_Fetch = 0,
			 State_Decode = 1,
			 State_Execute = 2,
			 State_Memory = 3,
			 State_WriteBack = 4,
			 State_Extra = 6;
			 
reg [0:2] CurrentState;
reg [0:2] NextState;

//Control de la maquina de estados, decide que sigue
always @ (posedge clock or posedge reset) begin
	if(reset) CurrentState <= State_Fetch;
	else CurrentState <= NextState;
end

always @ (*) begin
	NextState = CurrentState;
	case (CurrentState)
		State_Fetch:			//Actual_State = 000 ---------> Next_State = 001
			NextState = 3'b001;		
      State_Decode:			//Actual_State = 001 ---------> Next_State = 010
         NextState = 3'b010;
      State_Execute:			//Actual_State = 010 ---------> Next_State = 011  				#Read Register
         NextState = 3'b011;
      State_WriteBack:			//Actual_State = 011 ---------> Next_State = 100
         NextState = 3'b100;
		State_Extra:			//Actual_State = 100 ---------> Wait for next instruction	
         NextState = 3'b101; 			
      default:
         NextState = 3'b000;	//Wait for Keyboard
   endcase // case (state)
end // always @ (state)

assign enable = CurrentState;



endmodule

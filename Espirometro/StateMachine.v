`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:58:03 04/06/2017 
// Design Name: 
// Module Name:    StateMachine 
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
module StateMachine(
input iReset,
input iCE,
input iClk,
input iBoton,
input iLoser,
input ivLED,
output [1:0]ovStateMachine
    );

reg [1:0]rvState_Machine_D=0;
reg [1:0]rvState_Machine_Q=0;

assign ovStateMachine=rvState_Machine_Q;

always@(posedge iClk)
begin
	if(iReset)
	begin
		rvState_Machine_Q<=0;
	end
	else
	begin
		if(iCE)
		begin
			rvState_Machine_Q<=rvState_Machine_D;
		end
		else
		begin
			rvState_Machine_Q<=rvState_Machine_Q;
		end
	end
end

always@*
begin
	if(rvState_Machine_Q==0 && iBoton)
	begin
		rvState_Machine_D=2'd1;
	end
	else if(rvState_Machine_Q==1 && ~ivLED)
	begin
		rvState_Machine_D=2'd2;
	end
	else if(iLoser && rvState_Machine_Q==2)
	begin
		rvState_Machine_D=2'd3;
	end 
	else
	begin
		rvState_Machine_D=rvState_Machine_Q;
	end
end

endmodule

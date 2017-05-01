`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:20:08 04/05/2017 
// Design Name: 
// Module Name:    Suma_flujo 
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
module Suma_flujo(
input	iClk,
input iCE,
input iReset,
input [7:0]ivDatos,
input [1:0]ivStateMachine,
output [13:0]ovVolumen
    );

reg [13:0]rv_Suma_Q=0;
reg [13:0]rv_Suma_D=0;

assign ovVolumen=rv_Suma_Q;

always @(posedge iClk)
begin
	if(iReset)
	begin
		rv_Suma_Q<=0;
	end
	else
	begin
		if(iCE)
		begin
			rv_Suma_Q<=rv_Suma_D;
		end
		else
		begin
			rv_Suma_Q<=rv_Suma_Q;
		end
	end
end

always@*
begin
	if(ivStateMachine==2'd2)
	begin
		rv_Suma_D=rv_Suma_Q+ivDatos;
	end
	else
	begin
		rv_Suma_D=rv_Suma_Q;
	end
end

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:34:44 04/05/2017 
// Design Name: 
// Module Name:    Comp 
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
module Comp(
input iReset,
input iClk,
input iCE,
input [13:0]ivSuma,
input [9:0]ivCVP,
output [3:0]ovSenal_Barquito
    );


reg [3:0]rvSenal_Barquito_D=0;
reg [3:0]rvSenal_Barquito_Q=0;

assign ovSenal_Barquito=rvSenal_Barquito_Q;

always@(posedge iClk)
begin
	if(iReset)
	begin
		rvSenal_Barquito_Q<=0;
	end
	else
	begin
		if(iCE)
		begin
			rvSenal_Barquito_Q<=rvSenal_Barquito_D;
		end
		else
		begin
			rvSenal_Barquito_Q<=rvSenal_Barquito_Q;
		end
	end
end

always@*
begin
	if(ivSuma<ivCVP)
	begin
		rvSenal_Barquito_D=0;
	end
	else if(ivSuma<(ivCVP*2))
	begin
		rvSenal_Barquito_D=1;
	end
	else if(ivSuma<=(ivCVP*3))
	begin
		rvSenal_Barquito_D=2;
	end
	else if(ivSuma<=(ivCVP*4))
	begin
		rvSenal_Barquito_D=3;
	end
	else if(ivSuma<=(ivCVP*5))
	begin
		rvSenal_Barquito_D=4;
	end
	else if(ivSuma<=(ivCVP*6))
	begin
		rvSenal_Barquito_D=5;
	end
	else if(ivSuma<=(ivCVP*7))
	begin
		rvSenal_Barquito_D=6;
	end
	else if(ivSuma<=(ivCVP*8))
	begin
		rvSenal_Barquito_D=7;
	end
	else if(ivSuma<=(ivCVP*9))
	begin
		rvSenal_Barquito_D=8;
	end
	else if(ivSuma<=(ivCVP*10))
	begin
		rvSenal_Barquito_D=9;
	end
	else if(ivSuma>(ivCVP*10))
	begin
		rvSenal_Barquito_D=10;
	end
	else
	begin
		rvSenal_Barquito_D=rvSenal_Barquito_Q;
	end
end

endmodule

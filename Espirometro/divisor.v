`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:39:53 04/06/2017 
// Design Name: 
// Module Name:    divisor 
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
module divisor(
input iClk,
input iCE,
input iReset,
output oClkMod
    );

reg [23:0]rvCount_Q=0;
reg [23:0]rvCount_D=0;
reg rMod_D=0;
reg rMod_Q=0;

assign oClkMod=rMod_Q;

always @(posedge iClk)
begin
	if(iReset)
	begin
		rvCount_Q<=0;
		rMod_Q<=0;
	end
	else
	begin
		if(iCE)
		begin
			rvCount_Q<=rvCount_D;
			rMod_Q<=rMod_D;
		end
		else
		begin
			rvCount_Q<=rvCount_Q;
			rMod_Q<=rMod_Q;
		end
	end
end

always @*
begin
	if(rvCount_Q==24'd12500000)
	begin
		rvCount_D=0;
		rMod_D=1;
	end
	else
	begin
		rvCount_D=rvCount_Q+1;
		rMod_D=0;
	end
end

endmodule

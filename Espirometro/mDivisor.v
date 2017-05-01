`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:24:04 02/08/2017 
// Design Name: 
// Module Name:    mDivisor 
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
module mDivisor(
			input iClk,
			input iReset,
			input iCle,
			output oClkModified
    );

	reg rFF_D;
	reg rFF_Q;
	reg [26:0] rvCont_D;
	reg [26:0] rvCont_Q;
	
	assign oClkModified=rFF_Q;
	
	always@(posedge iClk)
	begin
		if(iReset)
		begin 
			rFF_Q<=0;
			rvCont_Q<=0;
		end
		else 
		begin
			if(iCle)
			begin
				rFF_Q<=rFF_D;
				rvCont_Q<=rvCont_D;
			end
			else
			begin
				rFF_Q<=rFF_Q;
				rvCont_Q<=rvCont_Q;
			end
		end	
	end		
	
	always@*
	begin
		if(rvCont_Q==27'd90000)
		begin
			rFF_D=1;
			rvCont_D=0;
		end
		else
		begin
			rvCont_D=rvCont_Q+1'd1;
			rFF_D=0;
		end
	end
		
		
	
	
endmodule

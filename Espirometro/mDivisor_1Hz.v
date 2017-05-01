`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:25:44 04/07/2017 
// Design Name: 
// Module Name:    mDivisor_1Hz 
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
module mDivisor_1Hz(
		input iClk,
		input iReset,
		input iCe,
		output oClk_1Hz
		
    );
	 
	 reg rvFF_D = 0;
	 reg rvFF_Q = 0;
	 reg [23:0] rvCount_D = 24'd0;
	 reg [23:0] rvCount_Q = 24'd0;
	 
	 assign oClk_1Hz = rvFF_Q;
	 
	 always @(posedge iClk)
	 begin
			if(iReset)
			begin
				rvFF_Q <= 1'b0;
				rvCount_Q <= 24'd0;
				
			end 
			else 
			begin
				if(iCe)
				begin
					rvCount_Q <= rvCount_D;
					rvFF_Q <= rvFF_D;
					
				end 
				else 
				begin
					rvCount_Q <= rvCount_Q;
					rvFF_Q <= rvFF_Q;
				end 
			end 
	 end 
	 
	 always @*
	 begin
		if(rvCount_Q < 24'd50000000)
		begin
			rvCount_D = rvCount_Q + 1'b1;
			rvFF_D = 1'b0;
		end 
		else 
		begin
			rvCount_D = 24'd0;
			rvFF_D = 1'b1;
		end
		
	 end 


endmodule

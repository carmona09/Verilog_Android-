`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:25:35 04/07/2017 
// Design Name: 
// Module Name:    mPerdedor 
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
module mPerdedor(
				input iClk, 
				input iReset, 
				input iCe, 
				input [7:0] ivFlujo, 
				output oState
				
				
				
    );
	 
	reg [1:0] rvCount_Q = 2'd0;
	reg [1:0] rvCount_D = 2'd0;
	reg rSt_D = 1'b0;
	reg rSt_Q = 1'b0;
	
	assign oState = rSt_Q;
	
	always @(posedge iClk)
	begin
		if(iReset)
		begin
			rvCount_Q <= 2'd0;
			rSt_Q <= 1'b0;
		end 
		else 
		begin
			if(iCe)
			begin
				rvCount_Q <= rvCount_D;
				rSt_Q <= rSt_D;
			end
			else 
			begin
				rvCount_Q <= rvCount_Q;
				rSt_Q <= rSt_Q;
				
			end 
		end 
	end 
	
	
	always @*
	begin
		if(ivFlujo==8'd0)
		begin
			rvCount_D =  rvCount_Q + 1'd1;
		end 
		else 
		begin
			rvCount_D =  rvCount_Q;
			
		end 
		
		if(rvCount_Q == 2'd3)
		begin
			rSt_D = 1'b1;
		end 
		else 
		begin
			rSt_D = 1'b0;
		end 
		
	end 


endmodule

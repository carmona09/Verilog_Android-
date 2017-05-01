`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:26:45 04/05/2017 
// Design Name: 
// Module Name:    Algoritmo_CVP 
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
 module Algoritmo_CVP(
				input [3:0] ivCounter1,
				input [3:0] ivCounter2,
				input iReset,
				input iCle,
				input iClk,
				output [7:0] ovSuma_Total
    );



				reg [7:0] rvSuma_d = 7'd0;
				reg [7:0] rvSuma_q = 7'd0;
				
				
				assign ovSuma_Total = rvSuma_q;

			always @(posedge iClk) 
			begin
				if(iReset)
				begin
					rvSuma_q <= 7'd0;
					
					
				end
				else 
					if(iCle)
					begin
						rvSuma_q <= rvSuma_d;
					end 
					else 
					begin
						rvSuma_q <= rvSuma_q;
					end
				end
			
			
			always @*
			begin
				rvSuma_d = (ivCounter2*4'd10)+ivCounter1;
			end 

endmodule

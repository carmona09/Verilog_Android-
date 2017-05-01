`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:07:17 02/08/2017 
// Design Name: 
// Module Name:    contador1 
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
module mCounter1(
			input iclk,
			input iCle,
			input iReset,
			output[3:0] ovCounter
    );

		reg [3:0] rvFF_Q = 4'b0;
		reg [3:0] rvFF_D = 4'b0;
		assign ovCounter = rvFF_Q;
		 
		always @(posedge iclk)
			begin
				if(iReset)
				begin	
					rvFF_Q <= 4'b0;
				end 
				else
				begin
					if(iCle)
					begin
							rvFF_Q <= rvFF_D;
					end 
					else 
					begin
						if(rvFF_Q==4'b1010)
						begin
							rvFF_Q<=4'b0;
						end 
						else 
						begin
							rvFF_Q<=rvFF_Q;
						end
					end 
				end
					
			end 
			
			always @*
			begin
					rvFF_D = rvFF_Q + 1'b1;
			end 


endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:05:15 02/09/2017 
// Design Name: 
// Module Name:    mMux 
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
module mMux(
				input iclk,
				input icle,
				input ireset,
				input [3:0] ioh,
				input [6:0] counter1,
				input [6:0] counter2,
				input [6:0] counter3,
				input [6:0] counter4,
				output [6:0] ov7seg     
    );
		reg [6:0] rvff_Q;
		reg [6:0] rvff_D;
		assign ov7seg=rvff_Q;
		
		always @(posedge iclk)
		begin
			if(ireset)
			begin
				rvff_Q<=7'b0;
			end 
			else
			begin
				if(icle)
				begin
					rvff_Q<=rvff_D;
				end
				else 
				begin 
				rvff_Q<=rvff_Q;
			end
			end
		end 
		
		always @*
		begin
				case(ioh)
					4'b0001: rvff_D = counter1;
					4'b0010: rvff_D = counter2;
					4'b0100: rvff_D = counter3;
					4'b1000: rvff_D = counter4;
					
					default: rvff_D = 7'b1111111;
				endcase 
				
		end
		


endmodule

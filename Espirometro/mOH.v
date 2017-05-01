`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:34:41 02/09/2017 
// Design Name: 
// Module Name:    mOH 
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
module mOH(
			input iclk,
			input icle,
			input ireset,
			output [3:0] ovsalida
    );
	 
		reg [3:0] rvff_D=2'b01;
		reg [3:0] rvff_Q=2'b01;
		assign ovsalida = rvff_Q;
		
		always @(posedge iclk)
		begin
			if(ireset)
			begin
				rvff_Q<=4'b0001;
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
			if(rvff_Q==4'b1000)
			begin
				rvff_D=4'b0001;
			end 
			else 
			begin
				rvff_D = rvff_Q<<1;
			end
		end 



endmodule

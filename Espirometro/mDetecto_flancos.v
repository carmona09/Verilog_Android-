`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:50:59 02/08/2017 
// Design Name: 
// Module Name:    mDetecto_flancos 
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
module mDetecto_flancos(
				input iclk,
				input icle,
				input iboton,
				input ireset,
				output osalida
    );
					reg rff_D=0;
					reg rff_Q=0;
					
					reg [3:0] rvbotonD=4'b0;
					reg [3:0] rvbotonQ=4'b0;
					assign osalida=rff_Q;
					
				always @(posedge iclk)
				begin
						if(ireset)
						begin
							rff_Q<=0;
							rvbotonQ<=0;
							
						end
						else 
						begin
							if(icle)
							begin 
								rff_Q<=rff_D;
								rvbotonQ<=rvbotonD;
							end
							else
							begin
								rff_Q<=rff_Q;
								rvbotonQ<=rvbotonQ;
							end
						end
						
					
				end 
				
				always @*
				begin
						if(rvbotonQ[0]==0 && rvbotonQ[2]==1 && rvbotonQ[1]==1 && rvbotonQ[3]==1 /*&& rvbotonQ[4]==1 && rvbotonQ[5]==1 && rvbotonQ[6]==1 && rvbotonQ[7]==1*/)
						begin
							rff_D=1'b1;
							
						end
						else
						begin
							rff_D=1'b0;
						end
							
							rvbotonD[0]=iboton;
							rvbotonD[1]=rvbotonQ[0];
							rvbotonD[2]=rvbotonQ[1];
							rvbotonD[3]=rvbotonQ[2];
						/*	rvbotonD[4]=rvbotonQ[3];
							rvbotonD[5]=rvbotonQ[4];
							rvbotonD[6]=rvbotonQ[5];
							rvbotonD[7]=rvbotonQ[6];*/
						
						
				end 

endmodule

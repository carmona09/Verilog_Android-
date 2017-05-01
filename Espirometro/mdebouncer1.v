`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:13:34 02/08/2017 
// Design Name: 
// Module Name:    mdebouncer1 
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
module mDebouncer1( 
			input iclk,
			input iD,
			input iReset,
			input iCle,
			output oQ
    );
			reg [14:0] rvFF_D;
			reg [14:0] rvFF_Q;
			reg rff_D;
			reg rff_Q;
	
			assign oQ=rff_Q;
			
			
			always @(posedge iclk)
			begin
					if(iReset)
					begin 
						rvFF_Q<=0;
						rff_Q<=0;
					end
					else 
					begin
						if(iCle)
						begin 
							rvFF_Q<=rvFF_D;
							rff_Q<=rff_D;
						end
					else 
					begin
						
						rvFF_Q<=rvFF_Q;
						rff_Q<=rff_Q;
					
				 
					end 
					end
			end 
			
			always @*
			begin
				if(rvFF_Q==15'b111111111111111)
				begin
					rff_D=1'b1;
				end 
				else 
				begin
			
						rff_D=1'b0;
				end
					rvFF_D[0]=iD;
					rvFF_D[1]=rvFF_Q[0];
					rvFF_D[2]=rvFF_Q[1];
					rvFF_D[3]=rvFF_Q[2];
					rvFF_D[4]=rvFF_Q[3];
					rvFF_D[5]=rvFF_Q[4];
					rvFF_D[6]=rvFF_Q[5];
					rvFF_D[7]=rvFF_Q[6];
					rvFF_D[8]=rvFF_Q[7];
					rvFF_D[9]=rvFF_Q[8];
					rvFF_D[10]=rvFF_Q[9];
					rvFF_D[11]=rvFF_Q[10];
					rvFF_D[12]=rvFF_Q[11];
					rvFF_D[13]=rvFF_Q[12];
					rvFF_D[14]=rvFF_Q[13];
					
	

	
	
			
			end

endmodule

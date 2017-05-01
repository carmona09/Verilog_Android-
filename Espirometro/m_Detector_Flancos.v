`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:59:45 02/21/2017 
// Design Name: 
// Module Name:    m_Detector_Flancos 
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
module m_Detector_Flancos(

input iClk,
input iReset,
input iSignal,
input iCE,
output oPosedge

    );


    reg  [1:0]rvDet_d;
    reg  [1:0]rvDet_q;
	 reg  rPosedge;
	
	 
	 assign oPosedge = rPosedge;



    
    always @(posedge iClk)
    begin
        if(iReset)
        begin
    
            rvDet_q  <= 0;
            
        end
        else
		      begin
					if(iCE)
					begin
					rvDet_q <= rvDet_d;
					
					end
				else
				begin
					rvDet_q <= rvDet_q;
					
				end
				 end          

      end
    always @*
 begin
	 
	 rvDet_d = {iSignal,rvDet_q[1]};
	 
	 
	 if( rvDet_q == 2'b10)
	   begin
		   rPosedge = 1'b1;
		 end
		  else
		    begin
			   rPosedge = 1'b0;
			 end
end
	 
endmodule

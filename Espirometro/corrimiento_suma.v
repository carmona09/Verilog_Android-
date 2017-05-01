`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:52:52 02/21/2017 
// Design Name: 
// Module Name:    corrimiento_suma 
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
module corrimiento_suma(
input [9:0]ivBits_Binary,
input iReset,
input iCE,
input iClk,
output [3:0]ovUnits,
output[3:0]ovDec,
output[3:0]ovCent,
output[3:0]ovMillar


);
reg [29:0]rvQ=0;
reg [29:0]rvD=0;
reg [14:0]rvCountD;
reg [14:0]rvCountQ=1;
reg [3:0]rvUnitsD;
reg [3:0]rvUnitsQ=0;
reg [3:0]rvDecD;
reg [3:0]rvDecQ=0;
reg [3:0]rvCentD;
reg [3:0]rvCentQ=0;
reg [3:0]rvMillarD;
reg [3:0]rvMillarQ=0;


assign ovUnits=rvUnitsQ;
assign ovDec=rvDecQ;
assign ovCent=rvCentQ;
assign ovMillar=rvMillarQ;

always @*
begin
	rvUnitsD=rvUnitsQ;
	rvDecD=rvDecQ;
	rvCentD=rvCentQ;
	rvMillarD=rvMillarQ;
	
	
	if(rvCountQ==1)
	begin
		rvD[29:14]=0;
		rvD[13:0]={4'b0000,ivBits_Binary};
		rvUnitsD=rvQ[17:14];
		rvDecD=rvQ[21:18];
		rvCentD=rvQ[25:22];
		rvMillarD=rvQ[29:26];
	end

	else if(rvCountQ==15'b100000000000000)
	begin
		rvD=rvQ<<1;
	end
		
	
		else
		begin
		
			rvD=rvQ<<1;
			if(rvQ[16:13] > 3'd4)
			begin
				rvD[17:14]=rvQ[16:13]+2'd3;
			end
			else 
			begin
				rvD[17:14]=rvQ[16:13];
			end
			
			if(rvQ[20:17]>3'd4)
			begin
				rvD[21:18]=rvQ[20:17]+2'd3;
			end
			else 
				rvD[21:18]=rvQ[20:17];
			
			if(rvQ[24:21]>3'd4)
			begin
				rvD[25:22]=rvQ[24:21]+2'd3;
			end
			else
			begin
				rvD[25:22]=rvQ[24:21];
				
			end
			if(rvQ[28:25]>3'd4)
			begin
				rvD[29:26]=rvQ[28:25]+2'd3;
			end
			else
			begin
				rvD[29:26]=rvQ[28:25];
			end
		end
		
	



end

always @*
begin
	if (rvCountQ==15'b100000000000000)
	begin
		
		rvCountD=1;
	end
	else
	begin
		
		rvCountD=rvCountQ<<1;
	end
end


always @(posedge iClk)
begin
	if(iReset)
	begin
		rvQ<=0;
		
	end 
	else
	begin
		if(iCE)
		begin
			rvQ<=rvD;
			rvCountQ<=rvCountD;
			rvUnitsQ<=rvUnitsD;
			rvDecQ<=rvDecD;
			rvCentQ<=rvCentD;
			rvMillarQ<=rvMillarD;
		end
		else
		begin
			rvQ<=rvQ;
			rvCountQ<=rvCountQ;
			rvUnitsQ<=rvUnitsQ;
			rvDecQ<=rvDecQ;
			rvCentQ<=rvCentQ;
			rvMillarQ<=rvMillarQ;
			
			
			
			
		end
	end
end



endmodule


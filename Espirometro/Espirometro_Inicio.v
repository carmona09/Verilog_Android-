`timescale 1ns / 1ps

module Espirometro_Inicio 
(  
    input           Clk ,
    input           iCE,
    input           Rst,
	input			[7:0]ivPeso,
	input			[1:0]ivStateMachine,
    output  		[7:0]ovPeso
);

reg [7:0]rvPeso_D;
reg [7:0]rvPeso_Q;

assign ovPeso=rvPeso_Q;

always @(posedge iClk)
begin
	if(iReset)
	begin
		rvPeso_Q<=0;
	end
	else
	begin
		if(iCE==1'b1 && ivStateMachine==0)
		begin
			rvPeso_Q<=rvPeso_D;
		end
		else
		begin
			rvPeso_Q<=rvPeso_Q;
		end
	end
end

always@*
begin
	rvPeso_D=ivPeso;
end

endmodule
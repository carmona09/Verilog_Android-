`timescale 1ns / 1ps

module Algoritmo_Datos_ADC
(  
    input           iClk ,
    input           iCE,
    input           iReset,
	input			[7:0]ivDatos,
	output			[9:0]ovFlujo
	
);

reg [9:0]rv_Flujo_D=0;
reg [9:0]rv_Flujo_Q=0;

assign ovFlujo = rv_Flujo_Q;


always @(posedge iClk)
begin
	if(iReset)
	begin
		rv_Flujo_Q<=0;
	end
	else
	begin
		if(iCE)
		begin
			rv_Flujo_Q<=rv_Flujo_D;
		end
		else
		begin
			rv_Flujo_Q<=rv_Flujo_Q;
		end
	end
	
end



always @*
begin

	rv_Flujo_D=ivDatos<<2'd2;	
end

endmodule
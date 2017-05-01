`timescale 1ns / 1ps

module State_Machine 
(  
    input           iClk ,
    input           iCE,
    input           iReset,
	input			[7:0]ivPeso,
	input			iBoton,
	input			[2:0]ivLED,
	output			[2:0]ovState_Machine
);

reg [2:0]rvState_Machine_D=0;
reg [2:0]rvState_Machine_Q=0;

assign ovState_Machine = rvState_Machine_Q;


always @(posedge iClk)
begin

	if(iReset)
		begin
			rvState_Machine_Q<=0;
		end
	else
	begin
		if(iCE)
		begin
			rvState_Machine_Q<=rvState_Machine_D;
		end
		else
		begin
			rvState_Machine_Q<=rvState_Machine_Q;
		end
	end

end


always@*
begin
	rvState_Machine_D=rvState_Machine_Q;
	if(rvState_Machine_Q==0 && iBoton==1'b1) //Estado de inicio-Introducción de peso
	begin
		rvState_Machine_D=2'd1;
	end
	else
	begin
		rvState_Machine_D=rvState_Machine_Q;
	end
	if(rvState_Machine_Q==2'd1 && ivLED==3)//Estado 2
	begin
		rvState_Machine_D=2'd2;
	end
	else
	begin
		rvState_Machine_D=rvState_Machine_Q;
	end
	if(rvState_Machine_Q==3'd2 ) //Estado 3
	begin
		rvState_Machine_D=3'd3;
	end
	else if(rvState_Machine_Q==3'd2 )//condicion para pasar a estado de derrota
	begin
		rvState_Machine_D=3'd4;
	end
	else
	begin
		rvState_Machine_D=rvState_Machine_Q;
	end
	
end

endmodule
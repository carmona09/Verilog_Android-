`timescale 1ns / 1ps

module State_2 
(  
    input           iClk ,
    input           iCE,
    input           iReset,

	
	input				[1:0]ivStateMachine,
	output			[2:0]ovLED
);

reg [1:0]rvCount_LED_Q=2'd0;
reg [1:0]rvCount_LED_D=2'd0;
reg [2:0]rvLED_D=3'b111;
reg [2:0]rvLED_Q=3'b111;

assign ovLED=rvLED_Q;

always @(posedge iClk)
begin
	if(iReset)
	begin
		rvCount_LED_Q<=2'd0;
		rvLED_Q <= 3'b111;
	end
	else
	begin
		if(iCE)
		begin
			rvCount_LED_Q<=rvCount_LED_D;
			rvLED_Q <= rvLED_D;
		end
		else
		begin
			rvCount_LED_Q<=rvCount_LED_Q;
			rvLED_Q <= rvLED_Q;
		end
	end
end


always @*
begin
if(ivStateMachine==1)
begin
	rvCount_LED_D=rvCount_LED_Q+1'b1;
	case(rvCount_LED_Q)
		2'd0:rvLED_D=3'b111;
		2'd1:rvLED_D=3'b110;
		2'd2:rvLED_D=3'b100;
		2'd3:rvLED_D=3'b000;
	default:rvLED_D=3'b111;
	endcase
end
else
begin
rvLED_D=rvLED_Q;
rvCount_LED_D=rvCount_LED_Q;
end		
end

endmodule
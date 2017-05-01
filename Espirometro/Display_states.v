`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:35:12 04/06/2017 
// Design Name: 
// Module Name:    Display_states 
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
module Display_states(
input iReset,
input iCE,
input iClk,
input [1:0]ivStateMachine,
input [3:0]ivCount1,
input [3:0]ivCount2,
input [3:0]ivCount_Flujo1,
input [3:0]ivCount_Flujo2,
input [3:0]ivCount_Flujo3,
input [3:0]ivCount_Flujo4,
output[3:0]ovDisplay1,
output[3:0]ovDisplay2,
output[3:0]ovDisplay3,
output[3:0]ovDisplay4
    );

reg [3:0]rvDisplay1_Q=0;
reg [3:0]rvDisplay2_Q=0;
reg [3:0]rvDisplay3_Q=0;
reg [3:0]rvDisplay4_Q=0;
reg [3:0]rvDisplay1_D=0;
reg [3:0]rvDisplay2_D=0;
reg [3:0]rvDisplay3_D=0;
reg [3:0]rvDisplay4_D=0;

assign ovDisplay1=rvDisplay1_Q;
assign ovDisplay2=rvDisplay2_Q;
assign ovDisplay3=rvDisplay3_Q;
assign ovDisplay4=rvDisplay4_Q;

always @(posedge iClk)
begin
	if(iReset)
	begin
		rvDisplay1_Q<=0;
		rvDisplay2_Q<=0;
		rvDisplay3_Q<=0;
		rvDisplay4_Q<=0;
	end
	else
	begin
		if(iCE)
		begin
			rvDisplay1_Q<=rvDisplay1_D;
			rvDisplay2_Q<=rvDisplay2_D;
			rvDisplay3_Q<=rvDisplay3_D;
			rvDisplay4_Q<=rvDisplay4_D;
		end
		else
		begin
			rvDisplay1_Q<=rvDisplay1_Q;
			rvDisplay2_Q<=rvDisplay2_Q;
			rvDisplay3_Q<=rvDisplay3_Q;
			rvDisplay4_Q<=rvDisplay4_Q;
		end
	end
end

always@*
begin
	case(ivStateMachine)
	2'd0:begin
		rvDisplay1_D=ivCount1;
		rvDisplay2_D=ivCount2;
		rvDisplay3_D=4'd10;
		rvDisplay4_D=4'd10;
	end
	2'd1:begin
		rvDisplay1_D=4'd10;
		rvDisplay2_D=4'd10;
		rvDisplay3_D=4'd10;
		rvDisplay4_D=4'd10;
	end
	2'd2:begin
		rvDisplay1_D=ivCount_Flujo1;
		rvDisplay2_D=ivCount_Flujo2;
		rvDisplay3_D=ivCount_Flujo3;
		rvDisplay4_D=ivCount_Flujo4;
	end
	default:begin
		rvDisplay1_D=4'd10;
		rvDisplay2_D=4'd10;
		rvDisplay3_D=4'd10;
		rvDisplay4_D=4'd10;
	end
	endcase
	
end


endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:36:39 02/08/2017 
// Design Name: 
// Module Name:    mBCD 
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
module mBCD(
			input iclk,
			input iCle,
			input iReset,
			input [3:0] iCount,
			output [6:0] ov7segmentos
    );
	 
		
	
				reg [6:0] rv7segmentos;
				reg [6:0] rvFF_7seg;

				assign ov7segmentos=rv7segmentos;

		always @(posedge iclk)
				begin
					if(iReset)
					begin
							rv7segmentos<=7'b0;
					end 
					else
					begin
						if(iCle)
						begin
							rv7segmentos <= rvFF_7seg;	
						end
					else 
					begin
						rv7segmentos<=rv7segmentos;
					end 
					end 
					
					
				end 
				
				always @*
				begin
					
					
					case (iCount)
					
							4'd0: rvFF_7seg = 7'b0000001;
							4'd1: rvFF_7seg = 7'b1001111;
							4'd2: rvFF_7seg = 7'b0010010;
							4'd3: rvFF_7seg = 7'b0000110;
							4'd4: rvFF_7seg = 7'b1001100;
							4'd5: rvFF_7seg = 7'b0100100;
							4'd6: rvFF_7seg = 7'b0100000;
							4'd7: rvFF_7seg = 7'b0001111;
							4'd8: rvFF_7seg = 7'b0000000;
							4'd9: rvFF_7seg = 7'b0001100;
							
							default: rvFF_7seg = 7'b1111111;
							
					endcase 		
				end 



endmodule

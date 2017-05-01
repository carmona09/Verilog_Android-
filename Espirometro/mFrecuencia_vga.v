`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:21:33 04/06/2017 
// Design Name: 
// Module Name:    mFrecuencia_vga 
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
module ClkDivider
(  
    input Clk ,
    input Rst ,
    output Clk25 
);
reg Clk25_d;
reg Clk25_q;

assign Clk25 = Clk25_q;	  // 25 MHz
always @(posedge Clk or posedge Rst)
begin
    if(Rst == 1)
    begin
        Clk25_q <= 0;
    end
    else 
    begin
        Clk25_q <= Clk25_d;
    end
end
always @(*)
begin
    Clk25_d = ~Clk25_q;
end
endmodule 
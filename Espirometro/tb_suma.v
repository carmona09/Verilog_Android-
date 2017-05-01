`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:21:05 04/06/2017
// Design Name:   Suma_flujo
// Module Name:   C:/Users/Alumnos/Desktop/Espirometro/tb_suma.v
// Project Name:  Espirometro
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Suma_flujo
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_suma;

	// Inputs
	reg iClk;
	reg iCE;
	reg iReset;
	reg [7:0] ivDatos;
	reg [1:0] ivStateMachine;

	// Outputs
	wire [13:0] ovVolumen;

	// Instantiate the Unit Under Test (UUT)
	Suma_flujo uut (
		.iClk(iClk), 
		.iCE(iCE), 
		.iReset(iReset), 
		.ivDatos(ivDatos), 
		.ivStateMachine(ivStateMachine), 
		.ovVolumen(ovVolumen)
	);

	initial begin
		// Initialize Inputs
		iClk = 0;
		iCE = 1;
		iReset = 0;
		ivDatos = 0;
		ivStateMachine = 0;

		// Wait 100 ns for global reset to finish
		forever
		begin
			iClk=iClk^1;
			#10;
		end
        
		// Add stimulus here

	end
      
endmodule


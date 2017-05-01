`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:48:48 04/06/2017 
// Design Name: 
// Module Name:    top 
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
module top(
input iReset,
input iClk,
input iBoton,
input iBotonCount1,
input iBotonCount2,
input [7:0]ivDatos,
output [6:0]ovDisplay,
output [3:0]ovAnode,
output [2:0]ovLED,
output hsync ,
output vsync ,
output [2:0] red ,
output [2:0] green ,
output [1:0] blue


    );
	 
wire wReset;
wire wBoton;
wire wBotonCount1;
wire wBotonCount2;
wire wBoton_Flanco;
wire wBoton_FlancoCount1;
wire wBoton_FlancoCount2;
wire [3:0]wvCounter1;
wire [3:0]wvCounter2;
wire [3:0]wvUnits;
wire [3:0]wvDec;
wire [3:0]wvCent;
wire [3:0]wvMillar;
wire [2:0]wvLED;
wire [1:0]wvStateMachine;
wire [3:0]wvDisplay1;
wire [3:0]wvDisplay2;
wire [3:0]wvDisplay3;
wire [3:0]wvDisplay4;
wire [3:0]wvAnode;
wire wDivider;
wire [6:0]wvseg1;
wire [6:0]wvseg2;
wire [6:0]wvseg3;
wire [6:0]wvseg4;
wire wDivider4Hz;
wire [7:0]wvEdad;
wire [9:0]wvCVP;
wire [3:0]wvSenal_Barquito;
wire [9:0]wvFlujo;
wire [13:0]wvVolumen;
wire wClk25;
wire wClk_1Hz;
wire wLoser;

assign ovLED=wvLED;
assign ovAnode=~wvAnode;


mDebouncer1 Reset_debouncer (
    .iclk(iClk), 
    .iD(iReset), 
    .iReset(1'b0), 
    .iCle(1'b1), 
    .oQ(wReset)
    );

mDebouncer1 Boton (
    .iclk(iClk), 
    .iD(iBoton), 
    .iReset(1'b0), 
    .iCle(1'b1), 
    .oQ(wBoton)
    );
mDebouncer1 BotonCount1 (
    .iclk(iClk), 
    .iD(iBotonCount1), 
    .iReset(1'b0), 
    .iCle(1'b1), 
    .oQ(wBotonCount1)
    );
mDebouncer1 BotonCount2 (
    .iclk(iClk), 
    .iD(iBotonCount2), 
    .iReset(1'b0), 
    .iCle(1'b1), 
    .oQ(wBotonCount2)
    );
mDetecto_flancos Flanco_Boton(
    .iclk(iClk), 
    .icle(1'b1), 
    .iboton(wBoton), 
    .ireset(0), 
    .osalida(wBoton_Flanco)
    );
 mDetecto_flancos Flanco_BotonCount1(
    .iclk(iClk), 
    .icle(1'b1), 
    .iboton(wBotonCount1), 
    .ireset(1'b0), 
    .osalida(wBoton_FlancoCount1)
    );
 mDetecto_flancos Flanco_BotonCount2(
    .iclk(iClk), 
    .icle(1'b1), 
    .iboton(wBotonCount2), 
    .ireset(0), 
    .osalida(wBoton_FlancoCount2)
    );
 mCounter1 Counter1 (
    .iclk(iClk), 
    .iCle(wBoton_FlancoCount1), 
    .iReset(wReset), 
    .ovCounter(wvCounter1)
    );

  mCounter1 Counter2 (
    .iclk(iClk), 
    .iCle(wBoton_FlancoCount2), 
    .iReset(wReset), 
    .ovCounter(wvCounter2)
    );

StateMachine Machine (
    .iReset(wReset), 
    .iCE(1'b1), 
    .iClk(iClk),
	 .iLoser(wLoser),
    .iBoton(wBoton_Flanco), 
    .ivLED(wvLED), 
    .ovStateMachine(wvStateMachine)
    );


corrimiento_suma Corrimiento (
    .ivBits_Binary(wvFlujo), 
    .iReset(wReset), 
    .iCE(1'b1), 
    .iClk(iClk), 
    .ovUnits(wvUnits), 
    .ovDec(wvDec), 
    .ovCent(wvCent), 
    .ovMillar(wvMillar)
    );
//inserte aquí corrimiento suma 3 y las salidas de estos irán a los ivCounts_flujos/////agregar clock 1hz
Algoritmo_Datos_ADC Flujo (
    .iClk(iClk), 
    .iCE(wClk_1Hz), 
    .iReset(wReset), 
    .ivDatos(ivDatos), 
    .ovFlujo(wvFlujo)
    );

Display_states Dis_states (
    .iReset(wReset), 
    .iCE(1'b1), 
    .iClk(iClk), 
    .ivStateMachine(wvStateMachine), 
    .ivCount1(wvCounter1), 
    .ivCount2(wvCounter2), 
    .ivCount_Flujo1(wvUnits), 
    .ivCount_Flujo2(wvDec), 
    .ivCount_Flujo3(wvCent), 
    .ivCount_Flujo4(wvMillar), 
    .ovDisplay1(wvDisplay1), 
    .ovDisplay2(wvDisplay2), 
    .ovDisplay3(wvDisplay3), 
    .ovDisplay4(wvDisplay4)
    );

mMux Mux (
    .iclk(iClk), 
    .icle(1'b1), 
    .ireset(wReset), 
    .ioh(wvAnode), 
    .counter1(wvseg1), 
    .counter2(wvseg2), 
    .counter3(wvseg3), 
    .counter4(wvseg4), 
    .ov7seg(ovDisplay)
    );

mDivisor divisor_Mux (
    .iClk(iClk), 
    .iReset(wReset), 
    .iCle(1'b1), 
    .oClkModified(wDivider)
    );

mOH Anodes(
    .iclk(iClk), 
    .icle(wDivider), 
    .ireset(wReset), 
    .ovsalida(wvAnode)
    );

mBCD BCD1 (
    .iclk(iClk), 
    .iCle(1'b1), 
    .iReset(wReset), 
    .iCount(wvDisplay1), 
    .ov7segmentos(wvseg1)
    );
mBCD BCD2 (
    .iclk(iClk), 
    .iCle(1'b1), 
    .iReset(wReset), 
    .iCount(wvDisplay2), 
    .ov7segmentos(wvseg2)
    );
 mBCD BCD3 (
 .iclk(iClk), 
 .iCle(1'b1), 
 .iReset(wReset), 
 .iCount(wvDisplay3), 
 .ov7segmentos(wvseg3)
 );

mBCD BCD4 (
    .iclk(iClk), 
    .iCle(1'b1), 
    .iReset(wReset), 
    .iCount(wvDisplay4), 
    .ov7segmentos(wvseg4)
    );
	 


	 
State_2 Estado2 (
    .iClk(iClk), 
    .iCE(wClk_1Hz), 
    .iReset(wReset), 
    .ivStateMachine(wvStateMachine), 
    .ovLED(wvLED)
    );

divisor  Divider_4Hz (
    .iClk(iClk), 
    .iCE(1'b1), 
    .iReset(1'b0), 
    .oClkMod(wDivider4Hz)
    );


Suma_flujo Sum_fluj (
    .iClk(iClk), 
    .iCE(wDivider4Hz), 
    .iReset(wReset), 
    .ivDatos(ivDatos), 
    .ivStateMachine(wvStateMachine), 
    .ovVolumen(wvVolumen)
    );
	 

Algoritmo_CVP Alg_CVP (   //Calculo de edad ingresada
    .ivCounter1(wvCounter1), 
    .ivCounter2(wvCounter2), 
    .iReset(wReset), 
    .iCle(1'b1), 
    .iClk(iClk), 
    .ovSuma_Total(wvEdad)
    );
	 
	 
CVP CVP_Calculo (	//Calcula los saltos del barco dependiendo de la edad
    .iClk(iClk), 
    .iCE(1'b1), 
    .iReset(wReset), 
    .ivEdad(wvEdad), 
    .ovCVP(wvCVP)
    );

Comp Comparador (	//Señal que mueve barco
    .iReset(iReset), 
    .iClk(iClk), 
    .iCE(1'b1), 
    .ivSuma(wvVolumen), 
    .ivCVP(wvCVP), 
    .ovSenal_Barquito(wvSenal_Barquito)
    );
	
	
	VGA640x480 VGA (
    .Clk(iClk), 
    .ClkEnable(wClk25), 
    .Rst(wReset), 
    .ivState(wvStateMachine), 
    .iS(wvSenal_Barquito), 
    .HSync(hsync), 
    .VSync(vsync), 
    .RedOut(red), 
    .GreenOut(green), 
    .BlueOut(blue)
    );
	

	ClkDivider Divisor_VGA (
    .Clk(iClk), 
    .Rst(wReset), 
    .Clk25(wClk25)
    );
	 
	 mDivisor_1Hz Div_1Hz (
    .iClk(iClk), 
    .iReset(wReset), 
    .iCe(1'b1), 
    .oClk_1Hz(wClk_1Hz)
    );
		mPerdedor Perdedor (
    .iClk(iClk), 
    .iReset(wReset), 
    .iCe(wClk_1Hz), 
    .ivFlujo(ivDatos), 
    .oState(wLoser)
    );



endmodule

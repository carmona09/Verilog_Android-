`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:20:42 04/06/2017 
// Design Name: 
// Module Name:    dfgfdg 
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
module VGA640x480(  
    input           Clk ,
    input           ClkEnable,
    input           Rst,
	 input [1:0] ivState,
	 input [3:0] iS,
	 
    output          HSync ,
    output          VSync,
	 output  [2:0]   RedOut ,
    output  [2:0]   GreenOut ,
    output  [1:0]   BlueOut
	 
	 //input iBoton_incremento
   
);
parameter MAX_HORIZONTAL_PIXELS = 10'd800;

parameter MAX_VERTICAL_LINES = 10'd521;

reg     [9:0]   HCounter_d;
reg     [9:0]   HCounter_q;
reg     [9:0]   VCounter_d;
reg     [9:0]   VCounter_q;
reg             HSync_d;
reg             HSync_q;
reg             VSync_d;
reg             VSync_q;


reg [2:0]	RedOut_d;
reg [2:0]	RedOut_q;
reg [2:0]	GreenOut_d;
reg [2:0]	GreenOut_q;
reg [1:0]	BlueOut_d;
reg [1:0]	BlueOut_q;
/*reg [9:0] Incremento_d = 10'd250;
reg [9:0] Incremento_q = 10'd250;
reg [9:0] Incremento2_d = 10'd240;
reg [9:0] Incremento2_q = 10'd240;*/




assign VSync    = VSync_q;
assign HSync    = HSync_q;
assign RedOut		=	RedOut_q;
assign BlueOut		=	BlueOut_q;
assign GreenOut	=	GreenOut_q;


always @(posedge Clk or posedge Rst)
begin
    if(Rst == 1) 
    begin
        HCounter_q         			<=  10'b0;
        VCounter_q           			<=  10'b0;
        HSync_q                     <=  1'b0;
        VSync_q                     <=  1'b0;
		 RedOut_q		<=	3'b0;
		BlueOut_q	<=	2'b0;	
		GreenOut_q	<=	3'b0;	
/*		Incremento_q <= 10'd250;
		Incremento2_q <= 10'd240;		*/
    end
    else
    begin
        if(ClkEnable)
        begin
            HCounter_q     			<=  HCounter_d;
            VCounter_q       			<=  VCounter_d;
            HSync_q                 <=  HSync_d;
            VSync_q                 <=  VSync_d;
				
				RedOut_q		<=		RedOut_d;
				BlueOut_q	<=		BlueOut_d;
				GreenOut_q	<=		GreenOut_d;
			/*	Incremento_q <= Incremento_d;
				Incremento2_q <= Incremento2_d;*/
        end
        else
        begin
            HCounter_q     			<=  HCounter_q;
            VCounter_q       			<=  VCounter_q;
            HSync_q                 <=  HSync_q;
            VSync_q                 <=  VSync_q;
				
				RedOut_q		<=		RedOut_q;
				BlueOut_q	<=		BlueOut_q;
				GreenOut_q	<=		GreenOut_q;
				/*Incremento_q <= Incremento_q;
				Incremento2_q <= Incremento2_q;*/
        end
    end
end 
always @*
begin
    HCounter_d             			=  HCounter_q;
    VCounter_d               			=  VCounter_q;
    HSync_d                         =  HSync_q;
    VSync_d                         =  VSync_q;
	 RedOut_d		=		RedOut_q;
	BlueOut_d	=		BlueOut_q;
	GreenOut_d	=		GreenOut_q;
	/*Incremento_d = Incremento_q;
	Incremento2_d = Incremento2_q;*/
	 
    //
    if(HCounter_q < MAX_HORIZONTAL_PIXELS)
    begin
        HCounter_d =   HCounter_q + 1;
    end
    else
    begin
        HCounter_d =   0;
    end
	  if(VCounter_q < MAX_VERTICAL_LINES)
	  begin
        if(HCounter_q == MAX_HORIZONTAL_PIXELS)
		  begin
			VCounter_d  = VCounter_q + 1;
		  end
		  else
		  begin
		    VCounter_d = VCounter_q;
		  end
	  end
	  else
	  begin
			VCounter_d   =   0;
	  end
	  HSync_d = (HCounter_q < 128)?1:0;
	  VSync_d = (VCounter_q < 2)?1:0;
		//Inicio de la A
		/*if(iBoton_incremento)
		begin
			Incremento_d = Incremento_q + 6'd35;
			Incremento2_d = Incremento2_q + 6'd35;
		end 
		else 
		begin	
			Incremento_d = Incremento_d;
			Incremento2_d = Incremento2_d;
			
		end 
		if(Incremento_q == 600 && Incremento2_q == 590)
		begin
			Incremento_d = 250;
			Incremento2_d = 240;
		end 
		else 
		begin
			Incremento_d = Incremento_d;
			Incremento2_d = Incremento2_d;
		end */
		
	  /* if((HCounter_q  < Incremento_q) && (HCounter_q >= Incremento2_q)&& (VCounter_q  < 10'd260)&& (VCounter_q >= 10'd240))
		 begin
			RedOut_d = 3'b111;
			BlueOut_d = 2'b00;
			GreenOut_d = 3'b000; 
		 end */
		 case (ivState)
			2'd0:begin // JUGAR
			///////////////////////////////////////////////////////////LETRA J..
			if((HCounter_q  < 10'd230) && (HCounter_q >= 10'd200)&& (VCounter_q  < 10'd330)&& (VCounter_q >= 10'd150))
		 begin 
			RedOut_d = 3'b111;
			BlueOut_d = 2'b00;
			GreenOut_d = 3'b000; 
		 end 
		 else if((HCounter_q  < 10'd200) && (HCounter_q >= 10'd150)&& (VCounter_q  < 10'd330)&& (VCounter_q >= 10'd300))
		 begin
				RedOut_d = 3'b111;
			BlueOut_d = 2'b00;
			GreenOut_d = 3'b000; 
		 end 
		  else if((HCounter_q  < 10'd250) && (HCounter_q >= 10'd150)&& (VCounter_q  < 10'd150)&& (VCounter_q >= 10'd120))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b00;
				GreenOut_d = 3'b000; 
		 end 
		 
		 ///////////////////////////////////////////////////////////////////////////////LETRA U...
		 
		 else if((HCounter_q  < 10'd300) && (HCounter_q >= 10'd270)&& (VCounter_q  < 10'd330)&& (VCounter_q >= 10'd150))
		 begin
				RedOut_d = 3'b000;
			BlueOut_d = 2'b11;
			GreenOut_d = 3'b100; 
		 end 
		  else if((HCounter_q  < 10'd350) && (HCounter_q >= 10'd300)&& (VCounter_q  < 10'd330)&& (VCounter_q >= 10'd300))
		 begin
				RedOut_d = 3'b000;
			BlueOut_d = 2'b11;
			GreenOut_d = 3'b100;
		 end 
		 else if((HCounter_q  < 10'd380) && (HCounter_q >= 10'd350)&& (VCounter_q  < 10'd330)&& (VCounter_q >= 10'd150))
		 begin
			RedOut_d = 3'b000;
			BlueOut_d = 2'b11;
			GreenOut_d = 3'b100; 
		 end 
		 
		 ///////////////////////////////////////////////////////////////////////////////////LETRA G....
		  else if((HCounter_q  < 10'd460 - 6'd20) && (HCounter_q >= 10'd430 - 6'd20)&& (VCounter_q  < 10'd330)&& (VCounter_q >= 10'd150))
		 begin
				RedOut_d = 3'b111;
			BlueOut_d = 2'b11;
			GreenOut_d = 3'b111;
		 end 
		  else if((HCounter_q  < 10'd490 - 6'd20) && (HCounter_q >= 10'd460- 6'd20)&& (VCounter_q  < 10'd170)&& (VCounter_q >= 10'd150))
		 begin
				RedOut_d = 3'b111;
			BlueOut_d = 2'b11;
			GreenOut_d = 3'b111; 
		 end 
		 else if((HCounter_q  < 10'd500 - 6'd20) && (HCounter_q >= 10'd460 - 6'd20)&& (VCounter_q  < 10'd330)&& (VCounter_q >= 10'd300))
		 begin
				RedOut_d = 3'b111;
			BlueOut_d = 2'b11;
			GreenOut_d = 3'b111; 
		 end 
		  else if((HCounter_q  < 10'd500 - 6'd20) && (HCounter_q >= 10'd480 - 6'd20)&& (VCounter_q  < 10'd330)&& (VCounter_q >= 10'd230))
		 begin
				RedOut_d = 3'b111;
			BlueOut_d = 2'b11;
			GreenOut_d = 3'b111; 
		 end 
		  else if((HCounter_q  < 10'd480) && (HCounter_q >= 10'd460 - 6'd20)&& (VCounter_q  < 10'd240)&& (VCounter_q >= 10'd220))
		 begin
				RedOut_d = 3'b111;
			BlueOut_d = 2'b11;
			GreenOut_d = 3'b111;
		 end 
		
		////////////////////////////////////////////////////////////////////////////////// LETRA A...
		else if((HCounter_q  < 10'd530) && (HCounter_q >= 10'd510)&& (VCounter_q  < 10'd330)&& (VCounter_q >= 10'd150))
		 begin
				RedOut_d = 3'b000;
			BlueOut_d = 2'b11;
			GreenOut_d = 3'b100; 
		 end 
		  else if((HCounter_q  < 10'd590) && (HCounter_q >= 10'd570)&& (VCounter_q  < 10'd330)&& (VCounter_q >= 10'd150))
		 begin
				RedOut_d = 3'b000;
			BlueOut_d = 2'b11;
			GreenOut_d = 3'b100; 
		 end 
		 else if((HCounter_q  < 10'd570) && (HCounter_q >= 10'd530)&& (VCounter_q  < 10'd170)&& (VCounter_q >= 10'd150))
		 begin
				RedOut_d = 3'b000;
			BlueOut_d = 2'b11;
			GreenOut_d = 3'b100;
		 end 
		 else if((HCounter_q  < 10'd570) && (HCounter_q >= 10'd530)&& (VCounter_q  < 10'd270)&& (VCounter_q >= 10'd250))
		 begin
			RedOut_d = 3'b000;
			BlueOut_d = 2'b11;
			GreenOut_d = 3'b100; 
		 end 
		 
		 ////////////////////////////////////////////////////////////////////////////////// LETRA r...
		 
		 else if((HCounter_q  < 10'd650) && (HCounter_q >= 10'd620)&& (VCounter_q  < 10'd330)&& (VCounter_q >= 10'd150))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b00;
				GreenOut_d = 3'b000; 
		 end 
		 else if((HCounter_q  < 10'd700) && (HCounter_q >= 10'd620)&& (VCounter_q  < 10'd180)&& (VCounter_q >= 10'd150))
		 begin
			RedOut_d = 3'b111;
				BlueOut_d = 2'b00;
				GreenOut_d = 3'b000; 
		 end 
		
		
	////////////////////////////////TERMINA PINTAR...	 
		 else
	  begin
	   RedOut_d = 3'b000;
		BlueOut_d = 2'b00;
		GreenOut_d = 3'b00;
	  end
		 
				
			
			end 
			2'd1:begin //LOAD..
			end
			2'd2:begin //Movimientos BARCO
				
			case(iS)
		 4'd0:
		 begin 
		 if((HCounter_q  < 10'd250) && (HCounter_q >= 10'd230)&& (VCounter_q  < 10'd250)&& (VCounter_q >= 10'd240))
		 begin 
			RedOut_d = 3'b000;
			BlueOut_d = 2'b11;
			GreenOut_d = 3'b111; 
		 end 
		 else if((HCounter_q  < 10'd270) && (HCounter_q >= 10'd250)&& (VCounter_q  < 10'd250)&& (VCounter_q >= 10'd240))
		 begin
				RedOut_d = 3'b000;
			BlueOut_d = 2'b11;
			GreenOut_d = 3'b100; 
		 end 
		  else if((HCounter_q  < 10'd230) && (HCounter_q >= 10'd220)&& (VCounter_q  < 10'd240)&& (VCounter_q >= 10'd230))
		 begin
				RedOut_d = 3'b000;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b100; 
		 end 
		 //Inicio de la otra A
		  else if((HCounter_q  < 10'd280) && (HCounter_q >= 10'd270)&& (VCounter_q  < 10'd240)&& (VCounter_q >= 10'd230))
		 begin
				RedOut_d = 3'b000;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b111; 
		 end 
		 	  else if((HCounter_q  < 10'd270) && (HCounter_q >= 10'd255)&& (VCounter_q  < 10'd200)&& (VCounter_q >= 10'd195))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b111; 
		 end 
		   else if((HCounter_q  < 10'd255) && (HCounter_q >= 10'd252)&& (VCounter_q  < 10'd250)&& (VCounter_q >= 10'd195))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b00;
				GreenOut_d = 3'b100; 
		 end 
		   else if((HCounter_q  < 10'd260) && (HCounter_q >= 10'd240)&& (VCounter_q  < 10'd260)&& (VCounter_q >= 10'd250))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b00;
				GreenOut_d = 3'b000;
		 end 
		    else if((HCounter_q  < 10'd761) && (HCounter_q >= 10'd661)&& (VCounter_q  < 10'd270)&& (VCounter_q >= 10'd250))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b110;
		 end 
		    else if((HCounter_q  < 10'd674) && (HCounter_q >= 10'd669)&& (VCounter_q  < 10'd290)&& (VCounter_q >= 10'd270))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b110;
		 end 
		    else if((HCounter_q  < 10'd689) && (HCounter_q >= 10'd684)&& (VCounter_q  < 10'd290)&& (VCounter_q >= 10'd270))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b110;
		 end 
		 	   
				
				else
	  begin
	   RedOut_d = 3'b000;
		BlueOut_d = 2'b00;
		GreenOut_d = 3'b00;
	  end
		 end
		 	 //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			 4'd1:
		 begin 
		 if((HCounter_q  < 10'd250 + 10'd40) && (HCounter_q >= 10'd230 + 10'd40)&& (VCounter_q  < 10'd250)&& (VCounter_q >= 10'd240))
		 begin 
			RedOut_d = 3'b000;
			BlueOut_d = 2'b11;
			GreenOut_d = 3'b111; 
		 end 
		 else if((HCounter_q  < 10'd270 + 10'd40) && (HCounter_q >= 10'd250 + 10'd40)&& (VCounter_q  < 10'd250)&& (VCounter_q >= 10'd240))
		 begin
				RedOut_d = 3'b000;
			BlueOut_d = 2'b11;
			GreenOut_d = 3'b100; 
		 end 
		  else if((HCounter_q  < 10'd230 + 10'd40) && (HCounter_q >= 10'd220 + 10'd40)&& (VCounter_q  < 10'd240)&& (VCounter_q >= 10'd230))
		 begin
				RedOut_d = 3'b000;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b100; 
		 end 
		 //Inicio de la otra A
		  else if((HCounter_q  < 10'd280 + 10'd40) && (HCounter_q >= 10'd270 + 10'd40)&& (VCounter_q  < 10'd240)&& (VCounter_q >= 10'd230))
		 begin
				RedOut_d = 3'b000;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b111; 
		 end 
		 	  else if((HCounter_q  < 10'd270 + 10'd40) && (HCounter_q >= 10'd255 + 10'd40)&& (VCounter_q  < 10'd200)&& (VCounter_q >= 10'd195))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b111; 
		 end 
		   else if((HCounter_q  < 10'd255 + 10'd40) && (HCounter_q >= 10'd252 + 10'd40)&& (VCounter_q  < 10'd250)&& (VCounter_q >= 10'd195))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b00;
				GreenOut_d = 3'b100; 
		 end 
		   else if((HCounter_q  < 10'd260 + 10'd40 ) && (HCounter_q >= 10'd240 + 10'd40)&& (VCounter_q  < 10'd260)&& (VCounter_q >= 10'd250))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b00;
				GreenOut_d = 3'b000;
		 end 
		 		    else if((HCounter_q  < 10'd761) && (HCounter_q >= 10'd661)&& (VCounter_q  < 10'd270)&& (VCounter_q >= 10'd250))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b110;
		 end 
		    else if((HCounter_q  < 10'd674) && (HCounter_q >= 10'd669)&& (VCounter_q  < 10'd290)&& (VCounter_q >= 10'd270))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b110;
		 end 
		    else if((HCounter_q  < 10'd689) && (HCounter_q >= 10'd684)&& (VCounter_q  < 10'd290)&& (VCounter_q >= 10'd270))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b110;
		 end 
		 	   
		 
		 	   else
	  begin
	   RedOut_d = 3'b000;
		BlueOut_d = 2'b00;
		GreenOut_d = 3'b00;
	  end
		 end
		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

			 4'd2:
		 begin 
		 if((HCounter_q  < 10'd250 + 10'd80) && (HCounter_q >= 10'd230 + 10'd80)&& (VCounter_q  < 10'd250)&& (VCounter_q >= 10'd240))
		 begin 
			RedOut_d = 3'b000;
			BlueOut_d = 2'b11;
			GreenOut_d = 3'b111; 
		 end 
		 else if((HCounter_q  < 10'd270 + 10'd80) && (HCounter_q >= 10'd250 + 10'd80)&& (VCounter_q  < 10'd250)&& (VCounter_q >= 10'd240))
		 begin
				RedOut_d = 3'b000;
			BlueOut_d = 2'b11;
			GreenOut_d = 3'b100; 
		 end 
		  else if((HCounter_q  < 10'd230 + 10'd80) && (HCounter_q >= 10'd220 + 10'd80)&& (VCounter_q  < 10'd240)&& (VCounter_q >= 10'd230))
		 begin
				RedOut_d = 3'b000;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b100; 
		 end 
		 //Inicio de la otra A
		  else if((HCounter_q  < 10'd280 + 10'd80) && (HCounter_q >= 10'd270 + 10'd80)&& (VCounter_q  < 10'd240)&& (VCounter_q >= 10'd230))
		 begin
				RedOut_d = 3'b000;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b111; 
		 end 
		 	  else if((HCounter_q  < 10'd270 + 10'd80) && (HCounter_q >= 10'd255 + 10'd80)&& (VCounter_q  < 10'd200)&& (VCounter_q >= 10'd195))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b111; 
		 end 
		   else if((HCounter_q  < 10'd255 + 10'd80) && (HCounter_q >= 10'd252 + 10'd80)&& (VCounter_q  < 10'd250)&& (VCounter_q >= 10'd195))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b00;
				GreenOut_d = 3'b100; 
		 end 
		   else if((HCounter_q  < 10'd260 + 10'd80 ) && (HCounter_q >= 10'd240 + 10'd80)&& (VCounter_q  < 10'd260)&& (VCounter_q >= 10'd250))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b00;
				GreenOut_d = 3'b000;
		 end 
		 		    else if((HCounter_q  < 10'd761) && (HCounter_q >= 10'd661)&& (VCounter_q  < 10'd270)&& (VCounter_q >= 10'd250))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b110;
		 end 
		    else if((HCounter_q  < 10'd674) && (HCounter_q >= 10'd669)&& (VCounter_q  < 10'd290)&& (VCounter_q >= 10'd270))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b110;
		 end 
		    else if((HCounter_q  < 10'd689) && (HCounter_q >= 10'd684)&& (VCounter_q  < 10'd290)&& (VCounter_q >= 10'd270))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b110;
		 end 
		 	   
		 	   else
	  begin
	   RedOut_d = 3'b000;
		BlueOut_d = 2'b00;
		GreenOut_d = 3'b00;
	  end
		 end

		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


			4'd3:
		 begin 
		 if((HCounter_q  < 10'd250 + 10'd120) && (HCounter_q >= 10'd230 + 10'd120)&& (VCounter_q  < 10'd250)&& (VCounter_q >= 10'd240))
		 begin 
			RedOut_d = 3'b000;
			BlueOut_d = 2'b11;
			GreenOut_d = 3'b111; 
		 end 
		 else if((HCounter_q  < 10'd270 + 10'd120) && (HCounter_q >= 10'd250 + 10'd120)&& (VCounter_q  < 10'd250)&& (VCounter_q >= 10'd240))
		 begin
				RedOut_d = 3'b000;
			BlueOut_d = 2'b11;
			GreenOut_d = 3'b100; 
		 end 
		  else if((HCounter_q  < 10'd230 + 10'd120) && (HCounter_q >= 10'd220 + 10'd120)&& (VCounter_q  < 10'd240)&& (VCounter_q >= 10'd230))
		 begin
				RedOut_d = 3'b000;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b100; 
		 end 
		 //Inicio de la otra A
		  else if((HCounter_q  < 10'd280 + 10'd120) && (HCounter_q >= 10'd270 + 10'd120)&& (VCounter_q  < 10'd240)&& (VCounter_q >= 10'd230))
		 begin
				RedOut_d = 3'b000;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b111; 
		 end 
		 	  else if((HCounter_q  < 10'd270 + 10'd120) && (HCounter_q >= 10'd255 + 10'd120)&& (VCounter_q  < 10'd200)&& (VCounter_q >= 10'd195))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b111; 
		 end 
		   else if((HCounter_q  < 10'd255 + 10'd120) && (HCounter_q >= 10'd252 + 10'd120)&& (VCounter_q  < 10'd250)&& (VCounter_q >= 10'd195))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b00;
				GreenOut_d = 3'b100; 
		 end 
		   else if((HCounter_q  < 10'd260 + 10'd120 ) && (HCounter_q >= 10'd240 + 10'd120)&& (VCounter_q  < 10'd260)&& (VCounter_q >= 10'd250))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b00;
				GreenOut_d = 3'b000;
		 end 
		 		    else if((HCounter_q  < 10'd761) && (HCounter_q >= 10'd661)&& (VCounter_q  < 10'd270)&& (VCounter_q >= 10'd250))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b110;
		 end 
		    else if((HCounter_q  < 10'd674) && (HCounter_q >= 10'd669)&& (VCounter_q  < 10'd290)&& (VCounter_q >= 10'd270))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b110;
		 end 
		    else if((HCounter_q  < 10'd689) && (HCounter_q >= 10'd684)&& (VCounter_q  < 10'd290)&& (VCounter_q >= 10'd270))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b110;
		 end 
		 	   
		 
		 
		 	   else
	  begin
	   RedOut_d = 3'b000;
		BlueOut_d = 2'b00;
		GreenOut_d = 3'b00;
	  end
		 end
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		4'd4:
		 begin 
		 if((HCounter_q  < 10'd250 + 10'd160) && (HCounter_q >= 10'd230 + 10'd160)&& (VCounter_q  < 10'd250)&& (VCounter_q >= 10'd240))
		 begin 
			RedOut_d = 3'b000;
			BlueOut_d = 2'b11;
			GreenOut_d = 3'b111; 
		 end 
		 else if((HCounter_q  < 10'd270 + 10'd160) && (HCounter_q >= 10'd250 + 10'd160)&& (VCounter_q  < 10'd250)&& (VCounter_q >= 10'd240))
		 begin
				RedOut_d = 3'b000;
			BlueOut_d = 2'b11;
			GreenOut_d = 3'b100; 
		 end 
		  else if((HCounter_q  < 10'd230 + 10'd160) && (HCounter_q >= 10'd220 + 10'd160)&& (VCounter_q  < 10'd240)&& (VCounter_q >= 10'd230))
		 begin
				RedOut_d = 3'b000;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b100; 
		 end 
		 //Inicio de la otra A
		  else if((HCounter_q  < 10'd280 + 10'd160) && (HCounter_q >= 10'd270 + 10'd160)&& (VCounter_q  < 10'd240)&& (VCounter_q >= 10'd230))
		 begin
				RedOut_d = 3'b000;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b111; 
		 end 
		 	  else if((HCounter_q  < 10'd270 + 10'd160) && (HCounter_q >= 10'd255 + 10'd160)&& (VCounter_q  < 10'd200)&& (VCounter_q >= 10'd195))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b111; 
		 end 
		   else if((HCounter_q  < 10'd255 + 10'd160) && (HCounter_q >= 10'd252 + 10'd160)&& (VCounter_q  < 10'd250)&& (VCounter_q >= 10'd195))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b00;
				GreenOut_d = 3'b100; 
		 end 
		   else if((HCounter_q  < 10'd260 + 10'd160 ) && (HCounter_q >= 10'd240 + 10'd160)&& (VCounter_q  < 10'd260)&& (VCounter_q >= 10'd250))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b00;
				GreenOut_d = 3'b000;
		 end 
		 		    else if((HCounter_q  < 10'd761) && (HCounter_q >= 10'd661)&& (VCounter_q  < 10'd270)&& (VCounter_q >= 10'd250))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b110;
		 end 
		    else if((HCounter_q  < 10'd674) && (HCounter_q >= 10'd669)&& (VCounter_q  < 10'd290)&& (VCounter_q >= 10'd270))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b110;
		 end 
		    else if((HCounter_q  < 10'd689) && (HCounter_q >= 10'd684)&& (VCounter_q  < 10'd290)&& (VCounter_q >= 10'd270))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b110;
		 end 
		 	   
		 
		 
		 
		 
		 
		 	   else
	  begin
	   RedOut_d = 3'b000;
		BlueOut_d = 2'b00;
		GreenOut_d = 3'b00;
	  end
		 end
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		4'd5:
		 begin 
		 if((HCounter_q  < 10'd250 + 10'd200) && (HCounter_q >= 10'd230 + 10'd200)&& (VCounter_q  < 10'd250)&& (VCounter_q >= 10'd240))
		 begin 
			RedOut_d = 3'b000;
			BlueOut_d = 2'b11;
			GreenOut_d = 3'b111; 
		 end 
		 else if((HCounter_q  < 10'd270 + 10'd200) && (HCounter_q >= 10'd250 + 10'd200)&& (VCounter_q  < 10'd250)&& (VCounter_q >= 10'd240))
		 begin
				RedOut_d = 3'b000;
			BlueOut_d = 2'b11;
			GreenOut_d = 3'b100; 
		 end 
		  else if((HCounter_q  < 10'd230 + 10'd200) && (HCounter_q >= 10'd220 + 10'd200)&& (VCounter_q  < 10'd240)&& (VCounter_q >= 10'd230))
		 begin
				RedOut_d = 3'b000;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b100; 
		 end 
		 //Inicio de la otra A
		  else if((HCounter_q  < 10'd280 + 10'd200) && (HCounter_q >= 10'd270 + 10'd200)&& (VCounter_q  < 10'd240)&& (VCounter_q >= 10'd230))
		 begin
				RedOut_d = 3'b000;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b111; 
		 end 
		 	  else if((HCounter_q  < 10'd270 + 10'd200) && (HCounter_q >= 10'd255 + 10'd200)&& (VCounter_q  < 10'd200)&& (VCounter_q >= 10'd195))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b111; 
		 end 
		   else if((HCounter_q  < 10'd255 + 10'd200) && (HCounter_q >= 10'd252 + 10'd200)&& (VCounter_q  < 10'd250)&& (VCounter_q >= 10'd195))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b00;
				GreenOut_d = 3'b100; 
		 end 
		   else if((HCounter_q  < 10'd260 + 10'd200 ) && (HCounter_q >= 10'd240 + 10'd200)&& (VCounter_q  < 10'd260)&& (VCounter_q >= 10'd250))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b00;
				GreenOut_d = 3'b000;
		 end 
		 
		 		    else if((HCounter_q  < 10'd761) && (HCounter_q >= 10'd661)&& (VCounter_q  < 10'd270)&& (VCounter_q >= 10'd250))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b110;
		 end 
		    else if((HCounter_q  < 10'd674) && (HCounter_q >= 10'd669)&& (VCounter_q  < 10'd290)&& (VCounter_q >= 10'd270))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b110;
		 end 
		    else if((HCounter_q  < 10'd689) && (HCounter_q >= 10'd684)&& (VCounter_q  < 10'd290)&& (VCounter_q >= 10'd270))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b110;
		 end 
		 	   
		 
		 
		 
		 
		 	   else
	  begin
	   RedOut_d = 3'b000;
		BlueOut_d = 2'b00;
		GreenOut_d = 3'b00;
	  end
		 end

	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	4'd6:
		 begin 
		 if((HCounter_q  < 10'd250 + 10'd240) && (HCounter_q >= 10'd230 + 10'd240)&& (VCounter_q  < 10'd250)&& (VCounter_q >= 10'd240))
		 begin 
			RedOut_d = 3'b000;
			BlueOut_d = 2'b11;
			GreenOut_d = 3'b111; 
		 end 
		 else if((HCounter_q  < 10'd270 + 10'd240) && (HCounter_q >= 10'd250 + 10'd240 )&& (VCounter_q  < 10'd250)&& (VCounter_q >= 10'd240))
		 begin
				RedOut_d = 3'b000;
			BlueOut_d = 2'b11;
			GreenOut_d = 3'b100; 
		 end 
		  else if((HCounter_q  < 10'd230 + 10'd240) && (HCounter_q >= 10'd220 + 10'd240)&& (VCounter_q  < 10'd240)&& (VCounter_q >= 10'd230))
		 begin
				RedOut_d = 3'b000;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b100; 
		 end 
		 //Inicio de la otra A
		  else if((HCounter_q  < 10'd280 + 10'd240) && (HCounter_q >= 10'd270 + 10'd240)&& (VCounter_q  < 10'd240)&& (VCounter_q >= 10'd230))
		 begin
				RedOut_d = 3'b000;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b111; 
		 end 
		 	  else if((HCounter_q  < 10'd270 + 10'd240) && (HCounter_q >= 10'd255 + 10'd240)&& (VCounter_q  < 10'd200)&& (VCounter_q >= 10'd195))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b111; 
		 end 
		   else if((HCounter_q  < 10'd255 + 10'd240) && (HCounter_q >= 10'd252 + 10'd240)&& (VCounter_q  < 10'd250)&& (VCounter_q >= 10'd195))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b00;
				GreenOut_d = 3'b100; 
		 end 
		   else if((HCounter_q  < 10'd260 + 10'd240 ) && (HCounter_q >= 10'd240 + 10'd240)&& (VCounter_q  < 10'd260)&& (VCounter_q >= 10'd250))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b00;
				GreenOut_d = 3'b000;
		 end 
		 
		 		    else if((HCounter_q  < 10'd761) && (HCounter_q >= 10'd661)&& (VCounter_q  < 10'd270)&& (VCounter_q >= 10'd250))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b110;
		 end 
		    else if((HCounter_q  < 10'd674) && (HCounter_q >= 10'd669)&& (VCounter_q  < 10'd290)&& (VCounter_q >= 10'd270))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b110;
		 end 
		    else if((HCounter_q  < 10'd689) && (HCounter_q >= 10'd684)&& (VCounter_q  < 10'd290)&& (VCounter_q >= 10'd270))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b110;
		 end 
		 	   
		 
		 
		 
		 
		 
		 
		 	   else
	  begin
	   RedOut_d = 3'b000;
		BlueOut_d = 2'b00;
		GreenOut_d = 3'b00;
	  end
		 end

	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	4'd7:
		 begin 
		 if((HCounter_q  < 10'd250 + 10'd280) && (HCounter_q >= 10'd230 + 10'd280)&& (VCounter_q  < 10'd250)&& (VCounter_q >= 10'd240))
		 begin 
			RedOut_d = 3'b000;
			BlueOut_d = 2'b11;
			GreenOut_d = 3'b111; 
		 end 
		 else if((HCounter_q  < 10'd270 + 10'd280) && (HCounter_q >= 10'd250 + 10'd280)&& (VCounter_q  < 10'd250)&& (VCounter_q >= 10'd240))
		 begin
				RedOut_d = 3'b000;
			BlueOut_d = 2'b11;
			GreenOut_d = 3'b100; 
		 end 
		  else if((HCounter_q  < 10'd230 + 10'd280) && (HCounter_q >= 10'd220 + 10'd280)&& (VCounter_q  < 10'd240)&& (VCounter_q >= 10'd230))
		 begin
				RedOut_d = 3'b000;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b100; 
		 end 
		 //Inicio de la otra A
		  else if((HCounter_q  < 10'd280 + 10'd280) && (HCounter_q >= 10'd270 + 10'd280)&& (VCounter_q  < 10'd240)&& (VCounter_q >= 10'd230))
		 begin
				RedOut_d = 3'b000;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b111; 
		 end 
		 	  else if((HCounter_q  < 10'd270 + 10'd280) && (HCounter_q >= 10'd255 + 10'd280)&& (VCounter_q  < 10'd200)&& (VCounter_q >= 10'd195))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b111; 
		 end 
		   else if((HCounter_q  < 10'd255 + 10'd280) && (HCounter_q >= 10'd252 + 10'd280)&& (VCounter_q  < 10'd250)&& (VCounter_q >= 10'd195))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b00;
				GreenOut_d = 3'b100; 
		 end 
		   else if((HCounter_q  < 10'd260 + 10'd280 ) && (HCounter_q >= 10'd240 + 10'd280)&& (VCounter_q  < 10'd260)&& (VCounter_q >= 10'd250))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b00;
				GreenOut_d = 3'b000;
		 end 
		 
		 		    else if((HCounter_q  < 10'd761) && (HCounter_q >= 10'd661)&& (VCounter_q  < 10'd270)&& (VCounter_q >= 10'd250))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b110;
		 end 
		    else if((HCounter_q  < 10'd674) && (HCounter_q >= 10'd669)&& (VCounter_q  < 10'd290)&& (VCounter_q >= 10'd270))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b110;
		 end 
		    else if((HCounter_q  < 10'd689) && (HCounter_q >= 10'd684)&& (VCounter_q  < 10'd290)&& (VCounter_q >= 10'd270))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b110;
		 end 
		 	   
		 
		 
		 
		 
		 
		 	   else
	  begin
	   RedOut_d = 3'b000;
		BlueOut_d = 2'b00;
		GreenOut_d = 3'b00;
	  end
		 end

		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

			4'd8:
		 begin 
		 if((HCounter_q  < 10'd250 + 10'd320) && (HCounter_q >= 10'd230 + 10'd320)&& (VCounter_q  < 10'd250)&& (VCounter_q >= 10'd240))
		 begin 
			RedOut_d = 3'b000;
			BlueOut_d = 2'b11;
			GreenOut_d = 3'b111; 
		 end 
		 else if((HCounter_q  < 10'd270 + 10'd320) && (HCounter_q >= 10'd250 + 10'd320)&& (VCounter_q  < 10'd250)&& (VCounter_q >= 10'd240))
		 begin
				RedOut_d = 3'b000;
			BlueOut_d = 2'b11;
			GreenOut_d = 3'b100; 
		 end 
		  else if((HCounter_q  < 10'd230 + 10'd320) && (HCounter_q >= 10'd220 + 10'd320)&& (VCounter_q  < 10'd240)&& (VCounter_q >= 10'd230))
		 begin
				RedOut_d = 3'b000;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b100; 
		 end 
		 //Inicio de la otra A
		  else if((HCounter_q  < 10'd280 + 10'd320) && (HCounter_q >= 10'd270 + 10'd320)&& (VCounter_q  < 10'd240)&& (VCounter_q >= 10'd230))
		 begin
				RedOut_d = 3'b000;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b111; 
		 end 
		 	  else if((HCounter_q  < 10'd270 + 10'd320) && (HCounter_q >= 10'd255 + 10'd320)&& (VCounter_q  < 10'd200)&& (VCounter_q >= 10'd195))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b111; 
		 end 
		   else if((HCounter_q  < 10'd255 + 10'd320) && (HCounter_q >= 10'd252 + 10'd320)&& (VCounter_q  < 10'd250)&& (VCounter_q >= 10'd195))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b00;
				GreenOut_d = 3'b100; 
		 end 
		   else if((HCounter_q  < 10'd260 + 10'd320 ) && (HCounter_q >= 10'd240 + 10'd320)&& (VCounter_q  < 10'd260)&& (VCounter_q >= 10'd250))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b00;
				GreenOut_d = 3'b000;
		 end 
		 
					    else if((HCounter_q  < 10'd761) && (HCounter_q >= 10'd661)&& (VCounter_q  < 10'd270)&& (VCounter_q >= 10'd250))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b110;
		 end 
		    else if((HCounter_q  < 10'd674) && (HCounter_q >= 10'd669)&& (VCounter_q  < 10'd290)&& (VCounter_q >= 10'd270))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b110;
		 end 
		    else if((HCounter_q  < 10'd689) && (HCounter_q >= 10'd684)&& (VCounter_q  < 10'd290)&& (VCounter_q >= 10'd270))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b110;
		 end 
		 	   
		 
		 
		 
		 
		 	   else
	  begin
	   RedOut_d = 3'b000;
		BlueOut_d = 2'b00;
		GreenOut_d = 3'b00;
	  end
		 end

		//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
			4'd9:
		 begin 
		 if((HCounter_q  < 10'd250 + 10'd360) && (HCounter_q >= 10'd230 + 10'd360)&& (VCounter_q  < 10'd250)&& (VCounter_q >= 10'd240))
		 begin 
			RedOut_d = 3'b000;
			BlueOut_d = 2'b11;
			GreenOut_d = 3'b111; 
		 end 
		 else if((HCounter_q  < 10'd270 + 10'd360) && (HCounter_q >= 10'd250 + 10'd360)&& (VCounter_q  < 10'd250)&& (VCounter_q >= 10'd240))
		 begin
				RedOut_d = 3'b000;
			BlueOut_d = 2'b11;
			GreenOut_d = 3'b100; 
		 end 
		  else if((HCounter_q  < 10'd230 + 10'd360) && (HCounter_q >= 10'd220 + 10'd360)&& (VCounter_q  < 10'd240)&& (VCounter_q >= 10'd230))
		 begin
				RedOut_d = 3'b000;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b100; 
		 end 
		 //Inicio de la otra A
		  else if((HCounter_q  < 10'd280 + 10'd360) && (HCounter_q >= 10'd270 + 10'd360)&& (VCounter_q  < 10'd240)&& (VCounter_q >= 10'd230))
		 begin
				RedOut_d = 3'b000;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b111; 
		 end 
		 	  else if((HCounter_q  < 10'd270 + 10'd360) && (HCounter_q >= 10'd255 + 10'd360)&& (VCounter_q  < 10'd200)&& (VCounter_q >= 10'd195))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b111; 
		 end 
		   else if((HCounter_q  < 10'd255 + 10'd360) && (HCounter_q >= 10'd252 + 10'd360)&& (VCounter_q  < 10'd250)&& (VCounter_q >= 10'd195))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b00;
				GreenOut_d = 3'b100; 
		 end 
		   else if((HCounter_q  < 10'd260 + 10'd360 ) && (HCounter_q >= 10'd240 + 10'd360)&& (VCounter_q  < 10'd260)&& (VCounter_q >= 10'd250))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b00;
				GreenOut_d = 3'b000;
		 end 
		 
					    else if((HCounter_q  < 10'd761) && (HCounter_q >= 10'd661)&& (VCounter_q  < 10'd270)&& (VCounter_q >= 10'd250))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b110;
		 end 
		    else if((HCounter_q  < 10'd674) && (HCounter_q >= 10'd669)&& (VCounter_q  < 10'd290)&& (VCounter_q >= 10'd270))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b110;
		 end 
		    else if((HCounter_q  < 10'd689) && (HCounter_q >= 10'd684)&& (VCounter_q  < 10'd290)&& (VCounter_q >= 10'd270))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b110;
		 end 
		 	   
		 
		 
		 
		 
		 	   else
	  begin
	   RedOut_d = 3'b000;
		BlueOut_d = 2'b00;
		GreenOut_d = 3'b00;
	  end
		 end
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
			4'd10:
		 begin 
			if((HCounter_q  < 10'd230) && (HCounter_q >= 10'd200)&& (VCounter_q  < 10'd330)&& (VCounter_q >= 10'd150))
		 begin 
			RedOut_d = 3'b111;
			BlueOut_d = 2'b00;
			GreenOut_d = 3'b000; 
		 end 
		 else if((HCounter_q  < 10'd360) && (HCounter_q >= 10'd330)&& (VCounter_q  < 10'd330)&& (VCounter_q >= 10'd150))
		 begin
				RedOut_d = 3'b111;
			BlueOut_d = 2'b00;
			GreenOut_d = 3'b000; 
		 end 
		  else if((HCounter_q  < 10'd350) && (HCounter_q >= 10'd330)&& (VCounter_q  < 10'd329)&& (VCounter_q >= 10'd230))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b111; 
		 end 
		   else if((HCounter_q  < 10'd280) && (HCounter_q >= 10'd230)&& (VCounter_q  < 10'd330)&& (VCounter_q >= 10'd310))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b00;
				GreenOut_d = 3'b000; 
		 end 
		   else if((HCounter_q  < 10'd330) && (HCounter_q >= 10'd280)&& (VCounter_q  < 10'd330)&& (VCounter_q >= 10'd310))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b00;
				GreenOut_d = 3'b000; 
		 end 
		 ///////////////////////////////////////////////////////////////////////////////////////////Letra I...
		    else if((HCounter_q  < 10'd430) && (HCounter_q >= 10'd400)&& (VCounter_q  < 10'd330)&& (VCounter_q >= 10'd150))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b111; 
		 end 
		 
		 
		 //////////////////////////////////////////////////////////////////////////////////////////////Letra N....
		 
		   else if((HCounter_q  < 10'd510) && (HCounter_q >= 10'd480)&& (VCounter_q  < 10'd330)&& (VCounter_q >= 10'd150))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b00;
				GreenOut_d = 3'b000; 
		 end 
		   else if((HCounter_q  < 10'd590) && (HCounter_q >= 10'd560)&& (VCounter_q  < 10'd330)&& (VCounter_q >= 10'd150))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b00;
				GreenOut_d = 3'b000; 
		 end 
		   else if((HCounter_q  < 10'd560) && (HCounter_q >= 10'd510)&& (VCounter_q  < 10'd170)&& (VCounter_q >= 10'd150))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b00;
				GreenOut_d = 3'b000; 
		 end 
		    else
	  begin
	   RedOut_d = 3'b000;
		BlueOut_d = 2'b00;
		GreenOut_d = 3'b00;
	  end
		 end
		 ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		

		default: 
		 begin 
		 if((HCounter_q  < 10'd250) && (HCounter_q >= 10'd230)&& (VCounter_q  < 10'd250)&& (VCounter_q >= 10'd240))
		 begin 
			RedOut_d = 3'b000;
			BlueOut_d = 2'b11;
			GreenOut_d = 3'b111; 
		 end 
		 else if((HCounter_q  < 10'd270) && (HCounter_q >= 10'd250)&& (VCounter_q  < 10'd250)&& (VCounter_q >= 10'd240))
		 begin
				RedOut_d = 3'b000;
			BlueOut_d = 2'b11;
			GreenOut_d = 3'b100; 
		 end 
		  else if((HCounter_q  < 10'd230) && (HCounter_q >= 10'd220)&& (VCounter_q  < 10'd240)&& (VCounter_q >= 10'd230))
		 begin
				RedOut_d = 3'b000;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b100; 
		 end 
		 //Inicio de la otra A
		  else if((HCounter_q  < 10'd280) && (HCounter_q >= 10'd270)&& (VCounter_q  < 10'd240)&& (VCounter_q >= 10'd230))
		 begin
				RedOut_d = 3'b000;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b111; 
		 end 
		 	  else if((HCounter_q  < 10'd270) && (HCounter_q >= 10'd255)&& (VCounter_q  < 10'd200)&& (VCounter_q >= 10'd195))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b111; 
		 end 
		   else if((HCounter_q  < 10'd255) && (HCounter_q >= 10'd252)&& (VCounter_q  < 10'd250)&& (VCounter_q >= 10'd195))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b00;
				GreenOut_d = 3'b100; 
		 end 
		   else if((HCounter_q  < 10'd260) && (HCounter_q >= 10'd240)&& (VCounter_q  < 10'd260)&& (VCounter_q >= 10'd250))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b00;
				GreenOut_d = 3'b000;
		 end 
		   else
	  begin
	   RedOut_d = 3'b000;
		BlueOut_d = 2'b00;
		GreenOut_d = 3'b00;
	  end
		 end
		
		  endcase
		  end
			
			2'd3: begin //LOSE
			
					if((HCounter_q  < 10'd450) && (HCounter_q >= 10'd400)&& (VCounter_q  < 10'd330)&& (VCounter_q >= 10'd150))
		 begin 
			RedOut_d = 3'b111;
			BlueOut_d = 2'b00;
			GreenOut_d = 3'b000; 
		 end 
		 else if((HCounter_q  < 10'd530) && (HCounter_q >= 10'd450)&& (VCounter_q  < 10'd330)&& (VCounter_q >= 10'd280))
		 begin
				RedOut_d = 3'b111;
			BlueOut_d = 2'b11;
			GreenOut_d = 3'b111; 
		 end 
			
			else
	  begin
	   RedOut_d = 3'b000;
		BlueOut_d = 2'b00;
		GreenOut_d = 3'b00;
	  end
			
			
			
			
			
			
			
			
			
			
			end 
			
			default: 
			begin 
					 if((HCounter_q  < 10'd250) && (HCounter_q >= 10'd230)&& (VCounter_q  < 10'd250)&& (VCounter_q >= 10'd240))
		 begin 
			RedOut_d = 3'b000;
			BlueOut_d = 2'b11;
			GreenOut_d = 3'b111; 
		 end 
		 else if((HCounter_q  < 10'd270) && (HCounter_q >= 10'd250)&& (VCounter_q  < 10'd250)&& (VCounter_q >= 10'd240))
		 begin
				RedOut_d = 3'b000;
			BlueOut_d = 2'b11;
			GreenOut_d = 3'b100; 
		 end 
		  else if((HCounter_q  < 10'd230) && (HCounter_q >= 10'd220)&& (VCounter_q  < 10'd240)&& (VCounter_q >= 10'd230))
		 begin
				RedOut_d = 3'b000;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b100; 
		 end 
		 //Inicio de la otra A
		  else if((HCounter_q  < 10'd280) && (HCounter_q >= 10'd270)&& (VCounter_q  < 10'd240)&& (VCounter_q >= 10'd230))
		 begin
				RedOut_d = 3'b000;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b111; 
		 end 
		 	  else if((HCounter_q  < 10'd270) && (HCounter_q >= 10'd255)&& (VCounter_q  < 10'd200)&& (VCounter_q >= 10'd195))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b11;
				GreenOut_d = 3'b111; 
		 end 
		   else if((HCounter_q  < 10'd255) && (HCounter_q >= 10'd252)&& (VCounter_q  < 10'd250)&& (VCounter_q >= 10'd195))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b00;
				GreenOut_d = 3'b100; 
		 end 
		   else if((HCounter_q  < 10'd260) && (HCounter_q >= 10'd240)&& (VCounter_q  < 10'd260)&& (VCounter_q >= 10'd250))
		 begin
				RedOut_d = 3'b111;
				BlueOut_d = 2'b00;
				GreenOut_d = 3'b000;
		 end 
		   else
	  begin
	   RedOut_d = 3'b000;
		BlueOut_d = 2'b00;
		GreenOut_d = 3'b00;
	  end
			end 
		 endcase
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
		
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			

		 












		// Inicio de mi C
		    /*else if((HCounter_q  < 10'd540) && (HCounter_q >= 10'd520)&& (VCounter_q  < 10'd330)&& (VCounter_q >= 10'd150))
		 begin
				RedOut_d = 3'b000;
				BlueOut_d = 2'b10;
				GreenOut_d = 3'b000; 
		 end
		else if((HCounter_q  < 10'd600) && (HCounter_q >= 10'd540)&& (VCounter_q  < 10'd170)&& (VCounter_q >= 10'd150))
		 begin
				RedOut_d = 3'b000;
				BlueOut_d = 2'b10;
				GreenOut_d = 3'b000;
		 end 		 
		 else if((HCounter_q  < 10'd600) && (HCounter_q >= 10'd540)&& (VCounter_q  < 10'd330)&& (VCounter_q >= 10'd310))
		 begin
				RedOut_d = 3'b000;
				BlueOut_d = 2'b10;
				GreenOut_d = 3'b000; 
		 end 	*/
		
	 
	
end
endmodule


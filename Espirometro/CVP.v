`timescale 1ns / 1ps

module CVP 
(  
    input           iClk ,
    input           iCE,
    input           iReset,
	input			[7:0]ivEdad,
	output			[9:0]ovCVP
);

reg [8:0] rv_CVP_D=0;
reg [8:0] rv_CVP_Q=0;

assign ovCVP = rv_CVP_Q;

always @(posedge iClk)
begin
	if(iReset)
	begin
		rv_CVP_Q<=0;
	end
	else
	begin
		if(iCE)
		begin
			rv_CVP_Q<=rv_CVP_D;
		end
		else
		begin
			rv_CVP_Q<=rv_CVP_Q;
		end
	end
end



always @*
begin
	case(ivEdad)
		8'd10:rv_CVP_D=13'd155;
		8'd11:rv_CVP_D=13'd170;
		8'd12:rv_CVP_D=13'd204;
		8'd13:rv_CVP_D=13'd250;
		8'd14:rv_CVP_D=13'd275;
		8'd15:rv_CVP_D=13'd300;
		8'd16:rv_CVP_D=13'd320;
		8'd17:rv_CVP_D=13'd350;
		8'd18:rv_CVP_D=13'd380;
		8'd19:rv_CVP_D=13'd400;
		8'd20:rv_CVP_D=13'd400;
		8'd21:rv_CVP_D=13'd400;
		8'd22:rv_CVP_D=13'd400;
		8'd23:rv_CVP_D=13'd400;
		8'd24:rv_CVP_D=13'd400;
		8'd25:rv_CVP_D=13'd402;
		8'd26:rv_CVP_D=13'd400;
		8'd27:rv_CVP_D=13'd408;
		8'd28:rv_CVP_D=13'd405;
		8'd29:rv_CVP_D=13'd402;
		8'd30:rv_CVP_D=13'd400;
		8'd31:rv_CVP_D=13'd379;
		8'd32:rv_CVP_D=13'd379;
		8'd33:rv_CVP_D=13'd379;
		8'd34:rv_CVP_D=13'd379;
		8'd35:rv_CVP_D=13'd379;
		8'd36:rv_CVP_D=13'd360;
		8'd37:rv_CVP_D=13'd360;
		8'd38:rv_CVP_D=13'd360;
		8'd39:rv_CVP_D=13'd360;
		8'd40:rv_CVP_D=13'd360;
		8'd41:rv_CVP_D=13'd360;
		8'd42:rv_CVP_D=13'd360;
		8'd43:rv_CVP_D=13'd360;
		8'd44:rv_CVP_D=13'd360;
		8'd45:rv_CVP_D=13'd360;
		8'd46:rv_CVP_D=13'd320;
		8'd47:rv_CVP_D=13'd320;
		8'd48:rv_CVP_D=13'd320;
		8'd49:rv_CVP_D=13'd320;
		8'd50:rv_CVP_D=13'd320;
		8'd51:rv_CVP_D=13'd320;
		8'd52:rv_CVP_D=13'd320;
		8'd53:rv_CVP_D=13'd320;
		8'd54:rv_CVP_D=13'd300;
		8'd55:rv_CVP_D=13'd300;
		8'd56:rv_CVP_D=13'd300;
		8'd57:rv_CVP_D=13'd300;
		8'd58:rv_CVP_D=13'd300;
		8'd59:rv_CVP_D=13'd300;
		8'd60:rv_CVP_D=13'd300;
		8'd61:rv_CVP_D=13'd200;
		8'd62:rv_CVP_D=13'd200;
		8'd63:rv_CVP_D=13'd200;
		8'd64:rv_CVP_D=13'd200;
		8'd65:rv_CVP_D=13'd200;
		default:rv_CVP_D=13'd150;
	endcase
end

	endmodule
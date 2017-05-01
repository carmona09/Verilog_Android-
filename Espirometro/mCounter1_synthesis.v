////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: mCounter1_synthesis.v
// /___/   /\     Timestamp: Wed Feb 08 01:35:52 2017
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/synthesis -ofmt verilog -sim mCounter1.ngc mCounter1_synthesis.v 
// Device	: xc6slx16-3-csg324
// Input file	: mCounter1.ngc
// Output file	: C:\Users\Alumnos\Downloads\mux\pract4\netgen\synthesis\mCounter1_synthesis.v
// # of Modules	: 1
// Design Name	: mCounter1
// Xilinx        : C:\Xilinx\14.7\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module mCounter1 (
  iclk, iCle, iReset, ovCounter
);
  input iclk;
  input iCle;
  input iReset;
  output [3 : 0] ovCounter;
  wire iclk_BUFGP_0;
  wire iCle_IBUF_1;
  wire iReset_IBUF_2;
  wire rvFF_Q_0_rstpot_14;
  wire rvFF_Q_3_rstpot_15;
  wire rvFF_Q_1_rstpot1_16;
  wire rvFF_Q_2_rstpot1_17;
  wire [3 : 0] rvFF_Q;
  IBUF   iCle_IBUF (
    .I(iCle),
    .O(iCle_IBUF_1)
  );
  IBUF   iReset_IBUF (
    .I(iReset),
    .O(iReset_IBUF_2)
  );
  OBUF   ovCounter_3_OBUF (
    .I(rvFF_Q[3]),
    .O(ovCounter[3])
  );
  OBUF   ovCounter_2_OBUF (
    .I(rvFF_Q[2]),
    .O(ovCounter[2])
  );
  OBUF   ovCounter_1_OBUF (
    .I(rvFF_Q[1]),
    .O(ovCounter[1])
  );
  OBUF   ovCounter_0_OBUF (
    .I(rvFF_Q[0]),
    .O(ovCounter[0])
  );
  FD #(
    .INIT ( 1'b0 ))
  rvFF_Q_0 (
    .C(iclk_BUFGP_0),
    .D(rvFF_Q_0_rstpot_14),
    .Q(rvFF_Q[0])
  );
  FD #(
    .INIT ( 1'b0 ))
  rvFF_Q_3 (
    .C(iclk_BUFGP_0),
    .D(rvFF_Q_3_rstpot_15),
    .Q(rvFF_Q[3])
  );
  LUT6 #(
    .INIT ( 64'h1230303030203030 ))
  rvFF_Q_3_rstpot (
    .I0(iCle_IBUF_1),
    .I1(iReset_IBUF_2),
    .I2(rvFF_Q[3]),
    .I3(rvFF_Q[2]),
    .I4(rvFF_Q[0]),
    .I5(rvFF_Q[1]),
    .O(rvFF_Q_3_rstpot_15)
  );
  LUT6 #(
    .INIT ( 64'h1111110122222222 ))
  rvFF_Q_0_rstpot (
    .I0(iCle_IBUF_1),
    .I1(iReset_IBUF_2),
    .I2(rvFF_Q[3]),
    .I3(rvFF_Q[2]),
    .I4(rvFF_Q[1]),
    .I5(rvFF_Q[0]),
    .O(rvFF_Q_0_rstpot_14)
  );
  FD #(
    .INIT ( 1'b0 ))
  rvFF_Q_1 (
    .C(iclk_BUFGP_0),
    .D(rvFF_Q_1_rstpot1_16),
    .Q(rvFF_Q[1])
  );
  LUT4 #(
    .INIT ( 16'h1540 ))
  rvFF_Q_1_rstpot1 (
    .I0(iReset_IBUF_2),
    .I1(iCle_IBUF_1),
    .I2(rvFF_Q[0]),
    .I3(rvFF_Q[1]),
    .O(rvFF_Q_1_rstpot1_16)
  );
  FD #(
    .INIT ( 1'b0 ))
  rvFF_Q_2 (
    .C(iclk_BUFGP_0),
    .D(rvFF_Q_2_rstpot1_17),
    .Q(rvFF_Q[2])
  );
  LUT5 #(
    .INIT ( 32'h12303030 ))
  rvFF_Q_2_rstpot1 (
    .I0(iCle_IBUF_1),
    .I1(iReset_IBUF_2),
    .I2(rvFF_Q[2]),
    .I3(rvFF_Q[1]),
    .I4(rvFF_Q[0]),
    .O(rvFF_Q_2_rstpot1_17)
  );
  BUFGP   iclk_BUFGP (
    .I(iclk),
    .O(iclk_BUFGP_0)
  );
endmodule


`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif


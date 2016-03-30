// DataPath.v
// John Wilkes

module DataPath(input clk,      // system clock
                rst,						// system reset
                input [2:0] regSel,   // register select
                input [2:0] aluSel,   // ALU functionality selection
                input Rin,      // whether the registers should accept input from the bus
                Rout,           // whether the registers should output to the bus
                RAin,
                RCout,
                genConst);

	wire [7:0] bus;    // main data bus
	wire [7:0] regEn;  // which register to ouput to the bus
	wire [7:0] r0Out, r1Out, r2Out, r3Out, r4Out, r5Out, r6Out, r7Out, raOut, rcIn, rcOut;

	Decoder3to8 d0(regSel, regEn);

	/*** general purpose registers ***/
	Register8 r0(clk, rst, Rin & regEn[0], bus, r0Out);
	Register8 r1(clk, rst, Rin & regEn[1], bus, r1Out);
	Register8 r2(clk, rst, Rin & regEn[2], bus, r2Out);
	Register8 r3(clk, rst, Rin & regEn[3], bus, r3Out);
	Register8 r4(clk, rst, Rin & regEn[4], bus, r4Out);
	Register8 r5(clk, rst, Rin & regEn[5], bus, r5Out);
	Register8 r6(clk, rst, Rin & regEn[6], bus, r6Out);
	Register8 r7(clk, rst, Rin & regEn[7], bus, r7Out);

	TriState8 t0(Rout & regEn[0], r0Out, bus);
	TriState8 t1(Rout & regEn[1], r1Out, bus);
	TriState8 t2(Rout & regEn[2], r2Out, bus);
	TriState8 t3(Rout & regEn[3], r3Out, bus);
	TriState8 t4(Rout & regEn[4], r4Out, bus);
	TriState8 t5(Rout & regEn[5], r5Out, bus);
	TriState8 t6(Rout & regEn[6], r6Out, bus);
	TriState8 t7(Rout & regEn[7], r7Out, bus);

	// constant generator (the const is passed thru the regSel bus)
	TriState8 t8(genConst, {5'b00000, regSel}, bus);

	/*** ALU ***/
	// registers for ALU input and output
	Register8 ra(clk, rst, RAin, bus, raOut);
	Register8 rc(clk, rst, 1'b1, rcIn, rcOut);

	TriState8 tc(RCout, rcOut, bus);

	ALU8bit ALU(aluSel, raOut, bus, rcIn);

endmodule

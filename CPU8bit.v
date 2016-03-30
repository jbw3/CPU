// CPU8bit.v
// John Wilkes

module CPU(input clk, rst);

	wire [7:0] iBus; // instruction bus
	wire [2:0] regSel, aluSel;
	wire Rin, Rout, RAin, RCout, genConst;

	ControlUnit cu(clk, rst, iBus, regSel, aluSel, Rin, Rout, RAin, RCout, genConst);
	DataPath dp(clk, rst, regSel, aluSel, Rin, Rout, RAin, RCout, genConst);

endmodule

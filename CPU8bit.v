// CPU8bit.v
// John Wilkes

module CPU(input clk, rst,
           input [7:0] memVal,
           output [7:0] memAddr);

    wire [7:0] bus; // data bus
	wire [2:0] regSel, aluSel;
	wire Rin, Rout, RAin, RCout, genConst;


    /*** Control Unit ***/

	ControlUnit cu(clk, rst, memVal, memAddr, regSel, aluSel, Rin, Rout, RAin, RCout, genConst);


    /*** General Purpose Registers ***/

    GPRegisters regs(clk, rst, regSel, Rin, Rout, bus);


    /*** Constant Generator ***/

    // the const is passed thru the regSel bus
    TriState tConst(genConst, {5'b00000, regSel}, bus);


    /*** ALU ***/

    wire [7:0] raOut, rcIn, rcOut;

    // registers for ALU input and output
    Register ra(clk, rst, RAin, bus, raOut);
    Register rc(clk, rst, 1'b1, rcIn, rcOut);

    TriState tc(RCout, rcOut, bus);

    ALU8bit ALU(aluSel, raOut, bus, rcIn);

endmodule

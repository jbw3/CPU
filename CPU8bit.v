// CPU8bit.v
// John Wilkes

module CPU(input clk, rst,
           input [7:0] memVal,
           output [7:0] memAddr);

    wire [7:0] dataA, dataB, dataC; // data buses
    wire [3:0] aluSel;
	wire [2:0] rInSel, rOutSel;
	wire rInEn, rOutEn, genConst;


    /*** Control Unit ***/

	ControlUnit cu(clk, rst, memVal, memAddr, aluSel, rInSel, rOutSel, rInEn, rOutEn, genConst);


    /*** General Purpose Registers ***/

    GPRegisters regs(clk, rst, rInSel, rOutSel,
                     rInEn,
                     rOutEn,
                     dataC,  // rIn
                     dataB,  // rOut
                     dataA); // r0Out


    /*** Constant Generator ***/

    // the const is passed thru the rOutSel bus
    TriState tConst(genConst, {5'b00000, rOutSel}, dataB);


    /*** ALU ***/

    ALU8bit ALU(aluSel, dataA, dataB, dataC);

endmodule

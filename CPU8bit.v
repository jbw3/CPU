// CPU8bit.v
// John Wilkes

//      ------------
//     | Registers  |
//     |            |
//  +->|R0          |
//  |  |            |
//  |  | R0      Rx |      ------------
//  |   ------------      |     PC     |
//  |    |A      |B       |            |
//  |    |       +------->|addr        |
//  |    |       |         ------------
//  |   _v__   __v_
//  |   \   \_/   /
//  |    \  ALU  /
//  |     \_____/
//  |        |C
//  |        |
//  +--------+

module CPU(input clk, extRst,
           input [7:0] memVal,
           output [7:0] memAddr);

    reg rst;
    wire [7:0] dataA, dataB, dataC; // data buses
    wire [3:0] aluSel;
	wire [2:0] rInSel, rOutSel;
	wire rInEn, rOutEn, genConst, loadAddr;

    // always reset immediately when the external reset
    // goes high
    always @(posedge extRst) begin
        rst <= 1'b1;
    end

    // ensure reset only goes low on positive clock edge
    always @(posedge clk) begin
        if (extRst == 0) begin
            rst <= 1'b0;
        end
    end

    /*** Program Counter ***/

    ProgramCounter pc(clk, rst, loadAddr, dataB, memAddr);


    /*** Control Unit ***/

	ControlUnit cu(rst, memVal, aluSel, rInSel, rOutSel,
                   rInEn, rOutEn, genConst, loadAddr);


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

// GPRegisters.v
// General purpose registers
// John Wilkes

module GPRegisters(input clk,
                   input rst,
                   input [2:0] rInSel,
                   input [2:0] rOutSel,
                   input rInEn,
                   input rOutEn,
                   input [7:0] rIn,
                   output [7:0] rOut,
                   output [7:0] r0Out);

    wire [7:0] rInSig;  // which register to read the bus input
    wire [7:0] rOutSig; // which register to ouput to the bus
    wire [7:0] r1Out, r2Out, r3Out, r4Out, r5Out, r6Out, r7Out;

    Decoder3to8 dIn(rInSel, rInSig);
    Decoder3to8 dOut(rOutSel, rOutSig);

    Register r0(clk, rst, rInEn & rInSig[0], rIn, r0Out);
    Register r1(clk, rst, rInEn & rInSig[1], rIn, r1Out);
    Register r2(clk, rst, rInEn & rInSig[2], rIn, r2Out);
    Register r3(clk, rst, rInEn & rInSig[3], rIn, r3Out);
    Register r4(clk, rst, rInEn & rInSig[4], rIn, r4Out);
    Register r5(clk, rst, rInEn & rInSig[5], rIn, r5Out);
    Register r6(clk, rst, rInEn & rInSig[6], rIn, r6Out);
    Register r7(clk, rst, rInEn & rInSig[7], rIn, r7Out);

    TriState t0(rOutEn & rOutSig[0], r0Out, rOut);
    TriState t1(rOutEn & rOutSig[1], r1Out, rOut);
    TriState t2(rOutEn & rOutSig[2], r2Out, rOut);
    TriState t3(rOutEn & rOutSig[3], r3Out, rOut);
    TriState t4(rOutEn & rOutSig[4], r4Out, rOut);
    TriState t5(rOutEn & rOutSig[5], r5Out, rOut);
    TriState t6(rOutEn & rOutSig[6], r6Out, rOut);
    TriState t7(rOutEn & rOutSig[7], r7Out, rOut);

endmodule

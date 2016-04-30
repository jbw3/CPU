// GPRegisters.v
// General purpose registers
// John Wilkes

module GPRegisters(input clk,
                   input rst,
                   input [3:0] rInSel,
                   input [3:0] raOutSel,
                   input [3:0] rbOutSel,
                   input rInEn,
                   input rOutEn,
                   input [15:0] rIn,
                   output [15:0] raOut,
                   output [15:0] rbOut);

    wire [15:0] rInSig;   // which register to read the bus input
    wire [15:0] raOutSig; // which register to ouput to bus A
    wire [15:0] rbOutSig; // which register to ouput to bus B
    wire [15:0] r0Out, r1Out, r2Out, r3Out, r4Out, r5Out, r6Out, r7Out,
                r8Out, r9Out, r10Out, r11Out, r12Out, r13Out, r14Out, r15Out;

    Decoder4to16 inDec(rInSel, rInSig);
    Decoder4to16 aOutDec(raOutSel, rOutSig);
    Decoder4to16 bOutDec(rbOutSel, rbOutSig);

    Register r0(clk, rst, rInEn & rInSig[0], rIn, r0Out);
    Register r1(clk, rst, rInEn & rInSig[1], rIn, r1Out);
    Register r2(clk, rst, rInEn & rInSig[2], rIn, r2Out);
    Register r3(clk, rst, rInEn & rInSig[3], rIn, r3Out);
    Register r4(clk, rst, rInEn & rInSig[4], rIn, r4Out);
    Register r5(clk, rst, rInEn & rInSig[5], rIn, r5Out);
    Register r6(clk, rst, rInEn & rInSig[6], rIn, r6Out);
    Register r7(clk, rst, rInEn & rInSig[7], rIn, r7Out);
    Register r8(clk, rst, rInEn & rInSig[8], rIn, r8Out);
    Register r9(clk, rst, rInEn & rInSig[9], rIn, r9Out);
    Register r10(clk, rst, rInEn & rInSig[10], rIn, r10Out);
    Register r11(clk, rst, rInEn & rInSig[11], rIn, r11Out);
    Register r12(clk, rst, rInEn & rInSig[12], rIn, r12Out);
    Register r13(clk, rst, rInEn & rInSig[13], rIn, r13Out);
    Register r14(clk, rst, rInEn & rInSig[14], rIn, r14Out);
    Register r15(clk, rst, rInEn & rInSig[15], rIn, r15Out);

    TriState t0a(rOutEn & raOutSig[0], r0Out, raOut);
    TriState t1a(rOutEn & raOutSig[1], r1Out, raOut);
    TriState t2a(rOutEn & raOutSig[2], r2Out, raOut);
    TriState t3a(rOutEn & raOutSig[3], r3Out, raOut);
    TriState t4a(rOutEn & raOutSig[4], r4Out, raOut);
    TriState t5a(rOutEn & raOutSig[5], r5Out, raOut);
    TriState t6a(rOutEn & raOutSig[6], r6Out, raOut);
    TriState t7a(rOutEn & raOutSig[7], r7Out, raOut);
    TriState t8a(rOutEn & raOutSig[8], r8Out, raOut);
    TriState t9a(rOutEn & raOutSig[9], r9Out, raOut);
    TriState t10a(rOutEn & raOutSig[10], r10Out, raOut);
    TriState t11a(rOutEn & raOutSig[11], r11Out, raOut);
    TriState t12a(rOutEn & raOutSig[12], r12Out, raOut);
    TriState t13a(rOutEn & raOutSig[13], r13Out, raOut);
    TriState t14a(rOutEn & raOutSig[14], r14Out, raOut);
    TriState t15a(rOutEn & raOutSig[15], r15Out, raOut);

    TriState t0b(rOutEn & rbOutSig[0], r0Out, rbOut);
    TriState t1b(rOutEn & rbOutSig[1], r1Out, rbOut);
    TriState t2b(rOutEn & rbOutSig[2], r2Out, rbOut);
    TriState t3b(rOutEn & rbOutSig[3], r3Out, rbOut);
    TriState t4b(rOutEn & rbOutSig[4], r4Out, rbOut);
    TriState t5b(rOutEn & rbOutSig[5], r5Out, rbOut);
    TriState t6b(rOutEn & rbOutSig[6], r6Out, rbOut);
    TriState t7b(rOutEn & rbOutSig[7], r7Out, rbOut);
    TriState t8b(rOutEn & rbOutSig[8], r8Out, rbOut);
    TriState t9b(rOutEn & rbOutSig[9], r9Out, rbOut);
    TriState t10b(rOutEn & rbOutSig[10], r10Out, rbOut);
    TriState t11b(rOutEn & rbOutSig[11], r11Out, rbOut);
    TriState t12b(rOutEn & rbOutSig[12], r12Out, rbOut);
    TriState t13b(rOutEn & rbOutSig[13], r13Out, rbOut);
    TriState t14b(rOutEn & rbOutSig[14], r14Out, rbOut);
    TriState t15b(rOutEn & rbOutSig[15], r15Out, rbOut);

endmodule

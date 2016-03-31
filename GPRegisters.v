// GPRegisters.v
// General purpose registers
// John Wilkes

module GPRegisters(input clk,
                   input rst,
                   input [2:0] regSel,
                   input Rin,
                   input Rout,
                   inout [7:0] bus);

    wire [7:0] regEn; // which register to ouput to the bus
    wire [7:0] r0Out, r1Out, r2Out, r3Out, r4Out, r5Out, r6Out, r7Out;

    Decoder3to8 d0(regSel, regEn);

    Register r0(clk, rst, Rin & regEn[0], bus, r0Out);
    Register r1(clk, rst, Rin & regEn[1], bus, r1Out);
    Register r2(clk, rst, Rin & regEn[2], bus, r2Out);
    Register r3(clk, rst, Rin & regEn[3], bus, r3Out);
    Register r4(clk, rst, Rin & regEn[4], bus, r4Out);
    Register r5(clk, rst, Rin & regEn[5], bus, r5Out);
    Register r6(clk, rst, Rin & regEn[6], bus, r6Out);
    Register r7(clk, rst, Rin & regEn[7], bus, r7Out);

    TriState t0(Rout & regEn[0], r0Out, bus);
    TriState t1(Rout & regEn[1], r1Out, bus);
    TriState t2(Rout & regEn[2], r2Out, bus);
    TriState t3(Rout & regEn[3], r3Out, bus);
    TriState t4(Rout & regEn[4], r4Out, bus);
    TriState t5(Rout & regEn[5], r5Out, bus);
    TriState t6(Rout & regEn[6], r6Out, bus);
    TriState t7(Rout & regEn[7], r7Out, bus);

endmodule

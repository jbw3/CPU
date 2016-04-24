// ControlUnit_tb.v
// John Wilkes

`include "../../common/utils.v"

module ControlUnit_tb;

    reg clk;
    reg rst;
    reg [7:0] inst;
    wire [7:0] memAddr;
    wire [2:0] aluSel, regInSel, regOutSel;
    wire regInEn, regOutEn, genConst;

    ControlUnit ctrlUnit (clk, rst, inst, memAddr, aluSel, regInSel, regOutSel,
                          regInEn, regOutEn, genConst);

    initial begin
        $dumpfile("ControlUnit.vcd");
        $dumpvars(0, ControlUnit_tb);

        // reset
        # 0
        rst <= 1;
        inst <= 8'hFF;
        # 1
        `ASSERT(aluSel == 3'b000)
        `ASSERT(regInSel == 3'b000)
        `ASSERT(regOutSel == 3'b000)
        `ASSERT(regInEn == 0)
        `ASSERT(regOutEn == 0)
        `ASSERT(genConst == 0)

        rst <= 0;

        // NOP
        # 4
        inst <= 8'h00;
        # 1
        `ASSERT(aluSel == 3'b000)
        `ASSERT(regInSel == 3'b000)
        `ASSERT(regOutSel == 3'b000)
        `ASSERT(regInEn == 0)
        `ASSERT(regOutEn == 0)
        `ASSERT(genConst == 0)

        // move reg to R0
        # 4
        inst <= 8'b00001_011;
        # 1
        `ASSERT(aluSel == 3'b000)
        `ASSERT(regInSel == 3'b000)
        `ASSERT(regOutSel == 3'b011)
        `ASSERT(regInEn == 1)
        `ASSERT(regOutEn == 1)
        `ASSERT(genConst == 0)

        # 4
        $display("PASSED");
        $finish;
    end

endmodule

// ControlUnit_tb.v
// John Wilkes

`include "../../common/TestUtils.v"

module ControlUnit_tb;

    reg rst;
    reg [7:0] inst;
    wire [3:0] aluSel;
    wire [2:0] regInSel, regOutSel;
    wire regInEn, regOutEn, genConst, loadAddr;

    ControlUnit ctrlUnit (rst, inst, aluSel, regInSel, regOutSel,
                          regInEn, regOutEn, genConst, loadAddr);

    initial begin
        $dumpfile("ControlUnit.vcd");
        $dumpvars(0, ControlUnit_tb);

        // reset
        # 0
        rst <= 1;
        inst <= 8'hFF;
        # 1
        `ASSERT(aluSel == 4'b0000)
        `ASSERT(regInSel == 3'b000)
        `ASSERT(regOutSel == 3'b000)
        `ASSERT(regInEn == 0)
        `ASSERT(regOutEn == 0)
        `ASSERT(genConst == 0)
        `ASSERT(loadAddr == 0)

        rst <= 0;

        // NOP
        # 4
        inst <= 8'h00;
        # 1
        `ASSERT(aluSel == 4'b0000)
        `ASSERT(regInSel == 3'b000)
        `ASSERT(regOutSel == 3'b000)
        `ASSERT(regInEn == 0)
        `ASSERT(regOutEn == 0)
        `ASSERT(genConst == 0)
        `ASSERT(loadAddr == 0)

        // move reg to R0
        # 4
        inst <= 8'b00001_011;
        # 1
        `ASSERT(aluSel == 4'b0000)
        `ASSERT(regInSel == 3'b000)
        `ASSERT(regOutSel == 3'b011)
        `ASSERT(regInEn == 1)
        `ASSERT(regOutEn == 1)
        `ASSERT(genConst == 0)
        `ASSERT(loadAddr == 0)

        # 4
        $display("PASSED");
        $finish;
    end

endmodule

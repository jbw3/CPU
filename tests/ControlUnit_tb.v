// ControlUnit_tb.v
// John Wilkes

`include "../../common/utils.v"

module ControlUnit_tb;

    reg rst;
    reg [7:0] inst;
    wire [2:0] regSel;
    wire [2:0] aluSel;
    wire Rin, Rout, RAin, RCout, genConst;

    ControlUnit ctrlUnit (rst, inst, regSel, aluSel, Rin, Rout, RAin, RCout, genConst);

    initial begin
        $dumpfile("ControlUnit.vcd");
        $dumpvars(0, ControlUnit_tb);

        // reset
        # 0
        rst <= 1;
        inst <= 8'hFF;
        # 1
        `ASSERT(regSel == 8'h00)
        `ASSERT(aluSel == 8'h00)
        `ASSERT(Rin == 0)
        `ASSERT(Rout == 0)
        `ASSERT(RAin == 0)
        `ASSERT(RCout == 0)
        `ASSERT(genConst == 0)

        // NOP
        # 4
        rst <= 0;
        inst <= 8'h00;
        # 1
        `ASSERT(regSel == 8'h00)
        `ASSERT(aluSel == 8'h00)
        `ASSERT(Rin == 0)
        `ASSERT(Rout == 0)
        `ASSERT(RAin == 0)
        `ASSERT(RCout == 0)
        `ASSERT(genConst == 0)

        # 4
        $display("PASSED");
        $finish;
    end

endmodule

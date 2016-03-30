// ALU8bit_tb.v
// John Wilkes

`include "../../common/utils.v"

module ALU8bit_tb;

    reg [2:0] sel;
    reg [7:0] A, B;
    wire [7:0] C;

    ALU8bit alu(sel, A, B, C);

    initial begin
        $dumpfile("ALU8.vcd");
        $dumpvars(0, ALU8bit_tb);

        // pass B through
        # 0
        sel <= 3'b000;
        A <= 8'd3;
        B <= 8'd12;
        # 1
        `ASSERT(C == B)

        // NOT
        # 4
        sel <= 3'b001;
        A <= 8'd3;
        B <= 8'd12;
        # 1
        `ASSERT(C == ~B)

        // AND
        # 4
        sel <= 3'b010;
        A <= 8'hF3;
        B <= 8'h25;
        # 1
        `ASSERT(C == (A & B))

        // OR
        # 4
        sel <= 3'b011;
        A <= 8'h73;
        B <= 8'h8B;
        # 1
        `ASSERT(C == (A | B))

        // XOR
        # 4
        sel <= 3'b100;
        A <= 8'hA3;
        B <= 8'h45;
        # 1
        `ASSERT(C == (A ^ B))

        # 4
        $display("PASSED");
        $finish;
    end

endmodule

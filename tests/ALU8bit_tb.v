// ALU8bit_tb.v
// John Wilkes

`include "../../common/utils.v"

module ALU8bit_tb;

    reg [3:0] sel;
    reg [7:0] A, B;
    wire [7:0] C;
    wire cmp;

    ALU8bit alu(sel, A, B, C, cmp);

    initial begin
        $dumpfile("ALU8.vcd");
        $dumpvars(0, ALU8bit_tb);

        // pass B through
        # 0
        sel <= 4'b0000;
        A <= 8'd3;
        B <= 8'd12;
        # 1
        `ASSERT(C == B)
        `ASSERT(cmp == 1'b1)

        // NOT
        # 4
        sel <= 4'b0001;
        A <= 8'd3;
        B <= 8'd12;
        # 1
        `ASSERT(C == ~B)
        `ASSERT(cmp == 1'b1)

        // AND
        # 4
        sel <= 4'b0010;
        A <= 8'hF3;
        B <= 8'h25;
        # 1
        `ASSERT(C == (A & B))
        `ASSERT(cmp == 1'b1)

        // OR
        # 4
        sel <= 4'b0011;
        A <= 8'h73;
        B <= 8'h8B;
        # 1
        `ASSERT(C == (A | B))
        `ASSERT(cmp == 1'b1)

        // XOR
        # 4
        sel <= 4'b0100;
        A <= 8'hA3;
        B <= 8'h45;
        # 1
        `ASSERT(C == (A ^ B))
        `ASSERT(cmp == 1'b1)

        // left shift
        # 4
        sel <= 4'b0111;
        A <= 8'hA3;
        B <= 8'h02;
        # 1
        `ASSERT(C == 8'h8C)
        `ASSERT(cmp == 1'b1)

        // right shift logical
        # 4
        sel <= 4'b1000;
        A <= 8'hA3;
        B <= 8'h02;
        # 1
        `ASSERT(C == 8'h28)
        `ASSERT(cmp == 1'b1)

        // right shift arithmetic
        # 4
        sel <= 4'b1001;
        A <= 8'hA3;
        B <= 8'h02;
        # 1
        `ASSERT(C == 8'hE8)
        `ASSERT(cmp == 1'b1)

        # 4
        $display("PASSED");
        $finish;
    end

endmodule

// ALU8bit_tb.v
// John Wilkes

`include "../../common/utils.v"

module ALU8bit_tb;

    reg [3:0] sel;
    reg [7:0] A, B;
    wire [7:0] C;

    ALU8bit alu(sel, A, B, C);

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

        // NOT
        # 4
        sel <= 4'b0001;
        A <= 8'd3;
        B <= 8'd12;
        # 1
        `ASSERT(C == ~B)

        // AND
        # 4
        sel <= 4'b0010;
        A <= 8'hF3;
        B <= 8'h25;
        # 1
        `ASSERT(C == (A & B))

        // OR
        # 4
        sel <= 4'b0011;
        A <= 8'h73;
        B <= 8'h8B;
        # 1
        `ASSERT(C == (A | B))

        // XOR
        # 4
        sel <= 4'b0100;
        A <= 8'hA3;
        B <= 8'h45;
        # 1
        `ASSERT(C == (A ^ B))

        // left shift
        # 4
        sel <= 4'b0111;
        A <= 8'hA3;
        B <= 8'h02;
        # 1
        `ASSERT(C == 8'h8C)

        // right shift logical
        # 4
        sel <= 4'b1000;
        A <= 8'hA3;
        B <= 8'h02;
        # 1
        `ASSERT(C == 8'h28)

        // right shift arithmetic
        # 4
        sel <= 4'b1001;
        A <= 8'hA3;
        B <= 8'h02;
        # 1
        `ASSERT(C == 8'hE8)

        # 4
        $display("PASSED");
        $finish;
    end

endmodule

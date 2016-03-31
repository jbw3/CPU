// ALU8bit.v
// John Wilkes

module ALU8bit(input [2:0] sel, input [7:0] A, B, output reg [7:0] C);

	always @(A, B, sel) begin
		case(sel)
			0: // pass B
				C <= B;
			1: // NOT
				C <= ~B;
			2: // AND
				C <= A & B;
			3: // OR
				C <= A | B;
			4: // XOR
				C <= A ^ B;
			default: C <= B;
endcase
	end // always

endmodule

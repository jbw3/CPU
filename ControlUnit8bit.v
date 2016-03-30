// ControlUnit8bit.v
// John Wilkes

// Instruction set:
// 00000 move reg to C
// 00001 move C to reg
// 00010 move const to C
// 00011 move reg to A
// 00100 move reg to mem (not implemented)
// 00101 move mem to reg (not implemented)
// 00110 not
// 00111 and (not implemented)
// 01000 or (not implemented)
// 01001 xor (not implemented)
// 01010 add (not implemented)
// 01011 sub (not implemented)
// 01100 inc (not implemented)
// 01101
// 01110
// 01111
// 10000
// 10001
// 10010
// 10011
// 10100
// 10101
// 10110
// 10111
// 11000
// 11001
// 11010
// 11011
// 11100
// 11101
// 11110
// 11111 NOP (not implemented)

module ControlUnit(input clk, rst, input [7:0] inst, output [2:0] regSel, output reg [2:0] aluSel, output Rin, Rout, RAin, RCout, genConst);

	wire [31:0] opNum;
	Decoder5to32 iDec(inst[7:3], opNum);

	// register control signals
	assign Rin   = ~rst & opNum[1];
	assign Rout  = ~rst & (opNum[0] | opNum[3] | opNum[6]);
	assign RAin  = ~rst & opNum[3];
	assign RCout = ~rst & opNum[1];

	assign regSel = inst[2:0];
	assign genConst = ~rst & opNum[2];

	always @(inst) begin
		// select ALU functionality
		case (inst[7:3])
			0: aluSel <= 3'b000;
			2: aluSel <= 3'b000;
			6: aluSel <= 3'b001;
			default: aluSel <= 3'b000;
		endcase
	end

	always @(posedge clk) begin

	end

endmodule

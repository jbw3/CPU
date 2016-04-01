// ControlUnit.v
// John Wilkes

// Instruction set:
// 00000 NOP
// 00001 move reg to RC
// 00010 move const to RC
// 00011 move RC to reg
// 00100 move reg to RA
// 00101 load from memory (not implemented)
// 00110 store to memory (not implemented)
// 00111 not
// 01000 and
// 01001 or
// 01010 xor
// 01011 add (not implemented)
// 01100 sub (not implemented)
// 01101 inc (not implemented)
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
// 11111

module ControlUnit(input clk,
                   input rst,
                   input [7:0] memVal,
                   output [7:0] memAddr,
                   output [2:0] regSel,
                   output reg [2:0] aluSel,
                   output Rin, Rout, RAin, RCout, genConst);

    wire [31:0] opNum;
    assign instNop        = opNum[ 0];
    assign instMovRegRC   = opNum[ 1];
    assign instMovConstRC = opNum[ 2];
    assign instMovRCReg   = opNum[ 3];
    assign instMovRegRA   = opNum[ 4];
    assign instNot        = opNum[ 7];
    assign instAnd        = opNum[ 8];
    assign instOr         = opNum[ 9];
    assign instXor        = opNum[10];

    ProgramCounter pc(clk, rst, memAddr);

    Decoder5to32 iDec(memVal[7:3], opNum);

    // register control signals
    assign Rin   = ~rst & instMovRCReg;
    assign Rout  = ~rst & (instMovRegRC | instMovRegRA | instNot | instAnd | instOr | instXor);
    assign RAin  = ~rst & instMovRegRA;
    assign RCout = ~rst & instMovRCReg;

    assign regSel = {~rst, ~rst, ~rst} & memVal[2:0];
    assign genConst = ~rst & instMovConstRC;

    always @(memVal) begin
        // select ALU functionality
        case (memVal[7:3])
             7: aluSel <= 3'b001;
             8: aluSel <= 3'b010;
             9: aluSel <= 3'b011;
            10: aluSel <= 3'b100;
            default: aluSel <= 3'b000;
        endcase
    end

endmodule

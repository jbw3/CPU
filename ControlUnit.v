// ControlUnit.v
// John Wilkes

// Instruction set:
// 00000 nop
// 00001 move reg to R0
// 00010 move const to R0
// 00011 move R0 to reg
// 00100 not
// 00101 and
// 00110 or
// 00111 xor
// 01000 add
// 01001 sub
// 01010
// 01011
// 01100
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
// 11111

module ControlUnit(input clk,
                   input rst,
                   input [7:0] memVal,
                   output [7:0] memAddr,
                   output reg [3:0] aluSel,
                   output reg [2:0] regInSel,
                   output reg [2:0] regOutSel,
                   output regInEn,
                   output regOutEn,
                   output genConst);

    wire [31:0] opNum;
    assign instNop     = opNum[ 0];
    assign instMov     = opNum[ 1];
    assign instMovi    = opNum[ 2];
    assign instMvr0    = opNum[ 3];
    assign instNot     = opNum[ 4];
    assign instAnd     = opNum[ 5];
    assign instOr      = opNum[ 6];
    assign instXor     = opNum[ 7];
    assign instAdd     = opNum[ 8];
    assign instSub     = opNum[ 9];
    assign instShll    = opNum[10];
    assign instShrl    = opNum[11];
    assign instShra    = opNum[12];

    ProgramCounter pc(clk, rst, memAddr);

    Decoder5to32 iDec(memVal[7:3], opNum);

    // register control signals
    assign regInEn  = ~rst & (instMov | instMovi | instMvr0 | instNot | instAnd | instOr | instXor | instAdd | instSub | instShll | instShrl | instShra);
    assign regOutEn = ~rst & (instMov | instMvr0 | instNot | instAnd | instOr | instXor | instAdd | instSub | instShll | instShrl | instShra);

    assign genConst = ~rst & instMovi;

    always @(rst, memVal, instMvr0) begin
        // select register in
        if (rst == 1) begin
            regInSel <= 3'b000;
        end
        else if (instMvr0) begin
            regInSel <= memVal[2:0];
        end
        else begin
            regInSel <= 3'b000;
        end

        // select register out
        if (rst == 1) begin
            regOutSel <= 3'b000;
        end
        else if (instMvr0) begin
            regOutSel <= 3'b000;
        end
        else begin
            regOutSel <= memVal[2:0];
        end

        // select ALU functionality
        case (memVal[7:3])
             4: aluSel <= 4'b0001; // not
             5: aluSel <= 4'b0010; // and
             6: aluSel <= 4'b0011; // or
             7: aluSel <= 4'b0100; // xor
             8: aluSel <= 4'b0101; // add
             9: aluSel <= 4'b0110; // subtract
            10: aluSel <= 4'b0111; // shift left logical
            11: aluSel <= 4'b1000; // shift right logical
            12: aluSel <= 4'b1001; // shift right arithmetic
            default: aluSel <= 4'b0000;
        endcase
    end

endmodule

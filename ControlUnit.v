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
                   output reg [2:0] aluSel,
                   output reg [2:0] regInSel,
                   output reg [2:0] regOutSel,
                   output regInEn,
                   output regOutEn,
                   output genConst);

    wire [31:0] opNum;
    assign instNop        = opNum[ 0];
    assign instMovRxR0    = opNum[ 1];
    assign instMovConstR0 = opNum[ 2];
    assign instMovR0Rx    = opNum[ 3];
    assign instNot        = opNum[ 4];
    assign instAnd        = opNum[ 5];
    assign instOr         = opNum[ 6];
    assign instXor        = opNum[ 7];
    assign instAdd        = opNum[ 8];
    assign instSub        = opNum[ 9];

    ProgramCounter pc(clk, rst, memAddr);

    Decoder5to32 iDec(memVal[7:3], opNum);

    // register control signals
    assign regInEn  = ~rst & (instMovRxR0 | instMovConstR0 | instMovR0Rx | instNot | instAnd | instOr | instXor | instAdd | instSub);
    assign regOutEn = ~rst & (instMovRxR0 | instMovR0Rx | instNot | instAnd | instOr | instXor | instAdd | instSub);

    assign genConst = ~rst & instMovConstR0;

    always @(rst, memVal, instMovR0Rx) begin
        // select register in
        if (rst == 1) begin
            regInSel <= 3'b000;
        end
        else if (instMovR0Rx) begin
            regInSel <= memVal[2:0];
        end
        else begin
            regInSel <= 3'b000;
        end

        // select register out
        if (rst == 1) begin
            regOutSel <= 3'b000;
        end
        else if (instMovR0Rx) begin
            regOutSel <= 3'b000;
        end
        else begin
            regOutSel <= memVal[2:0];
        end

        // select ALU functionality
        case (memVal[7:3])
            4: aluSel <= 3'b001; // not
            5: aluSel <= 3'b010; // and
            6: aluSel <= 3'b011; // or
            7: aluSel <= 3'b100; // xor
            8: aluSel <= 3'b101; // add
            9: aluSel <= 3'b110; // subtract
            default: aluSel <= 3'b000;
        endcase
    end

endmodule

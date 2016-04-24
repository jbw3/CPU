// ControlUnit.v
// John Wilkes

// Instruction set:
// 00000 NOP
// 00001 move reg to R0
// 00010 move const to R0
// 00011 move R0 to reg
// 00100
// 00101 load from memory (not implemented)
// 00110 store to memory (not implemented)
// 00111 not
// 01000 and
// 01001 or
// 01010 xor
// 01011 add
// 01100 sub
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
    // assign instMovRegRA   = opNum[ 4];
    assign instNot        = opNum[ 7];
    assign instAnd        = opNum[ 8];
    assign instOr         = opNum[ 9];
    assign instXor        = opNum[10];
    assign instAdd        = opNum[11];
    assign instSub        = opNum[12];

    ProgramCounter pc(clk, rst, memAddr);

    Decoder5to32 iDec(memVal[7:3], opNum);

    // register control signals
    assign regInEn  = ~rst & (instMovRxR0 | instMovConstR0 | instMovR0Rx);
    assign regOutEn = ~rst & (instMovRxR0 | instNot | instAnd | instOr | instXor | instAdd | instSub);

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
             7: aluSel <= 3'b001;
             8: aluSel <= 3'b010;
             9: aluSel <= 3'b011;
            10: aluSel <= 3'b100;
            11: aluSel <= 3'b101;
            12: aluSel <= 3'b110;
            default: aluSel <= 3'b000;
        endcase
    end

endmodule

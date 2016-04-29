// ALU8bit.v
// John Wilkes

module ALU8bit(input [3:0] sel,
               input signed [7:0] A, B,
               output reg signed [7:0] C,
               output reg cmp);

    wire [7:0] A1;
    wire [7:0] A2;
    wire Cin;
    wire [7:0] sum;
    wire Cout;

    assign A1 = A;
    assign A2 = B ^ {8{Cin}};
    assign Cin = sel[1]; // 0 for ADD, 1 for SUB

    Adder adder(A1, A2, Cin, sum, Cout);

    wire isZero, isNegative;
    Comparator comp(A, isZero, isNegative);

    always @(A, B, sel, sum) begin

        case (sel)
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
            5: // ADD
                C <= sum;
            6: // SUB
                C <= sum;
            7: // left shift
                C <= A << B;
            8: // right shift logical
                C <= A >> B;
            9: // right shift arithmetic
                C <= A >>> B;
            default:
                C <= B;
        endcase

        case (sel)
            10: // equal to zero
                cmp <= isZero;
            11: // not equal to zero
                cmp <= ~isZero;
            12: // greater than zero
                cmp <= ~isNegative & ~isZero;
            13: // less than zero
                cmp <= isNegative;
            default:
                // by default set the signal high; this makes
                // the control unit logic easier on an
                // unconditional jump
                cmp <= 1'b1;
        endcase

    end // always

endmodule

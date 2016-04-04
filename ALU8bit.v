// ALU8bit.v
// John Wilkes

module ALU8bit(input [2:0] sel, input [7:0] A, B, output reg [7:0] C);

    wire [7:0] A1;
    wire [7:0] A2;
    wire Cin;
    wire [7:0] sum;
    wire Cout;

    assign A1 = A;
    assign A2 = B ^ {8{Cin}};
    assign Cin = sel[1]; // 0 for ADD, 1 for SUB

    Adder adder(A1, A2, Cin, sum, Cout);

    always @(A, B, sel, sum) begin
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
            5: // ADD
                C <= sum;
            6: // SUB
                C <= sum;
            default: C <= B;
        endcase
    end // always

endmodule

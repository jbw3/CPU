// Comparator.v
// John Wilkes
// Compares a number with zero

module Comparator(input [7:0] num,
                  output isZero, isNegative);

    assign isNegative = num[7];
    assign isZero = ~(num[7] | num[6] | num[5] | num[4] | num[3] | num[2] | num[1] | num[0]);

endmodule

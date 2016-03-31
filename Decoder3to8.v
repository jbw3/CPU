// Decoder3to8.v
// John Wilkes

module Decoder3to8(input [2:0] I, output reg [7:0] O);

    always @(I)
        case(I)
            0: O <= 8'h01;
            1: O <= 8'h02;
            2: O <= 8'h04;
            3: O <= 8'h08;
            4: O <= 8'h10;
            5: O <= 8'h20;
            6: O <= 8'h40;
            7: O <= 8'h80;
        endcase

endmodule

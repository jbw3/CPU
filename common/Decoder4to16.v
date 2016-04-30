// Decoder4to16.v
// John Wilkes

module Decoder4to16(input [3:0] I, output reg [15:0] O);

    always @(I) begin
        case(I)
             0: O <= 16'h0001;
             1: O <= 16'h0002;
             2: O <= 16'h0004;
             3: O <= 16'h0008;
             4: O <= 16'h0010;
             5: O <= 16'h0020;
             6: O <= 16'h0040;
             7: O <= 16'h0080;
             8: O <= 16'h0100;
             9: O <= 16'h0200;
            10: O <= 16'h0400;
            11: O <= 16'h0800;
            12: O <= 16'h1000;
            13: O <= 16'h2000;
            14: O <= 16'h4000;
            15: O <= 16'h8000;
        endcase
    end

endmodule

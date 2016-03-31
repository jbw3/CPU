// Register.v
// John Wilkes

// 8-bit register
module Register(input clk, rst, en, input [7:0] I, output reg [7:0] O);

    always @(posedge clk)
        if (rst == 1)
            O <= 8'h00;
        else if (en)
            O <= I;

endmodule

// Register.v
// John Wilkes

// 16-bit register
module Register(input clk, rst, en, input [15:0] I, output reg [15:0] O);

    reg [15:0] internal;

    always @(negedge clk) begin
        if (rst) begin
            internal <= 16'h0000;
        end
        else if (en) begin
            internal <= I;
        end
    end

    always @(posedge clk) begin
        if (rst) begin
            O <= 16'h0000;
        end
        else begin
            O <= internal;
        end
    end

endmodule

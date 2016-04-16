// Register.v
// John Wilkes

// 8-bit register
module Register(input clk, rst, en, input [7:0] I, output reg [7:0] O);

    reg [7:0] internal;

    always @(negedge clk) begin
        if (rst) begin
            internal <= 8'h00;
        end
        else if (en) begin
            internal <= I;
        end
    end

    always @(posedge clk) begin
        if (rst) begin
            O <= 8'h00;
        end
        else if (en) begin
            O <= internal;
        end
    end

endmodule

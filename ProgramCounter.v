// ProgramCounter.v
// John Wilkes

module ProgramCounter(input clk, rst,
                      output reg [7:0] addr);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // reset
            addr <= 8'h00;
        end
        else begin
            addr <= addr + 1;
        end
    end

endmodule

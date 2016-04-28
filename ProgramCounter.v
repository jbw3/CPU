// ProgramCounter.v
// John Wilkes

module ProgramCounter(input clk, rst,
                      output reg [7:0] addr);

    reg internalRst;

    // external reset value will change at positive clock
    // edge, latch value at negative clock edge
    always @(negedge clk) begin
        internalRst <= rst;
    end

    always @(posedge clk) begin
        if (internalRst) begin
            // reset
            addr <= 8'h00;
        end
        else begin
            addr <= addr + 1;
        end
    end

endmodule

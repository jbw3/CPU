// ProgramCounter.v
// John Wilkes

module ProgramCounter(input clk, rst, loadAddr,
                      input [7:0] inAddr,
                      output reg [7:0] addr);

    reg internalRst;
    reg [7:0] nextAddr;

    always @(negedge clk) begin
        // external reset value will change at positive clock
        // edge, latch value at negative clock edge
        internalRst <= rst;

        if (rst) begin
            nextAddr <= 8'h00;
        end
        else begin
            if (loadAddr) begin
                nextAddr <= inAddr;
            end
            else begin
                nextAddr <= addr + 1;
            end
        end
    end

    always @(posedge clk) begin
        if (internalRst) begin
            // reset
            addr <= 8'h00;
        end
        else begin
            addr <= nextAddr;
        end
    end

endmodule

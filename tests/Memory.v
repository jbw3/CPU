// Memory.v
// John Wilkes

module Memory(input [8*32:0] filename,
              input [7:0] addr,
              output reg [7:0] value);

    reg [7:0] mem [0:255];

    initial begin
        // read file into memory
        $readmemh(filename, mem);
    end

    always @(addr) begin
        value <= mem[addr];
    end

endmodule

// TriState.v
// John Wilkes

module TriState(input drive, input [15:0] bus, output [15:0] value);
    assign value = (drive == 1) ? bus : 16'bz;
endmodule

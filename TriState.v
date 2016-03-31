// TriState.v
// John Wilkes

module TriState(input drive, input [7:0] bus, output [7:0] value);
	assign value = (drive == 1) ? bus : 8'bz;
endmodule

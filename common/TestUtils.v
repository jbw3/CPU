// utils.v
// John Wilkes

`define ASSERT(condition) if (!(condition)) begin $display("ERROR: time: %0t", $time); $finish; end

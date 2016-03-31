# Tests for 8-bit CPU

VC = iverilog

.PHONY: all
all: ALU8bit_tb ControlUnit_tb
	vvp ALU8bit_tb
	vvp ControlUnit_tb

ALU8bit_tb: ALU8bit_tb.v ../ALU8bit.v
	$(VC) -o $@ $^

ControlUnit_tb: ControlUnit_tb.v ../ControlUnit.v ../Decoder5to32.v
	$(VC) -o $@ $^

.PHONY: clean
clean:
	rm -f ALU8bit_tb

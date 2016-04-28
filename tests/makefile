# Tests for 8-bit CPU

VC = iverilog

.PHONY: all
all: ALU8bit_tb ControlUnit_tb CPU_tb

ALU8bit_tb: ALU8bit_tb.v ../ALU8bit.v ../Adder.v ../Comparator.v
	$(VC) -o $@ $^
	vvp ALU8bit_tb

ControlUnit_tb: ControlUnit_tb.v ../ControlUnit.v ../ProgramCounter.v ../Decoder5to32.v
	$(VC) -o $@ $^
	vvp ControlUnit_tb

CPU_tb: CPU_tb.v ../CPU8bit.v ../ControlUnit.v ../GPRegisters.v ../ALU8bit.v ../Adder.v ../Comparator.v ../TriState.v ../Register.v ../ProgramCounter.v ../Decoder3to8.v ../Decoder5to32.v Memory.v
	$(VC) -o $@ $^
	vvp CPU_tb

.PHONY: clean
clean:
	rm -f ALU8bit_tb ControlUnit_tb CPU_tb

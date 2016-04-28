// CPU_tb.v
// John Wilkes

module CPU_tb;

	reg clk, rst;
	wire [7:0] memAddr;
	wire [7:0] memVal;

	CPU cpu(clk, rst, memVal, memAddr);
	Memory mem("mem.txt", memAddr, memVal);

	initial begin
		$dumpfile("CPU.vcd");
		$dumpvars(0, CPU_tb);

		clk = 1'b0;
		rst = 1'b1;
	end

	always begin
		#5 clk = ~clk;
	end

	initial begin
		#6
		rst = 0;

		#250
		$finish;
	end

endmodule

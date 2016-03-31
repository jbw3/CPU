// CPU_tb.v
// John Wilkes

module CPU_tb;

	reg [7:0] inst; // instruction
	reg clk, rst;
	CPU cpu(clk, rst);

	// temporary until we read instructions from memory
	assign cpu.inst = inst;

	initial begin
		$dumpfile("CPU.vcd");
		$dumpvars(0, CPU_tb);

		clk = 1'b0;
		rst = 1'b1;
		inst = 8'h00;
	end

	always begin
		#5 clk = ~clk;
	end

	initial begin
		@(negedge clk);
		rst = 0;

		// move const 5 to RC
		inst <= 8'b00010_101;
		@(negedge clk);

		// move RC to R0
		inst <= 8'b00011_000;
		@(negedge clk);

		// move R0 to RC
		inst <= 8'b0001_000;
		@(negedge clk);

		// move RC to R1
		inst <= 8'b00011_001;
		@(negedge clk);

		// NOT R1
		inst <= 8'b00111_001;
		@(negedge clk);

		// move RC to R2
		inst <= 8'b00011_010;
		@(negedge clk);

		$finish;
	end

endmodule

// TB_CPU8bit.v
// John Wilkes

module TB_CPU;

	reg [7:0] inst; // instruction
	reg clk, rst;
	CPU cpu(clk, rst);

	assign cpu.iBus = inst;

	initial begin
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

		// move const 5 to C
		inst <= 8'h15;
		@(negedge clk);

		// move C to r0
		inst <= 8'h08;
		@(negedge clk);

		// move r0 to C
		inst <= 8'h00;
		@(negedge clk);

		// move C to r1
		inst <= 8'h09;
		@(negedge clk);

		// NOT r1
		inst <= 8'h31;
		@(negedge clk);

		// move C to r2
		inst <= 8'h0A;
		@(negedge clk);
	end

endmodule

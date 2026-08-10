`timescale 10ns/1ns
`default_nettype none
module HACK_tb();

	// IN,OUT
	reg CLK = 1;
	reg [1:0] BUT = 0;
	wire [1:0] LED;

	// Part
	HACK HACK(
    	.CLK(CLK),
    	.BUT(BUT),
    	.LED(LED)
	);

	// Simulate
	always #500 BUT <= BUT+1;

	// Test
	always #0.5 CLK = ~CLK;
	initial begin
  		$dumpfile("HACK_tb.vcd");
  		$dumpvars(0, HACK_tb);

		#4000
		$finish;
	end

endmodule

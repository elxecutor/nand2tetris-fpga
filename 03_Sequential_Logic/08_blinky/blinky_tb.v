`default_nettype none
module blinky_tb();

	// IN,OUT
	reg CLK=1;
	wire[1:0] LED;

	// Part
	blinky blinky(
		.CLK(CLK),
		.LED(LED)
	);
	
	// Simulate
	always #1 CLK=~CLK;

  	initial begin
  		$dumpfile("blinky_tb.vcd");
  		$dumpvars(0, blinky_tb);
		#100000
		$finish;
	end

endmodule

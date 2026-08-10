`timescale 10ns/1ns
`default_nettype none
module Clock25_Reset20_tb();

	// IN,OUT
	reg CLK=1;
	wire clk;
	wire reset;
	
	// Part
	Clock25_Reset20 CLOCK25_RESET20(
		.CLK(CLK),
		.clk(clk),
		.reset(reset)
	);

	// Simulation
	always #0.5 CLK=~CLK;
	
	// Test  
  	initial begin
  		$dumpfile("Clock25_Reset20_tb.vcd");
  		$dumpvars(0, Clock25_Reset20_tb);
		
		$display("------------------------");
		$display("Testbench: Clock25_Reset10");

		#4000	
		$finish;
	end

endmodule

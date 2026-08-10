// Test to run on fpga with 100 MHz

`default_nettype none
module blinky(
	input CLK,
	output [1:0] LED
);

	wire [15:0] prescaler;
	wire clk;
	PC PRESCALER(.clk(CLK),.load(1'b0),.in(16'b0),.reset(1'b0),.inc(1'b1),.out(prescaler));
	Buffer 	CLOCK(.in(prescaler[12]),.out(clk));

	wire [15:0] counter;
	PC COUNTER(.clk(clk),.load(1'b0),.in(16'b0),.reset(1'b0),.inc(1'b1),.out(counter));
	Buffer BUF1(.in(counter[15]),.out(LED[1]));
	Buffer BUF2(.in(counter[14]),.out(LED[0]));

endmodule

`default_nettype none
module top(
	input BUT1,
	input BUT2,
	output LED1,
	output LED2
);

	Xor XOR(.a(BUT1),.b(BUT2),.out(LED1));
	
endmodule

`default_nettype none
module top(
	input BUT1,
	input BUT2,
	output LED1,
	output LED2
);

	HalfAdder HA(.a(BUT1),.b(BUT2),.sum(LED1),.carry(LED2));
	
endmodule

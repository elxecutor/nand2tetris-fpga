`default_nettype none
module top(
	input BUT1,
	input BUT2,
	output LED1,
	output LED2
);

	DMux DMUX(.in(BUT1),.sel(BUT2),.a(LED1),.b(LED2));
	
endmodule

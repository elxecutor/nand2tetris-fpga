`default_nettype none
module Clock25_Reset20( 
    input CLK,			// external clock 100 MHz	
	output clk,			// internal clock 25 Mhz
	output reset 		// reset signal
);

	// put your code here:
	reg [15:0] n=0;
	always @(posedge CLK)
		n <= n + 1;
	assign clk = n[1];
	reg resetx=0;
	always @(posedge clk)
		resetx <= n[11]?1:resetx;	
	wire reset=~resetx;	

endmodule	

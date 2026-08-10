/**
* One Bit-register, that can be switched on and off
* 
* if (out[t] == 0) and (on[t] == 1)	 out[t+1] = 1
* if (out[t] == 1) and (off[t] == 1) out[t+1] = 0
*/

`default_nettype none
module Switch(
	input clk,
	input on,
	input off,
	output out
);

	reg out = 0;
	always @(posedge clk)
		out <= (on&off)?(~out):(on?1:(off?0:(out?1:0)));

endmodule

/**
 * 16-bit multiplexor: 
 * for i = 0..15 out[i] = a[i] if sel == 0 
 *                        b[i] if sel == 1
 */

`default_nettype none
module Mux8Way16(
	input [15:0] a,
	input [15:0] b,
	input [15:0] c,
	input [15:0] d,
	input [15:0] e,
	input [15:0] f,
	input [15:0] g,
	input [15:0] h,
   	input [2:0] sel,
	output reg [15:0] out
);
	always @(*) begin
		case (sel)
			0 : out = a;
			1 : out = b;
			2 : out = c;
			3 : out = d;
			4 : out = e;
			5 : out = f;
			6 : out = g;
			7 : out = h;
		endcase
	end
endmodule

`default_nettype none
module Mux8Way16_tb();

	// IN,OUT
	reg [15:0] a,b,c,d,e,f,g,h;
	reg [2:0] sel;
	wire [15:0] out;

	// PART
	Mux8Way16 MUX8WAY16(
		.a(a),
		.b(b),
		.c(c),
		.d(d),
		.e(e),
		.f(f),
		.g(g),
		.h(h),
		.sel(sel),
		.out(out)
	);
	
	// Compare
	wire [15:0] out_cmp;
	assign out_cmp = (sel[2]?(sel[1]? (sel[0]?h:g):(sel[0]?f:e)):
							 (sel[1]? (sel[0]?d:c):(sel[0]?b:a)));

	reg fail = 0;
	reg [15:0] n = 0;
	task check;
		#1
		if (out != out_cmp)
			begin
				$display("FAIL: a=%16b, b=%16b, c=%16b, d=%16b, e=%16b, f=%16b, g=%16b, h=%16b, sel=%3b, out=%16b",a,b,c,d,e,f,g,h,sel,out);
				fail=1;
			end
	endtask
	  
  	initial begin
  		$dumpfile("Mux8Way16_tb.vcd");
  		$dumpvars(0, Mux8Way16_tb);
		
		$display("------------------------");
		$display("Testbench: Mux8Way16");
		
		for (n=0; n<100;n=n+1) 
			begin
				a=$random;
				b=$random;
				c=$random;
				d=$random;
				e=$random;
				f=$random;
				g=$random;
				h=$random;
				sel=0;check();
				sel=1;check();
				sel=2;check();
				sel=3;check();
				sel=4;check();
				sel=5;check();
				sel=6;check();
				sel=7;check();
			end
		
		if (fail==0) $display("passed");
		$display("------------------------");
		$finish;
	end

endmodule

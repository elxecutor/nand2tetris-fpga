`default_nettype none
module Mux4Way16_tb();

	// IN,OUT
	reg [15:0] a,b,c,d;
	reg [1:0] sel;
	wire [15:0] out;
	
	// Part
	Mux4Way16 MUX4WAY16(
		.a(a),
		.b(b),
		.c(c),
		.d(d),
		.sel(sel),
		.out(out)
	);

	// Compare
	wire [15:0] out_cmp;
	assign out_cmp = (sel[1]? (sel[0]?d:c):(sel[0]?b:a));
	
	reg fail = 0;
	reg [15:0] n = 0;
	task check;
		#1
			if (out != out_cmp)
			begin
				$display("FAIL: a=%16b, b=%16b, c=%16b, d=%16b, sel=%2b, out=%16b",a,b,c,d,sel,out);
				fail=1;
			end
	endtask
	 
	// Test 
  	initial begin
  		$dumpfile("Mux4Way16_tb.vcd");
  		$dumpvars(0, Mux4Way16_tb);
		
		$display("------------------------");
		$display("Testbench: Mux4Way16");
		
		for (n=0; n<1000;n=n+1) 
			begin
				a=$random;
				b=$random;
				c=$random;
				d=$random;
				sel=0;check();
				sel=1;check();
				sel=2;check();
				sel=3;check();
			end
		
		if (fail==0) $display("passed");
		$display("------------------------");
		$finish;
	end

endmodule

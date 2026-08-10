`default_nettype none
module Mux16_tb();

	// IN,OUT
	reg [15:0] a,b;
	reg sel;
	wire [15:0] out;

	// Part
	Mux16 MUX16(
		.a(a),
		.b(b),
		.sel(sel),
		.out(out)
	);

	// Compare
	wire [15:0] out_cmp;
	assign out_cmp = sel?b:a;
	
	reg fail = 0;
	reg [15:0] n = 0;
	task check;
		#1
		if (out != out_cmp) 
			begin
				$display("FAIL: a=%16b, b=%16b, sel=%1b, out=%16b",a,b,sel,out);
				fail=1;
			end
	endtask
	
	// Test 
  	initial begin
  		$dumpfile("Mux16_tb.vcd");
  		$dumpvars(0, Mux16_tb);
		
		$display("------------------------");
		$display("Testbench: Mux16");
		
		for (n=0; n<10000;n=n+1) 
			begin
				a=$random;
				b=$random;
				sel=0;check();
				sel=1;check();
			end
		
		if (fail==0) $display("passed");
		$display("------------------------");
		$finish;
	end

endmodule

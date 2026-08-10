`default_nettype none
module Mux_tb();

	// IN,OUT
	reg a,b,sel;
	wire out;

	// Part
	Mux MUX(
		.a(a),
		.b(b),
		.sel(sel),
		.out(out)
	);
	
	// Compare
	wire out_cmp;
	assign out_cmp = (sel?b:a);
	
	reg fail = 0;
	task check;
		#1
		if (out != out_cmp) 
			begin
				$display("FAIL: a=%1b, b=%1b, sel=%1b, out=%1b",a,b,sel,out);
				fail=1;
			end
	endtask
	 
	// Test 
  	initial begin
  		$dumpfile("Mux_tb.vcd");
  		$dumpvars(0, Mux_tb);
		
		$display("------------------------");
		$display("Testbench: Mux");
		
		a=0;b=0;sel=0;check();
		a=0;b=0;sel=1;check();
		a=0;b=1;sel=0;check();
		a=0;b=1;sel=1;check();
		a=1;b=0;sel=0;check();
		a=1;b=0;sel=1;check();
		a=1;b=1;sel=0;check();
		a=1;b=1;sel=1;check();
		
		if (fail==0) $display("passed");
		$display("------------------------");
		$finish;
	end

endmodule

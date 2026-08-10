`default_nettype none
module Or_tb();

	// IN,OUT
	reg a,b;
	wire out;

	// Part
	Or OR(
		.a(a),
		.b(b),
		.out(out)
	);

	// Compare
	wire out_cmp;
	assign out_cmp = a|b;

	reg fail=0;
	task check;
		#1
		if (out != out_cmp) 
			begin
				$display("FAIL: a=%1b, b=%1b, out=%1b",a,b,out);
				fail=1;
			end
	endtask
	  
  	// Test
	initial begin
  		$dumpfile("Or_tb.vcd");
  		$dumpvars(0, Or_tb);
		
		$display("------------------------");
		$display("Testbench: Or");
		
		a=0;b=0;check();
		a=0;b=1;check();
		a=1;b=0;check();
		a=1;b=1;check();
		
		if (fail==0) $display("passed");
		$display("------------------------");
		
		$finish;
	end

endmodule

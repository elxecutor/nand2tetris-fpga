`default_nettype none
module FullAdder_tb();

	// IN,OUT
	reg a,b,c;
	wire sum,carry;

	// Part
	FullAdder FULLADDER(
		.a(a),
		.b(b),
		.c(c),
		.sum(sum),
		.carry(carry)
	);

	// Compare
	wire [1:0] out_cmp;
	assign out_cmp = a+b+c;

	reg fail = 0;
	task check;
		#1
		if ({carry,sum} != out_cmp) 
			begin
				$display("FAIL: a=%1b, b=%1b, c=%1b, sum=%1b, carry=%1b",a,b,c,sum,carry);
				fail=1;
			end
	endtask
	  
  	initial begin
  		$dumpfile("FullAdder_tb.vcd");
  		$dumpvars(0, FullAdder_tb);
		
		$display("------------------------");
		$display("Testbench: FullAdder");
		
		a=0;b=0;c=0;check();
		a=0;b=0;c=1;check();
		a=0;b=1;c=0;check();
		a=0;b=1;c=1;check();
		a=1;b=0;c=0;check();
		a=1;b=0;c=1;check();
		a=1;b=1;c=0;check();
		a=1;b=1;c=1;check();
		
		if (fail==0) $display("passed");
		$display("------------------------");
		$finish;
	end

endmodule

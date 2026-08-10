`default_nettype none
module Or8Way_tb();
	
	// IN,OUT
	reg [7:0] in;
	wire out;

	// Part
	Or8Way OR8WAY(
		.in(in),
		.out(out)
	);

	// Compare
	wire out_cmp;
	assign out_cmp = |in;

	reg fail = 0;
	reg [15:0] n=0;
	task check;
		#1
		if (out != out_cmp) 
			begin
				$display("FAIL: in=%8b, out=%1b",in,out);
				fail=1;
			end
	endtask
	
	// Test 
  	initial begin
  		$dumpfile("Or8Way_tb.vcd");
  		$dumpvars(0, Or8Way_tb);
		
		$display("------------------------");
		$display("Testbench: Or8Way");

		in=0;
		check();				
		for (n=0; n<10000;n=n+1) 
			begin
				in=$random;
				check();
			end
	
		if (fail==0) $display("passed");
		$display("------------------------");
		$finish;
	end

endmodule

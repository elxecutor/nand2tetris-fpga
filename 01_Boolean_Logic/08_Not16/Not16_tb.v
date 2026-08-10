`default_nettype none
module Not16_tb();

	// IN,OUT
	reg [0:15] in;
	wire [0:15] out;

	// Part
	Not16 NOT16(
		.in(in),
		.out(out)
	);
	
	// Compare
	wire [15:0] out_cmp;
	assign out_cmp = ~in;

	reg fail = 0;
	reg [15:0] n = 0;
	task check;
		#1
		if (out != out_cmp) 
			begin
				$display("FAIL: a=%16b, out=%16b",in,out);
				fail=1;
			end
	endtask
	
	// Test 
  	initial begin
  		$dumpfile("Not16_tb.vcd");
  		$dumpvars(0, Not16_tb);
		
		$display("------------------------");
		$display("Testbench: Not16");
		
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

`default_nettype none
module Inc16_tb();

	// IN,OUT
	reg [15:0] in;
	wire [15:0] out;

	// Part
	Inc16 INC16(
		.in(in),
		.out(out)
	);

	// Compare
	wire [15:0] out_cmp;
	assign out_cmp = in+1;
	
	reg fail = 0;
	reg [15:0] n=0;
	task check;
		#1
		if (out != out_cmp) 
			begin
				$display("FAIL: in=%16b, out=%16b",in,out);
				fail=1;
			end
	endtask
	  
	// Test
  	initial begin
  		$dumpfile("Inc16_tb.vcd");
  		$dumpvars(0, Inc16_tb);
		
		$display("------------------------");
		$display("Testbench: Inc16");

		in=0;check();
		in=16'b1111111111111111;check();
		
		for (n=0; n<1000;n=n+1) 
			begin
				in=$random;
				check();
			end
		
		if (fail==0) $display("passed");
		$display("------------------------");
		$finish;
	end

endmodule

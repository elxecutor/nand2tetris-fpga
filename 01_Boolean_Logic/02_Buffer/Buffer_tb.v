`default_nettype none
module Buffer_tb();
	
	// IN,OUT
	reg in;
	wire out;

	// Part
	Buffer BUFFER(
		.in(in),
		.out(out)
	);

	// Compare
	wire out_cmp;
	assign out_cmp = in;
	
	reg fail = 0;
	task check;
		#1
		if (out != out_cmp) 
			begin
				$display("FAIL: in=%1b, out=%1b",in,out);
				fail=1;
			end
	endtask
	  
  	// Test	
	initial begin
  		$dumpfile("Buffer_tb.vcd");
  		$dumpvars(0, Buffer_tb);
		
		$display("------------------------");
		$display("Testbench: Buffer");
		
		in=0;check();
		in=1;check();
			
		if (fail==0) $display("passed");
		$display("------------------------");
		$finish;
	end

endmodule

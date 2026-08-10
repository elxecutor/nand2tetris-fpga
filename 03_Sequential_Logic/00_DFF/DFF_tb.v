`default_nettype none
module DFF_tb();

	// IN,OUT
	reg clk = 1;
	reg in;
	wire out;

	// Part
	DFF DFF(
		.clk(clk),
		.in(in),
		.out(out)
	);

	// Compare
	always #1 clk=~clk;
	always @(posedge clk)
		in <= $random;	
	
	reg out_cmp;
	always @(posedge clk)
		out_cmp <= in;	
	
	reg fail = 0;
	reg [15:0] n = 0;
	task check;
		#1
		if (out != out_cmp) 
			begin
				$display("FAIL: clk=%1b, in=%1b, out=%1b",clk,in,out);
				fail=1;
			end
	endtask
	
	// Test  
  	initial begin
  		$dumpfile("DFF_tb.vcd");
  		$dumpvars(0, DFF_tb);
		
		$display("------------------------");
		$display("Testbench: DFF");

		for (n=0; n<1000;n=n+1) 
			check();
		
		if (fail==0) $display("passed");
		$display("------------------------");
		$finish;
	end

endmodule

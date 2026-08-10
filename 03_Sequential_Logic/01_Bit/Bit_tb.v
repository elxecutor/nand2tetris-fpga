`default_nettype none
module Bit_tb();

	// IN,OUT
	reg clk = 1;
	reg in,load;
	wire out;

	// Part
	Bit BIT(
		.clk(clk),
		.in(in),
		.load(load),
		.out(out)
	);

	// Compare
	always #1 clk=~clk;
	always @(posedge clk) begin
		in <= $random;	
		load <= $random;
	end
	reg out_cmp;
	always @(posedge clk)
		out_cmp <= (load?in:out);	
	
	reg fail = 0;
	reg [15:0] n = 0;
	task check;
		#1
		if (out != out_cmp) 
			begin
				$display("FAIL: clk=%1b, in=%1b, load=%1b, out=%1b",clk,in,load,out);
				fail=1;
			end
	endtask
	  
  	initial begin
  		$dumpfile("Bit_tb.vcd");
  		$dumpvars(0, Bit_tb);
		
		$display("------------------------");
		$display("Testbench: Bit");

		for (n=0; n<1000;n=n+1) 
			check();
		
		if (fail==0) $display("passed");
		$display("------------------------");
		$finish;
	end

endmodule

`default_nettype none
module Register_tb();

	// IN,OUT
	reg clk = 1;
	reg [15:0] in;
	reg load;
	wire [15:0] out;

	// Part
	Register REGISTER(
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
	reg [15:0] out_cmp;
	always @(posedge clk)
		out_cmp <= (load?in:out);	
	reg fail = 0;
	reg [15:0] n = 0;
	task check;
		#1
		if (out != out_cmp) 
			begin
				$display("FAIL: clk=%1b, in=%16b, load=%1b, out=%16b",clk,in,load,out);
				fail=1;
			end
	endtask
	  
  	initial begin
  		$dumpfile("Register_tb.vcd");
  		$dumpvars(0, Register_tb);
		
		$display("------------------------");
		$display("Testbench: Register");

		for (n=0; n<1000;n=n+1) 
			check();
		
		if (fail==0) $display("passed");
		$display("------------------------");
		$finish;
	end

endmodule

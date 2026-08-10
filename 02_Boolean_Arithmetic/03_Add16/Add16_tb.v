`default_nettype none
module Add16_tb();

	// IN,OUT
	reg [15:0] a,b;
	wire [15:0] out;

	// Part
	Add16 ADD16(
		.a(a),
		.b(b),
		.out(out)
	);

	// Compare
	wire [15:0] out_cmp;
	assign out_cmp = a+b;

	reg fail = 0;
	reg [15:0] n=0;
	task check;
		#1
		if (out != out_cmp) 
			begin
				$display("FAIL: a=%16b, b=%16b, out=%16b",a,b,out);
				fail=1;
			end
	endtask
	  
  	initial begin
  		$dumpfile("Add16_tb.vcd");
  		$dumpvars(0, Add16_tb);
		
		$display("------------------------");
		$display("Testbench: Add16");
		
		for (n=0; n<1000;n=n+1) 
			begin
				a=$random;
				b=$random;
				check();
			end
		
		if (fail==0) $display("passed");
		$display("------------------------");
		$finish;
	end

endmodule

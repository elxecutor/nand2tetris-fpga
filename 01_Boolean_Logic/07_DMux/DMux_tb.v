`default_nettype none
module DMux_tb();

	// IN,OUT
	reg in,sel;
	wire a,b;
	
	// Part
	DMux DMUX(
		.in(in),
		.sel(sel),
		.a(a),
		.b(b)
	);

	// Compare
	wire a_cmp,b_cmp;
	assign a_cmp = (~sel&in);
	assign b_cmp = sel&in;

	reg fail=0;
	task check;
		#1
		if ((a != a_cmp) || (b != b_cmp)) 
			begin
				$display("FAIL: in=%1b, sel=%1b, a=%1b, b=%1b",in,sel,a,b);
				fail=1;
			end
	endtask
	
	// Test 
  	initial begin
  		$dumpfile("DMux_tb.vcd");
  		$dumpvars(0, DMux_tb);
		
		$display("------------------------");
		$display("Testbench: DMux");
		
		in=0;sel=0;check();
		in=0;sel=1;check();
		in=1;sel=0;check();
		in=1;sel=1;check();
		
		if (fail==0) $display("passed");
		$display("------------------------");
		$finish;
	end

endmodule

`default_nettype none
module DMux4Way_tb();

	// IN,OUT
	reg in;
	reg [1:0] sel;
	wire a,b,c,d;
	
	// Part
	DMux4Way DMUX4WAY(
		.in(in),
		.sel(sel),
		.a(a),
		.b(b),
		.c(c),
		.d(d)
	);

	// Compare
	wire a_cmp,b_cmp,c_cmp,d_cmp;
	assign a_cmp = (sel==0)?in:0;
	assign b_cmp = (sel==1)?in:0;
	assign c_cmp = (sel==2)?in:0;
	assign d_cmp = (sel==3)?in:0;

	reg fail = 0;
	task check;
		#1
		if ((a != a_cmp) || (b != b_cmp) || (c != c_cmp) || (d != d_cmp)) 
			begin
				$display("FAIL: in=%1b, sel=%1b, a=%1b, b=%1b, c=%1b, d=%1b",in,sel,a,b,c,d);
				fail=1;
			end
	endtask
	  
  	initial begin
  		$dumpfile("DMux4Way_tb.vcd");
  		$dumpvars(0, DMux4Way_tb);
		
		$display("------------------------");
		$display("Testbench: DMux4Way");
		
		in=0;sel=0;check();
		in=0;sel=1;check();
		in=0;sel=2;check();
		in=0;sel=3;check();
		in=1;sel=0;check();
		in=1;sel=1;check();
		in=1;sel=2;check();
		in=1;sel=3;check();
		
		if (fail==0) $display("passed");
		$display("------------------------");
		$finish;
	end

endmodule

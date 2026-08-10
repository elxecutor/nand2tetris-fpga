`default_nettype none
module DMux8Way_tb();

	// IN,OUT
	reg in;
	reg [2:0] sel;
	wire a,b,c,d,e,f,g,h;
	
	// Part
	DMux8Way DMUX8WAY(
		.in(in),
		.sel(sel),
		.a(a),
		.b(b),
		.c(c),
		.d(d),
		.e(e),
		.f(f),
		.g(g),
		.h(h)
	);
	
	// Compare
	wire a_cmp,b_cmp,c_cmp,d_cmp,e_cmp,f_cmp,g_cmp,h_cmp;
	assign a_cmp = (sel==0)?in:0;
	assign b_cmp = (sel==1)?in:0;
	assign c_cmp = (sel==2)?in:0;
	assign d_cmp = (sel==3)?in:0;
	assign e_cmp = (sel==4)?in:0;
	assign f_cmp = (sel==5)?in:0;
	assign g_cmp = (sel==6)?in:0;
	assign h_cmp = (sel==7)?in:0;
 
	reg fail = 0;
	task check;
		#1
		if ((a!=a_cmp)||(b!=b_cmp)||(c!=c_cmp)||(d!=d_cmp)||(e!=e_cmp)||(f!=f_cmp)||(g!=g_cmp)||(h!=h_cmp))
			begin
				$display("FAIL: in=%1b, sel=%2b, a=%1b, b=%1b, c=%1b, d=%1b, e=%1b, f=%1b, g=%1b, h=%1b",in,sel,a,b,c,d,e,f,g,h);
				fail=1;
			end
	endtask

	// Test 
  	initial begin
  		$dumpfile("DMux8Way_tb.vcd");
  		$dumpvars(0, DMux8Way_tb);
		
		$display("------------------------");
		$display("Testbench: DMux8Way");
		
		in=0;sel=0;check();
		in=0;sel=1;check();
		in=0;sel=2;check();
		in=0;sel=3;check();
		in=0;sel=4;check();
		in=0;sel=5;check();
		in=0;sel=6;check();
		in=0;sel=7;check();
		in=1;sel=0;check();
		in=1;sel=1;check();
		in=1;sel=2;check();
		in=1;sel=3;check();
		in=1;sel=4;check();
		in=1;sel=5;check();
		in=1;sel=6;check();
		in=1;sel=7;check();
		
		if (fail==0) $display("passed");
		$display("------------------------");
		$finish;
	end

endmodule

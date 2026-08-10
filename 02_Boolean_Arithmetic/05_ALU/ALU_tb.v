`default_nettype none
module ALU_tb();

	// IN,OUT
	reg [15:0] x,y;
	reg zx,nx,zy,ny,f,no;
	wire [15:0] out;
	wire zr,ng;

	// Part	
	ALU ALU(
		.x(x),
		.y(y),
		.zx(zx),
		.nx(nx),
		.zy(zy),
		.ny(ny),
		.f(f),
		.no(no),
		.out(out),
		.zr(zr),
		.ng(ng)
	);
	
	// Compare
	wire [15:0] xx,yy,out_cmp;
	wire zr_cmp,ng_cmp;
	assign xx = nx?(zx?~0:~x):(zx?0:x);
	assign yy = ny?(zy?~0:~y):(zy?0:y);
	assign out_cmp= no?(f?~(xx+yy):~(xx&yy)):(f?(xx+yy):(xx&yy));
	assign zr_cmp = (out==0);
	assign ng_cmp = out[15];
	
	reg fail = 0;
	reg [15:0] n = 0;
	task check;
		#1
		if ((out != out_cmp) || (zr != zr_cmp) || (ng != ng_cmp)) 
			begin
				$display("FAIL: x=%16b, y=%16b, zx=%1b, nx=%1b, zy=%1b, ny=%1b, f=%1b, no=%1b, out=%16b, zr=%1b, ng=%1b",x,y,zx,nx,zy,ny,f,no,out,zr,ng);
				fail=1;
			end
	endtask
	  
  	initial begin
  		$dumpfile("ALU_tb.vcd");
  		$dumpvars(0, ALU_tb);
		
		$display("------------------------");
		$display("Testbench: ALU");
		
		for (n=0; n<100;n=n+1) 
			begin
				x=$random;
				y=$random;
				zx=1;nx=0;zy=1;ny=0;f=1;no=0;check();// 0
				zx=1;nx=1;zy=1;ny=1;f=1;no=1;check();// 1
				zx=1;nx=1;zy=1;ny=0;f=1;no=0;check();// -1
				zx=0;nx=0;zy=1;ny=1;f=0;no=0;check();// x
				zx=1;nx=1;zy=0;ny=0;f=0;no=0;check();// y
				zx=0;nx=0;zy=1;ny=1;f=0;no=1;check();// !x
				zx=1;nx=1;zy=0;ny=0;f=0;no=1;check();// !y
				zx=0;nx=0;zy=1;ny=1;f=1;no=1;check();// -x
				zx=1;nx=1;zy=0;ny=0;f=1;no=1;check();// -y
				zx=0;nx=1;zy=1;ny=1;f=1;no=1;check();// x+1
				zx=1;nx=1;zy=0;ny=1;f=1;no=1;check();// y+1
				zx=0;nx=0;zy=1;ny=1;f=1;no=0;check();// x-1
				zx=1;nx=1;zy=0;ny=0;f=1;no=0;check();// y-1
				zx=0;nx=0;zy=0;ny=0;f=1;no=0;check();// x+y
				zx=0;nx=1;zy=0;ny=0;f=1;no=1;check();// x-y
				zx=0;nx=0;zy=0;ny=1;f=1;no=1;check();// y-x
				zx=0;nx=0;zy=0;ny=0;f=0;no=0;check();// x&y
				zx=0;nx=1;zy=0;ny=1;f=0;no=1;check();// x|y
			end
		
		if (fail==0) $display("passed");
		$display("------------------------");
		$finish;
	end

endmodule

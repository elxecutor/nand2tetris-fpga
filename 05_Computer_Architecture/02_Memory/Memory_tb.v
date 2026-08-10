`default_nettype none
module Memory_tb();

	// IN,OUT
	reg [15:0] address;
	reg load;
	wire [15:0] out;
	wire loadRAM;
	wire loadIO0;
	wire loadIO1;
	wire loadIO2;
	wire loadIO3;
	wire loadIO4;
	wire loadIO5;
	wire loadIO6;
	wire loadIO7;
	wire loadIO8;
	wire loadIO9;
	wire loadIOA;
	wire loadIOB;
	wire loadIOC;
	wire loadIOD;
	wire loadIOE;
	wire loadIOF;
	reg [15:0] inRAM;
	reg [15:0] inIO0;
	reg [15:0] inIO1;
	reg [15:0] inIO2;
	reg [15:0] inIO3;
	reg [15:0] inIO4;
	reg [15:0] inIO5;
	reg [15:0] inIO6;
	reg [15:0] inIO7;
	reg [15:0] inIO8;
	reg [15:0] inIO9;
	reg [15:0] inIOA;
	reg [15:0] inIOB;
	reg [15:0] inIOC;
	reg [15:0] inIOD;
	reg [15:0] inIOE;
	reg [15:0] inIOF;

	// Part
	Memory MEMORY(
		.address(address),
		.load(load),
		.out(out),
		.loadRAM(loadRAM),
		.loadIO0(loadIO0),
		.loadIO1(loadIO1),
		.loadIO2(loadIO2),
		.loadIO3(loadIO3),
		.loadIO4(loadIO4),
		.loadIO5(loadIO5),
		.loadIO6(loadIO6),
		.loadIO7(loadIO7),
		.loadIO8(loadIO8),
		.loadIO9(loadIO9),
		.loadIOA(loadIOA),
		.loadIOB(loadIOB),
		.loadIOC(loadIOC),
		.loadIOD(loadIOD),
		.loadIOE(loadIOE),
		.loadIOF(loadIOF),
		.inRAM(inRAM),
		.inIO0(inIO0),
		.inIO1(inIO1),
		.inIO2(inIO2),
		.inIO3(inIO3),
		.inIO4(inIO4),
		.inIO5(inIO5),
		.inIO6(inIO6),
		.inIO7(inIO7),
		.inIO8(inIO8),
		.inIO9(inIO9),
		.inIOA(inIOA),
		.inIOB(inIOB),
		.inIOC(inIOC),
		.inIOD(inIOD),
		.inIOE(inIOE),
		.inIOF(inIOF)
	);

	// Compare
	reg fail = 0;
	wire [15:0] out_cmp;
	assign out_cmp = ((address==4096)?inIO0:
				      (address==4097)?inIO1:
				      (address==4098)?inIO2:
				      (address==4099)?inIO3:
  				      (address==4100)?inIO4:
  				      (address==4101)?inIO5:
 				      (address==4102)?inIO6:
				      (address==4103)?inIO7:
				      (address==4104)?inIO8:
				      (address==4105)?inIO9:
				      (address==4106)?inIOA:
				      (address==4107)?inIOB:
				      (address==4108)?inIOC:
				      (address==4109)?inIOD:
				      (address==4110)?inIOE:
				      (address==4111)?inIOF:
				       inRAM);
	wire loadRAM_cmp,loadIO0_cmp,loadIO1_cmp,loadIO2_cmp,loadIO3_cmp,loadIO4_cmp,loadIO5_cmp,loadIO6_cmp,loadIO7_cmp,
					 loadIO8_cmp,loadIO9_cmp,loadIOA_cmp,loadIOB_cmp,loadIOC_cmp,loadIOD_cmp,loadIOE_cmp,loadIOF_cmp;
	assign loadRAM_cmp = (address<=3839)?load:0;
	assign loadIO0_cmp = (address==4096)?load:0;
	assign loadIO1_cmp = (address==4097)?load:0;
	assign loadIO2_cmp = (address==4098)?load:0;
	assign loadIO3_cmp = (address==4099)?load:0;
	assign loadIO4_cmp = (address==4100)?load:0;
	assign loadIO5_cmp = (address==4101)?load:0;
	assign loadIO6_cmp = (address==4102)?load:0;
	assign loadIO7_cmp = (address==4103)?load:0;
	assign loadIO8_cmp = (address==4104)?load:0;
	assign loadIO9_cmp = (address==4105)?load:0;
	assign loadIOA_cmp = (address==4106)?load:0;
	assign loadIOB_cmp = (address==4107)?load:0;
	assign loadIOC_cmp = (address==4108)?load:0;
	assign loadIOD_cmp = (address==4109)?load:0;
	assign loadIOE_cmp = (address==4110)?load:0;
	assign loadIOF_cmp = (address==4111)?load:0;
			
	task check;
		#1
		if ((out!=out_cmp)||(loadRAM!=loadRAM_cmp)||
			(loadIO0!=loadIO0_cmp)||(loadIO1!=loadIO1_cmp)||(loadIO2!=loadIO2_cmp)||(loadIO3!=loadIO3_cmp)||
			(loadIO4!=loadIO4_cmp)||(loadIO5!=loadIO5_cmp)||(loadIO6!=loadIO6_cmp)||(loadIO7!=loadIO7_cmp)||
			(loadIO8!=loadIO8_cmp)||(loadIO9!=loadIO9_cmp)||(loadIOA!=loadIOA_cmp)||(loadIOB!=loadIOB_cmp)||
			(loadIOC!=loadIOC_cmp)||(loadIOD!=loadIOD_cmp)||(loadIOE!=loadIOE_cmp)||(loadIOF!=loadIOF_cmp))
		begin
				$display("FAIL: address=%16b, load=%1b, out=%16b, loadRAM=%1b, loadIO0=%1b, loadIO1=%1b, ... ",address,load,out,loadRAM,loadIO0,loadIO1);
				fail=1;
			end
	endtask
	
	// Test 
  	initial begin
  		$dumpfile("Memory_tb.vcd");
  		$dumpvars(0, Memory_tb);
		
		$display("------------------------");
		$display("Testbench: Memory");
		
		inRAM=$random;
		inIO0=$random;
		inIO1=$random;
		inIO2=$random;
		inIO3=$random;
		inIO4=$random;
		inIO5=$random;
		inIO6=$random;
		inIO7=$random;
		inIO8=$random;
		inIO9=$random;
		inIOA=$random;
		inIOB=$random;
		inIOC=$random;
		inIOD=$random;
		inIOE=$random;
		inIOF=$random;
		for (address=4096; address<4112;address=address+1) 
			begin
				load=0;check();
				load=1;check();
			end
		for (address=0; address<3840;address=address+1) 
			begin
				inRAM=$random;
				load=0;check();
				load=1;check();
			end
		
		if (fail==0) $display("passed");
		$display("------------------------");
		
		$finish;
	end

endmodule

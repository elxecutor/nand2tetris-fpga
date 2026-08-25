/**
 * 8-way Or: 
 * out = (in[0] or in[1] or ... or in[7])
 */

`default_nettype none
module Or8Way(
	input [7:0] in,
	output out
);

	// Put your code here:
	wire [7:0] n_in;
	wire lvl11, lvl12, lvl13, lvl14, lvl21, lvl22, n_lvl11, n_lvl12, n_lvl13, n_lvl14, n_lvl21, n_lvl22;
	genvar i;
	generate
		for (i=0;i<=7;i++) begin
			nand(n_in[i], in[i], in[i]);
		end
	endgenerate

	nand(lvl11, n_in[0], n_in[1]);
	nand(n_lvl11, lvl11, lvl11);

	nand(lvl12, n_in[2], n_in[3]);
	nand(n_lvl12, lvl12, lvl12);

	nand(lvl13, n_in[4], n_in[5]);
	nand(n_lvl13, lvl13, lvl13);

	nand(lvl14, n_in[6], n_in[7]);
	nand(n_lvl14, lvl14, lvl14);

	nand(lvl21, n_lvl11, n_lvl12);
	nand(n_lvl21, lvl21, lvl21);
	
	nand(lvl22, n_lvl13, n_lvl14);
	nand(n_lvl22, lvl22, lvl22);

	nand(out, n_lvl21, n_lvl22);
endmodule

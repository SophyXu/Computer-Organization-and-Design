module mux2to1_32(
	input wire [31:0] a,
	input wire [31:0] b,
	input wire        sel,
	output wire [31:0] o
);
	assign o = sel ? a : b;
		
endmodule
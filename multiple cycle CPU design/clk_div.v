`timescale 1ns / 1ps
module clk_div(
input wire clk,
input wire rst,
input wire SW2,
output reg [31:0] clkdiv,
output wire Clk_CPU
);
always @ (posedge clk or posedge rst) begin
	if (rst) begin
		clkdiv <= 0;
	end 
	else begin
		clkdiv <= clkdiv + 1'b1;
	end
	end
	assign Clk_CPU = SW2 ? clkdiv[24] : clkdiv[1]; // SW2????¨º¡À?¨®
endmodule
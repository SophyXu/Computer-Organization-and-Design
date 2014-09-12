`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:34:44 03/12/2012 
// Design Name: 
// Module Name:    Regs 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module Regs(input clk,
				input rst,
				input [4:0] reg_R_addr_A, 
				input [4:0] reg_R_addr_B, 
				input [4:0] reg_W_addr, 
				input [31:0] wdata, 
				input reg_we, 
				output [31:0] rdata_A, 
				output [31:0] rdata_B
			  );
reg [31:0] regs[0:31];
integer i;
assign rdata_A = regs[reg_R_addr_A];
assign rdata_B = regs[reg_R_addr_B];
always @(posedge clk or posedge rst)
begin
	if (rst) 
		begin
			for (i=0;i<32;i=i+1) regs[i] = 32'h00000000;
		end
	else
		begin
			if (reg_we) regs[reg_W_addr] = wdata;
		end	
end
endmodule



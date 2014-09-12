`timescale 1ns / 1ps
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
	 reg [31:0] register[0:31];
	 
	 //assign rdata_A = (reg_R_addr_A == 0)? 0 : register[reg_R_addr_A];//read
    //assign rdata_B = (reg_R_addr_B == 0)? 0 : register[reg_R_addr_B];//read
	 assign rdata_A = register[reg_R_addr_A];//read
    assign rdata_B = register[reg_R_addr_B];//read
	 always @(posedge clk or posedge rst) begin
    if(rst == 1) begin//reset        
		register[0] <= 32'h00000000;
		register[1] <= 32'h00000000;
		register[2] <= 32'h00000000;
		register[3] <= 32'h00000000;
		register[4] <= 32'h00000000;
		register[5] <= 32'h00000000;
		register[6] <= 32'h00000000;
		register[7] <= 32'h00000000;
		register[8] <= 32'h00000000;
		register[9] <= 32'h00000000;
		register[10] <= 32'h00000000;
		register[11] <= 32'h00000000;
		register[12] <= 32'h00000000;
		register[13] <= 32'h00000000;
		register[14] <= 32'h00000000;
		register[15] <= 32'h00000000;
		register[16] <= 32'h00000000;
		register[17] <= 32'h00000000;
		register[18] <= 32'h00000000;
		register[19] <= 32'h00000000;
		register[20] <= 32'h00000000;
		register[21] <= 32'h00000000;
		register[22] <= 32'h00000000;
		register[23] <= 32'h00000000;
		register[24] <= 32'h00000000;
		register[25] <= 32'h00000000;
		register[26] <= 32'h00000000;
		register[27] <= 32'h00000000;
		register[28] <= 32'h00000000;
		register[29] <= 32'h00000000;
		register[30] <= 32'h00000000;
		register[31] <= 32'h00000000;
    end
    else begin
    if((reg_W_addr != 0) && (reg_we == 1))//write
        register[reg_W_addr] <=wdata;
    end
    end
	 
endmodule



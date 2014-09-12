`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:53:50 03/13/2014 
// Design Name: 
// Module Name:    alu 
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
module alu( input wire [31:0] A, input wire [31:0] B,
				input wire [2:0] ALU_operation,
				output reg [31:0] res,
				output wire zero, output wire overflow );
	//wire [31:0] res_and,res_or,res_add,res_sub,res_nor,res_slt,res_xor,res_srl;
	//reg [31:0] reg_res;
	parameter one = 32'h00000001, zero_0 = 32'h00000000;
	//assign res_and = A & B;
	//assign res_or = A | B;
	//assign res_add = A + B;
	//assign res_sub = A - B;
	//assign res_nor = ~(A | B);
	//assign res_slt =(A < B) ? one : zero_0;
	//assign res_xor = A ^ B;
	//assign res_srl = B >> 1;
	//assign res = reg_res;
	always @ (*)
		case (ALU_operation)
			3'b000: res = A & B;
			3'b001: res= A | B;
			3'b010: res= A + B;
			3'b110: res= A - B; 
			3'b100: res= ~(A | B);
			3'b111: res= (A < B) ? one : zero_0;
			3'b011: res= A ^ B;
			//3'b101: res= B >> 1;
			default: res= 32'hx;
		endcase
	assign zero = (res==0)? 1: 0;

endmodule


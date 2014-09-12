`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:08:41 03/06/2012 
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
module alu(input [31:0] A, 
			  input [31:0] B, 
			  input [2:0]ALU_operation, 
			  output reg[31:0] res,
			  output zero, 
			  output overflow 
			 );
parameter one=32'h00000001,zero_0=32'h00000000;
wire [31:0] res_slt,res_and,res_or,res_add,res_sub,res_xor;
assign res_slt=(A<B)?one:zero_0;
assign res_and = A&B;
assign res_or = A|B;
assign res_add = A+B;
assign res_sub = A-B;
assign res_xor = A^B;
assign res_srl = A >> 1;
always @(A or B or ALU_operation)
	case( ALU_operation )
	3'b000:res=res_and;
	3'b001:res=res_or;
	3'b010:res=res_add;
	3'b101:res=res_srl;
	3'b110:res=res_sub;
	3'b100:res=~(A|B);
	3'b111:res=res_slt;
	3'b011:res=res_xor;
	default:res=32'hx;
	endcase
assign zero=(res==0)?1:0;

endmodule

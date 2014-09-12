`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:32:56 02/25/2014 
// Design Name: 
// Module Name:    Controler_decode 
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
module Decode_Inst( input wire[5:0] OP_code, 
           input wire[5:0] function_code, 
           input wire int_code, 
           output reg jump, output reg jal, 
           output reg Bne, output reg Beq, 
           output reg lui, output reg jr,  
           output reg I_ALU, output reg reg_we, 
           output reg RFE, output reg mem_w, 
           output reg I_load, 
           output reg [2:0]  ALU_operation 
           );

 always @ * begin
       jump =0;
       jal = 0;
       Bne = 0;
       Beq = 0;
       lui = 0;
       jr = 0;
       I_ALU = 0;
       ALU_operation = 0;
       reg_we = 0;
       RFE = 0;
       mem_w = 0;
       I_load = 0;
       if(OP_code == 6'b000000)begin
           I_ALU = 1;
           reg_we = 1;
           case(function_code)
                 6'b100000: ALU_operation = 010;//add
                 6'b100010: ALU_operation = 110;//sub
                 6'b100100: ALU_operation = 000;//and
                 6'b100101: ALU_operation = 001;//or
                 6'b101010: ALU_operation = 111;//slt
                 6'b100111: ALU_operation = 100;//nor
                 6'h26:     ALU_operation = 011;//xor
                 6'h02:     ALU_operation = 101;//srl
                 6'h08:     jr = 1;             //jr
					  6'h09:     begin I_ALU=0;jr=1;jal=1;end//jalr				  
                 default: ALU_operation = 3'bx;
            endcase
         end
         else
         begin
         case(OP_code)
             6'b100011: begin ALU_operation = 010; reg_we = 1; I_load=1;end//lw
             6'b101011: begin ALU_operation = 010; mem_w = 1;end//sw
             6'b000100: begin ALU_operation = 110; Beq = 1; end//beq
				 6'h0a:     begin ALU_operation = 111; reg_we = 1; end//slti
             6'h08:     begin ALU_operation = 010; reg_we = 1; end//addi
             6'h0c:     begin ALU_operation = 000; reg_we = 1; end//andi
             6'h0e:     begin ALU_operation = 001; reg_we = 1; end//xori				 
             6'h05:     begin ALU_operation = 110; Bne = 1;   end//bne
             6'h02:     jump = 1;//j
             6'h03:     begin jal = 1; reg_we = 1;  end//jal            
             6'h0f:     begin lui = 1; reg_we = 1;  end//lui
             default: ALU_operation = 3'bx;
          endcase
          end
 end 
endmodule
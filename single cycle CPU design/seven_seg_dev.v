`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// CompANy: 
// Engineer: 
// 
// Create Date:    23:15:49 09/30/2011 
// Design Name: 
// Module Name:    x7seg 
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
module seven_seg_dev(
	input wire [31:0] disp_num,
	input wire clk,
	input wire clr,
	input	wire [1:0]SW,
	input wire [1:0] Scanning,
	output wire [7:0] SEGMENT,
	output reg [3:0] AN
	);
reg [3:0] digit;
reg [7:0] temp_seg, digit_seg;
wire [15:0] disp_current;
assign SEGMENT = SW[0] ? digit_seg : temp_seg; // 0：选择图形，1:16进制数
assign disp_current = SW[1] ? disp_num[31:16] : disp_num[15:0];// 0:低16位,1:高16位
always @(*) begin
	AN = 4'b1111;
	case (Scanning) // temp_seg是图形显示的映射值，方便构成7段上图形
		0: begin // disp_num[7:0]
				AN = 4'b1110;
				digit = disp_current[3:0]; //16进制数显示：D3~D0或D19~D16
				temp_seg = {disp_num[24], disp_num[0], disp_num[4], disp_num[16],
								disp_num[25], disp_num[17], disp_num[5], disp_num[12]}; end
		1: begin // disp_num[15:8]
				AN = 4'b1101;
				digit = disp_current[7:4]; //16进制数显示：D7~D4或D23~D20
				temp_seg = {disp_num[26], disp_num[1], disp_num[6], disp_num[18],
								disp_num[27], disp_num[19], disp_num[7], disp_num[13]};end
		2: begin // disp_num[23:16]
				AN = 4'b1011;
				digit = disp_current[11:8]; //16进制数显示：D11~D8或D27~D24
				temp_seg = {disp_num[28], disp_num[2], disp_num[8], disp_num[20],
				disp_num[29], disp_num[21], disp_num[9], disp_num[14]};end
		3: begin // disp_num[31:24]
				AN = 4'b0111;
				digit = disp_current[15:12]; //16进制数显示：D15~D12或D31~D28
				temp_seg = {disp_num[30], disp_num[3], disp_num[10], disp_num[22],
				disp_num[31], disp_num[23], disp_num[11], disp_num[15]};end
	endcase
	case (digit) 
		4'h0: digit_seg = 7'b0000001; 
		4'h1: digit_seg = 7'b1001111; 
		4'h2: digit_seg = 7'b0010010; 
		4'h3: digit_seg = 7'b0000110; 
		4'h4: digit_seg = 7'b1001100; 
		4'h5: digit_seg = 7'b0100100; 
		4'h6: digit_seg = 7'b0100000; 
		4'h7: digit_seg = 7'b0001111; 
		4'h8: digit_seg = 7'b0000000; 
		4'h9: digit_seg = 7'b0000100; 
		4'hA: digit_seg = 7'b0001000; 
		4'hB: digit_seg = 7'b1100000; 
		4'hC: digit_seg = 7'b0110001; 
		4'hD: digit_seg = 7'b1000010; 
		4'hE: digit_seg = 7'b0110000; 
		4'hF: digit_seg = 7'b0111000; 
	endcase
	end//7段码译码部分
endmodule


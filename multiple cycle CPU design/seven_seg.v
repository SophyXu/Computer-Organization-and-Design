`timescale 1ns / 1ps
module seven_seg(
	input wire [31:0] disp_num, // ∩y??那?米?32???t????那y?辰米??車
	input wire clr,
	input wire clk,
	input wire [1:0] SW,
	input wire [1:0] Scanning, // ??那?谷“?豕D?o?㏒?車?那㊣?車﹞??米??米??㏒
	output wire [7:0] SEGMENT, // 7??????那?㊣角??
	output reg [3:0] AN // 4??7????12????????㏒?車?車迆谷“?豕??那?????
);

reg [3:0] digit;
reg [7:0] temp_seg, digit_seg;
wire [15:0] disp_current;
assign SEGMENT = SW[0] ? digit_seg : temp_seg; // 0㏒o????赤?D?㏒?1:16????那y
assign disp_current = SW[1] ? disp_num[31:16] : disp_num[15:0];// 0:米赤16??,1:??16??

always @ (*) begin
	case (Scanning) // temp_seg那?赤?D???那?米?車3谷??米㏒?﹞?㊣?113谷7??谷?赤?D?
		0: begin // disp_num[7:0]
			digit = disp_current[3:0]; //16????那y??那?㏒oD3~D0?辰D19~D16
			temp_seg = {disp_num[24], disp_num[0], disp_num[4], disp_num[16], disp_num[25], disp_num[17], disp_num[5], disp_num[12]};
			AN = 4'b1110;
			end

		1: begin // disp_num[15:8]
			digit = disp_current[7:4]; //16????那y??那?㏒oD7~D4?辰D23~D20
			temp_seg = {disp_num[26], disp_num[1], disp_num[6], disp_num[18], disp_num[27], disp_num[19], disp_num[7], disp_num[13]};
			AN = 4'b1101;
			end

		2: begin // disp_num[23:16]
			digit = disp_current[11:8]; //16????那y??那?㏒oD11~D8?辰D27~D24
			temp_seg = {disp_num[28], disp_num[2], disp_num[8], disp_num[20], disp_num[29], disp_num[21], disp_num[9], disp_num[14]};
			AN = 4'b1011;
			end

		3: begin // disp_num[31:24]
			digit = disp_current[15:12]; //16????那y??那?㏒oD15~D12?辰D31~D28
			temp_seg = {disp_num[30], disp_num[3], disp_num[10], disp_num[22], disp_num[31], disp_num[23], disp_num[11], disp_num[15]};
			AN = 4'b0111;
			end
	endcase
end


always @ (*) begin
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
end

endmodule


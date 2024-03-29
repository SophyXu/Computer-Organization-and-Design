`timescale 1ns / 1ps

module seven_seg_Dev_IO( input clk,
							input rst,
							input GPIOe0000000_we,
							input [2:0] Test,
							input [31:0] disp_cpudata,
							input [31:0] Test_data0,
							input [31:0] Test_data1,
							input [31:0] Test_data2,
							input [31:0] Test_data3,
							input [31:0] Test_data4,
							input [31:0] Test_data5,
							input [31:0] Test_data6,						 						 
							output reg [31: 0] disp_num						 
						);
	//reg [31: 0] disp_num;
	always @(negedge clk or posedge rst) begin
	if(rst)
		disp_num <= 32'hAA5555AA;
	else begin
		case(Test) //SW[7:5]
		    0: begin if(GPIOe0000000_we) 
								disp_num <= disp_cpudata; 
						 else disp_num <= disp_num; 
				 end
//1: disp_num <={2'b00,Test_data0[31:2]}; //pc[31:2]
			1: disp_num <={Test_data0};    //               001
			2: disp_num <=Test_data1[31:0]; //counter[31:0]
			3: disp_num <= Test_data2; //Inst
			4: disp_num <=Test_data3; //addr_bus
			5: disp_num <=Test_data4; //Cpu_data2bus;
			6: disp_num <=Test_data5; //Cpu_data4bus;
			7: disp_num <=Test_data6; //pc;
					endcase end
			end

endmodule

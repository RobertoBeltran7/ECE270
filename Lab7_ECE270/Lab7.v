module Lab7_step1(I0,I1,I2,I3,I4,I5,I6,I7,A,B,C,D,E,F,G);
	input wire I0 /* synthesis loc="2" */;
	input wire I1 /* synthesis loc="3" */;
	input wire I2 /* synthesis loc="4" */;
	input wire I3 /* synthesis loc="5" */;
	input wire I4 /* synthesis loc="6" */;
	input wire I5 /* synthesis loc="7" */;
	input wire I6 /* synthesis loc="8" */;
	input wire I7 /* synthesis loc="9" */;
	
	output wire A /* synthesis loc="14" */;
	output wire B /* synthesis loc="15" */;
	output wire C /* synthesis loc="16" */;
	output wire D /* synthesis loc="17" */;
	output wire E /* synthesis loc="18" */;
	output wire F /* synthesis loc="19" */;
	output wire G /* synthesis loc="20" */;
	output wire DP /* synthesis loc="21" */;
	
	
	assign A = ~I0;
	assign B = ~I1;
	assign C = ~I2;
	assign D = ~I3;
	assign E = ~I4;
	assign F = ~I5;
	assign G = ~I6;
	assign DP = ~I7;

endmodule

module Lab7_step2(I0,I1,I2,I3,I4,A,B,C,D,E,F,G,DP);
	input wire I0 /* synthesis loc="2" */;
	input wire I1 /* synthesis loc="3" */;
	input wire I2 /* synthesis loc="4" */;
	input wire I3 /* synthesis loc="5" */;
	input wire I4 /* synthesis loc="6" */;
	
	output wire A /* synthesis loc="14" */;
	output wire B /* synthesis loc="15" */;
	output wire C /* synthesis loc="16" */;
	output wire D /* synthesis loc="17" */;
	output wire E /* synthesis loc="18" */;
	output wire F /* synthesis loc="19" */;
	output wire G /* synthesis loc="20" */;
	output wire DP /* synthesis loc="21" */;
	
	reg [7:0] SEG8;
	
	always @ (I4,I3,I2,I1,I0) begin
		case ({I4,I3,I2,I1,I0})
		  5'b00000: SEG8 = 8'b11111100;
		  5'b00001: SEG8 = 8'b01100000;
		  5'b00010: SEG8 = 8'b11011010;
		  5'b00011: SEG8 = 8'b11110010;
		  5'b00100: SEG8 = 8'b01100110;
		  5'b00101: SEG8 = 8'b10110110;
		  5'b00110: SEG8 = 8'b10111110;
		  5'b00111: SEG8 = 8'b11100000;
		  5'b01000: SEG8 = 8'b11111110;
		  5'b01001: SEG8 = 8'b11110110;
		  5'b01010: SEG8 = 8'b11101110;
		  5'b01011: SEG8 = 8'b00111110;
		  5'b01100: SEG8 = 8'b10011100;
		  5'b01101: SEG8 = 8'b01111010;
		  5'b01110: SEG8 = 8'b10011110;
		  5'b01111: SEG8 = 8'b10001110;
			
		  5'b10000: SEG8 = 8'b11101111;
		  5'b10001: SEG8 = 8'b00111111;
		  5'b10010: SEG8 = 8'b10011101;
		  5'b10011: SEG8 = 8'b01111011;
		  5'b10100: SEG8 = 8'b10011111;
		  5'b10101: SEG8 = 8'b10001111;
		  5'b10110: SEG8 = 8'b11110111;
		  5'b10111: SEG8 = 8'b01101111;
		  5'b11000: SEG8 = 8'b01110001;
		  5'b11001: SEG8 = 8'b00011101;
		  5'b11010: SEG8 = 8'b00101011;
		  5'b11011: SEG8 = 8'b00111011;
		  5'b11100: SEG8 = 8'b11001111;
		  5'b11101: SEG8 = 8'b00001011;
		  5'b11110: SEG8 = 8'b01111101;
		  5'b11111: SEG8 = 8'b01110111;
		endcase
	end
assign {A,B,C,D,E,F,G,DP} = ~SEG8;


endmodule


module Lab7_step4(I0,I1,I2,I3,I4,I5,I6,I7,A,B,C,D,E,F,G);
	input wire I0 /* synthesis loc="2" */;
	input wire I1 /* synthesis loc="3" */;
	input wire I2 /* synthesis loc="4" */;
	input wire I3 /* synthesis loc="5" */;
	input wire I4 /* synthesis loc="6" */;
	input wire I5 /* synthesis loc="7" */;
	input wire I6 /* synthesis loc="8" */;
	input wire I7 /* synthesis loc="9" */;
	
	output wire A /* synthesis loc="14" */;
	output wire B /* synthesis loc="15" */;
	output wire C /* synthesis loc="16" */;
	output wire D /* synthesis loc="17" */;
	output wire E /* synthesis loc="18" */;
	output wire F /* synthesis loc="19" */;
	output wire G /* synthesis loc="20" */;
	
	reg [6:0] SEG7;
	
	always @ (I7,I6,I5,I4,I3,I2,I1,I0) begin
		casez ({I7,I6,I5,I4,I3,I2,I1,I0})
		  8'b00000000: SEG7 = 7'b0111110;
		  8'b00000001: SEG7 = 7'b1110111;
		  8'b0000001?: SEG7 = 7'b0110000;
		  8'b000001??: SEG7 = 7'b1101101;
		  8'b00001???: SEG7 = 7'b1111001;
		  8'b0001????: SEG7 = 7'b0110011;
		  8'b001?????: SEG7 = 7'b1011011;
		  8'b01??????: SEG7 = 7'b1011111;
		  8'b1???????: SEG7 = 7'b1110000;
		endcase
	end
	
	assign{A,B,C,D,E,F,G} = ~SEG7;

endmodule


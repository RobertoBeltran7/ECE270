module lab10_top(DIP, i_S1_NC, i_S1_NO, i_S2_NC, i_S2_NO, o_TOPRED, o_MIDRED, o_BOTRED, o_DIS1, o_DIS2, o_DIS3, o_DIS4, o_JUMBO, o_LED_YELLOW);

// ====== DO NOT MODIFY BELOW ======
input wire [7:0] DIP /*synthesis loc="26,25,24,23,76,77,78,79"*/;		// DIP switches (MSB on the left)

input wire i_S1_NC /*synthesis loc="58"*/;					// ACTIVE LOW normally closed (down position)
input wire i_S1_NO /*synthesis loc="59"*/;					// ACTIVE LOW normally opened (up position)
input wire i_S2_NC /*synthesis loc="60"*/;					// ACTIVE LOW normally closed (down position)
input wire i_S2_NO /*synthesis loc="61"*/;					// ACTIVE LOW normally opened (up position)

output wire [7:0] o_TOPRED /*synthesis loc="28,29,30,31,32,33,39,40"*/;			// ACTIVE LOW first row of LED (from top, MSB on the left)
output wire [7:0] o_MIDRED /*synthesis loc="130,131,132,133,134,135,138,139"*/;		// ACTIVE LOW second row of LED (from top, MSB on the left)
output wire [7:0] o_BOTRED /*synthesis loc="112,111,105,104,103,102,101,100"*/;		// ACTIVE LOW third row of LED (from top, MSB on the left)

output wire [6:0] o_DIS1 /*synthesis loc="87,86,85,84,83,81,80"*/;			// ACTIVE LOW right most 7-segment
output wire [6:0] o_DIS2 /*synthesis loc="98,97,96,95,94,93,88"*/;			// ACTIVE LOW second right most 7-segment
output wire [6:0] o_DIS3 /*synthesis loc="125,124,123,122,121,120,116"*/;		// ACTIVE LOW second left most 7-segment
output wire [6:0] o_DIS4 /*synthesis loc="44,48,49,50,51,52,53"*/;			// ACTIVE LOW left most 7-segment

output wire [3:0] o_JUMBO /*synthesis loc="143,142,141,140*/;			// ACTIVE LOW Jumbo R-Y-G LED (unused, RED, YELLOW, GREEN)

output wire [1:0] o_LED_YELLOW /*synthesis loc="62,63*/;			// ACTIVE LOW yellow LED next to pushbuttons

// Active Low Assignments
wire S1_NC, S1_NO, S2_NC, S2_NO;
reg [7:0] TOPRED;
reg [7:0] MIDRED;
reg [7:0] BOTRED;
reg [6:0] DIS1;
reg [6:0] DIS2;
reg [6:0] DIS3;
reg [6:0] DIS4;
reg JUMBO_unused, JUMBO_R, JUMBO_Y, JUMBO_G;
reg LED_YELLOW_L, LED_YELLOW_R;

assign S1_NC = ~i_S1_NC;
assign S1_NO = ~i_S1_NO;
assign S2_NC = ~i_S2_NC;
assign S2_NO = ~i_S2_NO;
assign o_TOPRED = ~TOPRED;
assign o_MIDRED = ~MIDRED;
assign o_BOTRED = ~BOTRED;
assign o_DIS1 = ~DIS1;
assign o_DIS2 = ~DIS2;
assign o_DIS3 = ~DIS3;
assign o_DIS4 = ~DIS4;
assign o_JUMBO = {~JUMBO_unused, ~JUMBO_G, ~JUMBO_Y, ~JUMBO_R};
assign o_LED_YELLOW = {~LED_YELLOW_L, ~LED_YELLOW_R};


// Oscillator

wire osc_dis, tmr_rst, osc_out, tmr_out;
assign osc_dis = 1'b0;
assign tmr_rst = 1'b0;

defparam I1.TIMER_DIV = "1048576";
OSCTIMER I1 (.DYNOSCDIS(osc_dis), .TIMERRES(tmr_rst), .OSCOUT(osc_out), .TIMEROUT(tmr_out));


// 7-segment alphanumeric display code
localparam blank = 7'b0000000;
localparam char0 = 7'b1111110;
localparam char1 = 7'b0110000;
localparam char2 = 7'b1101101;
localparam char3 = 7'b1111001;
localparam char4 = 7'b0110011;
localparam char5 = 7'b1011011;
localparam char6 = 7'b1011111;
localparam char7 = 7'b1110000;
localparam char8 = 7'b1111111;
localparam char9 = 7'b1111011;
localparam charA = 7'b1110111;
localparam charB = 7'b0011111;
localparam charC = 7'b1001110;
localparam charD = 7'b0111101;
localparam charE = 7'b1001111;
localparam charF = 7'b1000111;
localparam charG = 7'b1111011;
localparam charH = 7'b0110111;
localparam charI = 7'b0010000;
localparam charJ = 7'b0111000;
localparam charL = 7'b0001110;
localparam charN = 7'b0010101;
localparam charO = 7'b0011101;
localparam charP = 7'b1100111;
localparam charR = 7'b0000101;
localparam charS = 7'b1011011;
localparam charT = 7'b0001111;
localparam charU = 7'b0111110;
localparam charY = 7'b0111011;

// ====== DO NOT MODIFY ABOVE ======

// Lab10 Step 1
reg tmr1;
reg tmr2;

always @ (posedge tmr_out)
begin
	tmr1 <= ~tmr1;
end

always @ (posedge tmr1)
begin
	tmr2 <= ~tmr2;
end

always @ (tmr2)
begin
	LED_YELLOW_R <= tmr2;
end



//Lab 10 Step3
reg [4:0] curr_DIS;
reg [4:0] next_DIS;
reg [6:0] out_DIS;


localparam blank1 = 5'b00000;
localparam g1	  = 5'b00001;
localparam o1	  = 5'b00010;
localparam blank2 = 5'b00011;
localparam p1	  = 5'b00100;
localparam u1	  = 5'b00101;
localparam r1	  = 5'b00110;
localparam d	  = 5'b00111;
localparam u2	  = 5'b01000;
localparam e1	  = 5'b01001;
localparam n	  = 5'b01010;
localparam o2	  = 5'b01011;
localparam i1	  = 5'b01100;
localparam s	  = 5'b01101;
localparam e2	  = 5'b01110;
localparam b1	  = 5'b01111;
localparam o3	  = 5'b10000;
localparam i2	  = 5'b10001;
localparam l1	  = 5'b10010;
localparam e3	  = 5'b10011;
localparam r2	  = 5'b10100;
localparam blank3 = 5'b10101;
localparam u3	  = 5'b10110;
localparam p2	  = 5'b10111;
localparam b3	  = 5'b11000;
localparam o4	  = 5'b11001;
localparam o5	  = 5'b11010;
localparam t	  = 5'b11011;
localparam y 	  = 5'b11100;
localparam b2	  = 5'b11101;
localparam i3	  = 5'b11110;
localparam g2	  = 5'b11111;

always @ (posedge tmr2) begin

	curr_DIS<= next_DIS;
end

always @ (DIP) begin
case (curr_DIS)
	blank1: if (DIP[1] == 0 && DIP[0] == 0)	next_DIS <= g1;
		else if (DIP[1] == 0 && DIP[0] == 1)	next_DIS <= n;
		else if (DIP[1] == 1 && DIP[0] == 0)	next_DIS <= b1;
		else if (DIP[1] == 1 && DIP[0] == 1)	next_DIS <= b2;

	g1: if (DIP[1] == 0 && DIP[0] == 0)	next_DIS <= o1;
		else	next_DIS <= blank1;	
	
	o1: if (DIP[1] == 0 && DIP[0] == 0)	next_DIS <= blank2
;		else	next_DIS <= blank1;

	blank2: if (DIP[1] == 0 && DIP[0] == 0)	next_DIS <= p1;
		else	next_DIS <= blank1;
	
	p1: if (DIP[1] == 0 && DIP[0] == 0)	next_DIS <= u1;
		else	next_DIS <= blank1;	
		
	u1: if (DIP[1] == 0 && DIP[0] == 0)	next_DIS <= r1;
		else	next_DIS <= blank1;

	r1: if (DIP[1] == 0 && DIP[0] == 0)	next_DIS <= d;
		else	next_DIS <= blank1;	

	d:  if (DIP[1] == 0 && DIP[0] == 0)	next_DIS <= u2;
		else	next_DIS <= blank1;
	
	u2: if (DIP[1] == 0 && DIP[0] == 0)	next_DIS <= e1;
		else	next_DIS <= blank1;

	e1: if (DIP[1] == 0 && DIP[0] == 0)	next_DIS <= blank1;
		else	next_DIS <= blank1;

	n:  if (DIP[1] == 0 && DIP[0] == 1)	next_DIS <= o2;
		else	next_DIS <= blank1;

	o2: if (DIP[1] == 0 && DIP[0] == 1)	next_DIS <= i1;
		else	next_DIS <= blank1;

	i1: if (DIP[1] == 0 && DIP[0] == 1)	next_DIS <= s;
		else	next_DIS <= blank1;
		
	s:  if ((DIP[1] == 0) && (DIP[0] == 1))	next_DIS <= e2;
		else	next_DIS <= blank1;

	e2: if ((DIP[1] == 0) && (DIP[0] == 1))	next_DIS <= blank1;
		else	next_DIS <= blank1;

	b1: if (DIP[1] == 1 && DIP[0] == 0)	next_DIS <= o3;
		else	next_DIS <= blank1;		
	
	o3: if (DIP[1] == 1 && DIP[0] == 0)	next_DIS <= i2;
		else	next_DIS <= blank1;

	i2: if (DIP[1] == 1 && DIP[0] == 0)	next_DIS <= l1;
		else	next_DIS <= blank1;
	
	l1: if (DIP[1] == 1 && DIP[0] == 0)	next_DIS <= e3;
		else	next_DIS <= blank1;

	e3: if (DIP[1] == 1 && DIP[0] == 0)	next_DIS <= r2;
		else	next_DIS <= blank1;

	r2: if (DIP[1] == 1 && DIP[0] == 0)	next_DIS <= blank3;
		else	next_DIS <= blank1;

	blank3: if (DIP[1] == 1 && DIP[0] == 0)	next_DIS <= u3;
		else	next_DIS <= blank1;
	
	u3: if (DIP[1] == 1 && DIP[0] == 0)	next_DIS <= p2;
		else	next_DIS <= blank1;

	p2: if (DIP[1] == 1 && DIP[0] == 0)	next_DIS <= blank1;
		else	next_DIS <= blank1;

	/*r3: if (DIP[1] == 1 && DIP[0] == 1)	next_DIS <= e4;
		else	next_DIS <= blank1;

	e4: if (DIP[1] == 1 && DIP[0] == 1)	next_DIS <= a;
		else	next_DIS <= blank1;

	a: if (DIP[1] == 1 && DIP[0] == 1)	next_DIS <= l2;
		else	next_DIS <= blank1;
	
	l2: if (DIP[1] == 1 && DIP[0] == 1)	next_DIS <= blank4;
		else	next_DIS <= blank1;
	
	blank4: if (DIP[1] == 1 && DIP[0] == 1)	next_DIS <= b2;
		else	next_DIS <= blank1;*/

	b2: if (DIP[1] == 1 && DIP[0] == 1)	next_DIS <= i3;
		else	next_DIS <= blank1;

	i3: if (DIP[1] == 1 && DIP[0] == 1)	next_DIS <= g2;
		else	next_DIS <= blank1;

	g2: if (DIP[1] == 1 && DIP[0] == 1)	next_DIS <= b3;
		else	next_DIS <= blank1;
	
	b3: if (DIP[1] == 1 && DIP[0] == 1)	next_DIS <= o4;
		else	next_DIS <= blank1;
	
	o4: if (DIP[1] == 1 && DIP[0] == 1)	next_DIS <= o5;
		else	next_DIS <= blank1;
	
	o5: if (DIP[1] == 1 && DIP[0] == 1)	next_DIS <= t;
		else	next_DIS <= blank1;
	
	t: if (DIP[1] == 1 && DIP[0] == 1)	next_DIS <= y;
		else	next_DIS <= blank1;

	y: if (DIP[1] == 1 && DIP[0] == 1)	next_DIS <= blank1;
		else	next_DIS <= blank1;
endcase
end


always @ (DIP)begin
case (curr_DIS)
//a : out_DIS = charA;
b1 : out_DIS = charB;
b2 : out_DIS = charB;
d : out_DIS = charD;
e1 : out_DIS = charE;
e2 : out_DIS = charE;
e3 : out_DIS = charE;
//e4 : out_DIS = charE;
g1 : out_DIS = charG;
g2 : out_DIS = charG;
i1 : out_DIS = charI;
i2 : out_DIS = charI;
i3 : out_DIS = charI;
l1 : out_DIS = charL;
//l2 : out_DIS = charL;
n : out_DIS = charN;
o1 : out_DIS = charO;
o2 : out_DIS = charO;
o3 : out_DIS = charO;
p1 : out_DIS = charP;
p2 : out_DIS = charP;
r1 : out_DIS = charR;
r2 : out_DIS = charR;
//r3 : out_DIS = charR;
s : out_DIS = charS;
u1 : out_DIS = charU;
u2 : out_DIS = charU;
u3 : out_DIS = charU;
blank1 : out_DIS = blank;
blank2 : out_DIS = blank;
blank3 : out_DIS = blank;
//blank4 : out_DIS = blank;
b3 : out_DIS = charB;
o4 : out_DIS = charO;
o5 : out_DIS = charO;
t : out_DIS = charT;
y : out_DIS = charY;

endcase
end


// Lab10 Step 2
always @ (posedge tmr2)
begin
	
if (DIP[7] == 1)
begin
	DIS1 <= blank1;
	DIS2 <= blank1;
	DIS3 <= blank1;
	DIS4 <= blank1;
end

else begin	
DIS1 <= out_DIS;

DIS2[6] <= DIS1[6];
DIS2[5] <= DIS1[5];
DIS2[4] <= DIS1[4];
DIS2[3] <= DIS1[3];
DIS2[2] <= DIS1[2];
DIS2[1] <= DIS1[1];
DIS2[0] <= DIS1[0];

DIS3[6] <= DIS2[6];
DIS3[5] <= DIS2[5];
DIS3[4] <= DIS2[4];
DIS3[3] <= DIS2[3];
DIS3[2] <= DIS2[2];
DIS3[1] <= DIS2[1];
DIS3[0] <= DIS2[0];

DIS4[6] <= DIS3[6];
DIS4[5] <= DIS3[5];
DIS4[4] <= DIS3[4];
DIS4[3] <= DIS3[3];
DIS4[2] <= DIS3[2];
DIS4[1] <= DIS3[1];
DIS4[0] <= DIS3[0];
end
		
end

endmodule 

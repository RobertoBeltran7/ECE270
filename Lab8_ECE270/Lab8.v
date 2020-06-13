module lab8_Step1(CLKIN, CS, RS, SS, CM, RM, SM, D, NC, NO,BQ, QM, QM_N, QS, QS_N, QFF);

//INPUTS
input    CLKIN/*synthesis loc="1"*/;
input    CS   /*synthesis loc="2"*/;
input    RS   /*synthesis loc="3"*/;
input    SS   /*synthesis loc="4"*/;
input    CM   /*synthesis loc="5"*/;
input    RM   /*synthesis loc="6"*/;
input    SM   /*synthesis loc="7"*/;
input    D    /*synthesis loc="8"*/;
input    NC   /*synthesis loc="9"*/;
input    NO   /*synthesis loc="10"*/;


//OUTPUTS
output     BQ   /*synthesis loc="23"*/;
output reg QFF  /*synthesis loc="18"*/;
output	QM   /*synthesis loc="17"*/;
output     QM_N /*synthesis loc="16"*/;
output     QS   /*synthesis loc="15"*/;
output     QS_N /*synthesis loc="14"*/;


// Bounceless Switch 

assign BQ = ~NO | (NC & BQ);

// Slave Latch 
assign QS = ~(~(SS&CS) & QS_N);
assign QS_N = ~(~(RS&CS) & QS);


// Master Latch 
assign QM = ~(~(SM&CM) & QM_N);
assign QM_N = ~(~(RM&CM) & QM);


// D flipflop
always @(posedge CLKIN)
begin
	QFF <= D;
end
endmodule


module lab8_Step3(CLKIN, CS, RS, SS, /*CM, RM, SM,*/ D, NC, NO,BQ, QM, QM_N, QS, QS_N, QFF);

//INPUTS
input    CLKIN/*synthesis loc="1"*/;
input    CS   /*synthesis loc="2"*/;
input    RS   /*synthesis loc="3"*/;
input    SS   /*synthesis loc="4"*/;
//input    CM   /*synthesis loc="5"*/;
//input    RM   /*synthesis loc="6"*/;
//input    SM   /*synthesis loc="7"*/;
input    D    /*synthesis loc="8"*/;
input    NC   /*synthesis loc="9"*/;
input    NO   /*synthesis loc="10"*/;


//OUTPUTS
output     BQ   /*synthesis loc="23"*/;
output reg QFF  /*synthesis loc="18"*/;
output	QM   /*synthesis loc="17"*/;
output     QM_N /*synthesis loc="16"*/;
output     QS   /*synthesis loc="15"*/;
output     QS_N /*synthesis loc="14"*/;


// Bounceless Switch 

assign BQ = ~NO | (NC & BQ);

// Slave Latch 
assign QS = ~(~(SS&(CS)) & QS_N);
assign QS_N = ~(~((RS)&(CS)) & QS);


// Master Latch 
assign QM = ~(~(D&(CLKIN)) & QM_N);
assign QM_N = ~(~(!D&(CLKIN)) & QM);


// D flipflop
always @(posedge CLKIN)
begin
	QFF <= D;
end
endmodule



module lab8_Step4(CLKIN, /*CS, RS, SS, CM, RM, SM,*/ D, NC, NO,BQ, QM, QM_N, QS, QS_N, QFF);

//INPUTS
input    CLKIN/*synthesis loc="1"*/;
//input    CS   /*synthesis loc="2"*/;
//input    RS   /*synthesis loc="3"*/;
//input    SS   /*synthesis loc="4"*/;
//input    CM   /*synthesis loc="5"*/;
//input    RM   /*synthesis loc="6"*/;
//input    SM   /*synthesis loc="7"*/;
input    D    /*synthesis loc="8"*/;
input    NC   /*synthesis loc="9"*/;
input    NO   /*synthesis loc="10"*/;


//OUTPUTS
output     BQ   /*synthesis loc="23"*/;
output reg QFF  /*synthesis loc="18"*/;
output	QM   /*synthesis loc="17"*/;
output     QM_N /*synthesis loc="16"*/;
output     QS   /*synthesis loc="15"*/;
output     QS_N /*synthesis loc="14"*/;


// Bounceless Switch 

assign BQ = ~NO | (NC & BQ);

// Slave Latch 
assign QS = ~(~(QM&(!CLKIN)) & QS_N);
assign QS_N = ~(~((QM_N)&(!CLKIN)) & QS);


// Master Latch 
assign QM = ~(~(D&(CLKIN)) & QM_N);
assign QM_N = ~(~(!D&(CLKIN)) & QM);


// D flipflop
always @(posedge CLKIN)
begin
	QFF <= D;
end
endmodule



module lab8_Step5(CLKIN, /*CS, RS, SS, CM, RM, SM,*/ D, NC, NO,BQ, QM, QM_N, QS, QS_N, QFF);

//INPUTS
input    CLKIN/*synthesis loc="1"*/;
//input    CS   /*synthesis loc="2"*/;
//input    RS   /*synthesis loc="3"*/;
//input    SS   /*synthesis loc="4"*/;
//input    CM   /*synthesis loc="5"*/;
//input    RM   /*synthesis loc="6"*/;
//input    SM   /*synthesis loc="7"*/;
input    D    /*synthesis loc="8"*/;
input    NC   /*synthesis loc="9"*/;
input    NO   /*synthesis loc="10"*/;


//OUTPUTS
output     BQ   /*synthesis loc="23"*/;
output reg QFF  /*synthesis loc="18"*/;
output	QM   /*synthesis loc="17"*/;
output     QM_N /*synthesis loc="16"*/;
output     QS   /*synthesis loc="15"*/;
output     QS_N /*synthesis loc="14"*/;


// Bounceless Switch 

assign BQ = ~NO | (NC & BQ);

// Slave Latch 
assign QS = ~(~(QM&(CLKIN)) & QS_N);
assign QS_N = ~(~((QM_N)&(CLKIN)) & QS);


// Master Latch 
assign QM = ~(~(D&(!CLKIN)) & QM_N);
assign QM_N = ~(~(!D&(!CLKIN)) & QM);


// D flipflop
always @(posedge CLKIN)
begin
	QFF <= D;
end
endmodule

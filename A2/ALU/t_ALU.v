/*
Samyak Jain & Mishal Shah
16CO254 & 16CO125
29/10/2017
Test Bench for 1-bit ALU
*/
`timescale 1ns/1ps

module test;

wire result,zero_flag;           
reg a,b,Ainvert,Binvert,cy_in;
reg [1:0]op;

ALU_1_bit f5(result,zero_flag,a,b,Ainvert,Binvert,op,cy_in);      //ALU module called       

initial begin
$dumpfile("ALU.vcd");
$dumpvars(0,test);
end

initial begin

//Inputs set to perform AND Operation

$display("AND Operation");
a=1'b0;
b=1'b0;
Ainvert=1'b0;
Binvert=1'b0;
op=2'b00;
$monitor("a=%b b=%b Ainvert=%b Binvert=%b op=%b result=%b zero_flag=%b",a,b,Ainvert,Binvert,op,result,zero_flag);
#10;
a=1'b0;
b=1'b1;
Ainvert=1'b0;
Binvert=1'b0;
op=2'b00;
$monitor("a=%b b=%b Ainvert=%b Binvert=%b op=%b result=%b zero_flag=%b",a,b,Ainvert,Binvert,op,result,zero_flag);
#10;

a=1'b1;
b=1'b0;
Ainvert=1'b0;
Binvert=1'b0;
op=2'b00;
$monitor("a=%b b=%b Ainvert=%b Binvert=%b op=%b result=%b zero_flag=%b",a,b,Ainvert,Binvert,op,result,zero_flag);
#10;

a=1'b1;
b=1'b1;
Ainvert=1'b0;
Binvert=1'b0;
op=2'b00;
$monitor("a=%b b=%b Ainvert=%b Binvert=%b op=%b result=%b zero_flag=%b\n",a,b,Ainvert,Binvert,op,result,zero_flag);
#10;


//Inputs set to perform OR Operation



$display("For OR Operation");
a=1'b0;
b=1'b0;
Ainvert=1'b0;
Binvert=1'b0;
op=2'b01;
$monitor("a=%b b=%b Ainvert=%b Binvert=%b op=%b result=%b zero_flag=%b",a,b,Ainvert,Binvert,op,result,zero_flag);
#10;

a=1'b0;
b=1'b1;
Ainvert=1'b0;
Binvert=1'b0;
op=2'b01;
$monitor("a=%b b=%b Ainvert=%b Binvert=%b op=%b result=%b zero_flag=%b",a,b,Ainvert,Binvert,op,result,zero_flag);
#10;

a=1'b1;
b=1'b0;
Ainvert=1'b0;
Binvert=1'b0;
op=2'b01;
$monitor("a=%b b=%b Ainvert=%b Binvert=%b op=%b result=%b zero_flag=%b",a,b,Ainvert,Binvert,op,result,zero_flag);
#10;

a=1'b1;
b=1'b1;
Ainvert=1'b0;
Binvert=1'b0;
op=2'b01;
$monitor("a=%b b=%b Ainvert=%b Binvert=%b op=%b result=%b zero_flag=%b\n",a,b,Ainvert,Binvert,op,result,zero_flag);
#10;


//Inputs set to perform ADD Operation



$display("For ADD opeartion");
a=1'b0;
b=1'b0;
Ainvert=1'b0;
Binvert=1'b0;
cy_in=1'b0;
op=2'b10;
$monitor("a=%b b=%b Ainvert=%b Binvert=%b carry in=%b op=%b result=%b zero_flag=%b",a,b,Ainvert,Binvert,cy_in,op,result,zero_flag);
#10;
a=1'b0;
b=1'b1;
Ainvert=1'b0;
Binvert=1'b0;
cy_in=1'b0;
op=2'b10;
$monitor("a=%b b=%b Ainvert=%b Binvert=%b carry in=%b op=%b result=%b zero_flag=%b",a,b,Ainvert,Binvert,cy_in,op,result,zero_flag);
#10;
a=1'b1;
b=1'b0;
Ainvert=1'b0;
Binvert=1'b0;
cy_in=1'b0;
op=2'b10;
$monitor("a=%b b=%b Ainvert=%b Binvert=%b carry in=%b op=%b result=%b zero_flag=%b",a,b,Ainvert,Binvert,cy_in,op,result,zero_flag);
#10;
a=1'b1;
b=1'b1;
Ainvert=1'b0;
Binvert=1'b0;
cy_in=1'b0;
op=2'b10;
$monitor("a=%b b=%b Ainvert=%b Binvert=%b carry in=%b op=%b result=%b zero_flag=%b\n",a,b,Ainvert,Binvert,cy_in,op,result,zero_flag);
#10;



//Inputs set to perform SUB Operation



$display("For SUB opeartion");
a=1'b0;
b=1'b0;
Ainvert=1'b0;
Binvert=1'b1;
cy_in=1'b1;
op=2'b10;
$monitor("a=%b b=%b Ainvert=%b Binvert=%b carry in=%b op=%b result=%b zero_flag=%b",a,b,Ainvert,Binvert,cy_in,op,result,zero_flag);
#10;
a=1'b0;
b=1'b1;
Ainvert=1'b0;
Binvert=1'b1;
cy_in=1'b1;
op=2'b10;
$monitor("a=%b b=%b Ainvert=%b Binvert=%b carry in=%b op=%b result=%b zero_flag=%b",a,b,Ainvert,Binvert,cy_in,op,result,zero_flag);
#10;
a=1'b1;
b=1'b0;
Ainvert=1'b0;
Binvert=1'b1;
cy_in=1'b1;
op=2'b10;
$monitor("a=%b b=%b Ainvert=%b Binvert=%b carry in=%b op=%b result=%b zero_flag=%b",a,b,Ainvert,Binvert,cy_in,op,result,zero_flag);
#10;
a=1'b1;
b=1'b1;
Ainvert=1'b0;
Binvert=1'b1;
cy_in=1'b1;
op=2'b10;
$monitor("a=%b b=%b Ainvert=%b Binvert=%b carry in=%b op=%b result=%b zero_flag=%b\n",a,b,Ainvert,Binvert,cy_in,op,result,zero_flag);
#10;




//Inputs set to perform NAND Operation




$display("For NAND opeartion");
a=1'b0;
b=1'b0;
Ainvert=1'b1;
Binvert=1'b1;
op=2'b01;
$monitor("a=%b b=%b Ainvert=%b Binvert=%b op=%b result=%b zero_flag=%b",a,b,Ainvert,Binvert,op,result,zero_flag);
#10;
a=1'b0;
b=1'b1;
Ainvert=1'b1;
Binvert=1'b1;
op=2'b01;
$monitor("a=%b b=%b Ainvert=%b Binvert=%b op=%b result=%b zero_flag=%b",a,b,Ainvert,Binvert,op,result,zero_flag);
#10;
a=1'b1;
b=1'b0;
Ainvert=1'b1;
Binvert=1'b1;
op=2'b01;
$monitor("a=%b b=%b Ainvert=%b Binvert=%b op=%b result=%b zero_flag=%b",a,b,Ainvert,Binvert,op,result,zero_flag);
#10;
a=1'b1;
b=1'b1;
Ainvert=1'b1;
Binvert=1'b1;
op=2'b01;
$monitor("a=%b b=%b Ainvert=%b Binvert=%b op=%b result=%b zero_flag=%b\n",a,b,Ainvert,Binvert,op,result,zero_flag);
#10;





//Inputs set to perform NOR Operation






$display("For NOR operation");
a=1'b0;
b=1'b0;
Ainvert=1'b1;
Binvert=1'b1;
op=2'b00;
$monitor("a=%b b=%b Ainvert=%b Binvert=%b op=%b result=%b zero_flag=%b",a,b,Ainvert,Binvert,op,result,zero_flag);
#10;
a=1'b0;
b=1'b1;
Ainvert=1'b1;
Binvert=1'b1;
op=2'b00;
$monitor("a=%b b=%b Ainvert=%b Binvert=%b op=%b result=%b zero_flag=%b",a,b,Ainvert,Binvert,op,result,zero_flag);
#10;
a=1'b1;
b=1'b0;
Ainvert=1'b1;
Binvert=1'b1;
op=2'b00;
$monitor("a=%b b=%b Ainvert=%b Binvert=%b op=%b result=%b zero_flag=%b",a,b,Ainvert,Binvert,op,result,zero_flag);
#10;
a=1'b1;
b=1'b1;
Ainvert=1'b1;
Binvert=1'b1;
op=2'b00;
$monitor("a=%b b=%b Ainvert=%b Binvert=%b op=%b result=%b zero_flag=%b\n",a,b,Ainvert,Binvert,op,result,zero_flag);
#10;



//Inputs set to determine whether a>b 



$display("To get the result when a>b");
a=1'b0;
b=1'b0;
Ainvert=1'b1;
Binvert=1'b0;
cy_in=1'b1;
op=2'b11;
$monitor("a=%b b=%b Ainvert=%b Binvert=%b carry in=%b op=%b result=%b",a,b,Ainvert,Binvert,cy_in,op,result);
#10;
a=1'b0;
b=1'b1;
Ainvert=1'b1;
Binvert=1'b0;
cy_in=1'b1;
op=2'b11;
$monitor("a=%b b=%b Ainvert=%b Binvert=%b carry in=%b op=%b result=%b",a,b,Ainvert,Binvert,cy_in,op,result);
#10;
a=1'b1;
b=1'b0;
Ainvert=1'b1;
Binvert=1'b0;
cy_in=1'b1;
op=2'b11;
$monitor("a=%b b=%b Ainvert=%b Binvert=%b carry in=%b op=%b result=%b",a,b,Ainvert,Binvert,cy_in,op,result);
#10;
a=1'b1;
b=1'b1;
Ainvert=1'b1;
Binvert=1'b0;
cy_in=1'b1;
op=2'b11;
$monitor("a=%b b=%b Ainvert=%b Binvert=%b carry in=%b op=%b result=%b\n",a,b,Ainvert,Binvert,cy_in,op,result);
#10;
end

endmodule
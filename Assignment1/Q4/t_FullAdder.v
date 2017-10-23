//Samyak Jain
//16CO254
//Test bench for Half Adder
//14 Oct 2017

`timescale 1ns/1ps

module test;
wire sum,cy_out;
reg a,b,cy_in;

FA s(sum,cy_out,a,b,cy_in);      //Instance of module

initial begin              //to create gtkwave 
	$dumpfile("FullAdder.vcd");
	$dumpvars(0,test);
end

initial begin
	a=1'b0;
	b=1'b0;
	cy_in=1'b0;
#20;
	a=1'b0;
	b=1'b0;
	cy_in=1'b1;
#20;
	a=1'b0;
	b=1'b1;
	cy_in=1'b0;
#20;
	a=1'b0;
	b=1'b1;
	cy_in=1'b1;
#20;
	a=1'b1;
	b=1'b0;
	cy_in=1'b0;
#20;
	a=1'b1;
	b=1'b0;
	cy_in=1'b1;
#20;
	a=1'b1;
	b=1'b1;
	cy_in=1'b0;
#20;
	a=1'b1;
	b=1'b1;
	cy_in=1'b1;
#20;
end

initial begin
$monitor("Time=%0d a=%b b=%b cy_in=%b sum=%b carry=%b",$time,a,b,cy_in,sum,cy_out);  //display result when a and b are added
#160 $finish;
end

endmodule

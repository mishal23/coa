`timescale 1ns/1ps

module test;
wire sum,cy_out;
reg a,b;

HA s(sum,cy_out,a,b);

initial begin              //to create gtkwave 
$dumpfile("HalfAdder.vcd");
$dumpvars(0,test);
end

initial begin
	a=1'b0;
	b=1'b0;
#20;
	a=1'b0;
	b=1'b1;
#20;
	a=1'b1;
	b=1'b0;
#20;
	a=1'b1;
	b=1'b1;
#20;
end

initial begin
	$monitor("Time=%0d a=%b b=%b sum=%b carry=%b",$time,a,b,sum,cy_out);
#80 $finish;
end

endmodule

//Samyak Jain
//16CO254
//Testbench for 16X4 encoder
//14 Oct 2017

`timescale 1ns/1ps

module test;
wire [3:0]a;
reg [15:0]d;
reg E;

encoder ef(a,d,E);
integer i;
initial begin              //to create gtkwave 
	$dumpfile("Encoder.vcd");
	$dumpvars(0,test);
end

initial begin
	E=1'b1;
for(i=0;i<=15;i++)    //loop to generate desired input
 	begin
 		d=0;
	 	d[i]=1;
 	#20;
 	end
end

initial begin              //displaying desired values
	$monitor("input=%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b output=%b%b%b%b",d[15],d[14],d[13],d[12],d[11],d[10],d[9],d[8],d[7],d[6],d[5],d[4],d[3],d[2],d[1],d[0],a[3],a[2],a[1],a[0]);

#300 $finish;        //after every 20 ns input changes and there are 15 combination of input so after 300 ns program terminates
end
endmodule

//Samyak Jain
//16CO254
//4x16 Decoder testbench
//14 Oct 2017

`timescale 1ns/1ps

module test;
wire [15:0]D;
reg [3:0]a;
reg E;

decoder d(D,a,E);   //instance of the decoder module

initial begin              //to create gtkwave 
	$dumpfile("Decoder.vcd");
	$dumpvars(0,test);
end

initial begin
	E=1'b1;                 //initially E=0 so output is 0 after that it is set to 1 and after every 20 ns the input changes
	for(a=0;a<=15;a++)
	#20;
end

initial begin              //displaying desired values
	$monitor("input=%b%b%b%b output=%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b",a[3],a[2],a[1],a[0],D[15],D[14],D[13],D[12],D[11],D[10],D[9],D[8],D[7],D[6],D[5],D[4],D[3],D[2],D[1],D[0]);

	#300 $finish;        //after every 20 ns input changes and there are 15 combination of input so after 300 ns program terminates
end
endmodule

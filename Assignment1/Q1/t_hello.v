//Samyak Jain
//16CO254
//Hello world program testbench in verilog
//14 Oct 2017


`timescale 1ns/1ps

module test;
reg  clk;
hello f(clk);   //instance of hello module

initial begin   //marks beginning of 0th clock cycle
	clk=1'b1;
	repeat (99)     //terminates after 100 clock cycles
		#1 clk=~clk;
end

endmodule

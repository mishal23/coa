//Mishal Shah
//16CO125
//Test bench for d flipflop

`timescale 1ns/1ps
module test;
wire Q,Qn;
reg D,C;

dflipflop out(Q, Qn, C, D);
initial begin
		$dumpfile("dflipflop.vcd");    //gtkwave production
		$dumpvars(0, test);
		C=0;                  //clk set
		forever #1 C=~C;
	end
	initial begin                                //value of d set at regular interval and displayed
			D=0;
			$monitor("clock=%b, d=%b, q=%b",C,D,Q);
		#8;
			D=1;
			$monitor("clock=%b, d=%b, q=%b",C,D,Q);
		#8;
			D=0;
			$monitor("clock=%b, d=%b, q=%b",C,D,Q);
		#8;
			D=1;
			$monitor("clock=%b, d=%b, q=%b",C,D,Q);
                
	end
	initial #30 $finish;
endmodule

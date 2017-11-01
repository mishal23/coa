//Samyak Jain
//16CO254
//Hello world program in verilog
//14 Oct 2017

module hello(input clk);  //input is clock signal

always @ (clk)            //it denotes level triggering whenever clk is 1 msg is printed on screen
begin
	$monitor("%0d Hello world\n",$time);       //print msg and its timestamp
end
endmodule

/*
	Name: Mishal Shah - 16CO125,
		  Samyak Jain - 16CO254
	29th October
*/
`include "regfile.v"

module testbench;

  wire[31:0] ReadData1;	
  wire[31:0] ReadData2;	
  wire[31:0] WriteData;	
  wire[4:0]	ReadRegister1;	
  wire[4:0]	ReadRegister2;	
  wire[4:0]	WriteRegister;  
  wire RegWrite;	
  wire clock;		

  reg begintest;

	// DUT = Device Under Test
  regfile DUT
  (
    .ReadData1(ReadData1),
    .ReadData2(ReadData2),
    .WriteData(WriteData),
    .ReadRegister1(ReadRegister1),
    .ReadRegister2(ReadRegister2),
    .WriteRegister(WriteRegister),
    .RegWrite(RegWrite),
    .clock(clock)
  );

  testbench_register tester
  (
    .begintest(begintest),
    .endtest(endtest), 
    .ReadData1(ReadData1),
    .ReadData2(ReadData2),
    .WriteData(WriteData), 
    .ReadRegister1(ReadRegister1), 
    .ReadRegister2(ReadRegister2),
    .WriteRegister(WriteRegister),
    .RegWrite(RegWrite), 
    .clock(clock)
  );

  initial begin
    begintest=0;
    #10;
    begintest=1;
    #100;
  end
endmodule

module testbench_register
(
input begintest,
output reg endtest,

input[31:0]		ReadData1,
input[31:0]		ReadData2,
output reg[31:0]	WriteData,
output reg[4:0]		ReadRegister1,
output reg[4:0]		ReadRegister2,
output reg[4:0]		WriteRegister,
output reg		RegWrite,
output reg		clock
);

  initial
     begin
        $dumpfile("reg.vcd");
        $dumpvars(0,testbench_register);
	end
 
 // Initializing the register signals
 initial begin
    WriteData=32'd0;
    ReadRegister1=5'd0;
    ReadRegister2=5'd0;
    WriteRegister=5'd0;
    RegWrite=0;
    clock=0;
  end

  always @(posedge begintest) begin
    endtest = 0;
    #10
		//Test1: Write R2<=38
		  WriteRegister = 5'd2;
		  WriteData = 32'd38;
		  RegWrite = 1;
		  ReadRegister1 = 5'd2;
		  ReadRegister2 = 5'd2;
		  #5 clock=1; #5 clock=0;
			$display("Writing 38 to register2");
			$display("WriteRegister=%d , WriteData=%-3d , RegWrite=%b, ReadRegister1=%d, ReadRegister2=%-3d, ReadData1=%-3d ReadData2=%-3d\n",WriteRegister,WriteData,RegWrite,ReadRegister1,ReadRegister2,ReadData1,ReadData2);
		
		//Test2: Write R2<=15
		  WriteRegister = 5'd2;
		  WriteData = 32'd15;
		  RegWrite = 1;
		  ReadRegister1 = 5'd2;
		  ReadRegister2 = 5'd2;
		  #5 clock=1; #5 clock=0;
			$display("Writing 15 to register2");
			$display("WriteRegister=%d , WriteData=%-3d , RegWrite=%b, ReadRegister1=%d, ReadRegister2=%d, ReadData1=%-3d ReadData2=%-3d\n",WriteRegister,WriteData,RegWrite,ReadRegister1,ReadRegister2,ReadData1,ReadData2);
  
		//Test3: Write R3<=16, but RegWrite=0, so should not be written
		  WriteRegister = 5'd3;
		  WriteData = 32'd16;
		  RegWrite = 0;
		  ReadRegister1 = 5'd3;
		  ReadRegister2 = 5'd3;
		  #5 clock=1; #5 clock=0;
			$display("As RegWrite=0, no data should be written");
			$display("WriteRegister=%d , WriteData=%-3d , RegWrite=%b, ReadRegister1=%d, ReadRegister2=%d, ReadData1=%-2d ReadData2=%-3d\n",WriteRegister,WriteData,RegWrite,ReadRegister1,ReadRegister2,ReadData1,ReadData2);
		  
		//Test4: Write R4<=987
		  WriteRegister = 5'd4;
		  WriteData = 32'd987;
		  RegWrite = 1;
		  ReadRegister1 = 5'd8;
		  ReadRegister2 = 5'd31;
		  #5 clock=1; #5 clock=0;
			$display("Writing 987 to register4, ReadData from register8 and register31");
			$display("WriteRegister=%d , WriteData=%-3d , RegWrite=%b, ReadRegister1=%d, ReadRegister2=%d, ReadData1=%-3d ReadData2=%-3d\n",WriteRegister,WriteData,RegWrite,ReadRegister1,ReadRegister2,ReadData1,ReadData2);
		  
  
		//Test5: Try to write R0<=456 (Should not be written)
		  WriteRegister = 5'd0;
		  WriteData = 32'd456;
		  RegWrite = 1;
		  ReadRegister1 = 5'd0;
		  ReadRegister2 = 5'd0;
		  #5 clock=1; #5 clock=0;
			$display("Write 456 to Register0, should not be written");
			$display("WriteRegister=%d , WriteData=%-3d , RegWrite=%b, ReadRegister1=%d, ReadRegister2=%d, ReadData1=%-3d ReadData2=%-3d\n",WriteRegister,WriteData,RegWrite,ReadRegister1,ReadRegister2,ReadData1,ReadData2);
		 
		 //Test6: Write R17<=810 & R2<=323
		  WriteRegister = 5'd17;
		  WriteData = 32'd810;
		  RegWrite = 1;
		  #5 clock=1; #5 clock=0;
				
		  WriteRegister = 5'd2;
		  WriteData = 32'd323;
		  RegWrite = 1;
		  ReadRegister1 = 5'd17;
	      ReadRegister2 = 5'd2;
		  #5 clock=1; #5 clock=0;
			$display("Write 810 to Register17 and 323 to Register2");
			$display("WriteRegister=%d , WriteData=%-3d , RegWrite=%b, ReadRegister1=%d, ReadRegister2=%d, ReadData1=%-3d ReadData2=%-3d\n",WriteRegister,WriteData,RegWrite,ReadRegister1,ReadRegister2,ReadData1,ReadData2);
   
   #5
		endtest = 1;

end
endmodule
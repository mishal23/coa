/*
	Name: Mishal Shah - 16CO125,
		  Samyak Jain - 16CO254
	28th October
*/
/*
	Register File
	width: 32 bits
	depth: 32 words (Reg[0] has value 0)
	2 asynchronous read ports
	1 synchronous, +ve edge triggered write port
*/
`include "decoders.v"
`include "register.v"

module regfile(output[31:0] ReadData1, 	// 1st Register Read
			   output[31:0] ReadData2,	// 2nd Register Read
			   input[31:0] WriteData,	// Data to write to register
			   input[4:0] ReadRegister1,// Address to read 1st Register
			   input[4:0] ReadRegister2,// Address to read 2nd Register
               input[4:0] WriteRegister,//Address of register to write
			   input RegWrite,			// Enable to write to register
			   input clock);
			   
	wire[31:0] DecoderOut;
	wire[31:0] RegOut[31:0];
	
	// Decoder for write enable
	decoder decoder1_32(DecoderOut,RegWrite,WriteRegister);
	register32zero register32_0(RegOut[0],WriteData,DecoderOut[0],clock);
	
	// Registers
	generate
		genvar i;
		for(i=1;i<32;i=i+1)
		begin
				register32 register_32(RegOut[i],WriteData,DecoderOut[i],clock);
		end
	endgenerate
	
	mux32to1by32 mux1(ReadData1,ReadRegister1,RegOut[0],RegOut[1],RegOut[2],RegOut[3],
											 RegOut[4],RegOut[5],RegOut[6],RegOut[7],
											 RegOut[8],RegOut[9],RegOut[10],RegOut[11],
											 RegOut[12],RegOut[13],RegOut[14],RegOut[15],
											 RegOut[16],RegOut[17],RegOut[18],RegOut[19],
											 RegOut[20],RegOut[21],RegOut[22],RegOut[23],
											 RegOut[24],RegOut[25],RegOut[26],RegOut[27],
											 RegOut[28],RegOut[29],RegOut[30],RegOut[31]);
											 
	mux32to1by32 mux2(ReadData2,ReadRegister2,RegOut[0],RegOut[1],RegOut[2],RegOut[3],
											 RegOut[4],RegOut[5],RegOut[6],RegOut[7],
											 RegOut[8],RegOut[9],RegOut[10],RegOut[11],
											 RegOut[12],RegOut[13],RegOut[14],RegOut[15],
											 RegOut[16],RegOut[17],RegOut[18],RegOut[19],
											 RegOut[20],RegOut[21],RegOut[22],RegOut[23],
											 RegOut[24],RegOut[25],RegOut[26],RegOut[27],
											 RegOut[28],RegOut[29],RegOut[30],RegOut[31]);
											 
endmodule
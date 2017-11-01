/*
	Name: Mishal Shah - 16CO125,
		  Samyak Jain - 16CO254
	28th October
*/
// 32 bit decoder with enable
module decoder(output[31:0] out,input enable,input[4:0] address);
	assign out= enable<<address;
endmodule
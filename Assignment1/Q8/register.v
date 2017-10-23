//Mishal Shah
//16CO125
//32 Bit register
//16 Oct 2017

module srLatch(r,s,reset,q,q1);
	input r,s,reset;
	output q,q1; 
	reg q,q1;
	initial
	begin
		q=1'b0;
		q1=1'b1;
	end
	always @(reset, s, r)
	  begin
	  case({reset, s, r})
	     {1'b1, 1'b1, 1'b0}: begin q=1'b0; q1=1'b1; end
		 {1'b0, 1'b0, 1'b0}: begin q=q; q1=q1; end
		 {1'b0, 1'b0, 1'b1}: begin q=1'b0; q1=1'b1; end
		 {1'b0, 1'b1, 1'b0}: begin q=1'b1; q1=1'b0; end
		 {1'b0, 1'b1, 1'b1}: begin q=1'bx; q=1'bx; end
	endcase
	end
endmodule

module dLatch(d,clk,reset,q,q1);
    input d,clk,reset;
    output q,q1;
    reg r,s;
    always @(clk,d,reset)
    begin
       r = ~d & clk;
       s = d & clk;
    end
    srLatch srl(r,s,reset,q,q1);
endmodule


module dFlipFlop(d,clk,reset,q,q1);
    input d,clk,reset;
    output q,q1;
    wire qm,qm1;
    dLatch dl1(d,~clk,reset,qm,qm1);
    dLatch dl2(qm,clk,reset,q,q1);
endmodule


module register(d,clk,reset,q,q1);
    input [31:0]d;
    input clk,reset;
    output [31:0]q,q1;
    genvar i;
    generate
    for (i=0;i<32;i=i+1) 
           begin
               dFlipFlop dff(d[i],clk,reset,q[i],q1[i]); 
           end
    endgenerate
    
endmodule
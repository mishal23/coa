//Samyak Jain
//16CO254
//n-bit Adder Subtractor
//15 Oct 2017

module N_bit_adder(input1,input2,cy_in,answer,carry_out,overflow);
   parameter n=32;               //n declared as 32 bit quantity and can be configrable
   input [n-1:0] input1,input2;  //2 inputs declared
   output [n-1:0] answer;        //answer corresponding to both add and subtract operation
   output  carry_out;            //To get the final carry from last full adder
   output overflow;              //to get if overflow is present
   wire [n-1:0] carry;           //all internal carry
   wire [n-1:0] input3;          //input generated after 2's complement of input2 is taken for subtraction.
   input cy_in;
   
   
   genvar i;
   
    for(i=0;i<n;i=i+1)
       xor(input3[i],input2[i],cy_in);   //if cy_in==1 then input3 is 2's complement of input2 else it remains as input 2
 
   generate 
    for(i=0;i<n;i=i+1)
       begin
       if(i==0) 
       FA f(carry[0],answer[0],input1[0],input3[0],cy_in);       //making instances of full adder circuit again and again
       else
       FA f(carry[i],answer[i],input1[i],input3[i],carry[i-1]);
       end
    assign carry_out = carry[n-1];
    assign overflow=carry[n-1] ^ carry[n-2];
   endgenerate
endmodule 

module FA(cy_out,sum,a,b,cy_in);
output sum,cy_out;
input a,b,cy_in;
wire t1,t2,t3;
HA G1(t1,t2,a,b);       //call the module halfadder
HA G2(sum,t3,t1,cy_in);  //again call the module halfadder
or (cy_out,t3,t2);
endmodule

module HA(sum,cy_out,a,b);
output sum,cy_out;
input a,b;

xor (sum,a,b);         //sum=a xor b, carry=a and b
and (cy_out,a,b);

endmodule
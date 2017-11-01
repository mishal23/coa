//Samyak Jain
//16CO254
//Half Adder
//14 Oct 2017
module HA(sum,cy_out,a,b);
output sum,cy_out;
input a,b;

xor (sum,a,b);    //sum= a xor b
and (cy_out,a,b);  //carry=a and b

endmodule
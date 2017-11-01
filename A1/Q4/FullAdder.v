//Samyak Jain
//16CO254
//Full Adder using Half Adders
//14 Oct 2017

module FA(sum,cy_out,a,b,cy_in);
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
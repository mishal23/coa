/*
Samyak Jain & Mishal Shah
16CO254 & 16CO125
29/10/2017
1 bit ALU 
*/
module ALU_1_bit(result,zero_flag,a,b,Ainvert,Binvert,op,cy_in);

  output result,zero_flag;                         //Output declared as result and zero flag

  input a,b,Ainvert,Binvert,cy_in;                 //Input is a,b,Ainvert,Binvert,cy_in

  input [1:0]op;                                    //operation mux select lines

  wire _a,_b,_and,_or,_sum,_carry,less,t,less1;     //wires used in connection   

  FA f4(less1,t,a,b,1'b1);                          //Full Adder module called to subtract a and b 
  or(zero_flag,less1,1'b0);                         //zero-flag is set

  mux2 f1(Ainvert,a,~a,_a);                         //Now mux1 is called to select a or a'
  mux2 f2(Binvert,b,~b,_b);                         //mux2 is called to select b or b'

  and (_and,_a,_b);                                 //and operation done and wire _and sent to 00 of operation mux
  or (_or,_a,_b);                                   //or operation done and wire _or sent to 01 of operation mux

  FA f3(_sum,_carry,_a,_b,cy_in);                   //add/sub operation done and wire _sum sent to 10 of operation mux
  FA f6(less,t,_a,_b,1'b1);                         //slt operation done and wire less sent to 11 of operation mux

  mux4 f5(op,_and,_or,_sum,less,result);             //Operation mux is called

endmodule


module mux2(input select,a1,a2,output o);        //2x1 mux made with nand gates
  
  wire t1,t2;
  
  nand(t1,a1,~select);
  
  nand(t2,a2,select);
  
  nand(o,t1,t2);

endmodule


module mux4(select,a1,a2,a3,a4,o);              //4x1 mux made with nand gates
  
  input [1:0]select;

  input a1,a2,a3,a4;

  output o;

  wire t1,t2,t3,t4;

  nand(t1,a1,~select[1],~select[0]);

  nand(t2,a2,~select[1],select[0]);

  nand(t3,a3,select[1],~select[0]);

  nand(t4,a4,select[1],select[0]);

  nand(o,t1,t2,t3,t4);

endmodule


module FA(sum,cy_out,a,b,cy_in);             //Full adder module
  
  output sum,cy_out;
  
  input a,b,cy_in;
  
  wire t1,t2,t3;
  
  HA G1(t1,t2,a,b);                           //call the module halfadder
  
  HA G2(sum,t3,t1,cy_in);                     //again call the module halfadder
  
  or (cy_out,t3,t2);

endmodule


module HA(sum,cy_out,a,b);                 //Half Adder module

  output sum,cy_out;
  
  input a,b;
  
  xor (sum,a,b);                            //sum=a xor b, carry=a and b
  
  and (cy_out,a,b);

endmodule
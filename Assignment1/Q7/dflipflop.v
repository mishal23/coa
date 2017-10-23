//Mishal Shah
//16CO125
// Edge Triggered DFlipFlop
//16 Oct 2017

module dflipflop(Q,Qn,C,D);
   output Q,Qn;
   input C,D;
  
   wire Cn;   // Control input to the D latch.
   wire Cnn;  // Control input to the SR latch.
   // Output from the D latch, input to the gated SR latch.
   wire DQ;   
   wire DQn;  
   
   not(Cn,C);
   not(Cnn,Cn);   
   d_latch dl(DQ,DQn,Cn,D);
   sr_latch_gated sr(Q,Qn,Cnn,DQ,DQn);   
endmodule 

// D-Latch
module d_latch(Q,Qn,G,D);
   output Q,Qn;
   input G,D;   
   
   wire Dn,D1,Dn1; 
   
   not(Dn,D);   
   and(D1,G, D);
   and(Dn1,G, Dn);   
   nor(Qn,D1,Q);
   nor(Q,Dn1,Qn);
endmodule

// SR-Latch
module sr_latch_gated(Q,Qn,G,S,R);
   output Q,Qn;
   input G,S,R;   
   
   wire S1,R1;
   
   and(S1,G,S);
   and(R1,G,R);   
   nor(Qn,S1,Q);
   nor(Q,R1,Qn);
endmodule
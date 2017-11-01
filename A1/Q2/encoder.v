//Samyak Jain
//16CO254
//16X4 Encoder
//14 Oct 2017

module encoder(a,d,E);
output [3:0]a;
input [15:0]d;
input E;
wire t1,t2,t3,t4;
  or(t1,d[8],d[9],d[10],d[11],d[12],d[13],d[14],d[15]),
    (t2,d[4],d[5],d[6],d[7],d[12],d[13],d[14],d[15]),
    (t3,d[2],d[3],d[6],d[7],d[10],d[11],d[14],d[15]),
    (t4,d[1],d[3],d[5],d[7],d[9],d[11],d[13],d[15]);
 and(a[3],t1,E),
    (a[2],t2,E),
    (a[1],t3,E),
    (a[0],t4,E);
    
endmodule
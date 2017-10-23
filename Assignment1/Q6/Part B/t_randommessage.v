//Mishal Shah
//16CO125
//Test bench for random msg generattion
//16 Oct 2017
    module t_q6b;
    reg clock=0;
    wire[3:0] message1_out;
    wire[3:0][3:0]  message2_out;
    
    A m1(message1_out,message2_out,clock);          //instance of modules
    B m2(message2_out,message1_out,clock);
    
    always begin                        //set up clock
        #5 clock = ~clock;
    end
    initial begin
        $dumpfile("randommessage.vcd");   //gtkwave generation
        $dumpvars(0,t_q6b); 
        #500 $finish;
    end
endmodule
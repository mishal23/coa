//Mishal Shah
//16CO125
//Test bench for msg signal
//16 Oct 2017

    module t_q6a;
    reg clock=0;
    wire[3:0] message1_out;    //msg sent by A and recieved by B
    wire[3:0]  message2_out;   //msg sent by B and recieved by A
    
    A m1(message1_out,message2_out,clock);  //instance of both the modules
    B m2(message2_out,message1_out,~clock);
    initial begin
    $dumpfile("message.vcd"); //generate gtkwave
    $dumpvars(0,t_q6a);
    always begin               //set the clock
        #5 clock = ~clock;
    end
    always begin
        #100 $finish;
    end
endmodule
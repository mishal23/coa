//Mishal Shah
//16CO125
//Basic interconection network
//16 Oct 2017

module A(output reg[3:0] message_out,input [3:0] message_in,input clk);
    reg[1:0] cycles = 0;                       //Cycle is set 
    parameter period = 2;                     //period is defined as constant parameter
    always@(posedge clk) begin
        cycles = cycles + 1;
        if(message_in!==4'bzzzz) begin
            $display("Time:%-16d\nA recieved %b\n",$time,message_in);       //msg recieved is displayed
        end
        if(cycles == period) begin
            cycles = 0;                             //cycle set for next msg
            message_out <= {$random}%16;            //random msg generated
        end
    end
endmodule

module B(output reg[3:0] message_out,input[3:0] message_in,input clk);
    reg[1:0] cycles;
    parameter period = 2;
    initial begin
        cycles = 1;                    //cycle set
    end
    always@(posedge clk) begin
        cycles = cycles + 1;
        if(message_in!==4'bzzzz ) begin
            $display("Time:%-16d\nB recieved %b\n",$time,message_in);  //display recieved msg
        end
        if(cycles == period) begin
            cycles = 0;                                               //cycle set
            message_out <= {$random}%16;                              //random msg generated
        end
    end
endmodule
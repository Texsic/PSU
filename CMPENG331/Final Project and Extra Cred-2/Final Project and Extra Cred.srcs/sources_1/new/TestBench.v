`timescale 1ns / 1ps

module TestBench;
    reg clk;
    wire [31:0] wbData;
    
    Datapath uut (
        .clk(clk), 
        .wbData(wbData)
    );

    initial begin
        clk = 0;
    end

    always begin
        #5 clk = ~clk;
    end
   
endmodule
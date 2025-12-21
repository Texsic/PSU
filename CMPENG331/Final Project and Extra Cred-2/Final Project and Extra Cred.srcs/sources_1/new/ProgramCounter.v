`timescale 1ns / 1ps



module ProgramCounter(
    input clk,            
    input [31:0] nextPc, 
    
    input wpcir,
    
    output reg [31:0] pc 
    
);

initial
    begin
        pc = 32'd0;     
    end

always @(posedge clk)
    begin
      if (wpcir == 1)
        pc = nextPc;      
    end

endmodule
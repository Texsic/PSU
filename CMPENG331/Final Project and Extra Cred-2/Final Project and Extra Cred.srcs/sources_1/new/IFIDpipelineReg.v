`timescale 1ns / 1ps

module IFIDpipelineReg(
    input clk,
    input [31:0] instOut,
    input [31:0] pc4,
    input wpcir,
    output reg [31:0] dinstOut,
    output reg [31:0] dpc4
    );
    
    always @ (posedge clk) 
        begin
         if (wpcir == 1) begin 
            dinstOut <= instOut;
            dpc4 <= pc4;
         end 
        end
        
endmodule
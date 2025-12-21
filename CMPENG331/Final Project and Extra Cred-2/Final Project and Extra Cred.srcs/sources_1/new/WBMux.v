`timescale 1ns / 1ps



module WbMux(
    input [31:0] walu,
    input [31:0] wdo,
    input wm2reg,
    output reg [31:0] wbData
    );
    
    always @ (*)
        begin
            if (wm2reg == 0)
                wbData = walu;
            else
                wbData = wdo;
        end
endmodule


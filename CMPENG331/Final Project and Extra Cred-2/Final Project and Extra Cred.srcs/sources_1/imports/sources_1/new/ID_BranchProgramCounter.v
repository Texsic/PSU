`timescale 1ns / 1ps


module ID_BranchProgramCounter(
    input [31:0] dpc4,
    input [31:0] immOut,
    output reg [31:0] bpc
    );
    
    always @ (*)
        begin
            bpc <= dpc4 + immOut;
        end
        
endmodule

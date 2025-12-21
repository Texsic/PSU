`timescale 1ns / 1ps



module IF_ProgramCounterMux(
    input [1:0] pcsrc,
    input [31:0] pc4,
    input [31:0] bpc,
    input [31:0] njpc,
    input [31:0] da,
    output reg [31:0] nextPc
    );
    
    always @ (*)
        begin
            case(pcsrc)
                2'b00: nextPc = pc4;
                2'b01: nextPc = bpc;
                2'b10: nextPc = da;
                2'b11: nextPc = njpc; 
            endcase
         end
endmodule

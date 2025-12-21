`timescale 1ns / 1ps



module EXE_ALUoutMux(
    input [31:0] epc8,
    input [31:0] r,
    input ejal,
    output reg [31:0] ealu
    );
    
    always @ (*)
        begin
            case(ejal)
                1'b0: ealu = r;
                1'b1: ealu = epc8;
            endcase  
        end
endmodule

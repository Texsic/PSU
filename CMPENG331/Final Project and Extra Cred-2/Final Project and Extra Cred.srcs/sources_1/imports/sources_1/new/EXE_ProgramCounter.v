`timescale 1ns / 1ps



module EXE_ProgramCounter(
    input [31:0] epc4,
    output reg [31:0] epc8
    );
    
    always @ (*)
        begin
            epc8 <= epc4 + 32'b00000000000000000000000000000100;
        end
endmodule

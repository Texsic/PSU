`timescale 1ns / 1ps

module ID_immLS(
    input [15:0] imm,
    output reg [31:0] immOut
    );
    
    always @ (*)
        begin
            immOut = {{16{imm[15]}}, imm} << 2;
        end
endmodule
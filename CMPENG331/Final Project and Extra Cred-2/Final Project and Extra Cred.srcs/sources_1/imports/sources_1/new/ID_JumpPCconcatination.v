`timescale 1ns / 1ps



module ID_JumpPCconcatination(
    input [25:0] jpc,
    input [31:0] dpc4,
    output reg [31:0] njpc
    );
    
    always @ (*)
        begin
            njpc <= {{dpc4[31:26]}, jpc};
        end
endmodule

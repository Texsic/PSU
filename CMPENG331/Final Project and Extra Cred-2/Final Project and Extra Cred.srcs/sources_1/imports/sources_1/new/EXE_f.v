`timescale 1ns / 1ps



module EXE_f(
    input [4:0]  ern0,
    input ejal,
    output reg [4:0] ern
    );
    
        always @ (*)
            begin
                case(ejal)
                    1'b0: ern = ern0;
                    1'b1: ern = 5'b11111;
                endcase
            end
    
    
endmodule

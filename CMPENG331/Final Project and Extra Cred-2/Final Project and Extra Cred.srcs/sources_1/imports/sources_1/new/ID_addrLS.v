`timescale 1ns / 1ps



module ID_addrLS(
    input [25:0] addr,
    output reg [25:0] jpc
    );
    always @ (*)
        begin
            jpc = addr << 2;
        end
endmodule

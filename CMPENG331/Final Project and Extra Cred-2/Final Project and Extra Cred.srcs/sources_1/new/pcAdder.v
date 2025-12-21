`timescale 1ns / 1ps



module pcAdder( 
    input [31:0] pc, 
    output reg [31:0] pc4 
);

    always @(*) begin 
        pc4 <= pc + 32'b00000000000000000000000000000100; 
    end 

endmodule

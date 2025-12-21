`timescale 1ns / 1ps



module ID_rsrtequCheck(
    input [31:0] da,
    input [31:0] db,
    output reg rsrtequ
    );
    
    always @ (*)
        begin
            if (da == db)
                rsrtequ <= 1;
            else
                rsrtequ <= 0;
        end
endmodule

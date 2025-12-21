`timescale 1ns / 1ps



module RegisterFile(
    // Inputs
    input [4:0] rs,     // Input for the source register (rs)
    input [4:0] rt,     // Input for the target register (rt)
    
    //Lab 5 Inputs
    input [4:0] wrn,
    input [31:0] wbData,
    input wwreg,
    input clk, clrn,

    // Outputs
    output reg [31:0] qa,  // Output for the value stored in the source register
    output reg [31:0] qb   // Output for the value stored in the target register
    
);


reg [31:0] register [0:31]; // 32x32 array for registers (register file)

// Initialize all registers to 0
integer r;
initial begin
    for (r = 0; r <= 31; r = r + 1) begin
        register[r] = 0;  // Initialize each register to 0.
    end
end

always @ (*) // Always block to update qa and qb based on the input rs and rt values.
begin
    qa = register[rs];  // Output qa is the value stored in the source register (rs).
    qb = register[rt];  // Output qb is the value stored in the target register (rt).
end

always @ (negedge clk)
    begin
        if (wwreg == 1)
            register[wrn] = wbData;
    end

endmodule


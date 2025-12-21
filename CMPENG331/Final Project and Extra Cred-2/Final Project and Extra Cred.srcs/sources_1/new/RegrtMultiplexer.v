`timescale 1ns / 1ps



module RegrtMultiplexer(
    // Inputs
    input [4:0] rt,     // Input register value rt
    input [4:0] rd,     // Input register value rd
    input regrt,        // Control signal to select the output (0 for rd, 1 for rt)

    // Output
    output reg [4:0] drn  // Output register value (selected based on the control signal)
);

always @(*)
begin
    if (regrt == 0)
        drn = rd;    // If regrt is 0, select rd as the output.
    else
        drn = rt;    // If regrt is 1, select rt as the output.
end

endmodule


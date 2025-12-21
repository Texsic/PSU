/*
 * CMPEN 331 - Lab 4 Test Bench
 */

`timescale 1ns/1ps

module testbench;

    //Stimulus Signals 
    reg clk;
    reg rst;

    
    wire wb_wreg;
    wire wb_m2reg;
    wire [31:0] wb_mo;
    wire [31:0] wb_alu;
    wire [4:0] wb_rn;

    wire mem_wreg;
    wire mem_m2reg;
    wire mem_wmem;
    wire [31:0] mem_alu;
    wire [31:0] mem_r2;
    wire [4:0] mem_rn;

    cpu_pipeline UUT (
        .clk(clk),
        .rst(rst),
        
        .wb_wreg(wb_wreg),
        .wb_m2reg(wb_m2reg),
        .wb_mo(wb_mo),
        .wb_alu(wb_alu),
        .wb_rn(wb_rn),
        
        //EX/MEM Outputs
        .mem_wreg(mem_wreg),
        .mem_m2reg(mem_m2reg),
        .mem_wmem(mem_wmem),
        .mem_alu(mem_alu),
        .mem_r2(mem_r2),
        .mem_rn(mem_rn)
    );

    initial begin
        clk = 0;
    end
    always #5 clk = ~clk;

    initial begin
        rst = 1'b1;
        
        #15;
        
        rst = 1'b0;


        #100;

        $finish;
    end

    initial begin
        $display("Time | PC | EX/MEM: ALU Out | MEM/WB: Mem Out (wb_mo) | WB Dest Reg");
        $display("-----------------------------------------------------------------------");
        
        $monitor("Time=%0t | PC=%h | MEM_ALU=%h | WB_MO=%h | WB_RN=%d",
                 $time, 
                 UUT.U_PC.current_pc, 
                 mem_alu, 
                 wb_mo, 
                 wb_rn);
    end


endmodule
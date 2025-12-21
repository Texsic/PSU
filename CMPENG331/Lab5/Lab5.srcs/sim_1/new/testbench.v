

`timescale 1ns/1ps

module testbench;

    reg clk;
    reg rst;

    //Monitored ignals
    //rom MEM/WB Register
    wire wb_wreg;      
    wire wb_m2reg;     
    wire [31:0] wb_mo; // Memory Output
    wire [31:0] wb_alu;// ALU Output
    wire [4:0] wb_rn;  // Des Register

    wire [4:0] rf_wn;  
    wire [31:0] rf_wd;
    wire rf_we;        

    wire [31:0] rf_qa;
    wire [31:0] rf_qb;

    //-UUT
    cpu_pipeline UUT (
        .clk(clk),
        .rst(rst),
        
        .wb_wreg(wb_wreg),
        .wb_m2reg(wb_m2reg),
        .wb_mo(wb_mo),
        .wb_alu(wb_alu),
        .wb_rn(wb_rn),
        
        .rf_wn(rf_wn),
        .rf_wd(rf_wd),
        .rf_we(rf_we),
        .rf_qa(rf_qa),
        .rf_qb(rf_qb)
    );

    initial begin
        clk = 0;
    end
    always #5 clk = ~clk;

    initial begin
        rst = 1'b1;
        #15;
        rst = 1'b0;
        
        #150; 
        
        $finish;
    end

    //onitor 
    initial begin
        $display("Time | PC | WB_MO (Load Result) | WB_ALU (Add Result) | WB_RN | RF_QA | RF_QB");
        $display("-----------------------------------------------------------------------------------");
        
        $monitor("Time=%0t | PC=%h | WB_MO=%h | WB_ALU=%h | RN=%d | QA=%h | QB=%h",
                 $time, 
                 UUT.U_PC.current_pc, 
                 wb_mo, 
                 wb_alu, 
                 wb_rn,
                 rf_qa,
                 rf_qb);
    end

endmodule
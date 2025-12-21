/*
 * CMPEN 331 - Lab 4
 verilog Design Code for IF, ID, EXE, and MEM Stages

 */


// Top-Level Module: cpu_pipeline
module cpu_pipeline (
    input clk,
    input rst,


    
    //ignals written into MEM/WB (Output of MEM stage)
    output wb_wreg,      // RegWrite
    output wb_m2reg,     // MemToReg
    output [31:0] wb_mo, // Memory Output Data
    output [31:0] wb_alu,// ALU Result (bypass from MEM)
    output [4:0] wb_rn,  // Destination Register Number

    // Signals output from EX/MEM (Input to MEM stage)
    output mem_wreg,
    output mem_m2reg,
    output mem_wmem,
    output [31:0] mem_alu,
    output [31:0] mem_r2,
    output [4:0] mem_rn
);

    //Wires & Interconnects

    // IF Stage
    wire [31:0] pc_current;
    wire [31:0] pc_next;
    wire [31:0] inst_if;

    // IF/ID Register
    wire [31:0] id_inst;
    wire [31:0] id_pc4;

    //ID
    wire [5:0] id_op;
    wire [4:0] id_rs;
    wire [4:0] id_rt;
    wire [4:0] id_rd;
    wire [15:0] id_imm16;
    
    wire ctrl_wreg, ctrl_m2reg, ctrl_wmem, ctrl_aluimm, ctrl_regrt;
    wire [3:0] ctrl_aluc;
    
    wire [31:0] rf_rd1, rf_rd2;
    wire [31:0] imm_ext;
    wire [4:0] reg_dest_id;

    //ID/EXE Regist-
    wire exe_wreg, exe_m2reg, exe_wmem, exe_aluimm;
    wire [3:0] exe_aluc;
    wire [31:0] exe_rd1, exe_rd2, exe_imm;
    wire [4:0] exe_rn;

    // EXE Stage
    wire [31:0] alu_b_input;
    wire [31:0] alu_result_exe;


    wire [31:0] mem_data_out;

 
    wire [31:0] wb_data; 

    assign id_op = id_inst[31:26];
    assign id_rs = id_inst[25:21];
    assign id_rt = id_inst[20:16];
    assign id_rd = id_inst[15:11];
    assign id_imm16 = id_inst[15:0];
    assign wb_data = (wb_m2reg == 1'b1) ? wb_mo : wb_alu;



    // 1.Instruction Fetch (IF) Stage
    PC U_PC (
        .clk(clk),
        .rst(rst),
        .next_pc(pc_next),
        .current_pc(pc_current)
    );

    PC_Adder U_PCAdd (
        .pc_in(pc_current),
        .pc_out(pc_next)
    );

    InstructionMemory U_IM (
        .addr(pc_current),
        .inst(inst_if)
    );

    IFID_Register U_IFID (
        .clk(clk),
        .rst(rst),
        .if_inst(inst_if),
        .if_pc4(pc_next),
        .id_inst(id_inst),
        .id_pc4(id_pc4)
    );

    //2. Instruction Decode (ID) Stage
    ControlUnit U_Control (
        .op(id_op),
        .wreg(ctrl_wreg),
        .m2reg(ctrl_m2reg),
        .wmem(ctrl_wmem),
        .aluc(ctrl_aluc),
        .aluimm(ctrl_aluimm),
        .regrt(ctrl_regrt)
    );

    RegisterFile U_RegFile (
        .clk(clk),
        .rst(rst),
        .rn1(id_rs),
        .rn2(id_rt),
        .wn(wb_rn),     
        .wd(wb_data),   
        .we(wb_wreg),   
        .rd1(rf_rd1),
        .rd2(rf_rd2)
    );

    SignExtension U_SignExt (
        .imm_in(id_imm16),
        .imm_out(imm_ext)
    );

    RegDstMux U_RegDstMux (
        .rt(id_rt),
        .rd(id_rd),
        .sel(ctrl_regrt),
        .rn(reg_dest_id)
    );

    IDEXE_Register U_IDEXE (
        .clk(clk),
        .rst(rst),
        .wreg_in(ctrl_wreg), .m2reg_in(ctrl_m2reg), .wmem_in(ctrl_wmem),
        .aluc_in(ctrl_aluc), .aluimm_in(ctrl_aluimm),
        .rd1_in(rf_rd1), .rd2_in(rf_rd2), .imm_in(imm_ext), .rn_in(reg_dest_id),
        .wreg_out(exe_wreg), .m2reg_out(exe_m2reg), .wmem_out(exe_wmem),
        .aluc_out(exe_aluc), .aluimm_out(exe_aluimm),
        .rd1_out(exe_rd1), .rd2_out(exe_rd2), .imm_out(exe_imm), .rn_out(exe_rn)
    );

    // 3Execute (EXE) Stage
    ALU_Mux U_ALUMux (
        .reg_b(exe_rd2),
        .imm(exe_imm),
        .sel(exe_aluimm),
        .b_out(alu_b_input)
    );

    ALU U_ALU (
        .a(exe_rd1),
        .b(alu_b_input),
        .aluc(exe_aluc),
        .r(alu_result_exe)
    );

    EXMEM_Register U_EXMEM (
        .clk(clk),
        .rst(rst),
        //nputs
        .wreg_in(exe_wreg), .m2reg_in(exe_m2reg), .wmem_in(exe_wmem),
        .alu_in(alu_result_exe), .r2_in(exe_rd2), .rn_in(exe_rn),
        //Outputs
        .wreg_out(mem_wreg), .m2reg_out(mem_m2reg), .wmem_out(mem_wmem),
        .alu_out(mem_alu), .r2_out(mem_r2), .rn_out(mem_rn)
    );

    //4.Memory (MEM) Stage
    DataMemory U_DataMem (
        .clk(clk),
        .addr(mem_alu),
        .wdata(mem_r2),
        .we(mem_wmem),
        .rdata(mem_data_out)
    );

    MEMWB_Register U_MEMWB (
        .clk(clk),
        .rst(rst),
        .wreg_in(mem_wreg), .m2reg_in(mem_m2reg),
        .mo_in(mem_data_out), .alu_in(mem_alu), .rn_in(mem_rn),
        .wreg_out(wb_wreg), .m2reg_out(wb_m2reg),
        .mo_out(wb_mo), .alu_out(wb_alu), .rn_out(wb_rn)
    );

endmodule



// 1. Program Counter
module PC (input clk, rst, input [31:0] next_pc, output reg [31:0] current_pc);
    always @(posedge clk, posedge rst) begin
        if (rst) current_pc <= 32'd100;
        else current_pc <= next_pc;
    end
endmodule

// 2.PC Adder
module PC_Adder (input [31:0] pc_in, output [31:0] pc_out);
    assign pc_out = pc_in + 32'd4;
endmodule

//3 Instruction Memory 
module InstructionMemory (input [31:0] addr, output [31:0] inst);
    reg [31:0] rom[0:63];
    integer i;
    initial begin
        for (i=0; i<64; i=i+1) rom[i] = 32'h0;
        // 100: lw $2, 00($1)  -> rs=1, rt=2, imm=0  -> 8C220000
        // 104: lw $3, 04($1)  -> rs=1, rt=3, imm=4  -> 8C230004
        // 108: lw $4, 08($1)  -> rs=1, rt=4, imm=8  -> 8C240008
        // 112: lw $5, 12($1)  -> rs=1, rt=5, imm=12 -> 8C25000C
        rom[25] = 32'h8C220000; 
        rom[26] = 32'h8C230004;
        rom[27] = 32'h8C240008;
        rom[28] = 32'h8C25000C;
    end
    assign inst = rom[addr[7:2]];
endmodule

// 4.IF/ID Register
module IFID_Register (input clk, rst, input [31:0] if_inst, if_pc4, output reg [31:0] id_inst, id_pc4);
    always @(posedge clk, posedge rst) begin
        if (rst) begin id_inst <= 0; id_pc4 <= 0; end
        else begin id_inst <= if_inst; id_pc4 <= if_pc4; end
    end
endmodule

// 5Control Unit
module ControlUnit (
    input [5:0] op,
    output reg wreg, m2reg, wmem, aluimm, regrt,
    output reg [3:0] aluc
);
    parameter OP_LW = 6'b100011;
    parameter ALU_ADD = 4'b0010;

    always @(*) begin
        if (op == OP_LW) begin
            wreg = 1; m2reg = 1; wmem = 0; aluimm = 1; regrt = 0; aluc = ALU_ADD;
        end else begin
            wreg = 0; m2reg = 0; wmem = 0; aluimm = 0; regrt = 0; aluc = 4'b0000;
        end
    end
endmodule

// 6.Register File (Initialize to 0)
module RegisterFile (
    input clk, rst,
    input [4:0] rn1, rn2, wn,
    input [31:0] wd,
    input we,
    output [31:0] rd1, rd2
);
    reg [31:0] regs[0:31];
    integer i;
    always @(posedge clk, posedge rst) begin
        if (rst) for (i=0; i<32; i=i+1) regs[i] <= 0;
        else if (we && wn != 0) regs[wn] <= wd;
    end
    assign rd1 = (rn1 == 0) ? 0 : regs[rn1];
    assign rd2 = (rn2 == 0) ? 0 : regs[rn2];
endmodule

// 7.Sign Extension
module SignExtension (input [15:0] imm_in, output [31:0] imm_out);
    assign imm_out = {{16{imm_in[15]}}, imm_in};
endmodule

// 8.RegDst Mux
module RegDstMux (input [4:0] rt, rd, input sel, output [4:0] rn);
    assign rn = (sel == 1) ? rd : rt;
endmodule

// 9.ID/EXE Register
module IDEXE_Register (
    input clk, rst,
    input wreg_in, m2reg_in, wmem_in, aluimm_in,
    input [3:0] aluc_in,
    input [31:0] rd1_in, rd2_in, imm_in,
    input [4:0] rn_in,
    output reg wreg_out, m2reg_out, wmem_out, aluimm_out,
    output reg [3:0] aluc_out,
    output reg [31:0] rd1_out, rd2_out, imm_out,
    output reg [4:0] rn_out
);
    always @(posedge clk, posedge rst) begin
        if (rst) begin
            wreg_out<=0; m2reg_out<=0; wmem_out<=0; aluimm_out<=0; aluc_out<=0;
            rd1_out<=0; rd2_out<=0; imm_out<=0; rn_out<=0;
        end else begin
            wreg_out<=wreg_in; m2reg_out<=m2reg_in; wmem_out<=wmem_in;
            aluimm_out<=aluimm_in; aluc_out<=aluc_in;
            rd1_out<=rd1_in; rd2_out<=rd2_in; imm_out<=imm_in; rn_out<=rn_in;
        end
    end
endmodule

// 10. ALU Mu
module ALU_Mux (input [31:0] reg_b, imm, input sel, output [31:0] b_out);
    assign b_out = (sel == 1) ? imm : reg_b;
endmodule

//11. ALU
module ALU (input [31:0] a, b, input [3:0] aluc, output reg [31:0] r);
    always @(*) begin
        case (aluc)
            4'b0010: r = a + b; // ADD
            default: r = 0;
        endcase
    end
endmodule

// 12. E/MEM Register
module EXMEM_Register (
    input clk, rst,
    input wreg_in, m2reg_in, wmem_in,
    input [31:0] alu_in, r2_in,
    input [4:0] rn_in,
    output reg wreg_out, m2reg_out, wmem_out,
    output reg [31:0] alu_out, r2_out,
    output reg [4:0] rn_out
);
    always @(posedge clk, posedge rst) begin
        if (rst) begin
            wreg_out<=0; m2reg_out<=0; wmem_out<=0; alu_out<=0; r2_out<=0; rn_out<=0;
        end else begin
            wreg_out<=wreg_in; m2reg_out<=m2reg_in; wmem_out<=wmem_in;
            alu_out<=alu_in; r2_out<=r2_in; rn_out<=rn_in;
        end
    end
endmodule

// 13. Data Memory
module DataMemory (
    input clk,
    input [31:0] addr, wdata,
    input we,
    output [31:0] rdata
);
    reg [31:0] dmem [0:63];
    integer i;
    initial begin
        for (i=0; i<64; i=i+1) dmem[i] = 32'h0;
        dmem[0] = 32'hA00000AA;
        dmem[1] = 32'h10000011;
        dmem[2] = 32'h20000022;
        dmem[3] = 32'h30000033;
        dmem[4] = 32'h40000044;
        dmem[5] = 32'h50000055;
        dmem[6] = 32'h60000066;
        dmem[7] = 32'h70000077;
        dmem[8] = 32'h80000088;
        dmem[9] = 32'h90000099;
    end
    
    // Synchronous write (Verilog_3.pdf slide 8)
    always @(posedge clk) begin
        if (we) dmem[addr[7:2]] <= wdata;
    end
    
    assign rdata = dmem[addr[7:2]];
endmodule

// 14.MEM/WB Register
module MEMWB_Register (
    input clk, rst,
    input wreg_in, m2reg_in,
    input [31:0] mo_in, alu_in,
    input [4:0] rn_in,
    output reg wreg_out, m2reg_out,
    output reg [31:0] mo_out, alu_out,
    output reg [4:0] rn_out
);
    always @(posedge clk, posedge rst) begin
        if (rst) begin
            wreg_out<=0; m2reg_out<=0; mo_out<=0; alu_out<=0; rn_out<=0;
        end else begin
            wreg_out<=wreg_in; m2reg_out<=m2reg_in;
            mo_out<=mo_in; alu_out<=alu_in; rn_out<=rn_in;
        end
    end
endmodule
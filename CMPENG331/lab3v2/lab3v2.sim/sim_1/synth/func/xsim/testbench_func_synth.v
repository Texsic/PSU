// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Sun Nov  9 20:14:01 2025
// Host        : E5-CSE-136-26 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               C:/Users/mma7020/Desktop/lab3v2/lab3v2.sim/sim_1/synth/func/xsim/testbench_func_synth.v
// Design      : cpu_if_id
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module IDEXE_Register
   (exe_regrt_OBUF,
    Q,
    id_inst_out,
    CLK,
    AR,
    \out_pc_plus_4_reg[31]_0 );
  output [1:0]exe_regrt_OBUF;
  output [29:0]Q;
  input [1:0]id_inst_out;
  input CLK;
  input [0:0]AR;
  input [29:0]\out_pc_plus_4_reg[31]_0 ;

  wire [0:0]AR;
  wire CLK;
  wire [29:0]Q;
  wire [1:0]exe_regrt_OBUF;
  wire [1:0]id_inst_out;
  wire [29:0]\out_pc_plus_4_reg[31]_0 ;

  FDCE #(
    .INIT(1'b0)) 
    \out_pc_plus_4_reg[10] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\out_pc_plus_4_reg[31]_0 [8]),
        .Q(Q[8]));
  FDCE #(
    .INIT(1'b0)) 
    \out_pc_plus_4_reg[11] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\out_pc_plus_4_reg[31]_0 [9]),
        .Q(Q[9]));
  FDCE #(
    .INIT(1'b0)) 
    \out_pc_plus_4_reg[12] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\out_pc_plus_4_reg[31]_0 [10]),
        .Q(Q[10]));
  FDCE #(
    .INIT(1'b0)) 
    \out_pc_plus_4_reg[13] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\out_pc_plus_4_reg[31]_0 [11]),
        .Q(Q[11]));
  FDCE #(
    .INIT(1'b0)) 
    \out_pc_plus_4_reg[14] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\out_pc_plus_4_reg[31]_0 [12]),
        .Q(Q[12]));
  FDCE #(
    .INIT(1'b0)) 
    \out_pc_plus_4_reg[15] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\out_pc_plus_4_reg[31]_0 [13]),
        .Q(Q[13]));
  FDCE #(
    .INIT(1'b0)) 
    \out_pc_plus_4_reg[16] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\out_pc_plus_4_reg[31]_0 [14]),
        .Q(Q[14]));
  FDCE #(
    .INIT(1'b0)) 
    \out_pc_plus_4_reg[17] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\out_pc_plus_4_reg[31]_0 [15]),
        .Q(Q[15]));
  FDCE #(
    .INIT(1'b0)) 
    \out_pc_plus_4_reg[18] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\out_pc_plus_4_reg[31]_0 [16]),
        .Q(Q[16]));
  FDCE #(
    .INIT(1'b0)) 
    \out_pc_plus_4_reg[19] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\out_pc_plus_4_reg[31]_0 [17]),
        .Q(Q[17]));
  FDCE #(
    .INIT(1'b0)) 
    \out_pc_plus_4_reg[20] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\out_pc_plus_4_reg[31]_0 [18]),
        .Q(Q[18]));
  FDCE #(
    .INIT(1'b0)) 
    \out_pc_plus_4_reg[21] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\out_pc_plus_4_reg[31]_0 [19]),
        .Q(Q[19]));
  FDCE #(
    .INIT(1'b0)) 
    \out_pc_plus_4_reg[22] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\out_pc_plus_4_reg[31]_0 [20]),
        .Q(Q[20]));
  FDCE #(
    .INIT(1'b0)) 
    \out_pc_plus_4_reg[23] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\out_pc_plus_4_reg[31]_0 [21]),
        .Q(Q[21]));
  FDCE #(
    .INIT(1'b0)) 
    \out_pc_plus_4_reg[24] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\out_pc_plus_4_reg[31]_0 [22]),
        .Q(Q[22]));
  FDCE #(
    .INIT(1'b0)) 
    \out_pc_plus_4_reg[25] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\out_pc_plus_4_reg[31]_0 [23]),
        .Q(Q[23]));
  FDCE #(
    .INIT(1'b0)) 
    \out_pc_plus_4_reg[26] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\out_pc_plus_4_reg[31]_0 [24]),
        .Q(Q[24]));
  FDCE #(
    .INIT(1'b0)) 
    \out_pc_plus_4_reg[27] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\out_pc_plus_4_reg[31]_0 [25]),
        .Q(Q[25]));
  FDCE #(
    .INIT(1'b0)) 
    \out_pc_plus_4_reg[28] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\out_pc_plus_4_reg[31]_0 [26]),
        .Q(Q[26]));
  FDCE #(
    .INIT(1'b0)) 
    \out_pc_plus_4_reg[29] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\out_pc_plus_4_reg[31]_0 [27]),
        .Q(Q[27]));
  FDCE #(
    .INIT(1'b0)) 
    \out_pc_plus_4_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\out_pc_plus_4_reg[31]_0 [0]),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \out_pc_plus_4_reg[30] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\out_pc_plus_4_reg[31]_0 [28]),
        .Q(Q[28]));
  FDCE #(
    .INIT(1'b0)) 
    \out_pc_plus_4_reg[31] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\out_pc_plus_4_reg[31]_0 [29]),
        .Q(Q[29]));
  FDCE #(
    .INIT(1'b0)) 
    \out_pc_plus_4_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\out_pc_plus_4_reg[31]_0 [1]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \out_pc_plus_4_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\out_pc_plus_4_reg[31]_0 [2]),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \out_pc_plus_4_reg[5] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\out_pc_plus_4_reg[31]_0 [3]),
        .Q(Q[3]));
  FDCE #(
    .INIT(1'b0)) 
    \out_pc_plus_4_reg[6] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\out_pc_plus_4_reg[31]_0 [4]),
        .Q(Q[4]));
  FDCE #(
    .INIT(1'b0)) 
    \out_pc_plus_4_reg[7] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\out_pc_plus_4_reg[31]_0 [5]),
        .Q(Q[5]));
  FDCE #(
    .INIT(1'b0)) 
    \out_pc_plus_4_reg[8] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\out_pc_plus_4_reg[31]_0 [6]),
        .Q(Q[6]));
  FDCE #(
    .INIT(1'b0)) 
    \out_pc_plus_4_reg[9] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\out_pc_plus_4_reg[31]_0 [7]),
        .Q(Q[7]));
  FDCE #(
    .INIT(1'b0)) 
    \out_regrt_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(id_inst_out[0]),
        .Q(exe_regrt_OBUF[0]));
  FDCE #(
    .INIT(1'b0)) 
    \out_regrt_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(id_inst_out[1]),
        .Q(exe_regrt_OBUF[1]));
endmodule

module IFID_Register
   (Q,
    \id_pc_plus_4_out_reg[31]_0 ,
    D,
    CLK,
    rst,
    \id_pc_plus_4_out_reg[31]_1 );
  output [1:0]Q;
  output [29:0]\id_pc_plus_4_out_reg[31]_0 ;
  input [1:0]D;
  input CLK;
  input rst;
  input [29:0]\id_pc_plus_4_out_reg[31]_1 ;

  wire CLK;
  wire [1:0]D;
  wire [1:0]Q;
  wire [29:0]\id_pc_plus_4_out_reg[31]_0 ;
  wire [29:0]\id_pc_plus_4_out_reg[31]_1 ;
  wire rst;

  FDCE #(
    .INIT(1'b0)) 
    \id_inst_out_reg[16] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst),
        .D(D[0]),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \id_inst_out_reg[26] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst),
        .D(D[1]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \id_pc_plus_4_out_reg[10] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst),
        .D(\id_pc_plus_4_out_reg[31]_1 [8]),
        .Q(\id_pc_plus_4_out_reg[31]_0 [8]));
  FDCE #(
    .INIT(1'b0)) 
    \id_pc_plus_4_out_reg[11] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst),
        .D(\id_pc_plus_4_out_reg[31]_1 [9]),
        .Q(\id_pc_plus_4_out_reg[31]_0 [9]));
  FDCE #(
    .INIT(1'b0)) 
    \id_pc_plus_4_out_reg[12] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst),
        .D(\id_pc_plus_4_out_reg[31]_1 [10]),
        .Q(\id_pc_plus_4_out_reg[31]_0 [10]));
  FDCE #(
    .INIT(1'b0)) 
    \id_pc_plus_4_out_reg[13] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst),
        .D(\id_pc_plus_4_out_reg[31]_1 [11]),
        .Q(\id_pc_plus_4_out_reg[31]_0 [11]));
  FDCE #(
    .INIT(1'b0)) 
    \id_pc_plus_4_out_reg[14] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst),
        .D(\id_pc_plus_4_out_reg[31]_1 [12]),
        .Q(\id_pc_plus_4_out_reg[31]_0 [12]));
  FDCE #(
    .INIT(1'b0)) 
    \id_pc_plus_4_out_reg[15] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst),
        .D(\id_pc_plus_4_out_reg[31]_1 [13]),
        .Q(\id_pc_plus_4_out_reg[31]_0 [13]));
  FDCE #(
    .INIT(1'b0)) 
    \id_pc_plus_4_out_reg[16] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst),
        .D(\id_pc_plus_4_out_reg[31]_1 [14]),
        .Q(\id_pc_plus_4_out_reg[31]_0 [14]));
  FDCE #(
    .INIT(1'b0)) 
    \id_pc_plus_4_out_reg[17] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst),
        .D(\id_pc_plus_4_out_reg[31]_1 [15]),
        .Q(\id_pc_plus_4_out_reg[31]_0 [15]));
  FDCE #(
    .INIT(1'b0)) 
    \id_pc_plus_4_out_reg[18] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst),
        .D(\id_pc_plus_4_out_reg[31]_1 [16]),
        .Q(\id_pc_plus_4_out_reg[31]_0 [16]));
  FDCE #(
    .INIT(1'b0)) 
    \id_pc_plus_4_out_reg[19] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst),
        .D(\id_pc_plus_4_out_reg[31]_1 [17]),
        .Q(\id_pc_plus_4_out_reg[31]_0 [17]));
  FDCE #(
    .INIT(1'b0)) 
    \id_pc_plus_4_out_reg[20] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst),
        .D(\id_pc_plus_4_out_reg[31]_1 [18]),
        .Q(\id_pc_plus_4_out_reg[31]_0 [18]));
  FDCE #(
    .INIT(1'b0)) 
    \id_pc_plus_4_out_reg[21] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst),
        .D(\id_pc_plus_4_out_reg[31]_1 [19]),
        .Q(\id_pc_plus_4_out_reg[31]_0 [19]));
  FDCE #(
    .INIT(1'b0)) 
    \id_pc_plus_4_out_reg[22] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst),
        .D(\id_pc_plus_4_out_reg[31]_1 [20]),
        .Q(\id_pc_plus_4_out_reg[31]_0 [20]));
  FDCE #(
    .INIT(1'b0)) 
    \id_pc_plus_4_out_reg[23] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst),
        .D(\id_pc_plus_4_out_reg[31]_1 [21]),
        .Q(\id_pc_plus_4_out_reg[31]_0 [21]));
  FDCE #(
    .INIT(1'b0)) 
    \id_pc_plus_4_out_reg[24] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst),
        .D(\id_pc_plus_4_out_reg[31]_1 [22]),
        .Q(\id_pc_plus_4_out_reg[31]_0 [22]));
  FDCE #(
    .INIT(1'b0)) 
    \id_pc_plus_4_out_reg[25] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst),
        .D(\id_pc_plus_4_out_reg[31]_1 [23]),
        .Q(\id_pc_plus_4_out_reg[31]_0 [23]));
  FDCE #(
    .INIT(1'b0)) 
    \id_pc_plus_4_out_reg[26] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst),
        .D(\id_pc_plus_4_out_reg[31]_1 [24]),
        .Q(\id_pc_plus_4_out_reg[31]_0 [24]));
  FDCE #(
    .INIT(1'b0)) 
    \id_pc_plus_4_out_reg[27] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst),
        .D(\id_pc_plus_4_out_reg[31]_1 [25]),
        .Q(\id_pc_plus_4_out_reg[31]_0 [25]));
  FDCE #(
    .INIT(1'b0)) 
    \id_pc_plus_4_out_reg[28] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst),
        .D(\id_pc_plus_4_out_reg[31]_1 [26]),
        .Q(\id_pc_plus_4_out_reg[31]_0 [26]));
  FDCE #(
    .INIT(1'b0)) 
    \id_pc_plus_4_out_reg[29] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst),
        .D(\id_pc_plus_4_out_reg[31]_1 [27]),
        .Q(\id_pc_plus_4_out_reg[31]_0 [27]));
  FDCE #(
    .INIT(1'b0)) 
    \id_pc_plus_4_out_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst),
        .D(\id_pc_plus_4_out_reg[31]_1 [0]),
        .Q(\id_pc_plus_4_out_reg[31]_0 [0]));
  FDCE #(
    .INIT(1'b0)) 
    \id_pc_plus_4_out_reg[30] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst),
        .D(\id_pc_plus_4_out_reg[31]_1 [28]),
        .Q(\id_pc_plus_4_out_reg[31]_0 [28]));
  FDCE #(
    .INIT(1'b0)) 
    \id_pc_plus_4_out_reg[31] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst),
        .D(\id_pc_plus_4_out_reg[31]_1 [29]),
        .Q(\id_pc_plus_4_out_reg[31]_0 [29]));
  FDCE #(
    .INIT(1'b0)) 
    \id_pc_plus_4_out_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst),
        .D(\id_pc_plus_4_out_reg[31]_1 [1]),
        .Q(\id_pc_plus_4_out_reg[31]_0 [1]));
  FDCE #(
    .INIT(1'b0)) 
    \id_pc_plus_4_out_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst),
        .D(\id_pc_plus_4_out_reg[31]_1 [2]),
        .Q(\id_pc_plus_4_out_reg[31]_0 [2]));
  FDCE #(
    .INIT(1'b0)) 
    \id_pc_plus_4_out_reg[5] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst),
        .D(\id_pc_plus_4_out_reg[31]_1 [3]),
        .Q(\id_pc_plus_4_out_reg[31]_0 [3]));
  FDCE #(
    .INIT(1'b0)) 
    \id_pc_plus_4_out_reg[6] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst),
        .D(\id_pc_plus_4_out_reg[31]_1 [4]),
        .Q(\id_pc_plus_4_out_reg[31]_0 [4]));
  FDCE #(
    .INIT(1'b0)) 
    \id_pc_plus_4_out_reg[7] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst),
        .D(\id_pc_plus_4_out_reg[31]_1 [5]),
        .Q(\id_pc_plus_4_out_reg[31]_0 [5]));
  FDCE #(
    .INIT(1'b0)) 
    \id_pc_plus_4_out_reg[8] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst),
        .D(\id_pc_plus_4_out_reg[31]_1 [6]),
        .Q(\id_pc_plus_4_out_reg[31]_0 [6]));
  FDCE #(
    .INIT(1'b0)) 
    \id_pc_plus_4_out_reg[9] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rst),
        .D(\id_pc_plus_4_out_reg[31]_1 [7]),
        .Q(\id_pc_plus_4_out_reg[31]_0 [7]));
endmodule

module PC
   (D,
    \current_pc_reg[31]_0 ,
    clk,
    rst);
  output [1:0]D;
  output [29:0]\current_pc_reg[31]_0 ;
  input clk;
  input rst;

  wire [1:0]D;
  wire clk;
  wire \current_pc[2]_i_2_n_0 ;
  wire [31:8]current_pc_reg;
  wire \current_pc_reg[10]_i_1_n_0 ;
  wire \current_pc_reg[10]_i_1_n_1 ;
  wire \current_pc_reg[10]_i_1_n_2 ;
  wire \current_pc_reg[10]_i_1_n_3 ;
  wire \current_pc_reg[10]_i_1_n_4 ;
  wire \current_pc_reg[10]_i_1_n_5 ;
  wire \current_pc_reg[10]_i_1_n_6 ;
  wire \current_pc_reg[10]_i_1_n_7 ;
  wire \current_pc_reg[14]_i_1_n_0 ;
  wire \current_pc_reg[14]_i_1_n_1 ;
  wire \current_pc_reg[14]_i_1_n_2 ;
  wire \current_pc_reg[14]_i_1_n_3 ;
  wire \current_pc_reg[14]_i_1_n_4 ;
  wire \current_pc_reg[14]_i_1_n_5 ;
  wire \current_pc_reg[14]_i_1_n_6 ;
  wire \current_pc_reg[14]_i_1_n_7 ;
  wire \current_pc_reg[18]_i_1_n_0 ;
  wire \current_pc_reg[18]_i_1_n_1 ;
  wire \current_pc_reg[18]_i_1_n_2 ;
  wire \current_pc_reg[18]_i_1_n_3 ;
  wire \current_pc_reg[18]_i_1_n_4 ;
  wire \current_pc_reg[18]_i_1_n_5 ;
  wire \current_pc_reg[18]_i_1_n_6 ;
  wire \current_pc_reg[18]_i_1_n_7 ;
  wire \current_pc_reg[22]_i_1_n_0 ;
  wire \current_pc_reg[22]_i_1_n_1 ;
  wire \current_pc_reg[22]_i_1_n_2 ;
  wire \current_pc_reg[22]_i_1_n_3 ;
  wire \current_pc_reg[22]_i_1_n_4 ;
  wire \current_pc_reg[22]_i_1_n_5 ;
  wire \current_pc_reg[22]_i_1_n_6 ;
  wire \current_pc_reg[22]_i_1_n_7 ;
  wire \current_pc_reg[26]_i_1_n_0 ;
  wire \current_pc_reg[26]_i_1_n_1 ;
  wire \current_pc_reg[26]_i_1_n_2 ;
  wire \current_pc_reg[26]_i_1_n_3 ;
  wire \current_pc_reg[26]_i_1_n_4 ;
  wire \current_pc_reg[26]_i_1_n_5 ;
  wire \current_pc_reg[26]_i_1_n_6 ;
  wire \current_pc_reg[26]_i_1_n_7 ;
  wire \current_pc_reg[2]_i_1_n_0 ;
  wire \current_pc_reg[2]_i_1_n_1 ;
  wire \current_pc_reg[2]_i_1_n_2 ;
  wire \current_pc_reg[2]_i_1_n_3 ;
  wire \current_pc_reg[2]_i_1_n_4 ;
  wire \current_pc_reg[2]_i_1_n_5 ;
  wire \current_pc_reg[2]_i_1_n_6 ;
  wire \current_pc_reg[2]_i_1_n_7 ;
  wire \current_pc_reg[30]_i_1_n_3 ;
  wire \current_pc_reg[30]_i_1_n_6 ;
  wire \current_pc_reg[30]_i_1_n_7 ;
  wire [29:0]\current_pc_reg[31]_0 ;
  wire \current_pc_reg[6]_i_1_n_0 ;
  wire \current_pc_reg[6]_i_1_n_1 ;
  wire \current_pc_reg[6]_i_1_n_2 ;
  wire \current_pc_reg[6]_i_1_n_3 ;
  wire \current_pc_reg[6]_i_1_n_4 ;
  wire \current_pc_reg[6]_i_1_n_5 ;
  wire \current_pc_reg[6]_i_1_n_6 ;
  wire \current_pc_reg[6]_i_1_n_7 ;
  wire \id_pc_plus_4_out[4]_i_2_n_0 ;
  wire \id_pc_plus_4_out_reg[12]_i_1_n_0 ;
  wire \id_pc_plus_4_out_reg[12]_i_1_n_1 ;
  wire \id_pc_plus_4_out_reg[12]_i_1_n_2 ;
  wire \id_pc_plus_4_out_reg[12]_i_1_n_3 ;
  wire \id_pc_plus_4_out_reg[16]_i_1_n_0 ;
  wire \id_pc_plus_4_out_reg[16]_i_1_n_1 ;
  wire \id_pc_plus_4_out_reg[16]_i_1_n_2 ;
  wire \id_pc_plus_4_out_reg[16]_i_1_n_3 ;
  wire \id_pc_plus_4_out_reg[20]_i_1_n_0 ;
  wire \id_pc_plus_4_out_reg[20]_i_1_n_1 ;
  wire \id_pc_plus_4_out_reg[20]_i_1_n_2 ;
  wire \id_pc_plus_4_out_reg[20]_i_1_n_3 ;
  wire \id_pc_plus_4_out_reg[24]_i_1_n_0 ;
  wire \id_pc_plus_4_out_reg[24]_i_1_n_1 ;
  wire \id_pc_plus_4_out_reg[24]_i_1_n_2 ;
  wire \id_pc_plus_4_out_reg[24]_i_1_n_3 ;
  wire \id_pc_plus_4_out_reg[28]_i_1_n_0 ;
  wire \id_pc_plus_4_out_reg[28]_i_1_n_1 ;
  wire \id_pc_plus_4_out_reg[28]_i_1_n_2 ;
  wire \id_pc_plus_4_out_reg[28]_i_1_n_3 ;
  wire \id_pc_plus_4_out_reg[31]_i_1_n_2 ;
  wire \id_pc_plus_4_out_reg[31]_i_1_n_3 ;
  wire \id_pc_plus_4_out_reg[4]_i_1_n_0 ;
  wire \id_pc_plus_4_out_reg[4]_i_1_n_1 ;
  wire \id_pc_plus_4_out_reg[4]_i_1_n_2 ;
  wire \id_pc_plus_4_out_reg[4]_i_1_n_3 ;
  wire \id_pc_plus_4_out_reg[8]_i_1_n_0 ;
  wire \id_pc_plus_4_out_reg[8]_i_1_n_1 ;
  wire \id_pc_plus_4_out_reg[8]_i_1_n_2 ;
  wire \id_pc_plus_4_out_reg[8]_i_1_n_3 ;
  wire [7:2]pc_current;
  wire rst;
  wire [3:1]\NLW_current_pc_reg[30]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_current_pc_reg[30]_i_1_O_UNCONNECTED ;
  wire [3:2]\NLW_id_pc_plus_4_out_reg[31]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_id_pc_plus_4_out_reg[31]_i_1_O_UNCONNECTED ;
  wire [0:0]\NLW_id_pc_plus_4_out_reg[4]_i_1_O_UNCONNECTED ;

  LUT1 #(
    .INIT(2'h1)) 
    \current_pc[2]_i_2 
       (.I0(pc_current[2]),
        .O(\current_pc[2]_i_2_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\current_pc_reg[10]_i_1_n_7 ),
        .Q(current_pc_reg[10]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \current_pc_reg[10]_i_1 
       (.CI(\current_pc_reg[6]_i_1_n_0 ),
        .CO({\current_pc_reg[10]_i_1_n_0 ,\current_pc_reg[10]_i_1_n_1 ,\current_pc_reg[10]_i_1_n_2 ,\current_pc_reg[10]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\current_pc_reg[10]_i_1_n_4 ,\current_pc_reg[10]_i_1_n_5 ,\current_pc_reg[10]_i_1_n_6 ,\current_pc_reg[10]_i_1_n_7 }),
        .S(current_pc_reg[13:10]));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\current_pc_reg[10]_i_1_n_6 ),
        .Q(current_pc_reg[11]));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\current_pc_reg[10]_i_1_n_5 ),
        .Q(current_pc_reg[12]));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\current_pc_reg[10]_i_1_n_4 ),
        .Q(current_pc_reg[13]));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\current_pc_reg[14]_i_1_n_7 ),
        .Q(current_pc_reg[14]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \current_pc_reg[14]_i_1 
       (.CI(\current_pc_reg[10]_i_1_n_0 ),
        .CO({\current_pc_reg[14]_i_1_n_0 ,\current_pc_reg[14]_i_1_n_1 ,\current_pc_reg[14]_i_1_n_2 ,\current_pc_reg[14]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\current_pc_reg[14]_i_1_n_4 ,\current_pc_reg[14]_i_1_n_5 ,\current_pc_reg[14]_i_1_n_6 ,\current_pc_reg[14]_i_1_n_7 }),
        .S(current_pc_reg[17:14]));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\current_pc_reg[14]_i_1_n_6 ),
        .Q(current_pc_reg[15]));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\current_pc_reg[14]_i_1_n_5 ),
        .Q(current_pc_reg[16]));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\current_pc_reg[14]_i_1_n_4 ),
        .Q(current_pc_reg[17]));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\current_pc_reg[18]_i_1_n_7 ),
        .Q(current_pc_reg[18]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \current_pc_reg[18]_i_1 
       (.CI(\current_pc_reg[14]_i_1_n_0 ),
        .CO({\current_pc_reg[18]_i_1_n_0 ,\current_pc_reg[18]_i_1_n_1 ,\current_pc_reg[18]_i_1_n_2 ,\current_pc_reg[18]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\current_pc_reg[18]_i_1_n_4 ,\current_pc_reg[18]_i_1_n_5 ,\current_pc_reg[18]_i_1_n_6 ,\current_pc_reg[18]_i_1_n_7 }),
        .S(current_pc_reg[21:18]));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\current_pc_reg[18]_i_1_n_6 ),
        .Q(current_pc_reg[19]));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\current_pc_reg[18]_i_1_n_5 ),
        .Q(current_pc_reg[20]));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[21] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\current_pc_reg[18]_i_1_n_4 ),
        .Q(current_pc_reg[21]));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[22] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\current_pc_reg[22]_i_1_n_7 ),
        .Q(current_pc_reg[22]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \current_pc_reg[22]_i_1 
       (.CI(\current_pc_reg[18]_i_1_n_0 ),
        .CO({\current_pc_reg[22]_i_1_n_0 ,\current_pc_reg[22]_i_1_n_1 ,\current_pc_reg[22]_i_1_n_2 ,\current_pc_reg[22]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\current_pc_reg[22]_i_1_n_4 ,\current_pc_reg[22]_i_1_n_5 ,\current_pc_reg[22]_i_1_n_6 ,\current_pc_reg[22]_i_1_n_7 }),
        .S(current_pc_reg[25:22]));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[23] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\current_pc_reg[22]_i_1_n_6 ),
        .Q(current_pc_reg[23]));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[24] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\current_pc_reg[22]_i_1_n_5 ),
        .Q(current_pc_reg[24]));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[25] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\current_pc_reg[22]_i_1_n_4 ),
        .Q(current_pc_reg[25]));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[26] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\current_pc_reg[26]_i_1_n_7 ),
        .Q(current_pc_reg[26]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \current_pc_reg[26]_i_1 
       (.CI(\current_pc_reg[22]_i_1_n_0 ),
        .CO({\current_pc_reg[26]_i_1_n_0 ,\current_pc_reg[26]_i_1_n_1 ,\current_pc_reg[26]_i_1_n_2 ,\current_pc_reg[26]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\current_pc_reg[26]_i_1_n_4 ,\current_pc_reg[26]_i_1_n_5 ,\current_pc_reg[26]_i_1_n_6 ,\current_pc_reg[26]_i_1_n_7 }),
        .S(current_pc_reg[29:26]));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[27] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\current_pc_reg[26]_i_1_n_6 ),
        .Q(current_pc_reg[27]));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[28] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\current_pc_reg[26]_i_1_n_5 ),
        .Q(current_pc_reg[28]));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[29] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\current_pc_reg[26]_i_1_n_4 ),
        .Q(current_pc_reg[29]));
  FDPE #(
    .INIT(1'b1)) 
    \current_pc_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\current_pc_reg[2]_i_1_n_7 ),
        .PRE(rst),
        .Q(pc_current[2]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \current_pc_reg[2]_i_1 
       (.CI(1'b0),
        .CO({\current_pc_reg[2]_i_1_n_0 ,\current_pc_reg[2]_i_1_n_1 ,\current_pc_reg[2]_i_1_n_2 ,\current_pc_reg[2]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\current_pc_reg[2]_i_1_n_4 ,\current_pc_reg[2]_i_1_n_5 ,\current_pc_reg[2]_i_1_n_6 ,\current_pc_reg[2]_i_1_n_7 }),
        .S({pc_current[5:3],\current_pc[2]_i_2_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[30] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\current_pc_reg[30]_i_1_n_7 ),
        .Q(current_pc_reg[30]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \current_pc_reg[30]_i_1 
       (.CI(\current_pc_reg[26]_i_1_n_0 ),
        .CO({\NLW_current_pc_reg[30]_i_1_CO_UNCONNECTED [3:1],\current_pc_reg[30]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_current_pc_reg[30]_i_1_O_UNCONNECTED [3:2],\current_pc_reg[30]_i_1_n_6 ,\current_pc_reg[30]_i_1_n_7 }),
        .S({1'b0,1'b0,current_pc_reg[31:30]}));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[31] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\current_pc_reg[30]_i_1_n_6 ),
        .Q(current_pc_reg[31]));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\current_pc_reg[2]_i_1_n_6 ),
        .Q(pc_current[3]));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\current_pc_reg[2]_i_1_n_5 ),
        .Q(pc_current[4]));
  FDPE #(
    .INIT(1'b1)) 
    \current_pc_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(\current_pc_reg[2]_i_1_n_4 ),
        .PRE(rst),
        .Q(pc_current[5]));
  FDPE #(
    .INIT(1'b1)) 
    \current_pc_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\current_pc_reg[6]_i_1_n_7 ),
        .PRE(rst),
        .Q(pc_current[6]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \current_pc_reg[6]_i_1 
       (.CI(\current_pc_reg[2]_i_1_n_0 ),
        .CO({\current_pc_reg[6]_i_1_n_0 ,\current_pc_reg[6]_i_1_n_1 ,\current_pc_reg[6]_i_1_n_2 ,\current_pc_reg[6]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\current_pc_reg[6]_i_1_n_4 ,\current_pc_reg[6]_i_1_n_5 ,\current_pc_reg[6]_i_1_n_6 ,\current_pc_reg[6]_i_1_n_7 }),
        .S({current_pc_reg[9:8],pc_current[7:6]}));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\current_pc_reg[6]_i_1_n_6 ),
        .Q(pc_current[7]));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\current_pc_reg[6]_i_1_n_5 ),
        .Q(current_pc_reg[8]));
  FDCE #(
    .INIT(1'b0)) 
    \current_pc_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\current_pc_reg[6]_i_1_n_4 ),
        .Q(current_pc_reg[9]));
  LUT6 #(
    .INIT(64'h0000000000004000)) 
    \id_inst_out[16]_i_1 
       (.I0(pc_current[4]),
        .I1(pc_current[3]),
        .I2(pc_current[5]),
        .I3(pc_current[6]),
        .I4(pc_current[2]),
        .I5(pc_current[7]),
        .O(D[0]));
  LUT6 #(
    .INIT(64'h0000000014000000)) 
    \id_inst_out[26]_i_1 
       (.I0(pc_current[4]),
        .I1(pc_current[3]),
        .I2(pc_current[2]),
        .I3(pc_current[6]),
        .I4(pc_current[5]),
        .I5(pc_current[7]),
        .O(D[1]));
  LUT1 #(
    .INIT(2'h1)) 
    \id_pc_plus_4_out[4]_i_2 
       (.I0(pc_current[2]),
        .O(\id_pc_plus_4_out[4]_i_2_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \id_pc_plus_4_out_reg[12]_i_1 
       (.CI(\id_pc_plus_4_out_reg[8]_i_1_n_0 ),
        .CO({\id_pc_plus_4_out_reg[12]_i_1_n_0 ,\id_pc_plus_4_out_reg[12]_i_1_n_1 ,\id_pc_plus_4_out_reg[12]_i_1_n_2 ,\id_pc_plus_4_out_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\current_pc_reg[31]_0 [10:7]),
        .S(current_pc_reg[12:9]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \id_pc_plus_4_out_reg[16]_i_1 
       (.CI(\id_pc_plus_4_out_reg[12]_i_1_n_0 ),
        .CO({\id_pc_plus_4_out_reg[16]_i_1_n_0 ,\id_pc_plus_4_out_reg[16]_i_1_n_1 ,\id_pc_plus_4_out_reg[16]_i_1_n_2 ,\id_pc_plus_4_out_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\current_pc_reg[31]_0 [14:11]),
        .S(current_pc_reg[16:13]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \id_pc_plus_4_out_reg[20]_i_1 
       (.CI(\id_pc_plus_4_out_reg[16]_i_1_n_0 ),
        .CO({\id_pc_plus_4_out_reg[20]_i_1_n_0 ,\id_pc_plus_4_out_reg[20]_i_1_n_1 ,\id_pc_plus_4_out_reg[20]_i_1_n_2 ,\id_pc_plus_4_out_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\current_pc_reg[31]_0 [18:15]),
        .S(current_pc_reg[20:17]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \id_pc_plus_4_out_reg[24]_i_1 
       (.CI(\id_pc_plus_4_out_reg[20]_i_1_n_0 ),
        .CO({\id_pc_plus_4_out_reg[24]_i_1_n_0 ,\id_pc_plus_4_out_reg[24]_i_1_n_1 ,\id_pc_plus_4_out_reg[24]_i_1_n_2 ,\id_pc_plus_4_out_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\current_pc_reg[31]_0 [22:19]),
        .S(current_pc_reg[24:21]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \id_pc_plus_4_out_reg[28]_i_1 
       (.CI(\id_pc_plus_4_out_reg[24]_i_1_n_0 ),
        .CO({\id_pc_plus_4_out_reg[28]_i_1_n_0 ,\id_pc_plus_4_out_reg[28]_i_1_n_1 ,\id_pc_plus_4_out_reg[28]_i_1_n_2 ,\id_pc_plus_4_out_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\current_pc_reg[31]_0 [26:23]),
        .S(current_pc_reg[28:25]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \id_pc_plus_4_out_reg[31]_i_1 
       (.CI(\id_pc_plus_4_out_reg[28]_i_1_n_0 ),
        .CO({\NLW_id_pc_plus_4_out_reg[31]_i_1_CO_UNCONNECTED [3:2],\id_pc_plus_4_out_reg[31]_i_1_n_2 ,\id_pc_plus_4_out_reg[31]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_id_pc_plus_4_out_reg[31]_i_1_O_UNCONNECTED [3],\current_pc_reg[31]_0 [29:27]}),
        .S({1'b0,current_pc_reg[31:29]}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \id_pc_plus_4_out_reg[4]_i_1 
       (.CI(1'b0),
        .CO({\id_pc_plus_4_out_reg[4]_i_1_n_0 ,\id_pc_plus_4_out_reg[4]_i_1_n_1 ,\id_pc_plus_4_out_reg[4]_i_1_n_2 ,\id_pc_plus_4_out_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,pc_current[2],1'b0}),
        .O({\current_pc_reg[31]_0 [2:0],\NLW_id_pc_plus_4_out_reg[4]_i_1_O_UNCONNECTED [0]}),
        .S({pc_current[4:3],\id_pc_plus_4_out[4]_i_2_n_0 ,1'b0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \id_pc_plus_4_out_reg[8]_i_1 
       (.CI(\id_pc_plus_4_out_reg[4]_i_1_n_0 ),
        .CO({\id_pc_plus_4_out_reg[8]_i_1_n_0 ,\id_pc_plus_4_out_reg[8]_i_1_n_1 ,\id_pc_plus_4_out_reg[8]_i_1_n_2 ,\id_pc_plus_4_out_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\current_pc_reg[31]_0 [6:3]),
        .S({current_pc_reg[8],pc_current[7:5]}));
endmodule

(* NotValidForBitStream *)
module cpu_if_id
   (clk,
    rst,
    exe_wreg,
    exe_m2reg,
    exe_wmem,
    exe_aluc,
    exe_aluimm,
    exe_rd1,
    exe_rd2,
    exe_imm,
    exe_regrt,
    exe_pc_plus_4);
  input clk;
  input rst;
  output exe_wreg;
  output exe_m2reg;
  output exe_wmem;
  output [3:0]exe_aluc;
  output exe_aluimm;
  output [31:0]exe_rd1;
  output [31:0]exe_rd2;
  output [31:0]exe_imm;
  output [4:0]exe_regrt;
  output [31:0]exe_pc_plus_4;

  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire [3:0]exe_aluc;
  wire exe_aluimm;
  wire [31:0]exe_imm;
  wire exe_m2reg;
  wire [31:0]exe_pc_plus_4;
  wire [31:2]exe_pc_plus_4_OBUF;
  wire [31:0]exe_rd1;
  wire [31:0]exe_rd2;
  wire [4:0]exe_regrt;
  wire [1:0]exe_regrt_OBUF;
  wire exe_wmem;
  wire exe_wreg;
  wire [31:2]id_pc_plus_4_out;
  wire [31:2]if_pc_plus_4_in;
  wire [26:16]inst_id;
  wire [26:16]inst_if;
  wire rst;
  wire rst_IBUF;

  IDEXE_Register U_IDEXE
       (.AR(rst_IBUF),
        .CLK(clk_IBUF_BUFG),
        .Q(exe_pc_plus_4_OBUF),
        .exe_regrt_OBUF(exe_regrt_OBUF),
        .id_inst_out({inst_id[26],inst_id[16]}),
        .\out_pc_plus_4_reg[31]_0 (id_pc_plus_4_out));
  IFID_Register U_IFID
       (.CLK(clk_IBUF_BUFG),
        .D({inst_if[26],inst_if[16]}),
        .Q({inst_id[26],inst_id[16]}),
        .\id_pc_plus_4_out_reg[31]_0 (id_pc_plus_4_out),
        .\id_pc_plus_4_out_reg[31]_1 (if_pc_plus_4_in),
        .rst(rst_IBUF));
  PC U_PC
       (.D({inst_if[26],inst_if[16]}),
        .clk(clk_IBUF_BUFG),
        .\current_pc_reg[31]_0 (if_pc_plus_4_in),
        .rst(rst_IBUF));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  OBUF \exe_aluc_OBUF[0]_inst 
       (.I(1'b0),
        .O(exe_aluc[0]));
  OBUF \exe_aluc_OBUF[1]_inst 
       (.I(exe_regrt_OBUF[1]),
        .O(exe_aluc[1]));
  OBUF \exe_aluc_OBUF[2]_inst 
       (.I(1'b0),
        .O(exe_aluc[2]));
  OBUF \exe_aluc_OBUF[3]_inst 
       (.I(1'b0),
        .O(exe_aluc[3]));
  OBUF exe_aluimm_OBUF_inst
       (.I(exe_regrt_OBUF[1]),
        .O(exe_aluimm));
  OBUF \exe_imm_OBUF[0]_inst 
       (.I(1'b0),
        .O(exe_imm[0]));
  OBUF \exe_imm_OBUF[10]_inst 
       (.I(1'b0),
        .O(exe_imm[10]));
  OBUF \exe_imm_OBUF[11]_inst 
       (.I(1'b0),
        .O(exe_imm[11]));
  OBUF \exe_imm_OBUF[12]_inst 
       (.I(1'b0),
        .O(exe_imm[12]));
  OBUF \exe_imm_OBUF[13]_inst 
       (.I(1'b0),
        .O(exe_imm[13]));
  OBUF \exe_imm_OBUF[14]_inst 
       (.I(1'b0),
        .O(exe_imm[14]));
  OBUF \exe_imm_OBUF[15]_inst 
       (.I(1'b0),
        .O(exe_imm[15]));
  OBUF \exe_imm_OBUF[16]_inst 
       (.I(1'b0),
        .O(exe_imm[16]));
  OBUF \exe_imm_OBUF[17]_inst 
       (.I(1'b0),
        .O(exe_imm[17]));
  OBUF \exe_imm_OBUF[18]_inst 
       (.I(1'b0),
        .O(exe_imm[18]));
  OBUF \exe_imm_OBUF[19]_inst 
       (.I(1'b0),
        .O(exe_imm[19]));
  OBUF \exe_imm_OBUF[1]_inst 
       (.I(1'b0),
        .O(exe_imm[1]));
  OBUF \exe_imm_OBUF[20]_inst 
       (.I(1'b0),
        .O(exe_imm[20]));
  OBUF \exe_imm_OBUF[21]_inst 
       (.I(1'b0),
        .O(exe_imm[21]));
  OBUF \exe_imm_OBUF[22]_inst 
       (.I(1'b0),
        .O(exe_imm[22]));
  OBUF \exe_imm_OBUF[23]_inst 
       (.I(1'b0),
        .O(exe_imm[23]));
  OBUF \exe_imm_OBUF[24]_inst 
       (.I(1'b0),
        .O(exe_imm[24]));
  OBUF \exe_imm_OBUF[25]_inst 
       (.I(1'b0),
        .O(exe_imm[25]));
  OBUF \exe_imm_OBUF[26]_inst 
       (.I(1'b0),
        .O(exe_imm[26]));
  OBUF \exe_imm_OBUF[27]_inst 
       (.I(1'b0),
        .O(exe_imm[27]));
  OBUF \exe_imm_OBUF[28]_inst 
       (.I(1'b0),
        .O(exe_imm[28]));
  OBUF \exe_imm_OBUF[29]_inst 
       (.I(1'b0),
        .O(exe_imm[29]));
  OBUF \exe_imm_OBUF[2]_inst 
       (.I(exe_regrt_OBUF[0]),
        .O(exe_imm[2]));
  OBUF \exe_imm_OBUF[30]_inst 
       (.I(1'b0),
        .O(exe_imm[30]));
  OBUF \exe_imm_OBUF[31]_inst 
       (.I(1'b0),
        .O(exe_imm[31]));
  OBUF \exe_imm_OBUF[3]_inst 
       (.I(1'b0),
        .O(exe_imm[3]));
  OBUF \exe_imm_OBUF[4]_inst 
       (.I(1'b0),
        .O(exe_imm[4]));
  OBUF \exe_imm_OBUF[5]_inst 
       (.I(1'b0),
        .O(exe_imm[5]));
  OBUF \exe_imm_OBUF[6]_inst 
       (.I(1'b0),
        .O(exe_imm[6]));
  OBUF \exe_imm_OBUF[7]_inst 
       (.I(1'b0),
        .O(exe_imm[7]));
  OBUF \exe_imm_OBUF[8]_inst 
       (.I(1'b0),
        .O(exe_imm[8]));
  OBUF \exe_imm_OBUF[9]_inst 
       (.I(1'b0),
        .O(exe_imm[9]));
  OBUF exe_m2reg_OBUF_inst
       (.I(exe_regrt_OBUF[1]),
        .O(exe_m2reg));
  OBUF \exe_pc_plus_4_OBUF[0]_inst 
       (.I(1'b0),
        .O(exe_pc_plus_4[0]));
  OBUF \exe_pc_plus_4_OBUF[10]_inst 
       (.I(exe_pc_plus_4_OBUF[10]),
        .O(exe_pc_plus_4[10]));
  OBUF \exe_pc_plus_4_OBUF[11]_inst 
       (.I(exe_pc_plus_4_OBUF[11]),
        .O(exe_pc_plus_4[11]));
  OBUF \exe_pc_plus_4_OBUF[12]_inst 
       (.I(exe_pc_plus_4_OBUF[12]),
        .O(exe_pc_plus_4[12]));
  OBUF \exe_pc_plus_4_OBUF[13]_inst 
       (.I(exe_pc_plus_4_OBUF[13]),
        .O(exe_pc_plus_4[13]));
  OBUF \exe_pc_plus_4_OBUF[14]_inst 
       (.I(exe_pc_plus_4_OBUF[14]),
        .O(exe_pc_plus_4[14]));
  OBUF \exe_pc_plus_4_OBUF[15]_inst 
       (.I(exe_pc_plus_4_OBUF[15]),
        .O(exe_pc_plus_4[15]));
  OBUF \exe_pc_plus_4_OBUF[16]_inst 
       (.I(exe_pc_plus_4_OBUF[16]),
        .O(exe_pc_plus_4[16]));
  OBUF \exe_pc_plus_4_OBUF[17]_inst 
       (.I(exe_pc_plus_4_OBUF[17]),
        .O(exe_pc_plus_4[17]));
  OBUF \exe_pc_plus_4_OBUF[18]_inst 
       (.I(exe_pc_plus_4_OBUF[18]),
        .O(exe_pc_plus_4[18]));
  OBUF \exe_pc_plus_4_OBUF[19]_inst 
       (.I(exe_pc_plus_4_OBUF[19]),
        .O(exe_pc_plus_4[19]));
  OBUF \exe_pc_plus_4_OBUF[1]_inst 
       (.I(1'b0),
        .O(exe_pc_plus_4[1]));
  OBUF \exe_pc_plus_4_OBUF[20]_inst 
       (.I(exe_pc_plus_4_OBUF[20]),
        .O(exe_pc_plus_4[20]));
  OBUF \exe_pc_plus_4_OBUF[21]_inst 
       (.I(exe_pc_plus_4_OBUF[21]),
        .O(exe_pc_plus_4[21]));
  OBUF \exe_pc_plus_4_OBUF[22]_inst 
       (.I(exe_pc_plus_4_OBUF[22]),
        .O(exe_pc_plus_4[22]));
  OBUF \exe_pc_plus_4_OBUF[23]_inst 
       (.I(exe_pc_plus_4_OBUF[23]),
        .O(exe_pc_plus_4[23]));
  OBUF \exe_pc_plus_4_OBUF[24]_inst 
       (.I(exe_pc_plus_4_OBUF[24]),
        .O(exe_pc_plus_4[24]));
  OBUF \exe_pc_plus_4_OBUF[25]_inst 
       (.I(exe_pc_plus_4_OBUF[25]),
        .O(exe_pc_plus_4[25]));
  OBUF \exe_pc_plus_4_OBUF[26]_inst 
       (.I(exe_pc_plus_4_OBUF[26]),
        .O(exe_pc_plus_4[26]));
  OBUF \exe_pc_plus_4_OBUF[27]_inst 
       (.I(exe_pc_plus_4_OBUF[27]),
        .O(exe_pc_plus_4[27]));
  OBUF \exe_pc_plus_4_OBUF[28]_inst 
       (.I(exe_pc_plus_4_OBUF[28]),
        .O(exe_pc_plus_4[28]));
  OBUF \exe_pc_plus_4_OBUF[29]_inst 
       (.I(exe_pc_plus_4_OBUF[29]),
        .O(exe_pc_plus_4[29]));
  OBUF \exe_pc_plus_4_OBUF[2]_inst 
       (.I(exe_pc_plus_4_OBUF[2]),
        .O(exe_pc_plus_4[2]));
  OBUF \exe_pc_plus_4_OBUF[30]_inst 
       (.I(exe_pc_plus_4_OBUF[30]),
        .O(exe_pc_plus_4[30]));
  OBUF \exe_pc_plus_4_OBUF[31]_inst 
       (.I(exe_pc_plus_4_OBUF[31]),
        .O(exe_pc_plus_4[31]));
  OBUF \exe_pc_plus_4_OBUF[3]_inst 
       (.I(exe_pc_plus_4_OBUF[3]),
        .O(exe_pc_plus_4[3]));
  OBUF \exe_pc_plus_4_OBUF[4]_inst 
       (.I(exe_pc_plus_4_OBUF[4]),
        .O(exe_pc_plus_4[4]));
  OBUF \exe_pc_plus_4_OBUF[5]_inst 
       (.I(exe_pc_plus_4_OBUF[5]),
        .O(exe_pc_plus_4[5]));
  OBUF \exe_pc_plus_4_OBUF[6]_inst 
       (.I(exe_pc_plus_4_OBUF[6]),
        .O(exe_pc_plus_4[6]));
  OBUF \exe_pc_plus_4_OBUF[7]_inst 
       (.I(exe_pc_plus_4_OBUF[7]),
        .O(exe_pc_plus_4[7]));
  OBUF \exe_pc_plus_4_OBUF[8]_inst 
       (.I(exe_pc_plus_4_OBUF[8]),
        .O(exe_pc_plus_4[8]));
  OBUF \exe_pc_plus_4_OBUF[9]_inst 
       (.I(exe_pc_plus_4_OBUF[9]),
        .O(exe_pc_plus_4[9]));
  OBUF \exe_rd1_OBUF[0]_inst 
       (.I(1'b0),
        .O(exe_rd1[0]));
  OBUF \exe_rd1_OBUF[10]_inst 
       (.I(1'b0),
        .O(exe_rd1[10]));
  OBUF \exe_rd1_OBUF[11]_inst 
       (.I(1'b0),
        .O(exe_rd1[11]));
  OBUF \exe_rd1_OBUF[12]_inst 
       (.I(1'b0),
        .O(exe_rd1[12]));
  OBUF \exe_rd1_OBUF[13]_inst 
       (.I(1'b0),
        .O(exe_rd1[13]));
  OBUF \exe_rd1_OBUF[14]_inst 
       (.I(1'b0),
        .O(exe_rd1[14]));
  OBUF \exe_rd1_OBUF[15]_inst 
       (.I(1'b0),
        .O(exe_rd1[15]));
  OBUF \exe_rd1_OBUF[16]_inst 
       (.I(1'b0),
        .O(exe_rd1[16]));
  OBUF \exe_rd1_OBUF[17]_inst 
       (.I(1'b0),
        .O(exe_rd1[17]));
  OBUF \exe_rd1_OBUF[18]_inst 
       (.I(1'b0),
        .O(exe_rd1[18]));
  OBUF \exe_rd1_OBUF[19]_inst 
       (.I(1'b0),
        .O(exe_rd1[19]));
  OBUF \exe_rd1_OBUF[1]_inst 
       (.I(1'b0),
        .O(exe_rd1[1]));
  OBUF \exe_rd1_OBUF[20]_inst 
       (.I(1'b0),
        .O(exe_rd1[20]));
  OBUF \exe_rd1_OBUF[21]_inst 
       (.I(1'b0),
        .O(exe_rd1[21]));
  OBUF \exe_rd1_OBUF[22]_inst 
       (.I(1'b0),
        .O(exe_rd1[22]));
  OBUF \exe_rd1_OBUF[23]_inst 
       (.I(1'b0),
        .O(exe_rd1[23]));
  OBUF \exe_rd1_OBUF[24]_inst 
       (.I(1'b0),
        .O(exe_rd1[24]));
  OBUF \exe_rd1_OBUF[25]_inst 
       (.I(1'b0),
        .O(exe_rd1[25]));
  OBUF \exe_rd1_OBUF[26]_inst 
       (.I(1'b0),
        .O(exe_rd1[26]));
  OBUF \exe_rd1_OBUF[27]_inst 
       (.I(1'b0),
        .O(exe_rd1[27]));
  OBUF \exe_rd1_OBUF[28]_inst 
       (.I(1'b0),
        .O(exe_rd1[28]));
  OBUF \exe_rd1_OBUF[29]_inst 
       (.I(1'b0),
        .O(exe_rd1[29]));
  OBUF \exe_rd1_OBUF[2]_inst 
       (.I(1'b0),
        .O(exe_rd1[2]));
  OBUF \exe_rd1_OBUF[30]_inst 
       (.I(1'b0),
        .O(exe_rd1[30]));
  OBUF \exe_rd1_OBUF[31]_inst 
       (.I(1'b0),
        .O(exe_rd1[31]));
  OBUF \exe_rd1_OBUF[3]_inst 
       (.I(1'b0),
        .O(exe_rd1[3]));
  OBUF \exe_rd1_OBUF[4]_inst 
       (.I(1'b0),
        .O(exe_rd1[4]));
  OBUF \exe_rd1_OBUF[5]_inst 
       (.I(1'b0),
        .O(exe_rd1[5]));
  OBUF \exe_rd1_OBUF[6]_inst 
       (.I(1'b0),
        .O(exe_rd1[6]));
  OBUF \exe_rd1_OBUF[7]_inst 
       (.I(1'b0),
        .O(exe_rd1[7]));
  OBUF \exe_rd1_OBUF[8]_inst 
       (.I(1'b0),
        .O(exe_rd1[8]));
  OBUF \exe_rd1_OBUF[9]_inst 
       (.I(1'b0),
        .O(exe_rd1[9]));
  OBUF \exe_rd2_OBUF[0]_inst 
       (.I(1'b0),
        .O(exe_rd2[0]));
  OBUF \exe_rd2_OBUF[10]_inst 
       (.I(1'b0),
        .O(exe_rd2[10]));
  OBUF \exe_rd2_OBUF[11]_inst 
       (.I(1'b0),
        .O(exe_rd2[11]));
  OBUF \exe_rd2_OBUF[12]_inst 
       (.I(1'b0),
        .O(exe_rd2[12]));
  OBUF \exe_rd2_OBUF[13]_inst 
       (.I(1'b0),
        .O(exe_rd2[13]));
  OBUF \exe_rd2_OBUF[14]_inst 
       (.I(1'b0),
        .O(exe_rd2[14]));
  OBUF \exe_rd2_OBUF[15]_inst 
       (.I(1'b0),
        .O(exe_rd2[15]));
  OBUF \exe_rd2_OBUF[16]_inst 
       (.I(1'b0),
        .O(exe_rd2[16]));
  OBUF \exe_rd2_OBUF[17]_inst 
       (.I(1'b0),
        .O(exe_rd2[17]));
  OBUF \exe_rd2_OBUF[18]_inst 
       (.I(1'b0),
        .O(exe_rd2[18]));
  OBUF \exe_rd2_OBUF[19]_inst 
       (.I(1'b0),
        .O(exe_rd2[19]));
  OBUF \exe_rd2_OBUF[1]_inst 
       (.I(1'b0),
        .O(exe_rd2[1]));
  OBUF \exe_rd2_OBUF[20]_inst 
       (.I(1'b0),
        .O(exe_rd2[20]));
  OBUF \exe_rd2_OBUF[21]_inst 
       (.I(1'b0),
        .O(exe_rd2[21]));
  OBUF \exe_rd2_OBUF[22]_inst 
       (.I(1'b0),
        .O(exe_rd2[22]));
  OBUF \exe_rd2_OBUF[23]_inst 
       (.I(1'b0),
        .O(exe_rd2[23]));
  OBUF \exe_rd2_OBUF[24]_inst 
       (.I(1'b0),
        .O(exe_rd2[24]));
  OBUF \exe_rd2_OBUF[25]_inst 
       (.I(1'b0),
        .O(exe_rd2[25]));
  OBUF \exe_rd2_OBUF[26]_inst 
       (.I(1'b0),
        .O(exe_rd2[26]));
  OBUF \exe_rd2_OBUF[27]_inst 
       (.I(1'b0),
        .O(exe_rd2[27]));
  OBUF \exe_rd2_OBUF[28]_inst 
       (.I(1'b0),
        .O(exe_rd2[28]));
  OBUF \exe_rd2_OBUF[29]_inst 
       (.I(1'b0),
        .O(exe_rd2[29]));
  OBUF \exe_rd2_OBUF[2]_inst 
       (.I(1'b0),
        .O(exe_rd2[2]));
  OBUF \exe_rd2_OBUF[30]_inst 
       (.I(1'b0),
        .O(exe_rd2[30]));
  OBUF \exe_rd2_OBUF[31]_inst 
       (.I(1'b0),
        .O(exe_rd2[31]));
  OBUF \exe_rd2_OBUF[3]_inst 
       (.I(1'b0),
        .O(exe_rd2[3]));
  OBUF \exe_rd2_OBUF[4]_inst 
       (.I(1'b0),
        .O(exe_rd2[4]));
  OBUF \exe_rd2_OBUF[5]_inst 
       (.I(1'b0),
        .O(exe_rd2[5]));
  OBUF \exe_rd2_OBUF[6]_inst 
       (.I(1'b0),
        .O(exe_rd2[6]));
  OBUF \exe_rd2_OBUF[7]_inst 
       (.I(1'b0),
        .O(exe_rd2[7]));
  OBUF \exe_rd2_OBUF[8]_inst 
       (.I(1'b0),
        .O(exe_rd2[8]));
  OBUF \exe_rd2_OBUF[9]_inst 
       (.I(1'b0),
        .O(exe_rd2[9]));
  OBUF \exe_regrt_OBUF[0]_inst 
       (.I(exe_regrt_OBUF[0]),
        .O(exe_regrt[0]));
  OBUF \exe_regrt_OBUF[1]_inst 
       (.I(exe_regrt_OBUF[1]),
        .O(exe_regrt[1]));
  OBUF \exe_regrt_OBUF[2]_inst 
       (.I(1'b0),
        .O(exe_regrt[2]));
  OBUF \exe_regrt_OBUF[3]_inst 
       (.I(1'b0),
        .O(exe_regrt[3]));
  OBUF \exe_regrt_OBUF[4]_inst 
       (.I(1'b0),
        .O(exe_regrt[4]));
  OBUF exe_wmem_OBUF_inst
       (.I(1'b0),
        .O(exe_wmem));
  OBUF exe_wreg_OBUF_inst
       (.I(exe_regrt_OBUF[1]),
        .O(exe_wreg));
  IBUF rst_IBUF_inst
       (.I(rst),
        .O(rst_IBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif

// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Mon Jul 27 15:43:38 2020
// Host        : LAPTOP-UP9RUFLK running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/Vivado_project18.3/Color_Snake/Color_Snake.srcs/sources_1/ip/dist_mem_gen_0/dist_mem_gen_0_stub.v
// Design      : dist_mem_gen_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7s15ftgb196-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "dist_mem_gen_v8_0_12,Vivado 2018.3" *)
module dist_mem_gen_0(a, d, dpra, clk, we, dpo)
/* synthesis syn_black_box black_box_pad_pin="a[14:0],d[2:0],dpra[14:0],clk,we,dpo[2:0]" */;
  input [14:0]a;
  input [2:0]d;
  input [14:0]dpra;
  input clk;
  input we;
  output [2:0]dpo;
endmodule

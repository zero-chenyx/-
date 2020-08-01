// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Mon Jul 27 17:14:06 2020
// Host        : LAPTOP-UP9RUFLK running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top RAM_G -prefix
//               RAM_G_ RAM_R_stub.v
// Design      : RAM_R
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7s15ftgb196-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "dist_mem_gen_v8_0_12,Vivado 2018.3" *)
module RAM_G(a, d, dpra, clk, we, dpo)
/* synthesis syn_black_box black_box_pad_pin="a[13:0],d[2:0],dpra[13:0],clk,we,dpo[2:0]" */;
  input [13:0]a;
  input [2:0]d;
  input [13:0]dpra;
  input clk;
  input we;
  output [2:0]dpo;
endmodule

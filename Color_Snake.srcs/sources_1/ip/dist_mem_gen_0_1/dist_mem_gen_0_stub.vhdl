-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Mon Jul 27 17:14:06 2020
-- Host        : LAPTOP-UP9RUFLK running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top dist_mem_gen_0 -prefix
--               dist_mem_gen_0_ RAM_R_stub.vhdl
-- Design      : RAM_R
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7s15ftgb196-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dist_mem_gen_0 is
  Port ( 
    a : in STD_LOGIC_VECTOR ( 13 downto 0 );
    d : in STD_LOGIC_VECTOR ( 2 downto 0 );
    dpra : in STD_LOGIC_VECTOR ( 13 downto 0 );
    clk : in STD_LOGIC;
    we : in STD_LOGIC;
    dpo : out STD_LOGIC_VECTOR ( 2 downto 0 )
  );

end dist_mem_gen_0;

architecture stub of dist_mem_gen_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "a[13:0],d[2:0],dpra[13:0],clk,we,dpo[2:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "dist_mem_gen_v8_0_12,Vivado 2018.3";
begin
end;

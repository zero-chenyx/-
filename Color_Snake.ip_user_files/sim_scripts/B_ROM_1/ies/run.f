-makelib ies_lib/xil_defaultlib -sv \
  "D:/vivado_18.3/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "D:/vivado_18.3/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "D:/vivado_18.3/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/blk_mem_gen_v8_4_2 \
  "../../../ipstatic/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../Color_Snake.srcs/sources_1/ip/B_ROM_1/sim/B_ROM.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib


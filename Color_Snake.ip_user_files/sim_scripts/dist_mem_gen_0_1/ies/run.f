-makelib ies_lib/xil_defaultlib -sv \
  "D:/vivado_18.3/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib ies_lib/xpm \
  "D:/vivado_18.3/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/dist_mem_gen_v8_0_12 \
  "../../../ipstatic/simulation/dist_mem_gen_v8_0.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../Color_Snake.srcs/sources_1/ip/dist_mem_gen_0_1/sim/dist_mem_gen_0.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib


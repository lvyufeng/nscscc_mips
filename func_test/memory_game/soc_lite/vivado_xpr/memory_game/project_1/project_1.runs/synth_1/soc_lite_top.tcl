# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {Common 17-41} -limit 10000000
create_project -in_memory -part xc7a200tfbg676-2

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/Users/CQU-LS/Desktop/func_test/memory_game/soc_lite/vivado_xpr/memory_game/project_1/project_1.cache/wt [current_project]
set_property parent.project_path C:/Users/CQU-LS/Desktop/func_test/memory_game/soc_lite/vivado_xpr/memory_game/project_1/project_1.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo c:/Users/CQU-LS/Desktop/func_test/memory_game/soc_lite/vivado_xpr/memory_game/project_1/project_1.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
add_files C:/Users/CQU-LS/Desktop/func_test/memory_game/soc_lite/soft/memory_game/data_ram.coe
add_files C:/Users/CQU-LS/Desktop/func_test/memory_game/soc_lite/soft/memory_game/inst_ram.coe
read_verilog C:/Users/CQU-LS/Desktop/func_test/memory_game/soc_lite/rtl/MIPS/defines.vh
read_verilog -library xil_defaultlib {
  C:/Users/CQU-LS/Desktop/func_test/memory_game/soc_lite/rtl/MIPS/LLbit.v
  C:/Users/CQU-LS/Desktop/func_test/memory_game/soc_lite/rtl/MIPS/ahb_bus_if.v
  C:/Users/CQU-LS/Desktop/func_test/memory_game/soc_lite/rtl/CONFREG/confreg.v
  C:/Users/CQU-LS/Desktop/func_test/memory_game/soc_lite/rtl/MIPS/cp0_reg.v
  C:/Users/CQU-LS/Desktop/func_test/memory_game/soc_lite/rtl/MIPS/ctrl.v
  C:/Users/CQU-LS/Desktop/func_test/memory_game/soc_lite/rtl/MIPS/div.v
  C:/Users/CQU-LS/Desktop/func_test/memory_game/soc_lite/rtl/MIPS/ex.v
  C:/Users/CQU-LS/Desktop/func_test/memory_game/soc_lite/rtl/MIPS/ex_mem.v
  C:/Users/CQU-LS/Desktop/func_test/memory_game/soc_lite/rtl/MIPS/hilo_reg.v
  C:/Users/CQU-LS/Desktop/func_test/memory_game/soc_lite/rtl/MIPS/id.v
  C:/Users/CQU-LS/Desktop/func_test/memory_game/soc_lite/rtl/MIPS/id_ex.v
  C:/Users/CQU-LS/Desktop/func_test/memory_game/soc_lite/rtl/MIPS/if_id.v
  C:/Users/CQU-LS/Desktop/func_test/memory_game/soc_lite/rtl/MIPS/mem.v
  C:/Users/CQU-LS/Desktop/func_test/memory_game/soc_lite/rtl/MIPS/mem_wb.v
  C:/Users/CQU-LS/Desktop/func_test/memory_game/soc_lite/rtl/MIPS/mips_top.v
  C:/Users/CQU-LS/Desktop/func_test/memory_game/soc_lite/rtl/MIPS/pc_reg.v
  C:/Users/CQU-LS/Desktop/func_test/memory_game/soc_lite/rtl/MIPS/regfile.v
  C:/Users/CQU-LS/Desktop/func_test/memory_game/soc_lite/rtl/AMBA/sramlike_to_ahb.v
  C:/Users/CQU-LS/Desktop/func_test/memory_game/soc_lite/rtl/TOP/soc_lite_top.v
}
read_ip -quiet C:/Users/CQU-LS/Desktop/func_test/memory_game/soc_lite/vivado_xpr/memory_game/xilinx_ip/data_ram/data_ram.xci
set_property used_in_implementation false [get_files -all c:/Users/CQU-LS/Desktop/func_test/memory_game/soc_lite/vivado_xpr/memory_game/xilinx_ip/data_ram/data_ram_ooc.xdc]
set_property is_locked true [get_files C:/Users/CQU-LS/Desktop/func_test/memory_game/soc_lite/vivado_xpr/memory_game/xilinx_ip/data_ram/data_ram.xci]

read_ip -quiet C:/Users/CQU-LS/Desktop/func_test/memory_game/soc_lite/vivado_xpr/memory_game/xilinx_ip/inst_ram/inst_ram.xci
set_property used_in_implementation false [get_files -all c:/Users/CQU-LS/Desktop/func_test/memory_game/soc_lite/vivado_xpr/memory_game/xilinx_ip/inst_ram/inst_ram_ooc.xdc]
set_property is_locked true [get_files C:/Users/CQU-LS/Desktop/func_test/memory_game/soc_lite/vivado_xpr/memory_game/xilinx_ip/inst_ram/inst_ram.xci]

read_ip -quiet C:/Users/CQU-LS/Desktop/func_test/memory_game/soc_lite/vivado_xpr/memory_game/xilinx_ip/ahblite_axi_bridge_0/ahblite_axi_bridge_0.xci
set_property used_in_implementation false [get_files -all c:/Users/CQU-LS/Desktop/func_test/memory_game/soc_lite/vivado_xpr/memory_game/xilinx_ip/ahblite_axi_bridge_0/ahblite_axi_bridge_0_ooc.xdc]
set_property is_locked true [get_files C:/Users/CQU-LS/Desktop/func_test/memory_game/soc_lite/vivado_xpr/memory_game/xilinx_ip/ahblite_axi_bridge_0/ahblite_axi_bridge_0.xci]

read_ip -quiet C:/Users/CQU-LS/Desktop/func_test/memory_game/soc_lite/vivado_xpr/memory_game/xilinx_ip/clk_pll/clk_pll.xci
set_property used_in_implementation false [get_files -all c:/Users/CQU-LS/Desktop/func_test/memory_game/soc_lite/vivado_xpr/memory_game/xilinx_ip/clk_pll/clk_pll_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/CQU-LS/Desktop/func_test/memory_game/soc_lite/vivado_xpr/memory_game/xilinx_ip/clk_pll/clk_pll.xdc]
set_property used_in_implementation false [get_files -all c:/Users/CQU-LS/Desktop/func_test/memory_game/soc_lite/vivado_xpr/memory_game/xilinx_ip/clk_pll/clk_pll_ooc.xdc]
set_property is_locked true [get_files C:/Users/CQU-LS/Desktop/func_test/memory_game/soc_lite/vivado_xpr/memory_game/xilinx_ip/clk_pll/clk_pll.xci]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/CQU-LS/Desktop/func_test/memory_game/soc_lite/vivado_xpr/soc_lite.xdc
set_property used_in_implementation false [get_files C:/Users/CQU-LS/Desktop/func_test/memory_game/soc_lite/vivado_xpr/soc_lite.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]

synth_design -top soc_lite_top -part xc7a200tfbg676-2


write_checkpoint -force -noxdef soc_lite_top.dcp

catch { report_utilization -file soc_lite_top_utilization_synth.rpt -pb soc_lite_top_utilization_synth.pb }
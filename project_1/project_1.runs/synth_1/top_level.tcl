# 
# Synthesis run script generated by Vivado
# 

debug::add_scope template.lib 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-1

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/Anthony/Documents/ECE530/project_1/project_1.cache/wt [current_project]
set_property parent.project_path C:/Users/Anthony/Documents/ECE530/project_1/project_1.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
add_files -quiet C:/Users/Anthony/Documents/ECE530/project_1/project_1.runs/clk_wiz_0_synth_1/clk_wiz_0.dcp
set_property used_in_implementation false [get_files C:/Users/Anthony/Documents/ECE530/project_1/project_1.runs/clk_wiz_0_synth_1/clk_wiz_0.dcp]
read_verilog -library xil_defaultlib C:/Users/Anthony/Documents/ECE530/project_1/project_1.srcs/sources_1/imports/lab2/colorlogic.v
read_vhdl -library xil_defaultlib {
  C:/Users/Anthony/Documents/ECE530/project_1/project_1.srcs/sources_1/new/vga_controller_640_60.vhd
  C:/Users/Anthony/Documents/ECE530/project_1/project_1.srcs/sources_1/new/top_level.vhd
}
read_xdc C:/Users/Anthony/Documents/ECE530/project_1/project_1.srcs/constrs_1/imports/new/decoder.xdc
set_property used_in_implementation false [get_files C:/Users/Anthony/Documents/ECE530/project_1/project_1.srcs/constrs_1/imports/new/decoder.xdc]

synth_design -top top_level -part xc7a100tcsg324-1
write_checkpoint -noxdef top_level.dcp
catch { report_utilization -file top_level_utilization_synth.rpt -pb top_level_utilization_synth.pb }

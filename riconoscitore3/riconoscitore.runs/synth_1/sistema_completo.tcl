# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param synth.incrementalSynthesisCache C:/Users/Christian/AppData/Roaming/Xilinx/Vivado/.Xil/Vivado-18944-LAPTOP-VF2Q2EVI/incrSyn
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xc7a50ticsg324-1L

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/Christian/Desktop/magistrale/progettiarchitetture/riconoscitore3/riconoscitore.cache/wt [current_project]
set_property parent.project_path C:/Users/Christian/Desktop/magistrale/progettiarchitetture/riconoscitore3/riconoscitore.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part digilentinc.com:nexys-a7-50t:part0:1.0 [current_project]
set_property ip_output_repo c:/Users/Christian/Desktop/magistrale/progettiarchitetture/riconoscitore3/riconoscitore.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  C:/Users/Christian/Desktop/magistrale/progettiarchitetture/riconoscitore3/riconoscitore.srcs/sources_1/new/debouncer.vhd
  C:/Users/Christian/Desktop/magistrale/progettiarchitetture/riconoscitore3/riconoscitore.srcs/sources_1/new/gestore_dato.vhd
  C:/Users/Christian/Desktop/magistrale/progettiarchitetture/riconoscitore3/riconoscitore.srcs/sources_1/new/gestore_modo.vhd
  C:/Users/Christian/Desktop/magistrale/progettiarchitetture/riconoscitore3/riconoscitore.srcs/sources_1/new/gestore_output.vhd
  C:/Users/Christian/Desktop/magistrale/progettiarchitetture/riconoscitore3/riconoscitore.srcs/sources_1/new/gestore_ric.vhd
  C:/Users/Christian/Desktop/magistrale/progettiarchitetture/riconoscitore3/riconoscitore.srcs/sources_1/new/riconoscitore1.vhd
  C:/Users/Christian/Desktop/magistrale/progettiarchitetture/riconoscitore3/riconoscitore.srcs/sources_1/new/riconoscitore2.vhd
  C:/Users/Christian/Desktop/magistrale/progettiarchitetture/riconoscitore3/riconoscitore.srcs/sources_1/new/sistema.vhd
  C:/Users/Christian/Desktop/magistrale/progettiarchitetture/riconoscitore3/riconoscitore.srcs/sources_1/new/sistema_completo.vhd
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/Christian/Desktop/magistrale/progettiarchitetture/riconoscitore3/riconoscitore.srcs/constrs_1/imports/digilent-xdc-master/Nexys-A7-50T-Master.xdc
set_property used_in_implementation false [get_files C:/Users/Christian/Desktop/magistrale/progettiarchitetture/riconoscitore3/riconoscitore.srcs/constrs_1/imports/digilent-xdc-master/Nexys-A7-50T-Master.xdc]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top sistema_completo -part xc7a50ticsg324-1L


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef sistema_completo.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file sistema_completo_utilization_synth.rpt -pb sistema_completo_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]

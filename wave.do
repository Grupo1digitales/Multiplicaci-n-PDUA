onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /project_tb/clk_tb
add wave -noupdate /project_tb/rst_tb
add wave -noupdate /project_tb/int_tb
add wave -noupdate /project_tb/PERIFIN_tb
add wave -noupdate /project_tb/PERIF2_tb
add wave -noupdate /project_tb/PERIF3_tb
add wave -noupdate /project_tb/PERIF1_tb
add wave -noupdate -expand /project_tb/DUT/RB/array_reg
add wave -noupdate /project_tb/DUT/RAM/r_data
add wave -noupdate /project_tb/DUT/RAM/ram
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {118019324 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {210 us}

onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mnist_nn_tb/clk
add wave -noupdate /mnist_nn_tb/reset
add wave -noupdate /mnist_nn_tb/inp_count
add wave -noupdate /mnist_nn_tb/w_0
add wave -noupdate /mnist_nn_tb/w_1
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
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
WaveRestoreZoom {1699050 ps} {1700050 ps}

onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /neuron_tb/inp_ready
add wave -noupdate /neuron_tb/reset
add wave -noupdate /neuron_tb/clk
add wave -noupdate -radix hexadecimal /neuron_tb/inp_data
add wave -noupdate /neuron_tb/weight
add wave -noupdate /neuron_tb/bias
add wave -noupdate -radix unsigned /neuron_tb/count
add wave -noupdate /neuron_tb/product_q16_16
add wave -noupdate /neuron_tb/product
add wave -noupdate /neuron_tb/acc
add wave -noupdate /neuron_tb/out
add wave -noupdate /neuron_tb/out_ready
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5241 ps} 0}
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
WaveRestoreZoom {0 ps} {26985 ps}

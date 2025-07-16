onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mnist_nn_tb/clk
add wave -noupdate /mnist_nn_tb/reset
add wave -noupdate /mnist_nn_tb/inp_ready
add wave -noupdate -radix unsigned /mnist_nn_tb/inp_count
add wave -noupdate /mnist_nn_tb/inp_data
add wave -noupdate /mnist_nn_tb/w_0
add wave -noupdate /mnist_nn_tb/w_1
add wave -noupdate /mnist_nn_tb/w_2
add wave -noupdate /mnist_nn_tb/w_3
add wave -noupdate /mnist_nn_tb/w_4
add wave -noupdate /mnist_nn_tb/w_5
add wave -noupdate /mnist_nn_tb/w_6
add wave -noupdate /mnist_nn_tb/w_7
add wave -noupdate /mnist_nn_tb/w_8
add wave -noupdate /mnist_nn_tb/w_9
add wave -noupdate /mnist_nn_tb/n0_ready
add wave -noupdate /mnist_nn_tb/n1_ready
add wave -noupdate /mnist_nn_tb/n2_ready
add wave -noupdate /mnist_nn_tb/n3_ready
add wave -noupdate /mnist_nn_tb/n4_ready
add wave -noupdate /mnist_nn_tb/n5_ready
add wave -noupdate /mnist_nn_tb/n6_ready
add wave -noupdate /mnist_nn_tb/n7_ready
add wave -noupdate /mnist_nn_tb/n8_ready
add wave -noupdate /mnist_nn_tb/n9_ready
add wave -noupdate -radix unsigned /mnist_nn_tb/n0_out
add wave -noupdate -radix unsigned /mnist_nn_tb/n1_out
add wave -noupdate -radix unsigned /mnist_nn_tb/n2_out
add wave -noupdate -radix unsigned /mnist_nn_tb/n3_out
add wave -noupdate -radix unsigned /mnist_nn_tb/n4_out
add wave -noupdate -radix unsigned /mnist_nn_tb/n5_out
add wave -noupdate -radix unsigned /mnist_nn_tb/n6_out
add wave -noupdate -radix unsigned /mnist_nn_tb/n7_out
add wave -noupdate -radix unsigned /mnist_nn_tb/n8_out
add wave -noupdate -radix unsigned /mnist_nn_tb/n9_out
add wave -noupdate /mnist_nn_tb/prediction_confidence
add wave -noupdate -radix unsigned /mnist_nn_tb/predicted_digit
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1577942 ps} 0}
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
WaveRestoreZoom {1570202 ps} {1582482 ps}

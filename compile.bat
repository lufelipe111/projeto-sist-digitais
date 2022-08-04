ghdl -a seq_rec.vhd
ghdl -a seq_rec_testbench.vhd
ghdl -e seq_rec_testbench
ghdl -r seq_rec_testbench --wave=result.ghw --stop-time=1300ns
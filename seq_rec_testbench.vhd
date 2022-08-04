-- Testbench for sequence recognizer example
library ieee;
use ieee.std_logic_1164.all;
-- use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity seq_rec_testbench is
end seq_rec_testbench;

architecture testbench of seq_rec_testbench is
	signal clock, X, reset, Z: std_logic;
	signal test_sequence : std_logic_vector(0 to 10)
		:= "01001100110";

	constant PERIOD : time := 100 ns;

	component seq_rec is
	port(CLK, RESET, X: in std_logic;
		Z: out std_logic);
	end component;

begin
	u1: seq_rec port map(clock, reset, X, Z);

	-- This process applies reset and
	-- then applies the test sequence to input X
	apply_inputs: process
	begin
		reset <= '1';
		X <='0';
		-- ensure that inputs are applied
		-- away from the active clock edge
		wait for 5*PERIOD/4;
		reset <= '0';
		for i in 0 to 10 loop
			X <= test_sequence(i);
			wait for PERIOD;
		end loop;
		wait; --wait forever
	end process;

	-- This process provides the clock pulses
	generate_clock: process
	begin
		clock <= '1';
		wait for PERIOD/2;
		clock <= '0';
		wait for PERIOD/2;
	end process;
end testbench;

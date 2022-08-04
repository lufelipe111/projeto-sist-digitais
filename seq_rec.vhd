-- Sequence Recognizer: VHDL Process Description
-- (See Figure 4-18(d) for state diagram)
library ieee;
use ieee.std_logic_1164.all;

entity seq_rec is
	port(CLK, RESET, X: in std_logic;
		Z: out std_logic);
end seq_rec;

architecture process_3 of seq_rec is
	type state_type is (A, B, C, D, E);
	signal state, next_state : state_type;
begin

-- Process 1 - state_register: implements ­
-- state storage with asynchronous reset.
	state_register: process (CLK, RESET)
	begin
		if (RESET = '1') then
			state <= A;
		elsif (CLK'event and CLK = '1') then
			state <= next_state;
		end if;
	end process;

-- Process 2 - next_state_function: implements next state as
-- a function of input X and state.
	next_state_func: process (X, state)
	begin
		case state is
			when A =>
				if X = '1' then
					next_state <= B;
				else
					next_state <= A;
				end if;
			when B =>
				if X = '1' then
					next_state <= B;
				else
					next_state <= C;
				end if;
			when C =>
				if X = '1' then
					next_state <= B;
				else
					next_state <= D;
				end if;
			when D =>
				if X = '1' then
					next_state <= E;
				else
					next_state <= A;
				end if;
			when E =>
				if X = '1' then
					next_state <= B;
				else
					next_state <= A;
				end if;
		end case;
	end process;

-- Process 3 - output_function: implements output as function
-- of input X and state.
	output_func: process (X, state)
	begin
		case state is
			when A =>
				Z <= '0';
			when B =>
				Z <= '0';
			when C =>
				Z <= '0';
			when D =>
				Z <= '0';
			when E =>
				Z <= '1';
		end case;
	end process;
end;

-- Sequence Recognizer: VHDL Process Description
-- (See Figure 4-18(d) for state diagram)
library ieee;
use ieee.std_logic_1164.all;

entity seq_rec_1001 is
	port(CLK, RESET, X: in std_logic;
		Z: out std_logic);
end seq_rec_1001;

architecture process_3 of seq_rec_1001 is
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
		Z <= '0';
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
				Z <= '1';
				if X = '1' then
					next_state <= B;
				else
					next_state <= C;
				end if;
		end case;
	end process;

end;

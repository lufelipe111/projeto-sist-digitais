-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "08/04/2022 20:47:30"
                                                            
-- Vhdl Test Bench template for design  :  seq_rec_1001
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY seq_rec_1001_vhd_tst IS
END seq_rec_1001_vhd_tst;
ARCHITECTURE seq_rec_1001_arch OF seq_rec_1001_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CLK : STD_LOGIC;
SIGNAL RESET : STD_LOGIC;
SIGNAL X : STD_LOGIC;
SIGNAL Z : STD_LOGIC;
SIGNAL TEST_SEQUENCE : std_logic_vector(0 to 10)
		:= "01001001100";
		
CONSTANT PERIOD : time := 100 ns;
		
COMPONENT seq_rec_1001
	PORT (
	CLK : IN STD_LOGIC;
	RESET : IN STD_LOGIC;
	X : IN STD_LOGIC;
	Z : BUFFER STD_LOGIC
	);
END COMPONENT;

BEGIN
	i1 : seq_rec_1001
	PORT MAP (
-- list connections between master ports and signals
	CLK => CLK,
	RESET => RESET,
	X => X,
	Z => Z
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
	RESET <= '1';
	X <='0';
	-- ensure that inputs are applied
	-- away from the active clock edge
	WAIT FOR 5*PERIOD/4;
	RESET <= '0';
	
	FOR I IN 0 TO 10 LOOP
		X <= TEST_SEQUENCE(I);
		WAIT FOR PERIOD;
	END LOOP;
	
	WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
   CLK <= '1';
	WAIT FOR PERIOD/2;
	CLK <= '0';
	WAIT FOR PERIOD/2;                                                       
END PROCESS always;                                          
END seq_rec_1001_arch;

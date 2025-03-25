-- Section 205, Team 8, Lab2_REPORT, Bryant Ruan, Jennifer Yu
library ieee;
use ieee.std_logic_1164.all;


entity full_adder_1bit is 
port (
	INPUT_B,INPUT_A 						   : in std_logic;  -- inputs from switches
	CARRY_IN								    	: in std_logic;  -- carry outs from other 1bit adders
	FULL_ADDER_CARRY_OUTPUT					: out std_logic; -- carry digit output
	FULL_ADDER_SUM_OUTPUT					: out std_logic  -- sum output
);

end full_adder_1bit;

architecture logic of full_adder_1bit is

	-- signals for first layer of gates
	signal HALF_ADDER_CARRY_OUTPUT		: std_logic;
	signal HALF_ADDER_SUM_OUTPUT			: std_logic;


begin
	
	-- first layer of logic gates
	HALF_ADDER_CARRY_OUTPUT <= (INPUT_A AND INPUT_B);
	HALF_ADDER_SUM_OUTPUT <= (INPUT_A XOR INPUT_B);
	
	-- outer gates
	FULL_ADDER_CARRY_OUTPUT <= (CARRY_IN AND HALF_ADDER_SUM_OUTPUT) OR (HALF_ADDER_CARRY_OUTPUT);
	FULL_ADDER_SUM_OUTPUT <= HALF_ADDER_SUM_OUTPUT XOR CARRY_IN;
				  
end logic;
	
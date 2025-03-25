-- Section 205, Team 8, Lab2_REPORT, Bryant Ruan, Jennifer Yu
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- inverts push buttons
ENTITY PB_Inverters IS
	PORT
	(
		pb_n : IN std_logic_vector(3 downto 0); -- active low input pbs
		pb : OUT std_logic_vector(3 downto 0)   -- active high output pbs
	);
END PB_Inverters;

ARCHITECTURE gates OF PB_Inverters IS

BEGIN 

-- to use active high
pb <= not(pb_n); 

END gates;
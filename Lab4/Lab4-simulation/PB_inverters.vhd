-- Section 205, Team 8, Lab4_REPORT, Bryant Ruan, Jennifer Yu

-- Import packages
library ieee;
use ieee.std_logic_1164.all;

-- Defines PB_inverters entity, which inverts button inputs
entity PB_inverters is port (
	rst_n				: in	std_logic; -- Input reset bit
	rst				: out std_logic; -- Output inverted reset bit
 	pb_n_filtered	: in  std_logic_vector (3 downto 0); -- Input 4 bit vector of filtered buttons
	pb					: out	std_logic_vector(3 downto 0)	 -- Output 4 bit vector for inverted buttons						 
	); 
end PB_inverters;

-- Defines logic of PB_inverters
architecture ckt of PB_inverters is

begin
	rst <= NOT(rst_n); -- Inverts the reset
	pb <= NOT(pb_n_filtered); -- Inverts the filtered buttons

end ckt;
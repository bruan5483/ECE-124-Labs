-- Section 205, Team 8, Lab2_REPORT, Bryant Ruan, Jennifer Yu
library ieee;
use ieee.std_logic_1164.all;


entity small_hex_mux is 
port (
	hex_num										: in std_logic_vector(3 downto 0); -- hex_B or hex_A input
	hex_other									: in std_logic_vector(3 downto 0); -- carry or sum input
	pb_select									: in std_logic;						  -- push button input
	hex_out										: out std_logic_vector(3 downto 0) -- the hex output
);

end small_hex_mux;

architecture mux_logic of small_hex_mux is

begin

	-- for the multiplexing of two hex input busses
	with pb_select select
	hex_out <= hex_num when '0',
				  hex_other when '1';
				  
	end mux_logic;
	
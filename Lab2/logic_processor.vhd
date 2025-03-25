-- Section 205, Team 8, Lab2_REPORT, Bryant Ruan, Jennifer Yu
library ieee;
use ieee.std_logic_1164.all;


entity logic_processor is 
port (
	logic_in1,logic_in0 						: in std_logic_vector(3 downto 0); -- switch inputs
	mux_select									: in std_logic_vector(1 downto 0); -- push buttons
	logic_out									: out std_logic_vector(3 downto 0) -- the hex output
);

end logic_processor;

architecture logic of logic_processor is

begin

	-- for the multiplexing of two hex input busses
	with mux_select(1 downto 0) select
	logic_out <= (logic_in0 AND logic_in1) when "00",
				  (logic_in0 OR logic_in1) when "01",
				  (logic_in0 XOR logic_in1) when "10",
				  (logic_in0 XNOR logic_in1) when "11";
				  
	end logic;
	
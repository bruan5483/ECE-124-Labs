-- Section 205, Team 8, Lab4_REPORT, Bryant Ruan, Jennifer Yu

-- Import packages
library ieee;
use ieee.std_logic_1164.all;

-- Defines holding_register entity, which holds button input valuees until logic gate conditions are met
entity holding_register is port (

			clk					: in std_logic; -- Clock input
			reset					: in std_logic; -- Reset input
			register_clr		: in std_logic; -- Register clear input
			din					: in std_logic; -- Data input bit
			dout					: out std_logic -- Data output bit
  );
 end holding_register;
 
 -- Defines the logic of holding_register
 architecture circuit of holding_register is

	Signal sreg				: std_logic; -- Signal to hold register values
	Signal d					: std_logic; -- Signal for holding evaluated input logic


BEGIN
	-- Evaluates input logic and assigns to signal d
	d <= (sreg OR din) AND (NOT(register_clr OR reset));
	
	-- Synchronous process that advances based on changes in the clock input, syncing the holding register
	sync_process : process(clk)
		BEGIN
			-- Do signal & output assignment if clock is on it's rising edge
			if(rising_edge(clk)) then
				sreg <= d; -- Assigns d to the register signal
				dout <= d; -- Assigns d to the data output bit
			end if;
		end process sync_process;
end;
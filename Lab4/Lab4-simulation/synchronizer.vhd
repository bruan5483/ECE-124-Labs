-- Section 205, Team 8, Lab4_REPORT, Bryant Ruan, Jennifer Yu

-- Import packages
library ieee;
use ieee.std_logic_1164.all;

-- Defines synchronizer entity, which takes in the button inputs asynchronously and synchronizes the outputs with the clock
entity synchronizer is port (

			clk		: in std_logic; -- Clock input
			reset		: in std_logic; -- Reset input
			din		: in std_logic; -- Input data bit
			dout		: out std_logic -- Output data bit
  );
 end synchronizer;
 
-- Defines logic of the synchronizer
architecture circuit of synchronizer is

	-- Signal (2-bit vector) that keeps track of synchronizer register components
	Signal sreg		: std_logic_vector(1 downto 0);

BEGIN
	-- Process construct that advances based on changes in the clock input
	sync_process : process(clk)
	
	BEGIN
		-- Evaluate logic if clock is on it's rising edge
		if rising_edge(clk) then
			-- If reset is active then reset the register contents both to 0
			if reset = '1' then
				sreg <= "00";
				
			-- If reset is inactive, shift the register (DFF) contents one to the right
			else
				sreg(1) <= sreg(0); -- Shifts from first register to the second
				sreg(0) <= din;	  -- Assigns data input to the first register
			end if;
		end if;
	end process sync_process;
	
	dout <= sreg(1); -- Assigns the second register contents to the data ouput
end;
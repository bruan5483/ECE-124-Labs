library ieee;
use ieee.std_logic_1164.all;


entity Energy_Monitor is port (
   AGTB,AEQB,ALTB															: in	std_logic;
   vacation_mode, MC_test_mode, window_open, door_open		: in	std_logic;
	furnace, at_temp, AC, blower, window, door, vacation  	: out	std_logic;
	decrease, increase, run												: out	std_logic
	); 
end Energy_Monitor;

architecture energy_monitor_ckt of Energy_Monitor is

--signal EQ_PASS, GT_PASS, LT_PASS : std_logic;

begin

Energy_Monitor1: 
PROCESS (MC_test_mode, window_open, door_open) is
 
begin
	if ((AEQB = '1') or (window_open = '1') or (door_open = '1') or (MC_test_mode = '1')) then
		run <= '0';
		blower <= '0';
		increase <= '0';
		decrease <= '0';
		
	else
		run <= '1';
		blower <= '1';
		
		if (AGTB = '1') then
			increase <= '1';
			decrease <= '0';
		else 
			increase <= '0';
			decrease <= '1';	
		end if;
		
	end if;
	
	if (ALTB = '1') then
		AC <= '1';
	else
		AC <= '0';
	end if;
	
	if (AGTB = '1') then
		furnace <= '1';
	else
		furnace <= '0';
	end if;
	
	if (AEQB = '1') then
		at_temp <= '1';
	else
		at_temp <= '0';
	end if;
	
	if (door_open = '1') then
		door <= '1';
	else 
		door <= '0';
	end if;
	
	if (window_open = '1') then
		window <= '1';
	else 
		window <= '0';
	end if;
	
	if (vacation_mode = '1') then
		vacation <= '1';
	else 
		vacation <= '0';
	end if;
		
		
end process;

end;
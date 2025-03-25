library ieee;
use ieee.std_logic_1164.all;


entity LogicalStep_Lab3_top is port (
	clkin_50		: in 	std_logic;
	pb_n			: in	std_logic_vector(3 downto 0);
 	sw   			: in  std_logic_vector(7 downto 0); 	
	
	----------------------------------------------------
--	HVAC_temp : out std_logic_vector(3 downto 0); -- used for simulations only. Comment out for FPGA download compiles.
	----------------------------------------------------
	
   leds			: out std_logic_vector(7 downto 0);
   seg7_data 	: out std_logic_vector(6 downto 0); -- 7-bit outputs to a 7-segment
	seg7_char1  : out	std_logic;				    		-- seg7 digit1 selector
	seg7_char2  : out	std_logic				    		-- seg7 digit2 selector
	
); 
end LogicalStep_Lab3_top;

architecture design of LogicalStep_Lab3_top is
--
-- Provided Project Components Used
------------------------------------------------------------------- 

component SevenSegment  port (
   hex	   :  in  std_logic_vector(3 downto 0);   -- The 4 bit data to be displayed
   sevenseg :  out std_logic_vector(6 downto 0)    -- 7-bit outputs to a 7-segment
); 
end component SevenSegment;

component segment7_mux port (
          clk        : in  std_logic := '0';
			 DIN2 		: in  std_logic_vector(6 downto 0);	
			 DIN1 		: in  std_logic_vector(6 downto 0);
			 DOUT			: out	std_logic_vector(6 downto 0);
			 DIG2			: out	std_logic;
			 DIG1			: out	std_logic
        );
end component segment7_mux;
--	
component Tester port (
 MC_TESTMODE				: in  std_logic;
 I1EQI2,I1GTI2,I1LTI2	: in	std_logic;
	input1					: in  std_logic_vector(3 downto 0);
	input2					: in  std_logic_vector(3 downto 0);
	TEST_PASS  				: out	std_logic							 
	); 
	end component;
----	
component HVAC 	port (
	HVAC_SIM					: in boolean;
	clk						: in std_logic; 
	run		   			: in std_logic;
	increase, decrease	: in std_logic;
	temp						: out std_logic_vector (3 downto 0)
	);
end component;
------------------------------------------------------------------
-- Add any Other Components here
component Compx4 is port(
	A4, B4					: in std_logic_vector(3 downto 0);
	AGTB4, AEQB4, ALTB4 	: out std_logic
);
end component;

component Bidir_shift_reg port (
	CLK				: in std_logic := '0';
	RESET				: in std_logic := '0';
	CLK_EN			: in std_logic := '0';
	LEFT0_RIGHT1	: in std_logic := '0';
	REG_BITS			: out std_logic_vector(7 downto 0)
);
end component;

component U_D_Bin_Counter8bit is port
	(
		CLK				: in std_logic;
		RESET				: in std_logic;
		CLK_EN			: in std_logic;
		UP1_DOWN0		: in std_logic;
		COUNTER_BITS	: out std_logic_vector(7 downto 0)
	);
end component;

component PB_Inverters IS
	PORT
	(
		pb_n : IN std_logic_vector(3 downto 0); -- active low input pbs
		pb : OUT std_logic_vector(3 downto 0)   -- active high output pbs
	);
end component;

component two_to_one_mux is 
port (
	desired_temp								: in std_logic_vector(3 downto 0); 
	vacation_temp								: in std_logic_vector(3 downto 0); 
	vacation_mode								: in std_logic;						 
	mux_temp										: out std_logic_vector(3 downto 0) 
);

end component;

component Energy_Monitor is port (
   AGTB,AEQB,ALTB															: in	std_logic;
   vacation_mode, MC_test_mode, window_open, door_open		: in	std_logic;
	furnace, at_temp, AC, blower, window, door, vacation  	: out	std_logic;
	decrease, increase, run												: out	std_logic
	); 
end component;
------------------------------------------------------------------

------------------------------------------------------------------	
-- Create any additional internal signals to be used
------------------------------------------------------------------	
constant HVAC_SIM : boolean := FALSE; -- set to FALSE when compiling for FPGA download to LogicalStep board 
                                      -- or TRUE for doing simulations with the HVAC Component
------------------------------------------------------------------	

-- global clock
signal clk_in					: std_logic;
signal hex_A, hex_B 			: std_logic_vector(3 downto 0);
signal hexA_7seg, hexB_7seg: std_logic_vector(6 downto 0);

signal pb 						: std_logic_vector(3 downto 0);
signal desired_temp			: std_logic_vector(3 downto 0);
signal vacation_temp			: std_logic_vector(3 downto 0);
signal vacation_mode			: std_logic;
signal current_temp			: std_logic_vector(3 downto 0);
signal mux_temp				: std_logic_vector(3 downto 0);
signal MC_test_mode			: std_logic;
signal window_open			: std_logic;
signal door_open				: std_logic;
signal decrease				: std_logic;
signal increase				: std_logic;
signal run						: std_logic;
signal AGTB						: std_logic;
signal AEQB						: std_logic;
signal ALTB						: std_logic;

------------------------------------------------------------------- 
begin -- Here the circuit begins

clk_in <= clkin_50;	--hook up the clock input

-- temp inputs hook-up to internal busses.
	desired_temp <= sw(3 downto 0);
	vacation_temp <= sw(7 downto 4);
	
	vacation_mode <= pb(3);
	MC_test_mode <= pb(2);
	window_open <= pb(1);
	door_open <= pb(0);
	
--	HVAC_TEMP <= current_temp; --comment out for FPGA download

inst1: sevensegment port map (mux_temp, hexA_7seg); --check which is a, which is b
inst2: sevensegment port map (current_temp, hexB_7seg);
inst3: segment7_mux port map (clk_in, hexA_7seg, hexB_7seg, seg7_data, seg7_char2, seg7_char1);
inst4: compx4 port map(mux_temp, current_temp, AGTB, AEQB, ALTB);
inst5: Tester port map(MC_test_mode, AEQB, AGTB, ALTB, desired_temp, current_temp, leds(6)); --check order of desired+current 
--inst5: bidir_shift_reg port map(clk_in, NOT(pb_n(0)), sw(0), sw(1), leds(7 downto 0));
--inst6: U_D_Bin_Counter8bit port map(clk_in, NOT(pb_n(0)), sw(0), sw(1), leds(7 downto 0));
inst7: HVAC port map(HVAC_SIM, clk_in, run, increase, decrease, current_temp);
inst8: PB_Inverters port map(pb_n, pb);
inst9: two_to_one_mux port map (desired_temp, vacation_temp, vacation_mode, mux_temp);
inst10: Energy_Monitor port map(AGTB, AEQB, ALTB, vacation_mode, MC_test_mode, window_open, door_open, leds(0), leds(1), leds(2), leds(3), leds(4), leds(5), leds(7), decrease, increase, run);
		
end design;


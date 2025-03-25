-- Section 205, Team 8, Lab4_REPORT, Bryant Ruan, Jennifer Yu

-- Import packages
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

-- Declares the top file/overall circuit input and output bits/vectors
ENTITY LogicalStep_Lab4_top IS
   PORT
	(
   clkin_50	    : in	std_logic;								-- The 50 MHz FPGA Clockinput
	rst_n			: in	std_logic;								-- The RESET input (ACTIVE LOW)
	pb_n			: in	std_logic_vector(3 downto 0); 	-- The push-button inputs (ACTIVE LOW)
 	sw   			: in  	std_logic_vector(7 downto 0); -- The switch inputs
   leds			: out 	std_logic_vector(7 downto 0);	-- for displaying the the lab4 project details
	-------------------------------------------------------------
	-- you can add temporary output ports here if you need to debug your design 
	-- or to add internal signals for your simulations
	-------------------------------------------------------------
	
   seg7_data 	: out 	std_logic_vector(6 downto 0); -- 7-bit outputs to a 7-segment
	seg7_char1  : out	std_logic;							-- seg7 digi selectors
	seg7_char2  : out	std_logic							-- seg7 digi selectors
	
	-- Output signals for final waveform
	--	sim_sm_clken		: out std_logic; 		-- simulation signal for sm_clken
	--	sim_blink_sig		: out std_logic; 		-- simulation signal for blink_sig
	--	sim_ns_red			: out std_logic; 		-- simulation signal for ns_red
	--	sim_ns_amber		: out std_logic; 		-- simulation signal for ns_amber
	--	sim_ns_green		: out std_logic; 		-- simulation signal for ns_green
	--	sim_ew_red			: out std_logic; 		-- simulation signal for ew_red
	--	sim_ew_amber		: out std_logic; 		-- simulation signal for ew_amber
	--	sim_ew_green		: out std_logic		-- simulation signal for ew_green
	);
END LogicalStep_Lab4_top;

-- Defines the architecture of the overall circuit
ARCHITECTURE SimpleCircuit OF LogicalStep_Lab4_top IS

	-- Defines the segment7_mux component
   component segment7_mux port (
          clk        : in  std_logic := '0';
			 DIN2 		: in  std_logic_vector(6 downto 0);	--bits 6 to 0 represent segments G,F,E,D,C,B,A
			 DIN1 		: in  std_logic_vector(6 downto 0); --bits 6 to 0 represent segments G,F,E,D,C,B,A
			 DOUT			: out	std_logic_vector(6 downto 0); -- Output 7 bit vector
			 DIG2			: out	std_logic; -- Output 1 bit for digit 2
			 DIG1			: out	std_logic  -- Output 1 bit for digit 1
   );
   end component;

	-- Defines the clock_generator component
   component clock_generator port (
			sim_mode			: in boolean;	  -- Boolean for simulation true/false status
			reset				: in std_logic;  -- Input reset bit
         clkin      		: in  std_logic; -- Clock input bit
			sm_clken			: out	std_logic; -- Clock enable output bit
			blink		  		: out std_logic  -- Blink output bit
  );
   end component;
	
	-- Defines the pb_filters component
   component pb_filters port (
			clkin				: in std_logic; -- Input clock bit
			rst_n				: in std_logic; -- Reset input bit (active low)
			rst_n_filtered	: out std_logic; -- Filtered reset output bit (active low)
			pb_n				: in  std_logic_vector (3 downto 0); -- Input 4 bit vector of buttons (active low)
			pb_n_filtered	: out	std_logic_vector(3 downto 0)	 -- Output filtered 4 bit vector of buttons
 );
   end component;

	-- Defines the pb_inverters component
	component pb_inverters port (
			rst_n				: in  std_logic; -- Input reset bit
			rst				: out	std_logic; -- Output inverted reset bit
			pb_n_filtered	: in  std_logic_vector (3 downto 0); -- Input 4 bit vector of filtered buttons
			pb					: out	std_logic_vector(3 downto 0)   -- Output 4 bit vector for inverted buttons
  );
   end component;
	
	-- Defines the synchronizer component
	component synchronizer port(
			clk					: in std_logic; -- Clock input
			reset					: in std_logic; -- Reset input
			din					: in std_logic; -- Input data bit
			dout					: out std_logic -- Output data bit
  );
   end component; 

	 -- Defines the holding_register component
  component holding_register port (
			clk					: in std_logic; -- Clock input
			reset					: in std_logic; -- Reset input
			register_clr		: in std_logic; -- Register clear input
			din					: in std_logic; -- Data input bit
			dout					: out std_logic -- Data output bit
  );
  end component;

  -- Defines the State_Machine component
	component State_Machine port (
		clk_input 	: in std_logic;  -- Clock input bit
		reset			: in std_logic;  -- Reset input bit
		sm_clken		: in std_logic;  -- Enable input bit
		blink_sig	: in std_logic;  -- Blink signal bit
		sw_0			: in std_logic;  -- online/offline mode control (active high, '1' is offline)
		ns_request	: in std_logic;  -- North/South pedestrian request input bit
		ew_request	: in std_logic;  -- East/West pedestrian request input bit
		
		ns_red, ns_amber, ns_green : out std_logic; -- North/South ouput bits for red, amber, and green traffic lights
		ew_red, ew_amber, ew_green : out std_logic; -- East/West ouput bits for red, amber, and green traffic lights
		ns_crossing : out std_logic; -- North/South crossing period output bit
		ew_crossing : out std_logic; -- East/West crossing period output bit
		state_number : out std_logic_vector(3 downto 0); -- Output 4 bit vector to represent state as binary number on leds(7 downto 4)
		ns_clear : out std_logic; -- Output to clear North/South pedestrian requests
		ew_clear : out std_logic -- Output to clear East/West pedestrian requests
	);
	end component;  
----------------------------------------------------------------------------------------------------
	CONSTANT	sim_mode									: boolean := FALSE;  			  -- set to FALSE for LogicalStep board downloads																						-- set to TRUE for SIMULATIONS
	SIGNAL rst, rst_n_filtered, synch_rst		: std_logic;		  				  -- Signals for holding reset values
	SIGNAL sm_clken, blink_sig						: std_logic; 		  				  -- Signals for holding the enable and blink values
	SIGNAL pb_n_filtered, pb						: std_logic_vector(3 downto 0); -- Signals for holding the button values
	SIGNAL ns_request, ew_request 				: std_logic; 						  -- Signals for holding the pedestrian crossing requests
	
	SIGNAL ns_red, ns_amber, ns_green : std_logic; -- North/South red, amber, and green traffic light values
	SIGNAL ew_red, ew_amber, ew_green : std_logic; -- East/West red, amber, and green traffic light values
	SIGNAL ns_crossing : std_logic; 					  -- North/South active crossing value
	SIGNAL ew_crossing : std_logic; 					  -- East/West active crossing value
	SIGNAL NSLIGHTS: std_logic_vector(6 downto 0); -- Holds the North/South concatenated traffic digit values
	SIGNAL EWLIGHTS: std_logic_vector(6 downto 0); -- Holds the East/West concatenated traffic digit values
	SIGNAL ns_clear, ew_clear : std_logic;			  -- Holds the pedestrian request clear signals
	SIGNAL ns_out, ew_out : std_logic;				  -- Signals for holding the outputs for crossing from holding registers
	SIGNAL synced_switch	: std_logic;				  -- Signal holding switch value after synchronizer
	
BEGIN
----------------------------------------------------------------------------------------------------
-- Filters the buttons
INST0: pb_filters			port map (clkin_50, rst_n, rst_n_filtered, pb_n, pb_n_filtered);

-- Inverts the buttons (Active Low to Active High)
INST1: pb_inverters		port map (rst_n_filtered, rst, pb_n_filtered, pb);

-- Used to generate the waveform in parts A+B
--INST2: synchronizer     port map (clkin_50,'0', rst, synch_rst);							-- the synchronizer is also reset by synch rst.;
--leds(0) <= blink_sig;
--leds(2) <= sm_clken;

-- Instance of the clock generator which generates the clock signal
INST3: clock_generator 	port map (sim_mode, synch_rst, clkin_50, sm_clken, blink_sig);

-- Instance of synchronizer which generates the synchronous reset signal
INSTMID: synchronizer	port map (clkin_50, '0', rst, synch_rst);

-- Instances of synchronizer and holding register for the NS traffic light
INSTNSS: synchronizer	port map (clkin_50, synch_rst, pb(0), ns_request);
INSTNSHR: holding_register port map (clkin_50, synch_rst, ns_clear, ns_request, ns_out);
leds(1) <= ns_out; -- North/South crossing from NS holding register output

-- Instances of synchronizer and holding register for the EW traffic light
INSTEWS: synchronizer	port map (clkin_50, synch_rst, pb(1), ew_request);
INSTEWHR: holding_register port map (clkin_50, synch_rst, ew_clear, ew_request, ew_out);
leds(3) <= ew_out; -- East/West crossing from EW holding register output

-- Instance of synchronizer which generates the synced_switch signal from sw(0) input
INSTSWITCHS: synchronizer	port map (clkin_50, synch_rst, sw(0), synced_switch);

-- Instance of the state machine which transitions between states and controls the traffic light
INSTSM: State_Machine port map(clkin_50, synch_rst, sm_clken, blink_sig, synced_switch, ns_out, ew_out, ns_red, ns_amber, ns_green, ew_red, 
										 ew_amber, ew_green, ns_crossing, ew_crossing, leds(7 downto 4), ns_clear, ew_clear);

-- Displays the NS and EW crossing state values on leds
leds(0) <= ns_crossing; -- North/South crossing state
leds(2) <= ew_crossing; -- East/West crossing state

-- Holds the concatenated traffic light digit values
NSLIGHTS(6 downto 0) <= ns_amber & "00" & ns_green & "00" & ns_red; -- North/South Lights
EWLIGHTS(6 downto 0) <= ew_amber & "00" & ew_green & "00" & ew_red; -- East/West Lights

-- Use segment7_mux to display traffic light digit values
INSTLIGHTS : segment7_mux port map(clkin_50, NSLIGHTS, EWLIGHTS, seg7_data, seg7_char2, seg7_char1);

-- Simulation values for final waveform
--sim_sm_clken <= sm_clken; 		-- assign sm_clken simulation signal
--sim_blink_sig <= blink_sig; 	-- assign blink_sig simulation signal
--sim_ns_red <= ns_red; 			-- assign ns_red simulation signal
--sim_ns_amber <= ns_amber; 		-- assign ns_amber simulation signal
--sim_ns_green <= ns_green;	 	-- assign ns_green simulation signal
--sim_ew_red <= ew_red; 			-- assign ew_red simulation signal
--sim_ew_amber <= ew_amber; 		-- assign ew_amber simulation signal
--sim_ew_green <= ew_green; 		-- assign ew_green simulation signal

END SimpleCircuit;

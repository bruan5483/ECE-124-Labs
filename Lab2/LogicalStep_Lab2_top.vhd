-- Section 205, Team 8, Lab2_REPORT, Bryant Ruan, Jennifer Yu
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity LogicalStep_Lab2_top is port (
   clkin_50			: in	std_logic;
	pb_n				: in	std_logic_vector(3 downto 0); -- Push buttons (uninverted)
 	sw   				: in  std_logic_vector(7 downto 0); -- The switch inputs
   leds				: out std_logic_vector(7 downto 0); -- for displaying the switch content
   seg7_data 		: out std_logic_vector(6 downto 0); -- 7-bit outputs to a 7-segment
	seg7_char1  	: out	std_logic;				    		-- seg7 digit1 selector
	seg7_char2  	: out	std_logic				    		-- seg7 digit2 selector
	
); 
end LogicalStep_Lab2_top;

architecture SimpleCircuit of LogicalStep_Lab2_top is
--
-- Components Used ---
------------------------------------------------------------------- 
  -- Displays 4 bit data using 7-segment 
  component SevenSegment port (
   hex   		:  in  std_logic_vector(3 downto 0);   -- The 4 bit data to be displayed
   sevenseg 	:  out std_logic_vector(6 downto 0)    -- 7-bit outputs to a 7-segment
   ); 
   end component;
	
	-- 7 segment MUX provided by instructors
	component segment7_mux port(
		clk		: in std_logic := '0';					
		DIN2		: in std_logic_vector(6 downto 0);
		DIN1		: in std_logic_vector(6 downto 0);
		DOUT     : out std_logic_vector(6 downto 0);
		DIG2     : out std_logic;
		DIG1     : out std_logic
	);
	end component;
	
	-- Invert PB to active high
	component pb_inverters port (
		pb_n : IN std_logic_vector(3 downto 0);
		pb : OUT std_logic_vector(3 downto 0)
	);
	end component;
	
	-- 2 to 1 MUX for LEDs
	component logic_processor port(
		logic_in1				: in std_logic_vector(3 downto 0);
		logic_in0 				: in std_logic_vector(3 downto 0); 
		mux_select				: in std_logic_vector(1 downto 0); -- PB inputs
		logic_out				: out std_logic_vector(3 downto 0) -- the hex output
	);
	end component;
	
	-- full adders with carrying, connecting 1bit adders
	component full_adder_4bit port(
		BUS0,BUS1					  : in std_logic_vector(3 downto 0);
		CARRY_IN						  : in std_logic;
		CARRY_OUT3					  : out std_logic;
		SUM							  : out std_logic_vector(3 downto 0)
	);
	end component;
	
	-- small 2 to 1 MUX for displaying hex_A/hex_B or the sum/carry
	component small_hex_mux port(
		hex_num, hex_other	     : in std_logic_vector(3 downto 0);
		pb_select					  : in std_logic;	-- push button 2
		hex_out						  : out std_logic_vector(3 downto 0)
	);
	end component;
	
	
--  signals used

	signal hex_A		: std_logic_vector(3 downto 0); -- switches set 1
	signal hex_B      : std_logic_vector(3 downto 0); -- switches set 2
	signal seg7_A		: std_logic_vector(6 downto 0); -- 7 segment display
	signal seg7_B     : std_logic_vector(6 downto 0); -- 7 segment display
	signal logic_leds	: std_logic_vector(3 downto 0); -- signal to connect LEDs below switches
	signal pb 			: std_logic_vector(3 downto 0); -- push buttons
	signal hex_sum		: std_logic_vector(3 downto 0); -- sum in hexadecimal
	signal carry_out	: std_logic; 						  -- digit for carrying
	signal signal_C 	: std_logic_vector(3 downto 0); -- Declare a new 4-bit signal for carrying
	signal show_segB 	: std_logic_vector(3 downto 0); -- output of 2 to 1 mux (either hex_B or signal_C)
	signal show_segA 	: std_logic_vector(3 downto 0); -- output of 2 to 1 mux (either hex_A or hex_sum)
	
	
-- Here the circuit begins

begin

	hex_A <= sw(3 downto 0); -- switches 0 to 3 on FPGA
	hex_B <= sw(7 downto 4); -- switches 4 to 7 on FPGA
	leds(3 downto 0) <= logic_leds; -- LEDs 0 to 3 
--	seg7_data <= seg7_A;

	-- Concatenation
	signal_C <= "000" & carry_out;


	
-- COMPONENT HOOKUP
--
-- generate the seven segment coding
	
	INST1: SevenSegment port map(show_segA, seg7_A); -- seven segment right digit
	INST2: SevenSegment port map(show_segB, seg7_B); -- seven segment left digit
--	INST1: SevenSegment port map(hex_A, seg7_A); -- from parts A-C
--	INST2: SevenSegment port map(hex_B, seg7_B);	-- from parts A-C
	INST3: segment7_mux port map(clkin_50, seg7_A, seg7_B, seg7_data, seg7_char2, seg7_char1); -- 7 segment MUX provided by instructors
	INST4: pb_inverters port map(pb_n, pb); -- invert buttons
	INST5: logic_processor port map(hex_A, hex_B, pb(1 downto 0), logic_leds); -- 2 to 1 MUX for LEDs
	INST6: full_adder_4bit port map(hex_A, hex_B, '0', carry_out, hex_sum); -- adder
	INST7: small_hex_mux port map(hex_B, signal_C, pb(2), show_segB);	-- 2 to 1 MUX for displaying hex_B or signal_C
	INST8: small_hex_mux port map(hex_A, hex_sum, pb(2), show_segA);	-- 2 to 1 MUX for displaying hex_A or hex_sum
	
 
end SimpleCircuit;


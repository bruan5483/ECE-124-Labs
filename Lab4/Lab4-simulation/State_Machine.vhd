-- Section 205, Team 8, Lab4_REPORT, Bryant Ruan, Jennifer Yu

-- Import packages
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Defines the State_Machine entity, which represents a traffic light through a Moore state machine
Entity State_Machine IS Port
(
	clk_input 	: IN std_logic;  -- Clock input bit
	reset			: IN std_logic;  -- Reset input bit
	sm_clken		: IN std_logic;  -- Enable input bit
	blink_sig	: IN std_logic;  -- Blink signal bit
	ns_request	: IN std_logic;  -- North/South pedestrian request input bit
	ew_request	: IN std_logic;  -- East/West pedestrian request input bit
	
	ns_red, ns_amber, ns_green : OUT std_logic; -- North/South ouput bits for red, amber, and green traffic lights
	ew_red, ew_amber, ew_green : OUT std_logic; -- East/West ouput bits for red, amber, and green traffic lights
	ns_crossing : OUT std_logic; -- North/South crossing period output bit
	ew_crossing : OUT std_logic; -- East/West crossing period output bit
	state_number : OUT std_logic_vector(3 downto 0); -- Output 4 bit vector to represent state as binary number
	ns_clear : OUT std_logic; -- Output to clear North/South pedestrian requests
	ew_clear : OUT std_logic -- Output to clear East/West pedestrian requests
 );
END ENTITY;

-- Defines the logic of the State_Machine
Architecture SM of State_Machine is

TYPE STATE_NAMES IS (S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12, S13, S14, S15); -- list all 16 STATE_NAMES values

SIGNAL current_state, next_state	:  STATE_NAMES; -- signals of type STATE_NAMES

BEGIN

	-- Register process, updates with the clock
	Register_Section: PROCESS (clk_input)
	BEGIN
		-- Evaluate logic if clock is on it's rising edge
		IF(rising_edge(clk_input)) THEN
		
			-- If reset is active 
			IF (reset = '1') THEN
				current_state <= S0; -- reset state back to first state (S0)
				
			-- If reset is inactive and state machine is enabled
			ELSIF (reset = '0' and sm_clken = '1') THEN
				current_state <= next_State; -- current state becomes next state
			END IF;
		END IF;
	END PROCESS;

	-- Transition process, updates with changes in current_state
	Transition_Section: PROCESS (current_state) 

	BEGIN
		-- Case block to define the transition between states depending on state order or variables 
		CASE current_state IS
			  WHEN S0 => -- current_state is S0
						-- hold register monitoring, if crossing request for ew is active and ns request is inactive,
						IF (ew_request = '1' and ns_request = '0') THEN		
							next_state <= S6;		-- go to state 6 (ns amber)
						ELSE
							next_state <= S1;		-- regular process, go to subsequent state
						END IF;

				WHEN S1 => -- current_state is S1
						-- hold register monitoring, if crossing request for ew is active and ns request is inactive,
						IF (ew_request = '1' and ns_request = '0') THEN
							next_state <= S6;		-- go to state 6 (ns amber)
						ELSE
							next_state <= S2;		-- regular process, go to subsequent state
						END IF;

				WHEN S2 => -- current_state is S2
						next_state <= S3;			-- regular process, go to subsequent state
					
				WHEN S3 => -- current_state is S3
						next_state <= S4;			-- regular process, go to subsequent state

				WHEN S4 => -- current_state is S4
						next_state <= S5;			-- regular process, go to subsequent state

				WHEN S5 => -- current_state is S5
						next_state <= S6;			-- regular process, go to subsequent state
					
				WHEN S6 => -- current_state is S6	
						next_state <= S7;			-- regular process, go to subsequent state
					
				WHEN S7 => -- current_state is S7
						next_state <= S8;			-- regular process, go to subsequent state
						
				WHEN S8 => -- current_state is S8
						-- hold register monitoring, if crossing request for ns is active and ew request is inactive,
						IF (ns_request = '1' and ew_request = '0') THEN
							next_state <= S14;	-- go to state 14 (ew amber)
						ELSE
							next_state <= S9;		-- regular process, go to subsequent state
						END IF;
						
				WHEN S9 => -- current_state is S9
						-- hold register monitoring, if crossing request for ns is active and ew request is inactive,
						IF (ns_request = '1' and ew_request = '0') THEN
							next_state <= S14;	-- go to state 14 (ew amber)
						ELSE
							next_state <= S10;	-- regular process, go to subsequent state
						END IF;
				
				WHEN S10 => -- current_state is S10
						next_state <= S11;		-- regular process, go to subsequent state
						
				WHEN S11 =>-- current_state is S11
						next_state <= S12;		-- regular process, go to subsequent state
						
				WHEN S12 => -- current_state is S12
						next_state <= S13;		-- regular process, go to subsequent state
						
				WHEN S13 => -- current_state is S13
						next_state <= S14;		-- regular process, go to subsequent state
						
				WHEN S14 => -- current_state is S14
						next_state <= S15;		-- regular process, go to subsequent state
						
				WHEN S15 => -- current_state is S15
						next_state <= S0;			-- regular process, go to subsequent state (state 0 since end of cycle)
						
		END CASE;
	END PROCESS;

	-- Decoder process, updates with changes in current_state
	Decoder_Section: PROCESS (current_state) 

	BEGIN
		  CASE current_state IS
		  
				WHEN S0 | S1 =>		
					ns_clear <= '0';
					ns_red <= '0';
					ns_amber <= '0';
					ns_green <= blink_sig;
					ns_crossing <= '0';
					
					ew_clear <= '0';
					ew_red <= '1';
					ew_amber <= '0';
					ew_green <= '0';
					ew_crossing <= '0';
				
				WHEN S2 | S3 | S4 | S5 =>	
					ns_clear <= '0';	
					ns_red <= '0';
					ns_amber <= '0';
					ns_green <= '1';
					ns_crossing <= '1';
					
					ew_clear <= '0';
					ew_red <= '1';
					ew_amber <= '0';
					ew_green <= '0';
					ew_crossing <= '0';

				WHEN S6 =>		
					ns_clear <= '1';	
					ns_red <= '0';
					ns_amber <= '1';
					ns_green <= '0';
					ns_crossing <= '0';
					
					ew_clear <= '0';	
					ew_red <= '1';
					ew_amber <= '0';
					ew_green <= '0';
					ew_crossing <= '0';
					
				WHEN S7 =>		
					ns_clear <= '0';	
					ns_red <= '0';
					ns_amber <= '1';
					ns_green <= '0';
					ns_crossing <= '0';
					
					ew_clear <= '0';	
					ew_red <= '1';
					ew_amber <= '0';
					ew_green <= '0';
					ew_crossing <= '0';
					
				WHEN S8 | S9 =>
					ns_clear <= '0';	
					ns_red <= '1';
					ns_amber <= '0';
					ns_green <= '0';
					ns_crossing <= '0';
					
					ew_clear <= '0';	
					ew_red <= '0';
					ew_amber <= '0';
					ew_green <= blink_sig;
					ew_crossing <= '0';
					
				WHEN S10 | S11 | S12 | S13 =>
					ns_clear <= '0';	
					ns_red <= '1';
					ns_amber <= '0';
					ns_green <= '0';
					ns_crossing <= '0';
					
					ew_clear <= '0';	
					ew_red <= '0';
					ew_amber <= '0';
					ew_green <= '1';
					ew_crossing <= '1';
					
				WHEN S14 =>
					ns_clear <= '0';
					ns_red <= '1';
					ns_amber <= '0';
					ns_green <= '0';
					ns_crossing <= '0';
					
					ew_clear <= '1';
					ew_red <= '0';
					ew_amber <= '1';
					ew_green <= '0';
					ew_crossing <= '0';
					
				WHEN S15 =>	
					ns_clear <= '0';
					ns_red <= '1';
					ns_amber <= '0';
					ns_green <= '0';
					ns_crossing <= '0';
					
					ew_clear <= '0';
					ew_red <= '0';
					ew_amber <= '1';
					ew_green <= '0';
					ew_crossing <= '0';
		  END CASE;
		  
		  -- Case block which assigns the current state's binary value to state_number
		  CASE current_state IS
			  WHEN S0 => 							-- current_state is S0
						state_number <= "0000";	-- assign 0 in binary to state_number

				WHEN S1 =>							-- current_state is S1
						state_number <= "0001"; -- assign 1 in binary to state_number

				WHEN S2 => 							-- current_state is S2
						state_number <= "0010"; -- assign 2 in binary to state_number
					
				WHEN S3 => 							-- current_state is S3
						state_number <= "0011"; -- assign 3 in binary to state_number

				WHEN S4 => 							-- current_state is S4
						state_number <= "0100"; -- assign 4 in binary to state_number

				WHEN S5 => 							-- current_state is S5
						state_number <= "0101"; -- assign 5 in binary to state_number
					
				WHEN S6 => 							-- current_state is S6
						state_number <= "0110"; -- assign 6 in binary to state_number
					
				WHEN S7 => 							-- current_state is S7
						state_number <= "0111"; -- assign 7 in binary to state_number
						
				WHEN S8 => 							-- current_state is S8
						state_number <= "1000"; -- assign 8 in binary to state_number
						
				WHEN S9 => 							-- current_state is S9
						state_number <= "1001"; -- assign 9 in binary to state_number
				
				WHEN S10 => 						-- current_state is S10
						state_number <= "1010"; -- assign 10 in binary to state_number
						
				WHEN S11 =>							-- current_state is S11	
						state_number <= "1011"; -- assign 11 in binary to state_number
						
				WHEN S12 => 						-- current_state is S12
						state_number <= "1100"; -- assign 12 in binary to state_number
						
				WHEN S13 => 						-- current_state is S13
						state_number <= "1101"; -- assign 13 in binary to state_number
						
				WHEN S14 => 						-- current_state is S14
						state_number <= "1110"; -- assign 14 in binary to state_number
						
				WHEN S15 => 						-- current_state is S15
						state_number <= "1111"; -- assign 15 in binary to state_number
		END CASE;
	 END PROCESS;
 
 END ARCHITECTURE SM;
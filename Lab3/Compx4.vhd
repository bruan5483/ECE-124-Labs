library ieee;
use ieee.std_logic_1164.all;

entity Compx4 is port(
	A4, B4					: in std_logic_vector(3 downto 0);
	AGTB4, AEQB4, ALTB4 	: out std_logic
);
end entity Compx4;

architecture logic of Compx4 is

	component Compx1 port (
		A, B					: in std_logic;
		AGTB, AEQB, ALTB 	: out std_logic
	);
	end component;
	
	signal A0GTB0, A0EQB0, A0LTB0	: std_logic;
	signal A1GTB1, A1EQB1, A1LTB1	: std_logic;
	signal A2GTB2, A2EQB2, A2LTB2	: std_logic;
	signal A3GTB3, A3EQB3, A3LTB3	: std_logic;

begin 
	INST1: Compx1 port map(A4(0), B4(0), A0GTB0, A0EQB0, A0LTB0);
	INST2: Compx1 port map(A4(1), B4(1), A1GTB1, A1EQB1, A1LTB1);
	INST3: Compx1 port map(A4(2), B4(2), A2GTB2, A2EQB2, A2LTB2);
	INST4: Compx1 port map(A4(3), B4(3), A3GTB3, A3EQB3, A3LTB3);
	
	AGTB4 <= A3GTB3 or (A3EQB3 and A2GTB2) or (A3EQB3 and A2EQB2 and A1GTB1) or (A3EQB3 and A2EQB2 and A1EQB1 and A0GTB0);
	AEQB4 <= A3EQB3 and A2EQB2 and A1EQB1 and A0EQB0;
	ALTB4 <= A3LTB3 or (A3EQB3 and A2LTB2) or (A3EQB3 and A2EQB2 and A1LTB1) or (A3EQB3 and A2EQB2 and A1EQB1 and A0LTB0);
	
end logic;

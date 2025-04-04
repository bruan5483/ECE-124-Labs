library ieee;
use ieee.std_logic_1164.all;

entity Compx1 is port(
	A, B					: in std_logic;
	AGTB, AEQB, ALTB 	: out std_logic
);
end entity Compx1;

architecture logic of Compx1 is
begin 
	AGTB <= A and not B;
	AEQB <= (A and B) or (not A and not B);
	ALTB <= (not A) and B;
	
end logic;

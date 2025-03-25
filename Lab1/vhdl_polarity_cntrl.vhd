LIBRARY ieee;
USE ieee.std_logic_1164.all;
LIBRARY work;
ENTITY vhdl_polarity_cntrl IS
	PORT (
		POLARITY_CNTRL, IN_1, IN_2, IN_3, IN_4 : IN STD_LOGIC;
		OUT_1, OUT_2, OUT_3, OUT_4 : OUT STD_LOGIC
	);

END ENTITY vhdl_polarity_cntrl;

ARCHITECTURE simple_gates OF vhdl_polarity_cntrl IS

BEGIN 

OUT_1 <= POLARITY_CNTRL XNOR IN_1;
OUT_2 <= POLARITY_CNTRL XNOR IN_2;
OUT_3 <= POLARITY_CNTRL XNOR IN_3;
OUT_4 <= POLARITY_CNTRL XNOR IN_4;

END simple_gates;
Library ieee;
USE ieee.std_logic_1164.all;
LIBRARY work;
ENTITY VHDL_gates IS
	PORT (
		XOR_IN1, XOR_IN2, OR_IN1, OR_IN2, NAND_IN1, NAND_IN2, AND_IN1, AND_IN2	:IN std_logic;
		XOR_OUT, OR_OUT, NAND_OUT, AND_OUT : OUT std_logic
		);
END VHDL_gates;

ARCHITECTURE simple_gates OF VHDL_gates IS

BEGIN

XOR_OUT <= XOR_IN1 XOR XOR_IN2;
OR_OUT <= OR_IN1 OR OR_IN2;
NAND_OUT <= NAND_IN1 NAND NAND_IN2;
AND_OUT <= AND_IN1 AND AND_IN2;

END simple_gates;
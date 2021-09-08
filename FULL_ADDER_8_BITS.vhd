LIBRARY IEEE;
USE ieee.std_logic_1164.all;
-------------------------------------------------------
ENTITY FULL_ADDER_8_BITS IS
	PORT(		A		:	IN			STD_LOGIC;
				B		:	IN			STD_LOGIC;
				CIN	:	IN			STD_LOGIC;
				SUM	:	OUT		STD_LOGIC;
				COUT	:	OUT		STD_LOGIC);
END ENTITY FULL_ADDER_8_BITS;
-------------------------------------------------------
ARCHITECTURE gateLevel OF FULL_ADDER_8_BITS IS
BEGIN
SUM <= ((CIN) XOR (A XOR B));
COUT <=((A AND B) OR (CIN AND (A XOR B)));
END ARCHITECTURE gateLevel;
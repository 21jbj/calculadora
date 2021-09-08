LIBRARY IEEE;
USE ieee.std_logic_1164.all;
-------------------------------------------------------
ENTITY COMPLEMENTO_A2 IS
	PORT(
				B			:	IN		STD_LOGIC_VECTOR (7 DOWNTO 0);
--				CIN		:	IN		STD_LOGIC;
				SUM		:	OUT	STD_LOGIC_VECTOR (7 DOWNTO 0)
				);

END ENTITY COMPLEMENTO_A2;
-------------------------------------------------------
ARCHITECTURE structural OF COMPLEMENTO_A2 IS

BEGIN

SUM <= (NOT B) OR "00000001";

END structural;
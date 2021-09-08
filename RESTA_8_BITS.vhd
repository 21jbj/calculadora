LIBRARY IEEE;
USE ieee.std_logic_1164.all;
-------------------------------------------------------
ENTITY RESTA_8_BITS IS
	PORT(		A			:	IN		STD_LOGIC_VECTOR (7 DOWNTO 0);
				B			:	IN		STD_LOGIC_VECTOR (7 DOWNTO 0);
				SUM_1		:	OUT	STD_LOGIC_VECTOR (7 DOWNTO 0);
				 
				COUT		:	OUT	STD_LOGIC);

END ENTITY RESTA_8_BITS;
-------------------------------------------------------
ARCHITECTURE structural OF RESTA_8_BITS IS
SIGNAL UNION_1 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL UNION_2 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL SUM_12 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL comparacion :  STD_LOGIC;
SIGNAL  W 		:     STD_LOGIC;

SIGNAL decidir : STD_LOGIC_VECTOR (7 DOWNTO 0);
BEGIN
complemento_A2: ENTITY work.COMPLEMENTO_A2
	PORT MAP		(
					  B		=> B,
					 SUM  	=> UNION_1 ); 
suma: ENTITY work.SUMADOR_8_BITS 
	PORT MAP		(
					  A		=> A,
					  B		=> UNION_1,
					 SUM  	=> UNION_2 ); 

complemento_A2_rectificacion: ENTITY work.COMPLEMENTO_A2
	PORT MAP		(
					  B		=>UNION_2,
					 SUM  	=> SUM_12 ); 
	
decidir <= SUM_12 OR "11110000";


w <= '1' WHEN (A<B) ELSE
		'0';

WITH w SELECT
SUM_1 <= 
		SUM_12 WHEN '1',
			UNION_2 WHEN OTHERS;

COUT <= w;
END structural;
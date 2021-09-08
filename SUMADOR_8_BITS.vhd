LIBRARY IEEE;
USE ieee.std_logic_1164.all;
-------------------------------------------------------
ENTITY SUMADOR_8_BITS IS
	PORT(		A			:	IN		STD_LOGIC_VECTOR (7 DOWNTO 0);
				B			:	IN		STD_LOGIC_VECTOR (7 DOWNTO 0);
				SUM		:	OUT	STD_LOGIC_VECTOR (7 DOWNTO 0)
				);

END ENTITY SUMADOR_8_BITS;
-------------------------------------------------------
ARCHITECTURE gateLevel OF SUMADOR_8_BITS IS
		SIGNAL IN1_OUT2 :  STD_LOGIC_VECTOR (7 DOWNTO 0);

		
BEGIN-- me falta cambiar aquí


oneBitEqModule_1: ENTITY work.FULL_ADDER_8_BITS
	PORT MAP(	A		=>	A			(0),
					B		=> B			(0),
					CIN	=> '0',
					SUM	=> SUM		(0),
					COUT	=> IN1_OUT2	(0)
				);
oneBitEqModule_2: ENTITY work.FULL_ADDER_8_BITS
	PORT MAP(	A		=>	A			(1),
					B		=> B			(1),
					CIN	=> IN1_OUT2	(0),
					SUM	=> SUM		(1),
					COUT	=> IN1_OUT2	(1)
				);
oneBitEqModule_3: ENTITY work.FULL_ADDER_8_BITS
	PORT MAP(	A		=>	A			(2),
					B		=> B			(2),
					CIN	=> IN1_OUT2	(1),
					SUM	=> SUM		(2),
					COUT	=> IN1_OUT2	(2)
				);
oneBitEqModule_4: ENTITY work.FULL_ADDER_8_BITS
	PORT MAP(	A		=>	A			(3),
					B		=> B			(3),
					CIN	=> IN1_OUT2	(2),
					SUM	=> SUM		(3),
					COUT	=> IN1_OUT2	(3)
				);	
oneBitEqModule_5: ENTITY work.FULL_ADDER_8_BITS
	PORT MAP(	A		=>	A			(4),
					B		=> B			(4),
					CIN	=> IN1_OUT2	(3),
					SUM	=> SUM		(4),
					COUT	=> IN1_OUT2	(4)
				);			
oneBitEqModule_6: ENTITY work.FULL_ADDER_8_BITS
	PORT MAP(	A		=>	A			(5),
					B		=> B			(5),
					CIN	=> IN1_OUT2	(4),
					SUM	=> SUM		(5),
					COUT	=> IN1_OUT2	(5)
				);						
oneBitEqModule_7: ENTITY work.FULL_ADDER_8_BITS
	PORT MAP(	A		=>	A			(6),
					B		=> B			(6),
					CIN	=> IN1_OUT2	(5),
					SUM	=> SUM		(6),
					COUT	=> IN1_OUT2	(6)
				);						
												
oneBitEqModule_8: ENTITY work.FULL_ADDER_8_BITS
	PORT MAP(	A		=>	A			(7),
					B		=> B			(7),
					CIN	=> IN1_OUT2	(6),
					SUM	=> SUM		(7),
					COUT	=> IN1_OUT2	(7)
				);		
				
END ARCHITECTURE gateLevel;
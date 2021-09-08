LIBRARY IEEE;
USE ieee.std_logic_1164.all;
----------------------------------------
ENTITY  multiplicador IS 
PORT (		A			:	IN		STD_LOGIC_VECTOR (7 DOWNTO 0);
				B			:	IN		STD_LOGIC_VECTOR (7 DOWNTO 0);
				COUT		:	OUT		STD_LOGIC_VECTOR (7 DOWNTO 0)
				);
END ENTITY multiplicador;
ARCHITECTURE gateLevel OF multiplicador IS 
SIGNAL IN_OUT1 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL IN_OUT2 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL IN_OUT3 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL IN_OUT4 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL IN_OUT5 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL IN_OUT6 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL IN_OUT7 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL IN_OUT8 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL IN_OUT9 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL IN_OUT10 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL SEL_1 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
BEGIN
		
multiplicador_8_1: ENTITY work.SUMADOR_8_BITS
	PORT MAP		( A		=> A,
					  B 		=> A,
					 SUM 	   => IN_OUT1); 
multiplicador_8_2: ENTITY work.SUMADOR_8_BITS
	PORT MAP		( A		=> A,
					  B 		=> IN_OUT1,
					 SUM 	   => IN_OUT2); 
multiplicador_8_3: ENTITY work.SUMADOR_8_BITS
	PORT MAP		( A		=> A,
					  B 		=> IN_OUT2,
					 SUM 	   => IN_OUT3); 
multiplicador_8_4: ENTITY work.SUMADOR_8_BITS
	PORT MAP		( A		=> A,
					  B 		=> IN_OUT3,
					 SUM 	   => IN_OUT4); 
multiplicador_8_5: ENTITY work.SUMADOR_8_BITS
	PORT MAP		( A		=> A,
					  B 		=> IN_OUT4,
					 SUM 	   => IN_OUT5); 
multiplicador_8_6: ENTITY work.SUMADOR_8_BITS
	PORT MAP		( A		=> A,
					  B 		=> IN_OUT5,
					 SUM 	   => IN_OUT6); 
multiplicador_8_7: ENTITY work.SUMADOR_8_BITS
	PORT MAP		( A		=> A,
					  B 		=> IN_OUT6,
					 SUM 	   => IN_OUT7); 
multiplicador_8_8: ENTITY work.SUMADOR_8_BITS
	PORT MAP		( A		=> A,
					  B 		=> IN_OUT7,
					 SUM 	   => IN_OUT8 ); 
multiplicador_8_9: ENTITY work.SUMADOR_8_BITS
	PORT MAP		( A		=> A,
					  B 		=> IN_OUT8,
					 SUM 	   => IN_OUT9 ); 


SEL_1 <=B;
		WITH SEL_1 SELECT 
	   COUT <=
		   "00000000" WHEN "00000000",
		    A  WHEN "00000001",
		   IN_OUT1 WHEN "00000010",
		   IN_OUT2 WHEN "00000011",
		   IN_OUT3 WHEN "00000100",
		   IN_OUT4 WHEN "00000101",
		   IN_OUT5 WHEN "00000110",
		   IN_OUT6 WHEN "00000111",
		   IN_OUT7 WHEN "00001000",
		  IN_OUT8 WHEN "00001001",
		  IN_OUT9 WHEN OTHERS;
	END gateLevel ;

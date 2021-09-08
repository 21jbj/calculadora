LIBRARY ieee;
USE ieee.std_logic_1164.all;
----------------------------------
ENTITY conversor_8_to_4 IS
PORT ( SELECTOR : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		 OUT_1 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
		 OUT_2 : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
		 );
 END ENTITY conversor_8_to_4;
 ARCHITECTURE gateLevel OF conversor_8_to_4 IS
 SIGNAL cable_1 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
 SIGNAL cable_2 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
 SIGNAL cable_3 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
 SIGNAL cable_4 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
 SIGNAL cable_5 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
 SIGNAL cable_6 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
 SIGNAL cable_7 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
 SIGNAL cable_8 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
 SIGNAL cable_9 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
 SIGNAL cable_out :  STD_LOGIC_VECTOR (3 DOWNTO 0);
 SIGNAL cable_out1 :  STD_LOGIC_VECTOR (3 DOWNTO 0);
 SIGNAL cable_out2 :  STD_LOGIC_VECTOR (3 DOWNTO 0);
 SIGNAL cable_out3 :  STD_LOGIC_VECTOR (3 DOWNTO 0);
 SIGNAL cable_out4 :  STD_LOGIC_VECTOR (3 DOWNTO 0);
 SIGNAL cable_out5 :  STD_LOGIC_VECTOR (3 DOWNTO 0);
 SIGNAL cable_out6 :  STD_LOGIC_VECTOR (3 DOWNTO 0);
 SIGNAL cable_out7 :  STD_LOGIC_VECTOR (3 DOWNTO 0);
 SIGNAL cable_out8 :  STD_LOGIC_VECTOR (3 DOWNTO 0);
 SIGNAL menos10 :  STD_LOGIC_VECTOR (3 DOWNTO 0);
 SIGNAL unidad :  STD_LOGIC_VECTOR (3 DOWNTO 0);
 SIGNAL resta :  STD_LOGIC;
 SIGNAL SELECTOR_1 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
 SIGNAL SELECTOR_2 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
 
 
	BEGIN
		
CONVERTIR_1: ENTITY work.SUMADOR_8_BITS
	PORT MAP		( A		=> SELECTOR ,
					  B 		=> "11110110"  ,
					 SUM 	   => cable_1); 

cable_out <= "0001";	
CONVERTIR_2: ENTITY work.SUMADOR_8_BITS
	PORT MAP		( A		=> cable_1 ,
					  B 		=> "11110110"  ,
					 SUM 	=> cable_2); 

cable_out1 <= "0010";	
CONVERTIR_3: ENTITY work.SUMADOR_8_BITS
	PORT MAP		( A		=>  cable_2 ,
					  B 		=> "11110110"  ,
					 SUM 	=> cable_3); 

cable_out2 <= "0011";	
CONVERTIR_4: ENTITY work.SUMADOR_8_BITS
	PORT MAP		( A		=> cable_3 ,
					  B 		=> "11110110"  ,
					 SUM 	=> cable_4); 

cable_out3 <= "0100";
CONVERTIR_5: ENTITY work.SUMADOR_8_BITS
	PORT MAP		( A		=> cable_4 ,
					  B 		=> "11110110"  ,
					 SUM 	=> cable_5); 

cable_out4 <= "0101";	
CONVERTIR_6: ENTITY work.SUMADOR_8_BITS
	PORT MAP		( A		=> cable_5 ,
					  B 		=> "11110110"  ,
					 SUM 	=> cable_6); 

cable_out5 <= "0110";	
CONVERTIR_7: ENTITY work.SUMADOR_8_BITS
	PORT MAP		( A		=> cable_6 ,
					  B 		=> "11110110"  ,
					 SUM 	=> cable_7); 

cable_out6 <= "0111";	
CONVERTIR_8:ENTITY work.SUMADOR_8_BITS
	PORT MAP		( A		=> cable_7 ,
					  B 		=> "11110110" ,
					 SUM 	=> cable_8); 

cable_out7 <= "1000";		

--------------------------------------

PROCESS (cable_1,cable_2,cable_3,cable_4,cable_5,
cable_6,cable_7,cable_8,cable_9,unidad,menos10,SELECTOR_1)
BEGIN

 
IF( SELECTOR < "00001010"  ) THEN
	menos10 <= "0000";
ELSIF(cable_1 < "00001010") THEN  
	menos10 <= cable_out;
ELSIF(cable_2 < "00001010") THEN  
	menos10 <= cable_out1;		
ELSIF(cable_3 < "0001010") THEN  
	menos10 <= cable_out2;
ELSIF(cable_4 < "0001010")	THEN
	menos10 <= cable_out3;
ELSIF(cable_5 < "00001010")	THEN  
	menos10 <= cable_out4;
ELSIF(cable_6 < "00001010")	THEN 
	menos10 <= cable_out5;
ELSIF(cable_7 < "00001010")	THEN 
	menos10 <=cable_out6;
ELSE 
	menos10 <= cable_out7;
	
END  IF;	
END PROCESS;

OUT_1<= menos10;
unidad <= menos10;
	WITH unidad SELECT
	OUT_2<=
		  SELECTOR (3 DOWNTO 0)WHEN "0000",
		  cable_1(3 DOWNTO 0) WHEN "0001",
		  cable_2 (3 DOWNTO 0) WHEN "0010",
		  cable_3(3 DOWNTO 0) WHEN "0011",
		  cable_4(3 DOWNTO 0) WHEN "0100",
		  cable_5(3 DOWNTO 0) WHEN "0101",
		  cable_6(3 DOWNTO 0) WHEN "0110",
		  cable_7(3 DOWNTO 0) WHEN "0111",
		  cable_8(3 DOWNTO 0) WHEN "1001",
				"1110" WHEN OTHERS;
				

 END gateLevel;
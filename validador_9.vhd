LIBRARY ieee;
USE ieee.std_logic_1164.all;
----------------------------------
ENTITY validador_9 IS
PORT ( bin 		: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		 sseg 	: OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
		 bin_2 	: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		 sseg_2 	: OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
		 bin_3 	: IN STD_LOGIC_VECTOR (1 DOWNTO 0);
		 sseg_3 	: OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
		 sseg_4 	: OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
		 );
END ENTITY validador_9;
-------------------------------------
ARCHITECTURE behaviour OF validador_9 IS
signal Cable_sum  :  STD_LOGIC_VECTOR (7 DOWNTO 0);
signal Cable_res  :  STD_LOGIC_VECTOR (7 DOWNTO 0);
signal multi  		:  STD_LOGIC_VECTOR (7 DOWNTO 0);
signal SELECTOR_1	:  STD_LOGIC_VECTOR (7 DOWNTO 0);
signal DECIMAL  	:  STD_LOGIC_VECTOR (3 DOWNTO 0);
signal UNIDAD  	:  STD_LOGIC_VECTOR (3 DOWNTO 0);
signal resta  	   :  STD_LOGIC;

BEGIN 

bin_to_sseg: ENTITY work.bin_seg
	PORT MAP		( bin		=>  bin,
						sseg	=> sseg_3 ); 
				  
bin_to_sseg_2: ENTITY work.bin_seg_2
	PORT MAP		( bin_3		=>  bin_2,
				  sseg_3	=> sseg_4); 
SUMADOR_8: ENTITY work.SUMADOR_8_BITS
	PORT MAP		( A		=> "0000" & bin ,
					  B 		=> "0000" & bin_2 ,
					SUM 	   => Cable_sum); 

RESTA_8: ENTITY work.RESTA_8_BITS
	PORT MAP		( A		=> "0000" & bin ,
					  B 		=> "0000" & bin_2 ,
					  COUT  	=> resta,
				 SUM_1 	   => Cable_res); 
MULTIPLICADOR_8: ENTITY work.multiplicador
	PORT MAP		( A		=> "0000" & bin ,
					  B 		=> "0000" & bin_2 ,
					 COUT 	   => multi); 
					 
---WITH SELECTOR SELECT
WITH bin_3 SELECT 
	   SELECTOR_1 <=
		   Cable_sum WHEN "11",
			Cable_res WHEN "01",
		   multi WHEN OTHERS;	
		  
conversor_8_to_4: ENTITY work.conversor_8_to_4
	PORT MAP		( SELECTOR		=> SELECTOR_1,
					  OUT_1		=> DECIMAL ,
					  OUT_2 	   => UNIDAD); 


bin_to_sseg_salida: ENTITY work.bin_seg
	PORT MAP		( bin		=>  DECIMAL,
					sseg	=> sseg ); 
				  
bin_to_sseg_salida_1: ENTITY work.bin_seg_2
	PORT MAP		( bin_3		=> UNIDAD,
					sseg_3		=> sseg_2); 		
END behaviour;
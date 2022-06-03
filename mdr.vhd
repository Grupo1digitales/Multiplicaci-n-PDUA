LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
------------------------------------------------------------------------------------------------
ENTITY mdr IS
	GENERIC( MAX_WIDTH  :  INTEGER := 8);
	PORT(		clk		  :  IN 		STD_LOGIC;
				rst		  :  IN     STD_LOGIC;
				mdr_alu_n  :  IN 		STD_LOGIC;
				mdr_en	  :  IN 		STD_LOGIC;
				Bus_alu	  :  IN 		STD_LOGIC_VECTOR(MAX_WIDTH-1 DOWNTO 0);
				BusDataIn  :  IN 		STD_LOGIC_VECTOR(MAX_WIDTH-1 DOWNTO 0);
				BusC		  :  OUT 	STD_LOGIC_VECTOR(MAX_WIDTH-1 DOWNTO 0);
				BusDataOut :  OUT 	STD_LOGIC_VECTOR(MAX_WIDTH-1 DOWNTO 0));
END ENTITY;
----------------------------------------------------------------------------------------------
ARCHITECTURE rtl OF mdr IS
	SIGNAL q		 :  STD_LOGIC_VECTOR(MAX_WIDTH-1 DOWNTO 0);
BEGIN 
		
		reg1: ENTITY work.my_reg	PORT MAP		( clk, rst, mdr_en, BusDataIn, q );
			
		reg2: ENTITY work.my_reg	PORT MAP		( clk, rst, mdr_en, Bus_alu, BusDataOut );
			
		WITH  mdr_alu_n SELECT
		BusC	<=	Bus_alu	WHEN '0',
					q			WHEN OTHERS;
			
END ARCHITECTURE;
				

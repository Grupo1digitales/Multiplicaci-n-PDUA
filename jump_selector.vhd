LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
------------------------------------------------------------------------------------------------------------------------------------
ENTITY jump_selector IS
	PORT(		Z		:  IN  STD_LOGIC;
				M		:  IN  STD_LOGIC;
				C		:  IN  STD_LOGIC;
				P		:  IN  STD_LOGIC;
				int   :	IN  STD_LOGIC;
				jcond :  IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
				load  :	OUT STD_LOGIC);
	
END ENTITY;
-----------------------------------------------------------------------------------------
ARCHITECTURE rtl OF jump_selector IS
	
	CONSTANT CERO: STD_LOGIC := '0';
	CONSTANT UNO : STD_LOGIC := '1';	

BEGIN

	WITH  jcond SELECT
		load	<=	CERO	WHEN "000",
					UNO	WHEN "001",
					Z		WHEN "010",
					M		WHEN "011",
				   C		WHEN "100",
				   P 		WHEN "101",
				   int 	WHEN "110",
					CERO	WHEN OTHERS;

END ARCHITECTURE;
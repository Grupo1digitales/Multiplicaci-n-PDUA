LIBRARY ieee;
USE ieee.std_logic_1164.all;
------------------------------------------------------------------------------------------------------------------------------------
ENTITY upc_selector IS
	PORT(		result :  IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
				offset :  IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
				load   :  IN  STD_LOGIC;
				D		 :  OUT STD_LOGIC_VECTOR (2 DOWNTO 0));
	
END ENTITY;
-----------------------------------------------------------------------------------------
ARCHITECTURE rtl OF upc_selector IS
BEGIN
	WITH  load SELECT
		D	<=	result	WHEN '0',
				offset	WHEN OTHERS;

END ARCHITECTURE;
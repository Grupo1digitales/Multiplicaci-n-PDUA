-----------------------------------------------
LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
---------------------------------------------------
ENTITY full_adder_with_select IS 
	PORT (	input    :	IN		STD_LOGIC_VECTOR(2 DOWNTO 0);
				C_out		:	OUT	STD_LOGIC;
				result	:	OUT	STD_LOGIC);
	END ENTITY full_adder_with_select;
---------------------------------------------------
ARCHITECTURE functional OF full_adder_with_select IS
---------------------------------------------------
BEGIN
	WITH input SELECT
	   C_out <= '1' WHEN "011",
					'1' WHEN "101",
					'1' WHEN "110",
					'1' WHEN "111",
					'0' WHEN OTHERS;
	WITH input SELECT
		result<=	'1' WHEN "001",
					'1' WHEN "010",
					'1' WHEN "100",
					'1' WHEN "111",
					'0' WHEN OTHERS;
			  
END ARCHITECTURE functional;
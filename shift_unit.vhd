LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY shift_unit IS
	GENERIC (N	: INTEGER := 8);
	PORT	(	shamt		:	IN STD_LOGIC_VECTOR(1 DOWNTO 0);
				dataa		:	IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
				dataout	:	OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0));
END ENTITY;
---------------------------------------------------------------------
ARCHITECTURE rtl OF shift_unit IS
BEGIN
	dataout	<=	dataa								WHEN shamt = "00"		ELSE 
					'0' & dataa(N-1 DOWNTO 1)	WHEN shamt = "01"    ELSE
					dataa(N-2 DOWNTO 0)&'0'		WHEN shamt = "10"    ELSE
					(OTHERS=>'0');
END ARCHITECTURE;





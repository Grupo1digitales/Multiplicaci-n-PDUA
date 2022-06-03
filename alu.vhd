LIBRARY IEEE;
USE ieee.std_logic_1164.all;
----------------------------------------------------------------
ENTITY alu IS 
GENERIC  ( MAX_WIDTH : INTEGER := 8 );
	PORT  ( clk		 :	 IN 	STD_LOGIC;
			  rst		 :	 IN	STD_LOGIC;
			  busA	 :	 IN	STD_LOGIC_VECTOR(MAX_WIDTH-1 DOWNTO 0);
			  busB	 :	 IN	STD_LOGIC_VECTOR(MAX_WIDTH-1 DOWNTO 0);
			  selop	 :	 IN 	STD_LOGIC_VECTOR(2 DOWNTO 0);
			  shamt	 :	 IN	STD_LOGIC_VECTOR(1 DOWNTO 0);
			  enaf	 :	 IN	STD_LOGIC;
			  busC	 :	 OUT	STD_LOGIC_VECTOR(MAX_WIDTH-1 DOWNTO 0);
			  C,M,P,Z :	 OUT	STD_LOGIC);
END ENTITY alu;
----------------------------------------------------------------
ARCHITECTURE rtl OF alu IS

	SIGNAL	cout_s	:	 STD_LOGIC;
	SIGNAL	result_s	:	 STD_LOGIC_VECTOR(MAX_WIDTH-1 DOWNTO 0);
	
BEGIN
	
	PU : ENTITY work.processing_unit 
	GENERIC MAP ( N	=>	MAX_WIDTH ) 
	PORT MAP ( busA, busB, selop, result_s, cout_s );
	
	FLAG : ENTITY work.flag_register
	GENERIC MAP	( N	=> MAX_WIDTH )
	PORT MAP	( clk, rst, enaf, result_s, cout_s, C, M, Z, P);
	
	SHIFT : ENTITY work.shift_unit
	GENERIC MAP ( N	=> MAX_WIDTH )
	PORT MAP ( shamt, result_s, busC );
	
	
END ARCHITECTURE rtl;
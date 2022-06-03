LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
------------------------------------------------------------------------------------------------------------------------------------
ENTITY control_unit IS
	PORT(		
				clk      :  IN  STD_LOGIC;
				rst	   :  IN  STD_LOGIC;		
				Z		   :  IN  STD_LOGIC;
				M		   :  IN  STD_LOGIC;
				C	      :  IN  STD_LOGIC;
				P		   :  IN  STD_LOGIC;
				int	   :	IN  STD_LOGIC;
				opcode   :	IN  STD_LOGIC_VECTOR (4 DOWNTO 0);
				uinstruc :	OUT STD_LOGIC_VECTOR (20 DOWNTO 0));	
END ENTITY;
-----------------------------------------------------------------------------------------
ARCHITECTURE rtl OF control_unit IS
	SIGNAL  load_s     :	 STD_LOGIC;
	SIGNAL  result_s   :	 STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL  uPCq_s     :  STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL  D_s		    :	 STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL  addr_s     :  STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL  uPC_en_s   :  STD_LOGIC;
	SIGNAL  uPC_clr_s  :	 STD_LOGIC;
	SIGNAL  jcond_s	 :  STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL  offset_s	 :	 STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL  uinstruc_s :	 STD_LOGIC_VECTOR (28 DOWNTO 0);

BEGIN
	
	uinstruc  <= 		uinstruc_s(28 DOWNTO 8);
	uPC_en_s  <=		uinstruc_s(7);
	uPC_clr_s <=		uinstruc_s(6);
	jcond_s   <=		uinstruc_s(5 DOWNTO 3);
	offset_s  <=      uinstruc_s(2 DOWNTO 0);
	
	addr_s(2 DOWNTO 0)    <=	upcq_s;
	addr_s(7 DOWNTO 3)    <=   opcode;

	FLAGS:	ENTITY work.jump_selector  PORT MAP(Z, M, C, P, int, jcond_s, load_s);
	PCplus1:	ENTITY work.add_sub 		   GENERIC MAP (3)
												   PORT MAP(uPCq_s, "001", '0', result_s);
	offset:	ENTITY work.upc_selector   PORT MAP(result_s, offset_s,load_s, D_s);
	uPCreg:  ENTITY work.uPC 				PORT MAP(clk, rst, uPC_en_s, uPC_clr_s, D_s, uPCq_s);
	ROM:     ENTITY work.uProgramMemory PORT MAP(addr_s, uinstruc_s);
	

						
	
END ARCHITECTURE;

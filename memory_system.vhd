LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY memory_system IS
	GENERIC (MAX_WIDTH	: 	INTEGER := 8);
	PORT	(	clk			:	IN  STD_LOGIC;
				rst			:	IN  STD_LOGIC;
				mdr_alu_n   :  IN  STD_LOGIC;
				mdr_en      :  IN  STD_LOGIC;
				bank_wr_en  :  IN  STD_LOGIC;
				BusB_addr   :  IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
				BusC_addr   :  IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
				ir_en       :  IN  STD_LOGIC;
				mar_en      :  IN  STD_LOGIC;
				wr_rdn      :  IN  STD_LOGIC;
				enaf        :  IN  STD_LOGIC;
				selop       :  IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
				shamt       :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
				Controlunit :  OUT STD_LOGIC_VECTOR(4 DOWNTO 0); 
				C           :  OUT STD_LOGIC;
				M           :  OUT STD_LOGIC;
				Z           :  OUT STD_LOGIC;
				P           :  OUT STD_LOGIC);
				
END ENTITY;
------------------------------------------------------------------------------------------------------------------------
ARCHITECTURE rtl OF memory_system IS
   SIGNAL   BusC_s       :  STD_LOGIC_VECTOR(7 DOWNTO 0); 
	SIGNAL 	BusA_s       :  STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	BusB_s       :  STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL   q_s          :  STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	Bus_alu_s	 :  STD_LOGIC_VECTOR(MAX_WIDTH-1 DOWNTO 0);
	SIGNAL   BusDataIn_s	 :  STD_LOGIC_VECTOR(MAX_WIDTH-1 DOWNTO 0);
	SIGNAL   BusDataOut_s :  STD_LOGIC_VECTOR(MAX_WIDTH-1 DOWNTO 0);
	SIGNAL   addr_bus_s	 :  STD_LOGIC_VECTOR(MAX_WIDTH-1 DOWNTO 0);
		
BEGIN 
	controlunit <= q_s(7 DOWNTO 3);
	
	MAR: ENTITY work.my_reg	  PORT MAP (clk, rst, mar_en, BusC_s, addr_bus_s);
	IR : ENTITY work.my_reg	  PORT MAP (clk, rst, ir_en, BusC_s, q_s);
	MDR: ENTITY work.mdr 	  PORT MAP (clk, rst, mdr_alu_n, mdr_en, Bus_alu_s, BusDataIn_s ,BusC_s, BusDataOut_s );
	RB : ENTITY work.reg_file PORT MAP (clk, rst, bank_wr_en, BusC_addr, BusB_addr, BusC_s, BusA_s, BusB_s);
	ALU: ENTITY work.alu      PORT MAP (clk, rst, BusA_s, BusB_s, selop, shamt, enaf, Bus_alu_s, C, M, P, Z);
	RAM: ENTITY work.my_SPRAM GENERIC MAP (MAX_WIDTH, MAX_WIDTH)
	                          PORT MAP (clk, wr_rdn, addr_bus_s, BusDataOut_s, BusDataIn_s);	
									  							  
END ARCHITECTURE;
	
	
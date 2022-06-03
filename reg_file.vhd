LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
-------------------------------------------------------------------------------------------------
ENTITY reg_file IS
	GENERIC(  DATA_WIDTH	:  INTEGER := 8;
				 ADDR_WIDTH :  INTEGER := 3);
	PORT(		 clk			:	IN		STD_LOGIC;
				 rst			:	IN		STD_LOGIC;
				 wr_en		:	IN		STD_LOGIC;
				 w_addr		:	IN		STD_LOGIC_VECTOR(ADDR_WIDTH-1 DOWNTO 0);
				 r_addr		:	IN		STD_LOGIC_VECTOR(ADDR_WIDTH-1 DOWNTO 0);
				 w_data		:	IN		STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0);
				 BusA			:	OUT	STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0);
				 BusB			:	OUT	STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0));
END ENTITY;
--------------------------------------------------------------------------------------------------
ARCHITECTURE rtl OF reg_file IS
	CONSTANT pc_init 	 : STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0) := "00000001";
	CONSTANT sp_init 	 : STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0) := "11111111";
	CONSTANT dptr_init : STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0) := "00000101";
	CONSTANT a_init 	 : STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0) := "00110000";
	CONSTANT avi_init  : STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0) := "00000001";
	CONSTANT temp_init : STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0) := "00000000";
	CONSTANT cte1_init : STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0) := "11111111";
	CONSTANT acc_init  : STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0) := "00000010";
	TYPE men_type IS ARRAY (0 TO 2**ADDR_WIDTH-1) OF STD_LOGIC_VECTOR (DATA_WIDTH-1 DOWNTO 0);
	SIGNAL array_reg: men_type;
BEGIN
	write_process: PROCESS(clk)
	BEGIN
		IF (rst='1') THEN
			array_reg(0) <= pc_init;
			array_reg(1) <= sp_init;
			array_reg(2) <= dptr_init;
			array_reg(3) <= a_init;
			array_reg(4) <= avi_init;
			array_reg(5) <= temp_init;
			array_reg(6) <= cte1_init;
			array_reg(7) <= acc_init;		
		ELSIF (rising_edge(clk)) THEN 
			IF (wr_en = '1') THEN
				array_reg (to_integer(unsigned(w_addr))) <= w_data;
			END IF;
		END IF;
	END PROCESS;
	BusB <= array_reg(to_integer(unsigned(r_addr)));
	BusA <= array_reg(7);	
END ARCHITECTURE;
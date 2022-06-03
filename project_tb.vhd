LIBRARY IEEE; -- IEEE library is included
USE IEEE.STD_LOGIC_1164.ALL; -- the std_logic_1164 package from the IEEE library is used
--------------------------------------------------------
ENTITY project_tb IS 
END ENTITY project_tb; 
--------------------------------------------------------
ARCHITECTURE testbench OF project_tb IS 
    --SIGNALS
    SIGNAL clk_tb	        :	 STD_LOGIC:='1';
    SIGNAL rst_tb	        :    STD_LOGIC:='1';
	 SIGNAL int_tb	        :    STD_LOGIC:='0';
	 SIGNAL PERIFIN_tb	  :    STD_LOGIC_VECTOR(7 DOWNTO 0);
	 SIGNAL PERIF2_tb	     :    STD_LOGIC_VECTOR(7 DOWNTO 0);
	 SIGNAL PERIF3_tb	     :    STD_LOGIC_VECTOR(7 DOWNTO 0);
	 SIGNAL PERIF1_tb	     :    STD_LOGIC:='0'; 
				
BEGIN
    ----CLOCK GENERATION----
	 clk_tb <= NOT clk_tb AFTER 10ns; 
	 
	 ----RESET GENERATION----
	 rst_tb        <='0'    AFTER 10ns;
	 
	 --test vectors
	 PERIFIN_tb <= "00000000" AFTER 10ns;
	 int_tb      <= '0' AFTER 10ns;--Primer ciclo
							
    DUT: ENTITY work.project1 PORT MAP( clk_tb, rst_tb,int_tb, PERIF1_tb, PERIF2_tb, PERIF3_tb, PERIFIN_tb);
 
END ARCHITECTURE;
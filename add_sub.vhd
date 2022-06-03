LIBRARY IEEE; -- IEEE library is included
USE IEEE.STD_LOGIC_1164.ALL; -- the std_logic_1164 package from the IEEE library is used
--------------------------------------------------------
ENTITY add_sub IS
	GENERIC(N			: INTEGER :=8);
	PORT(	  a			:	IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			  b		   :	IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			  addn_sub  :	IN STD_LOGIC;
			  s			:	OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			  cout		:	OUT STD_LOGIC);
END ENTITY add_sub;
--------------------------------------------------------------
ARCHITECTURE rtl OF add_sub IS
	SIGNAL	bxor					:	STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL	add_nsub_vector	:	STD_LOGIC_VECTOR(N-1 DOWNTO 0);
BEGIN
		vector_generation: FOR i in N-1 DOWNTO 0 GENERATE
			add_nsub_vector(i)	<= addn_sub;
		END GENERATE;
		
		bxor	<= b XOR add_nsub_vector;
		
		adder: ENTITY work.nbit_adder
		GENERIC MAP (N		=> N)
		PORT MAP (a, bxor, addn_sub, s, cout);
END ARCHITECTURE;

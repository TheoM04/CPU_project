library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_SIGNED.all;

ENTITY one_bit_full_adder IS
    PORT (
        A, B, Cin : IN  STD_LOGIC;
        Sum, Cout : OUT STD_LOGIC
    );
END one_bit_full_adder;

ARCHITECTURE Stractural OF one_bit_full_adder IS
	COMPONENT one_bit_half_adder IS
		PORT (
			A, B : IN  STD_LOGIC;
         Sum, Cout : OUT STD_LOGIC
		);
   END COMPONENT;
	 
	COMPONENT or_gate IS
	PORT (A, B: IN STD_LOGIC ;
		Q: OUT STD_LOGIC) ;
	END COMPONENT;
	 
   SIGNAL s1, c1, c2 : STD_LOGIC;

BEGIN
	HA1: one_bit_half_adder 
        PORT MAP (A, B, s1, c1);
   HA2: one_bit_half_adder 
        PORT MAP (s1, Cin, Sum, c2);
   R: or_gate PORT MAP (c1, c2, Cout);
	
END Stractural;
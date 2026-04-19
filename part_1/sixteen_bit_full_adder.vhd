library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_SIGNED.all;

ENTITY sixteen_bit_full_adder IS
    PORT (
		A, B : IN STD_LOGIC_VECTOR(15 downto 0);
		Cin : IN  STD_LOGIC;
      Sum : OUT STD_LOGIC_VECTOR(15 downto 0); 
		Cout : OUT STD_LOGIC
    );
END sixteen_bit_full_adder;

ARCHITECTURE Stractural OF sixteen_bit_full_adder IS
	COMPONENT one_bit_full_adder IS
	PORT (
       A, B, Cin : IN  STD_LOGIC;
       Sum, Cout : OUT STD_LOGIC
    );
   END COMPONENT;
	 
   SIGNAL c : STD_LOGIC_VECTOR(16 downto 0);

BEGIN
	c(0) <= Cin;

	ADDER_ARRAY: FOR i IN 0 TO 15 GENERATE
		FA: one_bit_full_adder PORT MAP(A(i), B(i), c(i), Sum(i), c(i+1));
	END GENERATE ADDER_ARRAY;
	
	Cout <= c(16);
	
END Stractural;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

ENTITY xor_gate IS
PORT (A, B: IN STD_LOGIC ;
		Q: OUT STD_LOGIC) ;
END xor_gate;

ARCHITECTURE stracturalXOR OF xor_gate IS

COMPONENT and_gate IS
PORT (A, B: IN STD_LOGIC;
		Q: OUT STD_LOGIC);
END COMPONENT;

COMPONENT or_gate IS
PORT (A, B: IN STD_LOGIC;
		Q: OUT STD_LOGIC);
END COMPONENT;

COMPONENT not_gate IS
PORT (A: IN STD_LOGIC;
		Q: OUT STD_LOGIC);
END COMPONENT;

SIGNAL x, y, anot, bnot: STD_LOGIC;
BEGIN
	V1: not_gate PORT MAP(B,bnot);
	V2: and_gate PORT MAP(A,bnot,x);
	V3: not_gate PORT MAP(A,anot);
	V4: and_gate PORT MAP(anot,B,y);
	V5: or_gate PORT MAP(x,y,Q);
END stracturalXOR;
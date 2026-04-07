library IEEE;
use IEEE.STD_LOGIC_1164.all;

ENTITY mux2to1 IS
PORT (in0, in1, Sel: IN STD_LOGIC ;
		Q: OUT STD_LOGIC) ;
END mux2to1;

ARCHITECTURE stractural OF mux2to1 IS
COMPONENT not_gate IS
PORT (A: IN STD_LOGIC;
		Q: OUT STD_LOGIC);
END COMPONENT;

COMPONENT or_gate IS
PORT (A, B: IN STD_LOGIC;
		Q: OUT STD_LOGIC);
END COMPONENT;

COMPONENT and_gate IS
PORT (A, B: IN STD_LOGIC;
		Q: OUT STD_LOGIC);
END COMPONENT;

SIGNAL sel_n, and0, and1: STD_LOGIC;

BEGIN
	INV: not_gate PORT MAP(Sel, sel_n);
	A1: and_gate PORT MAP(in0, sel_n, and0);
	A2: and_gate PORT MAP(in1, Sel, and1);
	O1: or_gate PORT MAP(and0, and1, Q);
END stractural;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

ENTITY and3_gate IS
PORT (A, B, c: IN STD_LOGIC ;
		Q: OUT STD_LOGIC) ;
END and3_gate;

ARCHITECTURE Stractural OF and3_gate IS

COMPONENT and_gate IS
PORT (A, B: IN STD_LOGIC ;
		Q: OUT STD_LOGIC) ;
END COMPONENT;

SIGNAL s: STD_LOGIC;

BEGIN
	AND1: and_gate PORT MAP(A,B,s);
	AND2: and_gate PORT MAP(C,s,Q);
END Stractural;
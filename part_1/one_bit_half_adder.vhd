library IEEE;
use IEEE.STD_LOGIC_1164.all;

ENTITY one_bit_half_adder IS
PORT (A, B: IN STD_LOGIC ;
		Sum, Cout: OUT STD_LOGIC) ;
END one_bit_half_adder;

ARCHITECTURE Stractural OF one_bit_half_adder IS

COMPONENT xor_gate IS
PORT (A, B: IN STD_LOGIC ;
		Q: OUT STD_LOGIC) ;
END COMPONENT;

COMPONENT and_gate IS
PORT (A, B: IN STD_LOGIC ;
		Q: OUT STD_LOGIC) ;
END COMPONENT;

BEGIN
	V1: xor_gate PORT MAP(A, B, Sum);
	V2: and_gate PORT MAP(A, B, Cout);
END Stractural;
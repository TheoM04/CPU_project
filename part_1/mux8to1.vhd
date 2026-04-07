library IEEE;
use IEEE.STD_LOGIC_1164.all;

ENTITY mux8to1 IS
PORT (Inp: IN STD_LOGIC_VECTOR(7 downto 0); 
		Sel: IN STD_LOGIC_VECTOR(2 downto 0);
		Q: OUT STD_LOGIC);
END mux8to1;

ARCHITECTURE stractural OF mux8to1 IS
COMPONENT mux2to1
	PORT (in0, in1, Sel: IN STD_LOGIC ;
		Q: OUT STD_LOGIC) ;
END COMPONENT;

SIGNAL stage1: STD_LOGIC_VECTOR(3 downto 0);
SIGNAL stage2: STD_LOGIC_VECTOR(1 downto 0);

BEGIN
	M1_0: mux2to1 PORT MAP(Inp(0), Inp(1), Sel(0), stage1(0));
	M1_1: mux2to1 PORT MAP(Inp(2), Inp(3), Sel(0), stage1(1));
	M1_2: mux2to1 PORT MAP(Inp(4), Inp(5), Sel(0), stage1(2));
	M1_3: mux2to1 PORT MAP(Inp(6), Inp(7), Sel(0), stage1(3));
	
	M2_0: mux2to1 PORT MAP(stage1(0), stage1(1), Sel(1), stage2(0));
	M2_1: mux2to1 PORT MAP(stage1(2), stage1(3), Sel(1), stage2(1));
	
	M3_0: mux2to1 PORT MAP(stage2(0), stage2(1), Sel(2), Q);
END stractural;
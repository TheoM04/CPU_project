library IEEE;
use IEEE.STD_LOGIC_1164.all;

ENTITY decoder3to8 IS
PORT (inp: IN STD_LOGIC_VECTOR(2 downto 0);
		Y: OUT STD_LOGIC_VECTOR(7 downto 0));
END decoder3to8;

ARCHITECTURE stractural OF decoder3to8 IS
COMPONENT not_gate IS
PORT (A: IN STD_LOGIC;
		Q: OUT STD_LOGIC);
END COMPONENT;

COMPONENT and3_gate IS
PORT (A, B, C: IN STD_LOGIC;
		Q: OUT STD_LOGIC);
END COMPONENT;

SIGNAL inp_n: STD_LOGIC_VECTOR(2 DOWNTO 0);

BEGIN
	INV1: not_gate PORT MAP(inp(0), inp_n(0));
	INV2: not_gate PORT MAP(inp(1), inp_n(1));
	INV3: not_gate PORT MAP(inp(2), inp_n(2));
	
	A1: and3_gate PORT MAP(inp_n(0), inp_n(1), inp_n(2), Y(0));
	A2: and3_gate PORT MAP(inp(0), inp_n(1), inp_n(2), Y(1));
	
	A3: and3_gate PORT MAP(inp_n(0), inp(1), inp_n(2), Y(2));
	A4: and3_gate PORT MAP(inp(0), inp(1), inp_n (2), Y(3));
	
	A5: and3_gate PORT MAP(inp_n(0), inp_n(1), inp(2), Y(4));
	A6: and3_gate PORT MAP(inp(0), inp_n(1), inp(2), Y(5));
	
	A7: and3_gate PORT MAP(inp_n(0), inp(1), inp(2), Y(6));
	A8: and3_gate PORT MAP(inp(0), inp(1), inp(2), Y(7));
	
END stractural;
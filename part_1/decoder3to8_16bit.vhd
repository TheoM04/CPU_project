library IEEE;
use IEEE.STD_LOGIC_1164.all;

ENTITY decoder3to8_16bit IS
PORT (inp: IN STD_LOGIC_VECTOR(2 downto 0);
		Y: OUT STD_LOGIC_VECTOR(15 downto 0));
END decoder3to8_16bit;

ARCHITECTURE stractural OF decoder3to8_16bit IS
COMPONENT decoder3to8 IS
PORT (inp: IN STD_LOGIC_VECTOR(2 downto 0);
		Y: OUT STD_LOGIC_VECTOR(7 downto 0));
END COMPONENT;

SIGNAL stage1: STD_LOGIC_VECTOR(7 downto 0);

BEGIN
	D1: decoder3to8 PORT MAP(inp, stage1);
	
	Y(0)  <= stage1(0);
	Y(1)  <= stage1(0);
	Y(2)  <= stage1(1);
	Y(3)  <= stage1(1);
	Y(4)  <= stage1(2);
	Y(5)  <= stage1(2);
	Y(6)  <= stage1(3);
	Y(7)  <= stage1(3);
	Y(8)  <= stage1(4);
	Y(9)  <= stage1(4);
	Y(10) <= stage1(5);
	Y(11) <= stage1(5);
	Y(12) <= stage1(6);
	Y(13) <= stage1(6);
	Y(14) <= stage1(7);
	Y(15) <= stage1(7);

END stractural;
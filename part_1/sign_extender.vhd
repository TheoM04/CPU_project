library ieee;
use ieee.std_logic_1164.all;

entity sign_extender is
	port(
		imm	: in std_logic_vector (5 downto 0);
		ext	: out std_logic_vector (15 downto 0)
	);
end sign_extender;

architecture structural of sign_extender is
begin
		 ext(0)  <= imm(0);
		 ext(1)  <= imm(1);
		 ext(2)  <= imm(2);
		 ext(3)  <= imm(3);
		 ext(4)  <= imm(4);
		 ext(5)  <= imm(5);
		 ext(6)  <= imm(5);
		 ext(7)  <= imm(5);
		 ext(8)  <= imm(5);
		 ext(9)  <= imm(5);
		 ext(10) <= imm(5);
		 ext(11) <= imm(5);
		 ext(12) <= imm(5);
		 ext(13) <= imm(5);
		 ext(14) <= imm(5);
		 ext(15) <= imm(5);
end structural;


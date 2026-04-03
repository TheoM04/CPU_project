library ieee;
use ieee.std_logic_1164.all;

entity sign_extender is
	port(
		imm	: in std_logic_vector (5 downto 0);
		ext	: out std_logic_vector (15 downto 0)
	);
end sign_extender;

architecture behavioral of sign_extender is
begin
		ext <= (15 downto 6 => imm(5)) & imm;
end behavioral;


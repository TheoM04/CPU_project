library ieee;
use ieee.std_logic_1164.all;

entity register_zero is
	port(
		q : out std_logic_vector (15 downto 0)
		);
end register_zero;

architecture behavioral of register_zero is
begin
	q <= (others => '0');
end behavioral;
	

library ieee;
use ieee.std_logic_1164.all;

entity ff_rising is
	port(
		d		: in std_logic_vector (15 downto 0);
		clk  	: in std_logic;
		en		: in std_logic;
		rst	: in std_logic;
		q		: out std_logic_vector (15 downto 0)
	);	
	
end ff_rising;

architecture behavioral of ff_rising is
begin
	process(clk)
	begin
		if rising_edge(clk) then
			if rst = '0' then
				q <= (others => '0');
			elsif en = '1' then
				q <= d;
			end if;
		end if;
	end process;
end behavioral;



library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity jump_address is
	port(
		jumpAD		: in std_logic_vector (11 downto 0);
		instrP2AD	: in std_logic_vector (15 downto 0);
		EjumpAD		: out std_logic_vector (15 downto 0)
	);
end jump_address;

architecture behavioral of jump_address is

		signal extended	: std_logic_vector (15 downto 0);
		signal doubled		: std_logic_vector (15 downto 0);
		
begin
		extended <= (15 downto 12 => jumpAD(11)) & jumpAD;
		doubled 	<= extended (14 downto 0) & '0';
		EjumpAD  <= doubled + instrP2AD;
		
end behavioral;

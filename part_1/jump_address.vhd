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

architecture structural of jump_address is

		component sixteen_bit_full_adder is
		PORT (
			A, B : IN STD_LOGIC_VECTOR(15 downto 0);
			Cin : IN  STD_LOGIC;
			Sum : OUT STD_LOGIC_VECTOR(15 downto 0); 
			Cout : OUT STD_LOGIC);
		end component;

		signal extended, doubled : std_logic_vector (15 downto 0);
		signal Cout : std_logic;
		
begin
		extended <= (15 downto 12 => jumpAD(11)) & jumpAD;
		doubled 	<= extended (14 downto 0) & '0';
		FA: sixteen_bit_full_adder PORT MAP(doubled, instrP2AD, '0', EjumpAD, Cout);	
end structural;

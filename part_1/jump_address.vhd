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
		--extend 12 se 16 bits
    extended(0)  <= jumpAD(0);
    extended(1)  <= jumpAD(1);
    extended(2)  <= jumpAD(2);
    extended(3)  <= jumpAD(3);
    extended(4)  <= jumpAD(4);
    extended(5)  <= jumpAD(5);
    extended(6)  <= jumpAD(6);
    extended(7)  <= jumpAD(7);
    extended(8)  <= jumpAD(8);
    extended(9)  <= jumpAD(9);
    extended(10) <= jumpAD(10);
    extended(11) <= jumpAD(11);
    extended(12) <= jumpAD(11);
    extended(13) <= jumpAD(11);
    extended(14) <= jumpAD(11);
    extended(15) <= jumpAD(11);

    -- Shift left 1 (*2)
    doubled(0)  <= '0';
    doubled(1)  <= extended(0);
    doubled(2)  <= extended(1);
    doubled(3)  <= extended(2);
    doubled(4)  <= extended(3);
    doubled(5)  <= extended(4);
    doubled(6)  <= extended(5);
    doubled(7)  <= extended(6);
    doubled(8)  <= extended(7);
    doubled(9)  <= extended(8);
    doubled(10) <= extended(9);
    doubled(11) <= extended(10);
    doubled(12) <= extended(11);
    doubled(13) <= extended(12);
    doubled(14) <= extended(13);
    doubled(15) <= extended(14);

	 FA: sixteen_bit_full_adder PORT MAP(doubled, instrP2AD, '0', EjumpAD, Cout);	
end structural;

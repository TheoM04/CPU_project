library ieee;
use ieee.std_logic_1164.all;

entity ff_combined is
port(
		d		: in std_logic_vector (15 downto 0);
		clk  	: in std_logic;
		en		: in std_logic;
		rst	: in std_logic;
		sel 	: in std_logic; -- 0 rising / 1 falling
		q		: out std_logic_vector (15 downto 0)
	);	
end ff_combined;

architecture structural of ff_combined is
	
component ff_rising
	port(
		d		: in std_logic_vector (15 downto 0);
		clk  	: in std_logic;
		en		: in std_logic;
		rst	: in std_logic;
		q		: out std_logic_vector (15 downto 0)
	);	
end component;

component ff_falling
	port(
		d		: in std_logic_vector (15 downto 0);
		clk  	: in std_logic;
		en		: in std_logic;
		rst	: in std_logic;
		q		: out std_logic_vector (15 downto 0)
	);	
end component;

	signal q_rising	: std_logic_vector (15 downto 0);
	signal q_falling	: std_logic_vector (15 downto 0);
	

begin

	u1: ff_rising port map(
		d	 => d,
		clk => clk,
		en	 => en,
		rst => rst,
		q   => q_rising
	);
	
	u2: ff_falling port map(
		d	 => d,
		clk => clk,
		en	 => en,
		rst => rst,
		q   => q_falling
	);
	
	q <= q_rising when sel = '0' else q_falling;
	
end structural;
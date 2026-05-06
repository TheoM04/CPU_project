library ieee;
use ieee.std_logic_1164.all;

entity shift_register is
    port(
        a : in  std_logic;
        clk    : in  std_logic;
        q : out std_logic_vector(3 downto 0)
    );
end shift_register;

architecture structural of shift_register is
    component ff_rising_1bit is
        port(
            d   : in  std_logic;
            clk : in  std_logic;
            en  : in  std_logic;
            rst : in  std_logic;
            q   : out std_logic
        );
    end component;
	 
	 signal s: std_logic_vector(3 downto 0);

begin
    FF1: ff_rising_1bit port map(d => a,   clk => clk, en => '1', rst => '1', q => s(3));
    FF2: ff_rising_1bit port map(d => s(3), clk => clk, en => '1', rst => '1', q => s(2));
    FF3: ff_rising_1bit port map(d => s(2), clk => clk, en => '1', rst => '1', q => s(1));
    FF4: ff_rising_1bit port map(d => s(1), clk => clk, en => '1', rst => '1', q => s(0));
	 q <= s;
end structural;

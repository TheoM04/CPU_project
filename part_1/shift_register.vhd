library ieee;
use ieee.std_logic_1164.all;

entity shift_register is
    port(
        a : in  std_logic;
        clk    : in  std_logic;
        en     : in  std_logic;
        rst    : in  std_logic;
        q : out std_logic
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

    signal ff1_out, ff2_out, ff3_out : std_logic;

begin
    FF1: ff_rising_1bit port map(d => a,   clk => clk, en => en, rst => rst, q => ff1_out);
    FF2: ff_rising_1bit port map(d => ff1_out, clk => clk, en => en, rst => rst, q => ff2_out);
    FF3: ff_rising_1bit port map(d => ff2_out, clk => clk, en => en, rst => rst, q => ff3_out);
    FF4: ff_rising_1bit port map(d => ff3_out, clk => clk, en => en, rst => rst, q => q);
end structural;

library ieee;
use ieee.std_logic_1164.all;


entity register_16bit is
    generic(
        N : integer := 16
    );
    port(
        d   : in  std_logic_vector(N-1 downto 0);
        clk : in  std_logic;
        en  : in  std_logic;
        rst : in  std_logic;
        q   : out std_logic_vector(N-1 downto 0)
    );
end register_16bit;

architecture structural of register_16bit is
    component ff_rising is
        port(
            d   : in  std_logic_vector(15 downto 0);
            clk : in  std_logic;
            en  : in  std_logic;
            rst : in  std_logic;
            q   : out std_logic_vector(15 downto 0)
        );
    end component;

begin
    FF: ff_rising
        port map(
            d   => d,
            clk => clk,
            en  => en,
            rst => rst,
            q   => q
        );
end structural;

library ieee;
use ieee.std_logic_1164.all;

entity ff_rising_1bit is
    port(
        d   : in  std_logic;
        clk : in  std_logic;
        en  : in  std_logic;
        rst : in  std_logic;
        q   : out std_logic
    );
end ff_rising_1bit;

architecture behavioral of ff_rising_1bit is
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '0' then
                q <= '0';
            elsif en = '1' then
                q <= d;
            end if;
        end if;
    end process;
end behavioral;

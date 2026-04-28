library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity IF_ID is
    Port (
        clk            : in  STD_LOGIC;
        en		        : in  STD_LOGIC;
        flush          : in  STD_LOGIC;
        inPC           : in  STD_LOGIC_VECTOR(15 downto 0);
        inInstruction  : in  STD_LOGIC_VECTOR(15 downto 0);
        outPC          : out STD_LOGIC_VECTOR(15 downto 0);
        outInstruction : out STD_LOGIC_VECTOR(15 downto 0)
    );
end IF_ID;

architecture Behavioral of IF_ID is
    signal pcPlus2 : STD_LOGIC_VECTOR(15 downto 0);
begin
    pcPlus2 <= inPC + 2;

    process(clk)
    begin
        if rising_edge(clk) then
            if flush = '1' then
                outPC          <= (others => '0');
                outInstruction <= (others => '0');
            elsif en = '1' then
                outPC          <= pcPlus2;
                outInstruction <= inInstruction;
            end if;
        end if;
    end process;
end Behavioral;
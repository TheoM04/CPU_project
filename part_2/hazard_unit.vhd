library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity hazard_unit is
    Port (
        isJump      : in  STD_LOGIC;
        isJR        : in  STD_LOGIC;
        isBranch    : in  STD_LOGIC;
        aluResult   : in  STD_LOGIC_VECTOR(15 downto 0);

        flush_IFID  : out STD_LOGIC;
        flush_IDEX  : out STD_LOGIC;
        JRopcode    : out STD_LOGIC_VECTOR(1 downto 0)
    );
end hazard_unit;

architecture behavioral of hazard_unit is
begin
    process(isJump, isJR, isBranch, aluResult)
    begin
        if isJR = '1' then
            -- Jump Register
            flush_IFID <= '1';
            flush_IDEX <= '1';
            JRopcode   <= "01";
        elsif isJump = '1' then
            -- Kanoniko Jump
            flush_IFID <= '1';
            flush_IDEX <= '1';
            JRopcode   <= "01"; -- JumpAD
        elsif isBranch = '1' and aluResult /= x"0000" then
            -- Branch taken: GEQ epistrefei diaforetiko tou 0 otan I1 >= 0
            flush_IFID <= '1';
            flush_IDEX <= '1';
            JRopcode   <= "10"; -- BranchAD
        else
            -- Kanonikh roh
            flush_IFID <= '0';
            flush_IDEX <= '0';
            JRopcode   <= "00"; -- PC+2
        end if;
    end process;
end behavioral;
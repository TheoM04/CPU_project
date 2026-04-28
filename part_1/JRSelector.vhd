library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JRSelector is
    Port (
        JRopcode  : in  STD_LOGIC_VECTOR(1 downto 0);
        PCP2AD    : in  STD_LOGIC_VECTOR(15 downto 0);
        JumpAD    : in  STD_LOGIC_VECTOR(15 downto 0);
        BranchAD  : in  STD_LOGIC_VECTOR(15 downto 0);

        PCnext    : out STD_LOGIC_VECTOR(15 downto 0)
    );
end JRSelector;

architecture behavioral of JRSelector is
begin
    process(JRopcode, PCP2AD, JumpAD, BranchAD)
    begin
        case JRopcode is
            when "00"   => PCnext <= PCP2AD;
            when "01"   => PCnext <= JumpAD;
            when "10"   => PCnext <= BranchAD;
            when others => PCnext <= PCP2AD;
        end case;
    end process;
end behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity forwarding_unit is
    Port (
        RS           : in  STD_LOGIC_VECTOR(2 downto 0);
        RT           : in  STD_LOGIC_VECTOR(2 downto 0);
        regAD_EXMEM  : in  STD_LOGIC_VECTOR(2 downto 0);
        regAD_MEMWB  : in  STD_LOGIC_VECTOR(2 downto 0);
        we_EXMEM     : in  STD_LOGIC;
        we_MEMWB     : in  STD_LOGIC;

        forwardA     : out STD_LOGIC_VECTOR(1 downto 0);
        forwardB     : out STD_LOGIC_VECTOR(1 downto 0)
    );
end forwarding_unit;

architecture behavioral of forwarding_unit is
begin
    process(RS, RT, regAD_EXMEM, regAD_MEMWB, we_EXMEM, we_MEMWB)
    begin
        -- Forward A (gia RS)
        if (we_EXMEM = '1' and regAD_EXMEM /= "000" and regAD_EXMEM = RS) then
            forwardA <= "10"; -- apo EX_MEM
        elsif (we_MEMWB = '1' and regAD_MEMWB /= "000" and regAD_MEMWB = RS) then
            forwardA <= "01"; -- apo MEM_WB
        else
            forwardA <= "00"; -- apo Register File
        end if;

        -- Forward B (gia RT)
        if (we_EXMEM = '1' and regAD_EXMEM /= "000" and regAD_EXMEM = RT) then
            forwardB <= "10"; -- apo EX_MEM
        elsif (we_MEMWB = '1' and regAD_MEMWB /= "000" and regAD_MEMWB = RT) then
            forwardB <= "01"; -- apo MEM_WB
        else
            forwardB <= "00"; -- από Register File
        end if;
    end process;
end behavioral;
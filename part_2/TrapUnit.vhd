library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TrapUnit is
    Port (
        opcode : in  STD_LOGIC_VECTOR(3 downto 0);
        EOR : out STD_LOGIC
    );
end TrapUnit;

architecture Behavioral of TrapUnit is
begin
    EOR <= '1' when opcode = "1010" else '0';
end Behavioral;
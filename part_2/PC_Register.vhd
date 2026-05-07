library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PC_Register is
    Port (
        clock   : in  STD_LOGIC;
        enable  : in  STD_LOGIC;                      -- Result of (TrapUnit_Out AND IsEOR_IDEX)
        pc_in   : in  STD_LOGIC_VECTOR(15 downto 0);  -- From JRSelector
        pc_out  : out STD_LOGIC_VECTOR(15 downto 0)
    );
end PC_Register;

architecture Behavioral of PC_Register is
    signal current_pc : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
begin

    process(clock)
    begin
        if rising_edge(clock) then
            if enable = '1' then
                current_pc <= pc_in;
            end if;
        end if;
    end process;

    pc_out <= current_pc;

end Behavioral;
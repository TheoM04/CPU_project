library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MEM_WB is
    Port (
        clk         : in  STD_LOGIC;
        -- apo EX_MEM
        isLW        : in  STD_LOGIC;
        isRead      : in  STD_LOGIC;
        writeEnable : in  STD_LOGIC;  -- νέο port
        regAD       : in  STD_LOGIC_VECTOR(2 downto 0);
        -- data pros eggrafh
        fromData    : in  STD_LOGIC_VECTOR(15 downto 0);
        keyData     : in  STD_LOGIC_VECTOR(15 downto 0);
        aluResult   : in  STD_LOGIC_VECTOR(15 downto 0);

        -- outputs pros Register File
        writeEnable_out : out STD_LOGIC;  -- νέο port
        writeData   : out STD_LOGIC_VECTOR(15 downto 0);
        writeAD     : out STD_LOGIC_VECTOR(2 downto 0)
    );
end MEM_WB;

architecture Behavioral of MEM_WB is
begin
    process(clk)
    begin
        if rising_edge(clk) then
            writeAD         <= regAD;
            writeEnable_out <= writeEnable;
            
            if isRead = '1' then
                writeData <= keyData;
            elsif isLW = '1' then
                writeData <= fromData;
            else
                writeData <= aluResult;
            end if;
        end if;
    end process;
end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity EX_MEM is
    Port (
        clk         		: in  STD_LOGIC;
        isPrint     		: in  STD_LOGIC;
        isRead      		: in  STD_LOGIC;
        writeEnable 		: in  STD_LOGIC;
        isLW        		: in  STD_LOGIC;
        isSW                : in  STD_LOGIC;
        Result      		: in  STD_LOGIC_VECTOR(15 downto 0);
        regAD       		: in  STD_LOGIC_VECTOR(2 downto 0);
        R2Reg       		: in  STD_LOGIC_VECTOR(15 downto 0);

        out_isPrint     : out STD_LOGIC;
        out_isRead      : out STD_LOGIC;
        out_writeEnable : out STD_LOGIC;
        out_isLW        : out STD_LOGIC;
        out_isSW        : out STD_LOGIC;
        out_Result      : out STD_LOGIC_VECTOR(15 downto 0);
        out_regAD       : out STD_LOGIC_VECTOR(2 downto 0);
        out_R2Reg       : out STD_LOGIC_VECTOR(15 downto 0)
    );
end EX_MEM;

architecture behavioral of EX_MEM is
begin
    process(clk)
    begin
        if rising_edge(clk) then
            out_isPrint     <= isPrint;
            out_isRead      <= isRead;
            out_writeEnable <= writeEnable;
            out_isLW        <= isLW;
            out_isSW        <= isSW;
            out_Result      <= Result;
            out_regAD       <= regAD;
            out_R2Reg       <= R2Reg;
        end if;
    end process;
end behavioral;
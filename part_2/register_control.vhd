library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity register_control is
    Port (
        flush         : in  STD_LOGIC;
        opcode        : in  STD_LOGIC_VECTOR(3 downto 0);
        func          : in  STD_LOGIC_VECTOR(2 downto 0);

        IsBranch      : out STD_LOGIC;
        IsJR          : out STD_LOGIC;
        IsJumpD       : out STD_LOGIC;
        IsLW          : out STD_LOGIC;
        IsMFPC        : out STD_LOGIC;
        IsPrintDigit  : out STD_LOGIC;
        IsR           : out STD_LOGIC;
        IsReadDigit   : out STD_LOGIC;
        IsSW          : out STD_LOGIC;
        RegWrite      : out STD_LOGIC
    );
end register_control;

architecture Behavioral of register_control is
begin
    process(opcode, func, flush)
    begin
        IsBranch     <= '0'; IsJR         <= '0'; IsJumpD      <= '0';
        IsLW         <= '0'; IsMFPC       <= '0'; IsPrintDigit <= '0';
        IsR          <= '0'; IsReadDigit  <= '0'; IsSW         <= '0';
        RegWrite     <= '0';

        if flush = '0' then
            case opcode is
                when "0000" => -- R-Type
                    IsR      <= '1';
                    RegWrite <= '1';
                
                when "1000" => -- LW
                    IsLW     <= '1';
                    RegWrite <= '1';
                
                when "1001" => -- SW
                    IsSW     <= '1';
                
                when "0100" => -- Branch
                    IsBranch <= '1';
                
                when "1111" => -- Jump
                    IsJumpD  <= '1';
                
                when "0101" => -- JR (Jump Register)
                    IsJR     <= '1';
                
                when "0110" => -- MFPC
                    IsMFPC   <= '1';
                    RegWrite <= '1';
                
                when "1101" => -- ReadDigit
                    IsReadDigit <= '1';
                    RegWrite    <= '1';
                
                when "1110" => -- PrintDigit
                    IsPrintDigit <= '1';

                when others => 
                    null;
            end case;
        end if;
    end process;
end Behavioral;
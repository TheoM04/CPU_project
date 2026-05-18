library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ID_EX is
    Port (
        clock              : in  STD_LOGIC;

        isBranch           : in  STD_LOGIC;
        isEOR              : in  STD_LOGIC;
        IsJR               : in  STD_LOGIC;
        IsJump             : in  STD_LOGIC;
        IsLW               : in  STD_LOGIC;
        IsMFPC             : in  STD_LOGIC;
        IsPrintDigit       : in  STD_LOGIC;
        IsR                : in  STD_LOGIC;
        IsReadDigit        : in  STD_LOGIC;
        IsSW               : in  STD_LOGIC;
        WasJumpOut         : in  STD_LOGIC;
        ALUFunc            : in  STD_LOGIC_VECTOR(6 downto 0);  -- opcode(3:0) & func(2:0)
        
        R1Reg              : in  STD_LOGIC_VECTOR(15 downto 0);
        R2Reg              : in  STD_LOGIC_VECTOR(15 downto 0);
        Immediate16        : in  STD_LOGIC_VECTOR(15 downto 0);
        R1AD               : in  STD_LOGIC_VECTOR(2 downto 0);  -- RS address
        R2AD               : in  STD_LOGIC_VECTOR(2 downto 0);  -- RT address
        RdAD               : in  STD_LOGIC_VECTOR(2 downto 0);  -- RD address (destination)
        JumpShortAddr      : in  STD_LOGIC_VECTOR(11 downto 0);

        IsBranch_IDEX      : out STD_LOGIC;
        IsEOR_IDEX         : out STD_LOGIC;
        IsJR_IDEX          : out STD_LOGIC;
        IsJump_IDEX        : out STD_LOGIC;
        IsLW_IDEX          : out STD_LOGIC;
        IsMFPC_IDEX        : out STD_LOGIC;
        IsPrintDigit_IDEX  : out STD_LOGIC;
        IsR_IDEX           : out STD_LOGIC;
        IsReadDigit_IDEX   : out STD_LOGIC;
        IsSW_IDEX          : out STD_LOGIC;
        ALUFunc_IDEX       : out STD_LOGIC_VECTOR(6 downto 0);
        R1Reg_IDEX         : out STD_LOGIC_VECTOR(15 downto 0);
        R2Reg_IDEX         : out STD_LOGIC_VECTOR(15 downto 0);
        Immediate16_IDEX   : out STD_LOGIC_VECTOR(15 downto 0);
        R1AD_IDEX          : out STD_LOGIC_VECTOR(2 downto 0);  -- RS address
        R2AD_IDEX          : out STD_LOGIC_VECTOR(2 downto 0);  -- RT address
        RdAD_IDEX          : out STD_LOGIC_VECTOR(2 downto 0);  -- RD address (destination)
        JumpShortAddr_IDEX : out STD_LOGIC_VECTOR(11 downto 0)
    );
end ID_EX;

architecture Behavioral of ID_EX is
begin
    process(clock)
    begin
        if rising_edge(clock) then
            if WasJumpOut = '1' then
                IsBranch_IDEX     <= '0';
                IsEOR_IDEX        <= '0';
                IsJR_IDEX         <= '0';
                IsJump_IDEX       <= '0';
                IsLW_IDEX         <= '0';
                IsMFPC_IDEX       <= '0';
                IsPrintDigit_IDEX <= '0';
                IsR_IDEX          <= '0';
                IsReadDigit_IDEX  <= '0';
                IsSW_IDEX         <= '0';
            else
                IsBranch_IDEX     <= isBranch;
                IsEOR_IDEX        <= isEOR;
                IsJR_IDEX         <= IsJR;
                IsJump_IDEX       <= IsJump;
                IsLW_IDEX         <= IsLW;
                IsMFPC_IDEX       <= IsMFPC;
                IsPrintDigit_IDEX <= IsPrintDigit;
                IsR_IDEX          <= IsR;
                IsReadDigit_IDEX  <= IsReadDigit;
                IsSW_IDEX         <= IsSW;
                ALUFunc_IDEX      <= ALUFunc;
                R1Reg_IDEX        <= R1Reg;
                R2Reg_IDEX        <= R2Reg;
                Immediate16_IDEX  <= Immediate16;
                R1AD_IDEX         <= R1AD;
                R2AD_IDEX         <= R2AD;
                RdAD_IDEX         <= RdAD;
                JumpShortAddr_IDEX <= JumpShortAddr;
            end if;
        end if;
    end process;
end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

ENTITY register_file IS
    PORT (
        clk         : IN  STD_LOGIC;
        write1AD    : IN  STD_LOGIC_VECTOR(2 downto 0);
        write1      : IN  STD_LOGIC_VECTOR(15 downto 0);
        readAD1     : IN  STD_LOGIC_VECTOR(2 downto 0);
        readAD2     : IN  STD_LOGIC_VECTOR(2 downto 0);
        Read1       : OUT STD_LOGIC_VECTOR(15 downto 0);
        Read2       : OUT STD_LOGIC_VECTOR(15 downto 0);
        OUTall      : OUT STD_LOGIC_VECTOR(127 downto 0)
    );
END register_file;

ARCHITECTURE structural OF register_file IS
    COMPONENT register_16bit IS
        PORT(
            d   : in  std_logic_vector(15 downto 0);
            clk : in  std_logic;
            en  : in  std_logic;
            rst : in  std_logic;
            q   : out std_logic_vector(15 downto 0)
        );
    END COMPONENT;

    COMPONENT register_zero IS
        PORT(q : out std_logic_vector(15 downto 0));
    END COMPONENT;

    COMPONENT decoder3to8 IS
        PORT(inp : IN STD_LOGIC_VECTOR(2 downto 0);
				 Y : OUT STD_LOGIC_VECTOR(7 downto 0));
    END COMPONENT;

    COMPONENT mux8to1_16bit IS
        PORT(
            reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7 : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
            sel : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
            q   : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL load_reg : STD_LOGIC_VECTOR(7 downto 0);
    SIGNAL r0, r1, r2, r3, r4, r5, r6, r7 : STD_LOGIC_VECTOR(15 downto 0);

BEGIN

    DEC: decoder3to8 PORT MAP(write1AD, load_reg);

    REG0: register_zero PORT MAP(q => r0);

    REG1: register_16bit PORT MAP(write1, clk, load_reg(1), '0', r1);
    REG2: register_16bit PORT MAP(write1, clk, load_reg(2), '0', r2);
    REG3: register_16bit PORT MAP(write1, clk, load_reg(3), '0', r3);
    REG4: register_16bit PORT MAP(write1, clk, load_reg(4), '0', r4);
    REG5: register_16bit PORT MAP(write1, clk, load_reg(5), '0', r5);
    REG6: register_16bit PORT MAP(write1, clk, load_reg(6), '0', r6);
    REG7: register_16bit PORT MAP(write1, clk, load_reg(7), '0', r7);

    MUX_A: mux8to1_16bit PORT MAP(r0, r1, r2, r3, r4, r5, r6, r7, readAD1, Read1);
    MUX_B: mux8to1_16bit PORT MAP(r0, r1, r2, r3, r4, r5, r6, r7, readAD2, Read2);

    OUTall <= r7 & r6 & r5 & r4 & r3 & r2 & r1 & r0;

END structural;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux8to1_16bit is
    Port ( 
        reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7 : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
        sel : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
        q   : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
end mux8to1_16bit;

architecture Structural of mux8to1_16bit is

    component mux8to1
        PORT (	Inp: IN STD_LOGIC_VECTOR(7 downto 0); 
					Sel: IN STD_LOGIC_VECTOR(2 downto 0);
					Q: OUT STD_LOGIC);
    end component;

begin

    MUX_GEN: FOR i IN 0 TO 15 GENERATE
        BIT_MUX: mux8to1 PORT MAP (
            Inp(0) => reg0(i),
            Inp(1) => reg1(i),
            Inp(2) => reg2(i),
            Inp(3) => reg3(i),
            Inp(4) => reg4(i),
            Inp(5) => reg5(i),
            Inp(6) => reg6(i),
            Inp(7) => reg7(i),
            
            Sel    => sel,
            Q      => q(i)
        );
    END GENERATE;

end Structural;
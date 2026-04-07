library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_SIGNED.all;

ENTITY alu_16bit IS
PORT (A, B: IN STD_LOGIC_VECTOR(15 downto 0);
		OP: IN STD_LOGIC_VECTOR(2 downto 0);
		Result: OUT STD_LOGIC_VECTOR(15 downto 0));
END alu_16bit;

ARCHITECTURE stractural OF alu_16bit IS

COMPONENT alu_1bit IS
PORT (A, B, Cin : IN STD_LOGIC;
		SEL: IN STD_LOGIC_VECTOR(2 downto 0);
		Q, Cout: OUT STD_LOGIC) ;
END COMPONENT;

	COMPONENT and_gate IS
		PORT (A, B: IN STD_LOGIC; Q: OUT STD_LOGIC);
   END COMPONENT;

   COMPONENT not_gate IS
		PORT (A: IN STD_LOGIC; Q: OUT STD_LOGIC);
   END COMPONENT;

   SIGNAL carries : STD_LOGIC_VECTOR(16 downto 0);
   SIGNAL op0_n, op1_n, sub_detect : STD_LOGIC;

BEGIN

END stractural;
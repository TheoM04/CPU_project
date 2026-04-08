library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_SIGNED.all;

ENTITY alu_16bit IS
PORT (A, B: IN STD_LOGIC_VECTOR(15 downto 0);
		OP: IN STD_LOGIC_VECTOR(2 downto 0);
		Result: OUT STD_LOGIC_VECTOR(15 downto 0);
		overflow: OUT STD_LOGIC);
END alu_16bit;

ARCHITECTURE stractural OF alu_16bit IS

	COMPONENT alu_1bit IS
		PORT (A, B, Cin, sub_mode, geq_bit: IN STD_LOGIC;
				SEL: IN STD_LOGIC_VECTOR(2 downto 0);
				Q, Cout: OUT STD_LOGIC);
	END COMPONENT;

   COMPONENT not_gate IS
		PORT (A: IN STD_LOGIC; Q: OUT STD_LOGIC);
   END COMPONENT;
	
	COMPONENT decoder3to8 IS
		PORT (inp: IN STD_LOGIC_VECTOR(2 downto 0);
				Y: OUT STD_LOGIC_VECTOR(7 downto 0));
		END COMPONENT;

   SIGNAL carries : STD_LOGIC_VECTOR(16 downto 0);
	SIGNAL Y: STD_LOGIC_VECTOR( 7 downto 0);
   SIGNAL geq_res : STD_LOGIC;
	SIGNAL GND : STD_LOGIC := '0';

BEGIN

	OP_DEC: decoder3to8 PORT MAP(OP, Y);
	
	carries(0) <= Y(1); --if we choose op code 001 meaning subtraction then the ddecoder will have 1 in this potition and we pass it as the first cin in order to simulate the subtraction (a-b = a + notb + 1)
	
	GEQ_INV: not_gate PORT MAP(A(15), geq_res);
	
	--The first 1bit alu slice should have the answer for the geq operation because it depends only on the msb, so the rest slices will just have the gnd signal for this operation
	ALU_0: alu_1bit PORT MAP(A(0), B(0), carries(0), Y(1), geq_res, OP, Result(0), carries(1));
	
	--The rest 15 1bit alu slices
	ALU_ARRAY: FOR i IN 1 TO 15 GENERATE
	
		ALU_SLICE:alu_1bit PORT MAP(A(i), B(i), carries(i), Y(1), GND, OP, Result(i), carries(i+1));
		
	END GENERATE;
	
	overflow <= carries(16);
	
END stractural;
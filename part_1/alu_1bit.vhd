library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_SIGNED.all;

ENTITY alu_1bit IS
PORT (A, B, Cin, geq_bit : IN STD_LOGIC;
		SEL: IN STD_LOGIC_VECTOR(2 downto 0);
		Q, Cout: OUT STD_LOGIC) ;
END alu_1bit;

ARCHITECTURE stractural OF alu_1bit IS

COMPONENT not_gate IS
PORT (A: IN STD_LOGIC;
		Q: OUT STD_LOGIC);
END COMPONENT;

COMPONENT or_gate IS
PORT (A, B: IN STD_LOGIC;
		Q: OUT STD_LOGIC);
END COMPONENT;

COMPONENT and_gate IS
PORT (A, B: IN STD_LOGIC;
		Q: OUT STD_LOGIC);
END COMPONENT;

COMPONENT xor_gate IS
PORT (A, B: IN STD_LOGIC ;
		Q: OUT STD_LOGIC) ;
END COMPONENT;

COMPONENT nor_gate IS
PORT (A, B: IN STD_LOGIC ;
		Q: OUT STD_LOGIC) ;
END COMPONENT;

COMPONENT one_bit_full_adder IS
    PORT (
        A, B, Cin : IN  STD_LOGIC;
        Sum, Cout : OUT STD_LOGIC
    );
END COMPONENT;

COMPONENT mux8to1 IS
PORT (Inp: IN STD_LOGIC_VECTOR(7 downto 0); 
		Sel: IN STD_LOGIC_VECTOR(2 downto 0);
		Q: OUT STD_LOGIC);
END COMPONENT;

SIGNAL op_results: STD_LOGIC_VECTOR(7 downto 0);
SIGNAL s_add, b_inp: STD_LOGIC;

BEGIN

-- If we need subtraction (op code 001) we need to flip the b input (the rest will be handled in the 16 bit alu) else we need b as it is
	B_CTRL: xor_gate PORT MAP(B, SEL(0), b_inp);
	
	ADD: one_bit_full_adder PORT MAP(A, b_inp, Cin, s_add, Cout);
	
	G1: and_gate PORT MAP(A, B, op_results(2));
	G2: or_gate PORT MAP(A, B, op_results(3));
	G3: not_gate PORT MAP(A, op_results(5));
	G4: xor_gate PORT MAP(A, B, op_results(6));
	G5: nor_gate PORT MAP(A, B, op_results(7));
	
	op_results(0) <= s_add; --add
	op_results(1) <= s_add;	--sub
	op_results(4) <= geq_bit; --we will handle this operation in the 16-bit level

	RESULT_MUX: mux8to1 PORT MAP(op_results, SEL, Q);

END stractural;
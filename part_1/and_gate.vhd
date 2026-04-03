library IEEE;
use IEEE.STD_LOGIC_1164.all;

ENTITY and_gate IS
PORT (A, B: IN STD_LOGIC ;
		Q: OUT STD_LOGIC) ;
END and_gate;

ARCHITECTURE Behaviour OF and_gate IS
BEGIN
	Q <= A AND B;
END Behaviour;
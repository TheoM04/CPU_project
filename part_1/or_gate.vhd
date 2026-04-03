library IEEE;
use IEEE.STD_LOGIC_1164.all;

ENTITY or_gate IS
PORT (A, B: IN STD_LOGIC ;
		Q: OUT STD_LOGIC) ;
END or_gate;

ARCHITECTURE Behaviour OF or_gate IS
BEGIN
	Q <= A OR B;
END Behaviour;
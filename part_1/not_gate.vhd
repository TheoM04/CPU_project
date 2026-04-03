library IEEE;
use IEEE.STD_LOGIC_1164.all;

ENTITY not_gate IS
PORT (A: IN STD_LOGIC ;
		Q: OUT STD_LOGIC) ;
END not_gate;

ARCHITECTURE Behaviour OF not_gate IS
BEGIN
	Q <= NOT A;
END Behaviour;
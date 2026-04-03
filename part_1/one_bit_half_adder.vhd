library IEEE;
use IEEE.STD_LOGIC_1164.all;

ENTITY one_bit_half_adder IS
PORT (a, b: IN STD_LOGIC ;
		sum, cout: OUT STD_LOGIC) ;
END one_bit_half_adder;

ARCHITECTURE Behaviour OF one_bit_half_adder IS
BEGIN
	sum <= a XOR b;
	cout <= a AND b;
END Behaviour;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

ENTITY register_zero IS
    PORT (
        d           : IN  STD_LOGIC_VECTOR(15 downto 0);
        clk, en, rst : IN  STD_LOGIC;
        q           : OUT STD_LOGIC_VECTOR(15 downto 0)
    );
END register_zero;

ARCHITECTURE structural OF register_zero IS
BEGIN
    q <= "0000000000000000";
END structural;
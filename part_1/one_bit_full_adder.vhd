library IEEE;
use IEEE.STD_LOGIC_1164.all;

ENTITY one_bit_full_adder IS
    PORT (
        a, b, cin : IN  STD_LOGIC;
        sum, cout : OUT STD_LOGIC
    );
END one_bit_full_adder;

ARCHITECTURE Behaviour OF one_bit_full_adder IS

    -- 1. Declare the Half Adder component
    COMPONENT one_bit_half_adder
        PORT (
            a, b : IN  STD_LOGIC;
            sum, cout : OUT STD_LOGIC
        );
    END COMPONENT;

    -- 2. Internal signals to connect the blocks
    SIGNAL s1, c1, c2 : STD_LOGIC;

BEGIN
    
    -- First Half Adder: Adds A and B
    HA1: one_bit_half_adder 
        PORT MAP (
            a   => a, 
            b   => b, 
            sum => s1, 
            cout => c1
        );

    -- Second Half Adder: Adds result of HA1 (s1) and CIN
    HA2: one_bit_half_adder 
        PORT MAP (
            a   => s1, 
            b   => cin, 
            sum => sum, 
            cout => c2
        );
    cout <= c1 OR c2;
	
END Behaviour;
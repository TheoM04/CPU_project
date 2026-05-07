library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Selector is
    Port (
        sel           : in  STD_LOGIC_VECTOR(1 downto 0); -- From Forwarding Unit
        reg_data      : in  STD_LOGIC_VECTOR(15 downto 0); -- ID/EX output
        mem_forward   : in  STD_LOGIC_VECTOR(15 downto 0); -- EX/MEM result
        wb_forward    : in  STD_LOGIC_VECTOR(15 downto 0); -- MEM/WB result
        final_out     : out STD_LOGIC_VECTOR(15 downto 0)
    );
end Selector;

architecture Behavioral of Selector is
begin
    with sel select
        final_out <= reg_data    when "00",
                     wb_forward  when "01",
                     mem_forward when "10",
                     reg_data    when others;
end Behavioral;
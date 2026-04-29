library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu_control is
    Port (
        opcode   : in  STD_LOGIC_VECTOR(3 downto 0);
        func     : in  STD_LOGIC_VECTOR(2 downto 0);
        alu_op   : out STD_LOGIC_VECTOR(2 downto 0)
    );
	 
end alu_control;

architecture behavioral of alu_control is
begin
    process(opcode, func)
    begin
        if opcode = "0000" then
            -- R-type: h prajh ka8orizetai apo to func
            alu_op <= func;
        else
            -- oles oi alles einai h prajh apo to opcode
            -- pairnw ta 3 teleytaia bits apo to opcode
            alu_op <= opcode(2 downto 0);
        end if;
    end process;
end Behavioral;
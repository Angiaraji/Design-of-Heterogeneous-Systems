----------------------------------------------------------------------------------
-- Create Date:    17:05:35 12/27/2020 
-- Engineer	: Rajarajeswari Angia Krishnan
-- Module Name:  AL8 - Behavioral 
-- Project Name: ALU_8bit
-- Description : The arithmetic module of ALU
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity AL8 is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);	 -- input 1
           B : in  STD_LOGIC_VECTOR (7 downto 0);	 -- input 2
           OP : in  STD_LOGIC_VECTOR (7 downto 0);	 -- operand
           Y : out  STD_LOGIC_VECTOR (7 downto 0)); -- output
end AL8;

architecture Behavioral of AL8 is

begin

	process(A,B,OP)
	
		begin
		
			case OP is
				
				when x"44" 	=> Y <= A or B;    -- bitwise OR
				when x"54" 	=> Y <= A and B;	 -- bitwise AND
				when x"64" 	=> Y <= A xor B;	 -- bitwise XOR
				when x"04" 	=> Y <= A + 1;		 -- increment A (+1)
				when x"14" 	=> Y <= A - 1;		 -- decrement A (-1)
				when x"24" 	=> Y <= A + B;		 -- add A+B
				when x"94" 	=> Y <= A - B;		 -- subtract B from A
				when others => Y <= A;			 -- no operation (=A)
			
			end case;
			
	end process;

end Behavioral;


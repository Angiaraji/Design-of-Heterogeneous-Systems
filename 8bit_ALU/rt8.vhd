----------------------------------------------------------------------------------
-- Engineer	: Rajarajeswari Angia Krishnan
-- Create Date: 17:57:13 12/27/2020 
-- Module Name:  rt8 - Behavioral 
-- Project Name: ALU_8bit
-- Description: The rotational module of ALU
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rt8 is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           OP : in  STD_LOGIC_VECTOR (7 downto 0);
           Y : out  STD_LOGIC_VECTOR (7 downto 0));
end rt8;

architecture Behavioral of rt8 is

begin

	with OP select
		
		Y <= A(0) & A(7 downto 1) when "00000011",
			  A(6 downto 0) & A(7) when "00100011",
			  A when others;

end Behavioral;


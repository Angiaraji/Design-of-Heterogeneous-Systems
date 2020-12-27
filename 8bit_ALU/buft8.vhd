----------------------------------------------------------------------------------
-- Engineer	: Rajarajeswari Angia Krishnan
-- Create Date:    17:49:01 12/27/2020 
-- Module Name:    buft8 - Behavioral 
-- Project Name: ALU_8bit
-- Description : The buffer module of ALU
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity buft8 is
    Port ( IN8 : in  STD_LOGIC_VECTOR (7 downto 0);
           OE : in  STD_LOGIC;
           OUT8 : out  STD_LOGIC_VECTOR (7 downto 0));
end buft8;

architecture Behavioral of buft8 is

begin

	OUT8 <= IN8 when OE = '1' else "ZZZZZZZZ";


end Behavioral;


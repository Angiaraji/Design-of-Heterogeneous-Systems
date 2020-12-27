----------------------------------------------------------------------------------
-- Engineer	: Rajarajeswari Angia Krishnan
-- Create Date:    17:57:13 12/27/2020 
-- Module Name:  ALU - Behavioral 
-- Project Name: ALU_8bit
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           OP : in  STD_LOGIC_VECTOR (7 downto 0);
           Y : out  STD_LOGIC_VECTOR (7 downto 0));
end ALU;

architecture Behavioral of ALU is

signal wYAL,wYRL  : STD_LOGIC_VECTOR(7 downto 0);
signal OEAn, OERn : STD_LOGIC;

component AL8 is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);	  
           B : in  STD_LOGIC_VECTOR (7 downto 0);	  
           OP : in  STD_LOGIC_VECTOR (7 downto 0);	  
           Y : out  STD_LOGIC_VECTOR (7 downto 0));  
end component AL8;

component rt8 is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           OP : in  STD_LOGIC_VECTOR (7 downto 0);
           Y : out  STD_LOGIC_VECTOR (7 downto 0));
end component rt8;

component buft8 is
    Port ( IN8 : in  STD_LOGIC_VECTOR (7 downto 0);
           OE : in  STD_LOGIC;
           OUT8 : out  STD_LOGIC_VECTOR (7 downto 0));
end component buft8;

begin

	comp_al8: al8
			port map( A => A,
						 B => B,
						 OP => OP,
						 Y => wYAL);
						 
	comp_rt8: rt8
			port map( A => A,
						 OP => OP,
						 Y => wYRL);
						 
	comp_buft8_1 : buft8
			port map( IN8 => wYAL,
						 OE  => OEAn,
						 OUT8	  => Y);
						 
	comp_buft8_2 : buft8
			port map( IN8 => wYRL,
						 OE  => OERn,
						 OUT8	 => Y);


	-- decoder logic
	process(OP)
	
		begin
		
			case OP is
			
				when x"03" | x"23" => OERn <= '1'; OEAn <= '0';
				when x"44" | x"54" | x"64" | x"04" | x"14" | x"24" | x"94" => OEAn <= '1'; OERn <= '0';
				when others => OERn <= '0'; OEAn <= '0';
		   
			end case;
			
	end process;
	
end Behavioral;


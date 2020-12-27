--------------------------------------------------------------------------------
-- Engineer	  	: Rajarajeswari Angia Krishnan
-- Create Date :   18:20:26 12/27/2020   
-- Module Name :  tb_ALU.vhd
-- Project Name:  ALU_8bit
-- VHDL Test Bench Created by ISE for module: ALU
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_ALU IS
END tb_ALU;
 
ARCHITECTURE behavior OF tb_ALU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         OP : IN  std_logic_vector(7 downto 0);
         Y : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0);
   signal B : std_logic_vector(7 downto 0);
   signal OP : std_logic_vector(7 downto 0);

 	--Outputs
   signal Y : std_logic_vector(7 downto 0);
 
 
BEGIN
 
   uut: ALU PORT MAP (
          A => A,
          B => B,
          OP => OP,
          Y => Y
        );

   test_input_ALU : process
	
    begin
	 
        A <= "00001111"; B <= "00000001"; 
		  
        OP <= x"44"; wait for 10ns;
        OP <= x"54"; wait for 10ns;
        OP <= x"64"; wait for 10ns;
        OP <= x"04"; wait for 10ns;
        OP <= x"14"; wait for 10ns;
		  
        A <= x"40"; B <= x"12";
		  
        OP <= x"24"; wait for 10ns;
        OP <= x"94"; wait for 10ns;
        OP <= x"03"; wait for 10ns;
        OP <= x"23"; wait for 10ns;
        OP <= x"23"; wait for 10ns;
        OP <= x"23"; wait for 10ns;
        OP <= x"23"; wait for 10ns;
        OP <= x"00"; wait for 10ns;
        wait;
		  
    end process test_input_ALU;

END;

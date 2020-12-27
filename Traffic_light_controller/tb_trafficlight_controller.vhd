--------------------------------------------------------------------------------
-- Engineer 	: Rajarajeswari Angia Krishnan
-- Create Date:   00:42:57 12/27/2020 
-- Module Name:   tb_trafficlight_controller.vhd
-- Project Name:  Traffic_light_controller
-- VHDL Test Bench Created by ISE for module: 
----trafficlight_controller
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY tb_trafficlight_controller IS
END tb_trafficlight_controller;
 
ARCHITECTURE behavior OF tb_trafficlight_controller IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT trafficlight_controller
    PORT(
         stop : IN  std_logic;
         clk : IN  std_logic;
         reset : IN  std_logic;
         p_light : OUT  std_logic_vector(1 downto 0);
         t_light : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal stop : std_logic := '0';
   signal clk : std_logic := '1';
   signal reset : std_logic ;

 	--Outputs
   signal p_light : std_logic_vector(1 downto 0);
   signal t_light : std_logic_vector(2 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: trafficlight_controller PORT MAP (
          stop => stop,
          clk => clk,
          reset => reset,
          p_light => p_light,
          t_light => t_light
        );

  clk <= not clk after 25 ms;

   -- Stimulus process
   stim_proc: process
   begin		

		-- test case for reset
		reset <= '1';
		wait for 10 ms;
		reset <= '0';
		-- test case for vehicle run
		stop <= '0';
		-- test case for pedestrian
		wait for 2000 ms;
		stop <= '1';
		-- minimum push time
		wait for 500 ms;
		stop <= '0';
		
      wait;
   end process;

END;

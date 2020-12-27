----------------------------------------------------------------------------------
-- Engineer		: Rajarajeswari Angia Krishnan
-- Create Date	: 00:14:46 12/27/2020 
-- Module Name	: trafficlight_controller - Behavioral 
-- Project Name	: Traffic light controller
-- Description	: Design of traffic light controller that controls the signals of 
--			vehicles and pedestrians crossing the road.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity trafficlight_controller is
    Port ( stop : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           p_light : out  STD_LOGIC_VECTOR (1 downto 0);
           t_light : out  STD_LOGIC_VECTOR (2 downto 0));
end trafficlight_controller;

architecture Behavioral of trafficlight_controller is

signal counter : integer range 0 to 100;
signal set_counter : std_logic;
type state_type is (s1,s2,s3,s4,s5,s6);
signal state,next_state : state_type;

begin

Reg: process(clk,reset)

begin

	if reset = '1' then
		state 	<= s1;
		counter <= 0;
	elsif rising_edge(clk) then
		state 	<= next_state;
		if set_counter = '1' then
			counter <= 0;
		elsif counter < 100 then
			counter <= counter + 1;
		else
			counter <= 0;
		end if;
	end if;
	
end process Reg;

state_transition : process(state,counter,stop)

begin
	
	set_counter <= '0';
	next_state  <= state;
	
	case state is
		
		when s1 	=> 	if stop = '1'    then next_state <= s2;
						set_counter <= '1';
						end if;
					  
		when s2 	=> 	if counter = 40  then next_state <= s3;
						set_counter <= '1';
						end if;
					  
		when s3 	=> 	if counter = 20  then next_state <= s4;
						set_counter <= '1';
						end if;
		
		when s4 	=> 	if counter = 100 then next_state <= s5;
						set_counter <= '1';
						end if;
					  
		when s5 	=> 	if counter = 100 then next_state <= s6;
						set_counter <= '1';
						end if;
		
		when s6 	=> 	if counter = 40  then next_state <= s1;
						set_counter <= '1';
						end if;
		
		when others => 	next_state <= s1;
	
	end case;

end process state_transition;

--output logic using concurrent signal assignments

p_light <=	 "01" when state = s4 else "10";

t_light <= 	"001" when state = s1 else
			"010" when state = s2 else
			"110" when state = s6 else "100";

end Behavioral;


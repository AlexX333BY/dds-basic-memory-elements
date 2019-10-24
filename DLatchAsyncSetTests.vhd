LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY DLatchAsyncSetTests IS
END DLatchAsyncSetTests;
 
ARCHITECTURE behavior OF DLatchAsyncSetTests IS 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT DLatchAsyncSet
    PORT(
         D : IN  std_logic;
         S : IN  std_logic;
         Q : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal D : std_logic := '0';
   signal S : std_logic := '0';

 	--Outputs
   signal Q : std_logic;
 
   constant clock_period : time := 10 ns;
   constant d_clock_multiplier : integer := 2 ** 0;
   constant s_clock_multiplier : integer := 2 ** 1;
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: DLatchAsyncSet PORT MAP (
          D => D,
          S => S,
          Q => Q
        );

   d_process :process
   begin
		D <= '0';
		wait for clock_period*d_clock_multiplier/2;
		D <= '1';
		wait for clock_period*d_clock_multiplier/2;
   end process;
 
   s_process :process
   begin
		S <= '0';
		wait for clock_period*s_clock_multiplier/2;
		S <= '1';
		wait for clock_period*s_clock_multiplier/2;
   end process;
END;

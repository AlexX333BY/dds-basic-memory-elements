LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY DLatchAsyncResetTests IS
END DLatchAsyncResetTests;
 
ARCHITECTURE behavior OF DLatchAsyncResetTests IS 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT DLatchAsyncReset
    PORT(
         D : IN  std_logic;
         R : IN  std_logic;
         Q : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal D : std_logic := '0';
   signal R : std_logic := '0';

 	--Outputs
   signal Q : std_logic;
 
   constant clock_period : time := 10 ns;
   constant d_clock_multiplier : integer := 2 ** 0;
   constant r_clock_multiplier : integer := 2 ** 1;
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: DLatchAsyncReset PORT MAP (
          D => D,
          R => R,
          Q => Q
        );

   d_process :process
   begin
		D <= '0';
		wait for clock_period*d_clock_multiplier/2;
		D <= '1';
		wait for clock_period*d_clock_multiplier/2;
   end process;
 
   r_process :process
   begin
		R <= '0';
		wait for clock_period*r_clock_multiplier/2;
		R <= '1';
		wait for clock_period*r_clock_multiplier/2;
   end process;
END;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY DTriggerSyncSetAsyncResetTests IS
END DTriggerSyncSetAsyncResetTests;
 
ARCHITECTURE behavior OF DTriggerSyncSetAsyncResetTests IS 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT DTriggerSyncSetAsyncReset
    PORT(
         D : IN  std_logic;
         C : IN  std_logic;
         S : IN  std_logic;
         R : IN  std_logic;
         Q : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal D : std_logic := '0';
   signal C : std_logic := '0';
   signal S : std_logic := '0';
   signal R : std_logic := '0';

 	--Outputs
   signal Q : std_logic;
 
   constant clock_period : time := 10 ns;
   constant r_period : time := clock_period/2 + 2 ns;
   constant s_period : time := r_period/2;
   constant d_period : time := s_period/2;
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: DTriggerSyncSetAsyncReset PORT MAP (
          D => D,
          C => C,
          S => S,
          R => R,
          Q => Q
        );

   -- Clock process definitions
   clock_process :process
   begin
		C <= '0';
		wait for clock_period/2;
		C <= '1';
		wait for clock_period/2;
   end process;
 
   d_process :process
   begin
      D <= '0';
      wait for d_period/2;
      D <= '1';
      wait for d_period/2;
   end process;
   
   r_process :process
   begin
      R <= '0';
      wait for r_period/2;
      R <= '1';
      wait for r_period/2;
   end process;
   
   s_process :process
   begin
      S <= '0';
      wait for s_period/2;
      S <= '1';
      wait for s_period/2;
   end process;
END;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY DTriggerTests IS
END DTriggerTests;
 
ARCHITECTURE behavior OF DTriggerTests IS 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT DTrigger
    PORT(
         D : IN  std_logic;
         C : IN  std_logic;
         Q : OUT  std_logic
        );
    END COMPONENT;

   --Inputs
   signal D : std_logic := '0';
   signal C : std_logic := '0';

 	--Outputs
   signal Q : std_logic;
 
   constant clock_period : time := 10 ns;
   constant d_period : time := clock_period/2 + 1 ns;
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: DTrigger PORT MAP (
          D => D,
          C => C,
          Q => Q
        );

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
END;

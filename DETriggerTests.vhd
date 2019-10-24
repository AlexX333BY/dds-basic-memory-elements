LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY DETriggerTests IS
END DETriggerTests;
 
ARCHITECTURE behavior OF DETriggerTests IS 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT DETrigger
    PORT(
         D : IN  std_logic;
         E : IN  std_logic;
         C : IN  std_logic;
         Q : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal D : std_logic := '0';
   signal E : std_logic := '0';
   signal C : std_logic := '0';

 	--Outputs
   signal Q : std_logic;

   constant clock_period : time := 10 ns;
   constant e_period : time := clock_period/2 + 2 ns;
   constant d_period : time := e_period/2;
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: DETrigger PORT MAP (
          D => D,
          E => E,
          C => C,
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
   
   e_process :process
   begin
      E <= '0';
      wait for E_period/2;
      E <= '1';
      wait for E_period/2;
   end process;
END;

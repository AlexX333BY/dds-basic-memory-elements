LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY RsLatchPlaceRouteTests IS
END RsLatchPlaceRouteTests;
 
ARCHITECTURE behavior OF RsLatchPlaceRouteTests IS 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT RsLatchPlaceRoute
    PORT(
         S : IN  std_logic;
         R : IN  std_logic;
         nQ : OUT  std_logic;
         Q : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal S : std_logic := '0';
   signal R : std_logic := '0';

 	--Outputs
   signal nQ : std_logic;
   signal Q : std_logic;
 
   constant period : time := 10 ns;
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: RsLatchPlaceRoute PORT MAP (
          S => S,
          R => R,
          nQ => nQ,
          Q => Q
        );

   period_process :process
   begin
		S <= '1';
      R <= '1';
		wait for period;
		S <= '0';
      R <= '0';
		wait for period;
   end process;
END;

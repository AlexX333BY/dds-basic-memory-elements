LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY DLatchTests IS
END DLatchTests;
 
ARCHITECTURE behavior OF DLatchTests IS 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT DLatch
    PORT(
         D : IN  std_logic;
         Q : OUT  std_logic;
         nQ : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal D : std_logic := '0';

 	--Outputs
   signal Q_b, Q_s : std_logic;
   signal nQ_b, nQ_s : std_logic;
   signal Q_error, nQ_error, error : std_logic;
   
   constant clock_period : time := 10 ns;
BEGIN
	DLatch_b: entity work.DLatch(Behavioral) PORT MAP (
          D => D,
          Q => Q_b,
          nQ => nQ_b
        );

   DLatch_s: entity work.DLatch(Structural) PORT MAP (
          D => D,
          Q => Q_s,
          nQ => nQ_s
        );

   D_process :process
   begin
		D <= '0';
		wait for clock_period/2;
		D <= '1';
		wait for clock_period/2;
   end process;
   
   Q_error <= Q_s xor Q_b;
   nQ_error <= nQ_s xor nQ_b;
   error <= Q_error or nQ_error;
END;

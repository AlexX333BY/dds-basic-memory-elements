library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity Bistable is
    Port ( Q : out  STD_LOGIC;
           nQ : out  STD_LOGIC);
end Bistable;

architecture Behavioral of Bistable is
   signal bse, inv1, inv2: STD_LOGIC;
begin
   Main: process 
   begin
      inv1 <= not bse;
      inv2 <= not inv1;
      bse <= not inv2;
   end process;
   nQ <= inv1;
   Q <= inv2;
end Behavioral;

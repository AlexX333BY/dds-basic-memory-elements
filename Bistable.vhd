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
   B1: INV port map (bse, inv1);
   nQ <= inv1;
   B2: INV port map (inv1, inv2);
   Q <= inv2;
   bse <= inv2;
end Behavioral;

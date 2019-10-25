library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity Bistable is
    Port ( Q : out  STD_LOGIC;
           nQ : out  STD_LOGIC);
end Bistable;

architecture Structural of Bistable is
   signal bse : STD_LOGIC := '0';
   signal invbse : STD_LOGIC;
begin
   B1: INV port map (I => bse, O => invbse);
   B2: BUF port map (I => invbse, O => nQ);
   B3: INV port map (I => invbse, O => Q);
end Structural;

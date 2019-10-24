library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity DELatch is
    Port ( D : in  STD_LOGIC;
           E : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           nQ : out  STD_LOGIC);
end DELatch;

architecture Behavioral of DELatch is
   signal del : STD_LOGIC;
begin
   Main : process(D, E)
   begin
      if E = '1' then
         del <= D;
      end if;
   end process;
   
   Q <= del;
   nQ <= not del;
end Behavioral;

architecture Structural of DELatch is
component RsLatch
   Port ( S : in  STD_LOGIC;
          R : in  STD_LOGIC;
          nQ : out  STD_LOGIC;
          Q : out  STD_LOGIC);
end component;

signal notd, se, re : STD_LOGIC;
begin
   DE1: INV port map (I => D, O => notd);
   DE2: AND2 port map (I0 => D, I1 => E, O => se);
   DE3: AND2 port map (I0 => notd, I1 => E, O => re);
   DE4: RsLatch port map (S => se, R => re, Q => Q, nQ => nQ);
end Structural;

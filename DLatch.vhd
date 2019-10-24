library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity DLatch is
    Port ( D : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           nQ : out  STD_LOGIC);
end DLatch;

architecture Behavioral of DLatch is
   signal dl : STD_LOGIC;
begin
   Main : process (D)
   begin
      dl <= D;
   end process;

   Q <= dl;
   nQ <= not dl;
end Behavioral;

architecture Structural of DLatch is
component RsLatch
   Port ( S : in  STD_LOGIC;
          R : in  STD_LOGIC;
          nQ : out  STD_LOGIC;
          Q : out  STD_LOGIC);
end component;

signal notd : STD_LOGIC;
begin
   DL1: INV port map (I => D, O => notd);
   DL2: RsLatch port map (S => D, R => notd, nQ => nQ, Q => Q);
end Structural;

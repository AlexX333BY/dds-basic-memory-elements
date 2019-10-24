library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DLatchAsyncReset is
    Port ( D : in  STD_LOGIC;
           R : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end DLatchAsyncReset;

architecture Behavioral of DLatchAsyncReset is
   signal dlar : STD_LOGIC;
begin
   Main : process(D, R)
   begin
      if R = '1' then
         dlar <= '0';
      else
         dlar <= D;
      end if;
   end process;

   Q <= dlar;
end Behavioral;

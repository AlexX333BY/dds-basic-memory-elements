library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DLatchAsyncSet is
    Port ( D : in  STD_LOGIC;
           S : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end DLatchAsyncSet;

architecture Behavioral of DLatchAsyncSet is
   signal dlas : STD_LOGIC;
begin
   Main : process(D, S)
   begin
      if S = '1' then
         dlas <= '1';
      else
         dlas <= D;
      end if;
   end process;

   Q <= dlas;
end Behavioral;

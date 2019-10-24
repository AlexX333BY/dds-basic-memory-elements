library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DTriggerAsyncSet is
    Port ( D : in  STD_LOGIC;
           C : in  STD_LOGIC;
           S : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end DTriggerAsyncSet;

architecture Behavioral of DTriggerAsyncSet is
   signal dtas : STD_LOGIC;
begin
   Main : process (D, S, C)
   begin
      if S = '1' then
         dtas <= '1';
      elsif rising_edge(C) then
         dtas <= D;
      end if;
   end process;
   
   Q <= dtas;
end Behavioral;

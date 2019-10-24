library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DTriggerAsyncReset is
    Port ( D : in  STD_LOGIC;
           R : in  STD_LOGIC;
           C : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end DTriggerAsyncReset;

architecture Behavioral of DTriggerAsyncReset is
   signal dtar : STD_LOGIC;
begin
   Main : process (D, R, C)
   begin
      if R = '1' then
         dtar <= '0';
      elsif rising_edge(C) then
         dtar <= D;
      end if;
   end process;
   
   Q <= dtar;
end Behavioral;
